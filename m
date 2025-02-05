Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CADBC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4245A41790;
	Wed,  5 Feb 2025 09:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2P9iR--UtZ0; Wed,  5 Feb 2025 09:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE7E41786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE7E41786;
	Wed,  5 Feb 2025 09:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6886312A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 587A760E60
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cg_7Q7k_au_A for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 368BE606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368BE606CE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 368BE606CE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 481D743220;
 Wed,  5 Feb 2025 09:47:44 +0000 (UTC)
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 05 Feb 2025 10:47:45 +0100
MIME-Version: 1.0
Message-Id: <20250205-fix_zxing-v1-7-c3e4c2adfdab@bootlin.com>
References: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
In-Reply-To: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefftdefffevfffhjeevveevuddtfeffiedtleejueelffeugfevtdelhfetjeffnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopegludejvddrudeirddvrddutdelngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehfhhhunhhlvghthhesthhrohhoughonhdqshhofhhtfigrrhgvrdgtohhmp
 dhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738748864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDfcF9gwW34ngsubKbFmGZt4Ck4n+pfxzD/anKLn9n8=;
 b=dEqZ05nl2Sssbo4csptor3gHXCh5MgW5Xzzb7GBkT9/zSrMrH7KLKxp+FStGv5AcPMVe+L
 sFTxRixNFAe+JtA5WACcVJBZ++pvbiyms8wHlN/IFi+Ic8/1DOIzV4gor6LVwdJJ+GRWFP
 x0+niZGsui4QvywHCMH0bjy2ZXdYUWJc6n+HWbtc0gyo360C5uxhXEbaLPw5e4mhPxW7vG
 LmqYL3rR5tcJkqdQIsJXBASWlGXIzgyS/8Tb3di1kkGSt3b8IoJseui2XZ21jvfiWyua5/
 t9tlMyPfssdVMIh2O2HFalwfsK2PEjpvTyY9gDpl0RP2VBu4qYtzaShArbJyyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dEqZ05nl
Subject: [Buildroot] [PATCH 07/12] package/gstreamer1/gst1-vaapi: bump
 version to 1.24.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The va plugin (gst-plugins-bad) is now preffered over gst1-vaapi.
For details, see the release notes:

    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index c6e0048ee752bcc8bace0e18a43d4aa3e99039aa..d53a96215084a702a0fe2edc5e03cc9478583690 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.12.tar.xz.sha256sum
-sha256  013ad729b2fe4fccda559bddc626bcb14230cfb90a2271049f8466bfec5d80df  gstreamer-vaapi-1.22.12.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.11.tar.xz.sha256sum
+sha256  e85904a47d9ecb41d7f76b1d3fe887fa18c0b81a3793e7d7f61361ea7e90420d  gstreamer-vaapi-1.24.11.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 0cdec46f359f8410b75000b7e247bae51c0b8b88..1bd3dbf12e24190435db54db5961210d0f771ac8 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.22.12
+GST1_VAAPI_VERSION = 1.24.11
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
