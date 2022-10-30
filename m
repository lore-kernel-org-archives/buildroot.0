Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B04FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B09F812EB;
	Sun, 30 Oct 2022 11:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B09F812EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsvgu81WwJuC; Sun, 30 Oct 2022 11:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2748129D;
	Sun, 30 Oct 2022 11:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2748129D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B25EB1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B75E40347
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B75E40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxj7HZcEWpet for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:07:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97DC5402F7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97DC5402F7
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:07:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6118840005;
 Sun, 30 Oct 2022 11:07:02 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120701.4795e27e@windsurf>
In-Reply-To: <20221029195108.35473-1-fontaine.fabrice@gmail.com>
References: <20221029195108.35473-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIVCnlyJJa85qR+Vqxc5xHwEvNKfJrDVEyp4PLbeEFM=;
 b=VvGSsjg968Bog8dlinArpN2E+qcjVl/eA1WWVtFDwuFd9rCkFx8qKgzTZ2iy2pE84rqXnR
 oLFWMy2ePXvDtpghS4wzcXg3mZB2PBpxc7sEW3+48UZr/CxOqYVGy7YnJBJBpkEXGr0Lhd
 loP+3HMifrdzf9gMXq3oDKT9tsvgr3eLiLI8yha+hzRYNdQpPTfSXa0oKOsqXr5i7dQZx1
 QWdQ90tNnIyD28N3sPBEQ3hznmSzyi04P+E4jV+h/ECMZkmEZn3ZBvYn7Uzooe8+yC/KKT
 bSLvW2IbKjrcatKO/pY6urlYKMFY06IxnhQvKhESwRSd36M0RnUFx5rkwlRK4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VvGSsjg9
Subject: Re: [Buildroot] [PATCH 1/1] package/minissdpd: bump to version 1.6.0
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

On Sat, 29 Oct 2022 21:51:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of LICENSE file (license refined for github:
> https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13)
> 
> http://miniupnp.free.fr/files/changelog.php?file=minissdpd-1.6.0.tar.gz
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minissdpd/minissdpd.hash | 4 ++--
>  package/minissdpd/minissdpd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
