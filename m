Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07452CA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 21:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B46198294A;
	Fri, 15 Aug 2025 21:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iW2zw77FtChg; Fri, 15 Aug 2025 21:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A0B8293F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A0B8293F;
	Fri, 15 Aug 2025 21:50:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE1DF223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 21:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0288611FD
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 21:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KYqKvtPnkJ5 for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 21:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F0AF6119E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0AF6119E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F0AF6119E
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 21:50:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E2D1C43174;
 Fri, 15 Aug 2025 21:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Aug 2025 23:50:48 +0200
Message-ID: <20250815215049.1127002-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeehtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeekueetvdetieefveeffffgtdfhleeuvdejkeeuvdfgheffueevvefgjeduvdelnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhinhhtrhgrvdhnvghtrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopeihvghgohhrshhlihhsthhssehgohhoghhlvghmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhdrshgrnhhguhgvsehsrghnghhuvgdrtghh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755294651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ni6wAwk1Scrw234mpnzDQ3uWE4Nb8F9KJSTEOJOEmRY=;
 b=Byx2ZU6Q8joJzkwSpWkOELEDeyrv+1KTH++tqjI9PNk0ZVKWW6PxSxf9aaGL91xzv4wjX5
 GippEoe2hyIUNIAzOC74S5vHd20zpJEIgRxiCEQfsEQxzkvoz3QPnrB3oJdjBRXIZGX0b7
 YB7ODfFbgHZBFDZDxrTmLvSA6Cug6Ri6tpTF+IBxoD2yyjrJlyYZFFFPgiF5NZvF6RQJkK
 rjVXjQaHnDlomBBJaywpgnkGm3nQg9g8YF3wIA0NkA+2gu/YsBfua0ic62d1M0PY22XO+3
 VMJ7qXZRP/t4kYr73K0UjdiVCiIkvxUiWTWJfMZcxIkdGV7fNcEgHNNTq1+BiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Byx2ZU6Q
Subject: [Buildroot] [PATCH] package/libftdi1: bump version to fix
 pkg-config file installation
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
Cc: Daniel Sangue <daniel.sangue@sangue.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of libftdi1 to version v1.5-48-g22b4667a8 in commit
d8173e084eb9ccd700b964e1b8117b96e0fed387, the libftdi1.pc file is
installed in $(STAGING_DIR)/pkgconfig/libftdi1.pc instead of
$(STAGING_DIR)/lib/pkgconfig/libftdi1.pc, making it "invisible" to
pkg-config. This is turn causes flashrom to not find libftdi1 and
failing to build when libftdi1 is needed.

This issue is cause by CMAKE_INSTALL_LIBDIR being empty in libftdi1's
CMakeLists.txt, which in turn is due to include(GNUInstallDirs) being
missing. This has been fixed upstream a few commits later, so rather
than backporting a patch, let's just update to the commit containing
the fix, 5e67403c4fb5536a2effe2e91181dd73a2cff91b. The list of changes
upstream is:

5e67403c4fb5536a2effe2e91181dd73a2cff91b cmake: fix building static lib on windows/msvc
2e714eec137f86ca1950457d8226d8cb9b71c495 msvc: quiet uninteresting warnings
d96dbea887373f26755e9873b4ab020f922b7c3b fix unit var warning if ftdi_read_eeprom_location returned error, data would not be initialized
d31e3d5697eacbe87cd310b5bce615f3d8426cc0 cmake: fix elseif statement
c2b7c25e1272222c1719daea5761093fbc9c3010 msvc: fix shadowed variable warning
c4962c38a1ab470fbdc835c231567bd582eb5a5a msvc: fix warnings by using all enum values in case statements
2a992306c0acf938b29fa0cd5fbc160e24424209 Add SHAREDLIBS option
18499a2fa496c20e5e35590bb89eb701fa9fdfea Ignore VSCode temp folder
7676fb59ecd9fac9e5ea39439905c923ee7ee8c9 python/CMakeLists.txt: rework policy CMP0078
cfaec73e0a5ad9d05d62f1f5c393ab1c59ba771b C++ wrapper: get rid of the Boost dependency
12a8de0daba0816227c7010fc1b84d0abf70a500 .editorconfig: fix insert_final_newline option
3d7293651483130af9e8c5fe685d28b226baa99b Ignore clangd specific files
72e0e1e40126a2a9498fb249ca26a727bd670139 examples/async.c: remove unused includes
bfcdea286df81660b980a3bc91902b5970ff6347 examples/async.c: fix sometimes-uninitialized warning

(Yes the commit containing the fix is titled "cmake: fix building
static lib on windows/msvc", but because it adds
include(GNUInstallDirs), it also fixes our problem).

Fixes:

  https://autobuild.buildroot.net/results/3600a9b7f323b4610ac67feb7171c0e10b6383d7/

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libftdi1/libftdi1.hash | 2 +-
 package/libftdi1/libftdi1.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index 414b0af0ed..e110da6b5b 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9ff3b0845ed410ed940a6190fc4c11d549617de3dd4e4c4a959268eb920c18ec  libftdi1-v1.5-48-g22b4667a8c3bc483494ba735ba4ae4d5cb8a0f03-git4.tar.gz
+sha256  e85f1161d19f60b570751f3c8be334d309c710e5f77ef9afdc0eaa2c4fa73c95  libftdi1-v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b-git4.tar.gz
 
 # Hash for license files:
 sha256  524f46428bf72bb8c6acfeca4909551fd2e0bdbb5305406d38382f4056095c56  LICENSE
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 8a6db58476..31ffa1aca3 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = v1.5-48-g22b4667a8c3bc483494ba735ba4ae4d5cb8a0f03
+LIBFTDI1_VERSION = v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b
 LIBFTDI1_SITE = git://developer.intra2net.com/libftdi
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
