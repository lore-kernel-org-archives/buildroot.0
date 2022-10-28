Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC25C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AC3C401B2;
	Fri, 28 Oct 2022 06:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AC3C401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuFz8YmVZd1u; Fri, 28 Oct 2022 06:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B242640133;
	Fri, 28 Oct 2022 06:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B242640133
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB681BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0632240133
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0632240133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSoPU6lYb42X for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:56:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C4D400D0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04C4D400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:56:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6BAF9E0008;
 Fri, 28 Oct 2022 06:56:20 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:56:19 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221028085619.2acac723@windsurf>
In-Reply-To: <20221025221445.352620-1-fontaine.fabrice@gmail.com>
References: <20221025221445.352620-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666940180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjg3XrtLDUYe3cX+Gwcfun7jaFhhRMpJ8UTtC9tAyy4=;
 b=KwPAt4ZHKqlUYOZn98gokhMbc6iVaNhTobLcMvwzhY7m132peDUN3ho5xir3eG922Kjma4
 fnFffJi23Szus9n5iHu5zTAEOHZwOmavUmrlToq3mTp98q/iDw1GNaVjpXsR6t5KM3BJMP
 1F0BMRaGU3N8UxJZdiK9n1hkxZCsviklAc9dC6w7r3tNIrFohmysu3FZgStdIxncGZxrY2
 bbCF22HsCRRpkaHK8jVaQ7nRj3skQos4AvMDaGYt9KkG1FBL2KB9/8p3Wgno3jxfgR53WG
 NZTCWQ882PK4n+m//NHMkms3wC9hOdx7Au1EcCEzYFoq+lz2MK/sT5SKC0XNkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KwPAt4ZH
Subject: Re: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.4.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 00:14:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> 3.4.4 Oct-23-2022
>     Important aarch64 fixes, including support for linux builds
>       with Link Time Optimization (-flto).
>     Fix x86 stdcall stack alignment.
>     Fix x86 Windows msvc assembler compatibility.
>     Fix moxie and or1k small structure args.
> 
> https://github.com/libffi/libffi/releases/tag/v3.4.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libffi/libffi.hash | 2 +-
>  package/libffi/libffi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
