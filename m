Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01A2C32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93E78405FD;
	Wed, 24 Aug 2022 02:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93E78405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8D2GnYBSxJ0k; Wed, 24 Aug 2022 02:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A038B40547;
	Wed, 24 Aug 2022 02:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A038B40547
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48B0A1C1148
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2650E40921
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2650E40921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZGG7EZLiPjW for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DCA5409AA
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DCA5409AA
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:31 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 ds12-20020a17090b08cc00b001fae6343d9fso2700931pjb.0
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=wa3DKlTeWNHxps021eIm12nfbLanyLopDKreP461VJ4=;
 b=0YBhxmcKw5wHIipsWGqJuCZqTCUDtMPqbzTfyoAm9kcj5vx74Y/TyRNjk8bu5/6J0S
 Uc9XqrdOnRlrrEamETqPcrVd8VyAO5X+RufCdIU2BUnQ/I254FBor5mEAQvDEoBdc8cF
 p+Pk+1tzO3IxnhwPg3syvKu0CXGK7FzWBWQhF4kdpaskRL8HCRBigTjhFilzADfBN/Xd
 Inug+GmixiygY96N4QnCJVQ5U83eVu7rQ2iOf5b3RUzYyZ96gfVNbHWVgq0yWtKIo1QC
 bvs2SWMSaBgeWs+rUtc+eO6fgLDggacV/9y3VUiAHGnw7P8wqltWXI8ZefeSQUvjV8ar
 bQlg==
X-Gm-Message-State: ACgBeo1cP1VzI52aP1F2ir8IYSD45TrxGIDP0o4X3TM6TheuV33/X0ck
 Fwwk6Tbs1/4rBJuY9fYMYz+sG0SdP7KbHoGx2xY=
X-Google-Smtp-Source: AA6agR47ejPMaWQJth3Go5BPb19ZRQlKTngidicJ2mKpTtBp4C2khnynf9KDZgy/5o8O8VHaXxxFOQ==
X-Received: by 2002:a17:90b:3ec2:b0:1f7:3f49:17c3 with SMTP id
 rm2-20020a17090b3ec200b001f73f4917c3mr6017998pjb.203.1661309371269; 
 Tue, 23 Aug 2022 19:49:31 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:31 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:54 -0700
Message-Id: <20220824024904.2529728-4-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=wa3DKlTeWNHxps021eIm12nfbLanyLopDKreP461VJ4=;
 b=HtPR+cal62wVFOqd9R+vtGrzPFF7f2AH2f7QpcWA6qZDeJERLoARoewGhMlxXfWBEi
 EFWx0YfrLuEVTNbYc4MFYi5+exo6+NpdeSZFYA6al16bOk3/A7AN5smB0sORfdQgAKvx
 scpwAkN3mDHcmo6vcD0jtRj9XBu3E8R359Paw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=HtPR+cal
Subject: [Buildroot] [PATCH 4/7] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.3.p4.2
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To match NXP 5.15.32-2.0.0 release.
EULA/COPYING: update to LA_OPT_NXP_Software_License v35.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 312eeb6f82..b6d206d21d 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1324b1aaf190110b80ad9a6f6533f4f50dce9e9ab8d49d8503f59764b151d219  imx-gpu-viv-6.4.3.p2.0-aarch32.bin
-sha256  003c30baefb1655790b475c3cdfa5cefbf81ea89ef37c6649b64f151dd23a52e  imx-gpu-viv-6.4.3.p2.0-aarch64.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  89197fdb13dfc21c49968297c2e8b5cb8dd5563502278151d36b2dce2a2092ed  imx-gpu-viv-6.4.3.p4.2-aarch32.bin
+sha256  52921c0b59529f1598084e991eda1863100754f28a7744ba958158dff8074b3b  imx-gpu-viv-6.4.3.p4.2-aarch64.bin
+sha256  4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517  COPYING
+sha256  4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 1d76d79e2b..b139e423eb 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.3.p4.2-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.3.p4.2-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
