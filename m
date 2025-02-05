Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98897C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5886A60F0B;
	Wed,  5 Feb 2025 09:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApIMq9vE4hvx; Wed,  5 Feb 2025 09:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E359F60DA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E359F60DA5;
	Wed,  5 Feb 2025 09:48:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C13D2CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5B9080CC6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeWYmqlLgehH for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8429680B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8429680B9A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8429680B9A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A15704320B;
 Wed,  5 Feb 2025 09:47:44 +0000 (UTC)
Date: Wed, 05 Feb 2025 10:47:46 +0100
MIME-Version: 1.0
Message-Id: <20250205-fix_zxing-v1-8-c3e4c2adfdab@bootlin.com>
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
 bh=18if+Jf+31nrpjbZDEMj3qFANg6SAE+i78dP7pg6hyQ=;
 b=AnZc5XD6AANsV0LcMU+gmnHDAVDxi7BH3M7Gea6e3a/SZaBYJZp722BWZiLhaB9VKLKEC/
 /FGB8wr5IM25YVkFKxPZQLF16LqGreXCsJ4MUCbMxwcZwQpEHfKY4r5xLWeBod3+ZWQ6P+
 lhHCBPnuiFP4lyY7rRAFq4/FiM9oLZUJyq72DctJvSX7rpr5CAO/td4WKO/mSE9HF1nwzR
 NSQTeJLQgQnvEnO1ChW6aG+Zs5JwPs9YiwopWMJKw0RAXFHHHMrDGyT/9iqSs9//XvPRgN
 nEBU/Zgos3wYwz68P6fs+FzDOoXm436ugHppXBSDJbTDlIycMMSkYooFK1m4qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AnZc5XD6
Subject: [Buildroot] [PATCH 08/12]
 package/gstreamer1/gstreamer1-editing-services: bump version to 1.24.11
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No functional change, but bump for consistency. For details, see the
release notes:

    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.hash      | 4 ++--
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index e6bba2072472f69273e725f73e1683d0cb47e038..584d235451d30e720cc52018f394e2b8089df9f9 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.12.tar.xz.sha256sum
-sha256  792339135ce713088663cc5d44e0aea8217793e88fabfd11571e7abf4a429f2c  gst-editing-services-1.22.12.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.24.11.tar.xz.sha256sum
+sha256  85fd74dab259e137a95ab4427e009dd853f4ca82874500cb5493c33bcef1ef08  gst-editing-services-1.24.11.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 75c660f31d2295e0f74f49d1857699f3513e8c95..0832cfa30f4f8a248f50b1d4e39914380d3075c4 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.12
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.24.11
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
