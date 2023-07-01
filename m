Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80317EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31D7D60EF2;
	Sat,  1 Jul 2023 14:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31D7D60EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2MnKEustaz_U; Sat,  1 Jul 2023 14:01:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82BDE60FA1;
	Sat,  1 Jul 2023 14:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82BDE60FA1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22ED61BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F083940A75
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F083940A75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3NMDQyWtIoL for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:01:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B1F40003
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4B1F40003
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:01:01 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6C9C1C0005;
 Sat,  1 Jul 2023 14:00:59 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:00:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701160058.11314d8e@windsurf>
In-Reply-To: <20230628151320.554700-2-bernd@kuhls.net>
References: <20230628151320.554700-1-bernd@kuhls.net>
 <20230628151320.554700-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688220060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxDfczDvQtX1FqAP/+leQXA73IjolW0Yr5o+s0vM9+k=;
 b=Cyo7L82ZWi7z1ch2t47c8Zwz4IUK1I9SZRx2WlrUTja802UchaFxmAL+UqICMwwaJkpRJ1
 NpZ65lTWoGqa0W27RoFifi+AGjUBZiJch3rTOcD0TA4EI4+/spD1eManzPWo3YiLqj+zv4
 2MPz5iU1H93754EH/wPgwhIjuTaXuyrZQdZcXLw1dlr2dAWH2stEdnPVOouvaoMyUUraBM
 WdQGcpkEq6yerKsghm8ef36ZTyuQqce8vuDMd0EBZMqqIGTU7vNk72hfYe8bXLjqoycgVO
 oHVXgx1+yb3O5xtAYCtiJAJj1N+g0uiRpf+RdnlitjFW7AhBXfva8RGyst6V2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cyo7L82Z
Subject: Re: [Buildroot] [PATCH 2/2] package/libbsd: bump version to 0.11.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Jun 2023 17:13:20 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://archive.hadrons.org/software/libbsd/libbsd-0.11.4.announce
> https://archive.hadrons.org/software/libbsd/libbsd-0.11.5.announce
> https://archive.hadrons.org/software/libbsd/libbsd-0.11.6.announce
> https://archive.hadrons.org/software/libbsd/libbsd-0.11.7.announce
> 
> Removed patch which is included in upstream release:
> https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/873639ebb5bc3688e5e78d71e5c0c49469498f46
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  ...01-src-local-elf.h-fix-big-endian-sh.patch | 39 -------------------
>  package/libbsd/libbsd.hash                    |  6 ++-
>  package/libbsd/libbsd.mk                      |  2 +-
>  4 files changed, 5 insertions(+), 43 deletions(-)
>  delete mode 100644 package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch

After this patch, the legal-info was broken due to a change in the
license file. I fixed that up when applying, with the following details
in the commit log:

    Update hash of license file, which has changed due to:
    - Copyright year updates
    - Changes in list of files affected by the different license
    - Removal of one part under BSD-4-Clause, but as there are still other
      parts under BSD-4-Clause, this doesn't change the overall license
      information in Buildroot
    
Applied to master with this change, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
