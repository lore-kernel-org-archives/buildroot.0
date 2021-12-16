Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C97DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 22:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1485E61074;
	Thu, 16 Dec 2021 22:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqh71c20YMfe; Thu, 16 Dec 2021 22:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52C6F61071;
	Thu, 16 Dec 2021 22:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01D921BF29D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E54BC83F89
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FWLBom5eYMD for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 22:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB9FB83F7F
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 22:31:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c4so586630wrd.9
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 14:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILF5wSh1nqo/lV80bqVS1evDI0Z0Rn9IupVnq8MN/8E=;
 b=NZCsbABkxMPSWghK5FCexqVJ65NE5G5jPOq5vW9blxOepJAbczFEMzrQ/tjTVV3ixB
 2gVrN/3s4G183tlLJldVqy671gtQzmGBnclpJdwRRmnbxl3mFE8197rvXOKoXOj4aSDX
 LjBYSMC/p/C2IxY/XT+RVHg9MhKc9L39UOx/qKui70HLIUJF/O/iWcvgkqnJD/0kxusH
 nH9caX/9gZNSu217mZWd/GyoCoN9AwPQmubhNlI88Kf9KzEsLepKK9yxnRDCbn4w5ODk
 BYgmJ34ezcwOLZF2qtD6ZimLtVkGPBR1beRCmAxF2pehlqtA50FhpN6RbjaDRLLusY2r
 yOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILF5wSh1nqo/lV80bqVS1evDI0Z0Rn9IupVnq8MN/8E=;
 b=v1miFvRb56KdYG9gHGm/Makl2tUi0dDzXvbB3LAcAghSXLSALIim44V1DPeyTEz7qr
 CNdyVSCf+lxnYinzTmPRQ4HKty2tB9d2rq/nRemOY1WlLsRRbMfjNZ0voavmRLSnNKsc
 LHmOmEs7ze6asYCGD1rl5iT/AtWVhXYQIjg+FjRPnPw3in4KX2i6TQTHO5k8SqPeqDot
 x7kj23COug5Qk9KDJ4jEU5e0tZtsYqWrIZSUc/WZofDaepttNhy0ZfJZ0OF7H1rmw8Bq
 sd4Ciy91GNjHSv8JoFbuXmNh/t2DPt8UY//iEEF/dEVM/ZObHDBEziWYapDJbKMRdMAF
 psFw==
X-Gm-Message-State: AOAM531uLY8B/0Q2ruo2Gm7PvJg/81pcHdd9SfVNsVAgluib38ghrVGU
 7/aTKzC8fvd2avz17hdAmMw/dNNorWtTtw==
X-Google-Smtp-Source: ABdhPJwrWM/8VZqV6BfRn47TzqheY9RKd3lHV4DR//qR1UYpgcoVfU+aY9iS+3FMJ7IZUPFwl24JrQ==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr72434wrr.177.1639693874991;
 Thu, 16 Dec 2021 14:31:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id v15sm5842338wro.35.2021.12.16.14.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:31:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 23:30:50 +0100
Message-Id: <20211216223050.1028050-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/stella: bump to version 6.6
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- C++17 is mandatory since version 6.5 and
  https://github.com/stella-emu/stella/commit/fe2b4d630e1aeae80d0e90d7fe5e79b396c796a6
- Update hash of Copyright.txt, year updated:
  https://github.com/stella-emu/stella/commit/21438a82cc5245ff7437c9e61425d9d4307f7273

https://github.com/stella-emu/stella/blob/6.6/Changes.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/0001-configure-add-CC.patch | 30 ++++++++++++++++++++++
 package/stella/Config.in                   |  6 ++---
 package/stella/stella.hash                 |  4 +--
 package/stella/stella.mk                   |  2 +-
 4 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 package/stella/0001-configure-add-CC.patch

diff --git a/package/stella/0001-configure-add-CC.patch b/package/stella/0001-configure-add-CC.patch
new file mode 100644
index 0000000000..d4b29e39b5
--- /dev/null
+++ b/package/stella/0001-configure-add-CC.patch
@@ -0,0 +1,30 @@
+From 143cf9fa13a07b827de7065a5e919631406b0941 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Dec 2021 22:46:52 +0100
+Subject: [PATCH] configure: add CC (#854)
+
+Add CC to fix the following build failure when cross-compiling which is
+raised since
+https://github.com/stella-emu/stella/commit/771b5b44e31de1b81a552ee47b65014fbc338776:
+
+out/src/sqlite/sqlite3.o: file not recognized: file format not recognized
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/stella-emu/stella/commit/143cf9fa13a07b827de7065a5e919631406b0941]
+---
+ configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure b/configure
+index df666b377..0101d2567 100755
+--- a/configure
++++ b/configure
+@@ -899,6 +899,7 @@ echo "Creating config.mak"
+ cat > config.mak << EOF
+ # -------- Generated by configure -----------
+ 
++CC := $CC
+ CXX := $CXX
+ CXXFLAGS := $CXXFLAGS
+ LD := $LD
diff --git a/package/stella/Config.in b/package/stella/Config.in
index 7722f8a540..b5d148489a 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_STELLA
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
 	help
@@ -11,10 +11,10 @@ config BR2_PACKAGE_STELLA
 
 	  https://stella-emu.github.io/
 
-comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 6"
+comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 7"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 comment "stella needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index c40d96616a..8aa5118165 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  0346900e9ba4b6d532b72d956adc5078502a9bd6bbc1648bb3dd68f5ffd4859b  stella-6.4-src.tar.xz
-sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
+sha256  d481efc6d27b5294565dfcc10983de2dbc4db8a59932a678ffdb4d2404b8c207  stella-6.6-src.tar.xz
+sha256  d5e5897578c2590e48328986cebd950ff215653f7f506ef93accf981870366a6  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 9e21606155..198a1134dc 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.4
+STELLA_VERSION = 6.6
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
