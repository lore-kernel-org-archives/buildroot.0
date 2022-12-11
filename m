Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3692AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB0744094D;
	Sun, 11 Dec 2022 17:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB0744094D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwQ0B8qtl7qi; Sun, 11 Dec 2022 17:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF8D94093F;
	Sun, 11 Dec 2022 17:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF8D94093F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26B9D1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E82D240890
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E82D240890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6hhSys3uuQZ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:05:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0083404F4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0083404F4
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:05:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACB54C0005;
 Sun, 11 Dec 2022 17:05:03 +0000 (UTC)
Date: Sun, 11 Dec 2022 18:05:02 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221211180502.1042cc20@windsurf>
In-Reply-To: <20221207222631.1260519-1-bernd.kuhls@t-online.de>
References: <20221207222631.1260519-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670778303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1BZhmNSL6+rdMgDqYS+iKiDFptP6tM1gMNn7lIBdUY=;
 b=LDhRGpiAAV0XZ4NguFBrKO1Esm9OAV3glfReurnrKayK7rfv8hHV/R0ArzEkg3pHHrlMIO
 Ay/KKRKBosEq4Ijv0X1r82Khq9dD1xK8XCwMGt05lBODxpBR5J7BRTQSVex/GpZey1ywPz
 NPNO4wV85zOfsGhbVu97UKZb5W4DT3KtyOciNZ6+uhW00VHcj2F0x0NxmTbx2TxxTLLnT1
 9fmGkN4Z7xlLjWTytud3XqqR54fJNdpO4MXIwUaimZIM+GugxJEFxD8uVdjLYwcin+rnnY
 XbzkGFXpEWZrYonQ9vBQyvMUtzvr7czVcHLgsQ8jDBJSlJbJ71Mlyo4P5CR3sA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LDhRGpiA
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-nextpvr: bump version
 to 19.0.5-Matrix
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

On Wed,  7 Dec 2022 23:26:31 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
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
