Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B4AC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 13:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD4940904;
	Wed, 28 May 2025 13:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oj5IN09cXlt; Wed, 28 May 2025 13:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99F24090C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99F24090C;
	Wed, 28 May 2025 13:44:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEAF8DCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D495C40770
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7cEf0MIoDXK for <buildroot@buildroot.org>;
 Wed, 28 May 2025 13:44:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FF0340511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF0340511
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF0340511
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:44:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3B8DE1F4F3;
 Wed, 28 May 2025 13:44:02 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Lang <dalang@gmx.at>, James Knight <james.knight@collins.com>
Date: Wed, 28 May 2025 15:44:00 +0200
Message-ID: <20250528134401.72041-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeegudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelfffggfeuteehleejffevkedvhffghfejffdugedvgfdtgeeggeejhffgheelgfenucffohhmrghinhepghhtkhhmmhdrohhrghdpghhnohhmvgdrohhrghenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemsgdvtggrmegstgdvkeemkehftgemvgduheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemledvtdgsmeegjedttdemsgdvtggrmegstgdvkeemkehftgemvgduheeipdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrlhgrnhhgsehgmhigrdgrthdprhgtphhtthhopehjrghmvghsrdhknhhighhhthestgholhhlihhnshdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748439842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HuktrZ9c9er99VXWtq45y7durFq5S1OlmYtSKNgIFtQ=;
 b=K+7PJoQ7o+v1sUStDv0kHNjCvECKkDf+AzZ2wUqUs38wdCOc9xkGIskWdbimnrRxScdhos
 gLMqHPtTbE+hKXKwz4uA6K1qYxBSYu5zmz6dR9wPEsj1uaXjnAJc7jq2Ywzg2K2/nYS5vV
 qPgmAakZWYj4aTRlIvFQhv/tF5EiO2tiXWt2h40QkaE/NKM7eruLuhSz6OQ3ajLMygdHUM
 UIs/OSi/uJeJcN+pHuA6kwC3bPZl5MQs2qhgu4bUXhhkF69oJaqo0XFOjRHLO86GoKrXkw
 nIiP/zAUwToytTAuDH8i54VNEIhkL8EEcMkZn1CfDvEx42FbBG7hY2OnVRQVTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+7PJoQ7
Subject: [Buildroot] [PATCH] package/{atkmm, atmm2_28, gtkmm3,
 libglade}: propagate at-spi2-core dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit d1757fdfb0010d29f20cd68cb6e16f019e236424, at-spi2-core
depends on !BR2_STATIC_LIBS, but this wasn't properly propagated to
reverse dependencies, so let's do this propagation now.

Fixes the following warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_AT_SPI2_CORE
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=y]
  Selected by [y]:
  - BR2_PACKAGE_ATKMM [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atkmm/Config.in     | 6 ++++--
 package/atkmm2_28/Config.in | 6 ++++--
 package/gtkmm3/Config.in    | 6 ++++--
 package/libglade/Config.in  | 5 +++--
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 571d7e69ad..cdae340266 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
@@ -14,7 +15,8 @@ config BR2_PACKAGE_ATKMM
 
 	  http://www.gtkmm.org/
 
-comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
index e88073b87a..8dc70210fa 100644
--- a/package/atkmm2_28/Config.in
+++ b/package/atkmm2_28/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM2_28
 	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_LIBSIGC2
@@ -17,7 +18,8 @@ config BR2_PACKAGE_ATKMM2_28
 
 	  http://www.gtkmm.org/
 
-comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 76af6b24f9..ac38ba06fc 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,9 +1,10 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
 	depends on BR2_PACKAGE_LIBGTK3
+	depends on !BR2_STATIC_LIBS # atkmm
 	select BR2_PACKAGE_ATKMM2_28
 	select BR2_PACKAGE_CAIROMM1_14
 	select BR2_PACKAGE_GLIBMM2_66
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index 8d0d26f159..0f889542fa 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBXML2
@@ -14,7 +15,7 @@ config BR2_PACKAGE_LIBGLADE
 
 	  https://download.gnome.org/sources/libglade/
 
-comment "libglade needs a toolchain w/ wchar, threads"
+comment "libglade needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
