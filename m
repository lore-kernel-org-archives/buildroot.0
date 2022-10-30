Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB0FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D18B812F0;
	Sun, 30 Oct 2022 11:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D18B812F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1zCszWFHxHy; Sun, 30 Oct 2022 11:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C626D812A7;
	Sun, 30 Oct 2022 11:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C626D812A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB0841BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84F4040045
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F4040045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADfrPzSy_dcK for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2369040022
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2369040022
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6AD8C240002;
 Sun, 30 Oct 2022 11:08:32 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:08:12 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120812.0bf3ad04@windsurf>
In-Reply-To: <20221030100904.76419-1-fontaine.fabrice@gmail.com>
References: <20221030100904.76419-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrYlt4/+7JXPGuUdE8c+QeYoNLgPGFzHZjfux0qplKE=;
 b=A4889e7jcny8sJm6ckXS4Q+n89p0kxhpqSg7rym76zFhUchLvm9ShxeXcpIjikt7VOohPQ
 s4md2uO1OEAk/FSyexu8qAPxWFH4NTcSBMUVUKeuXbm8Pt2tw56VGWr7e6fzhDaEOer69D
 oXvkJ7oN/9bR2BD1LHKoLeZsWeQyoLCLWMmYtPCLBMTwqRzDsPMcGhkHlpcCPiE4xEV7kJ
 DgKHFUvEclVbYP6yxgnLFaI0eSVMC52i5Huk8qH3+Ay6Bjj4PIg7fs5HLTtMK9B4yL1JtX
 ncJaZaXMqEzj5DlijebnesLma95XKb0sKe08fzybJ5DHIlUEaY5/N1llZW23+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A4889e7j
Subject: Re: [Buildroot] [PATCH 1/1] package/libnl: bump to version 3.7.0
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

On Sun, 30 Oct 2022 11:09:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/thom311/libnl/compare/libnl3_6_0...libnl3_7_0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnl/libnl.hash | 4 ++--
>  package/libnl/libnl.mk   | 2 +-
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
