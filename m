Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0DC43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF149408E2;
	Wed,  8 Jun 2022 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0II_qEf3jjI4; Wed,  8 Jun 2022 21:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9EF408B0;
	Wed,  8 Jun 2022 21:03:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 398C21BF968
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 21:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 282938264A
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 21:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPXAo53wuqZr for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 21:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0F46825B1
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 21:02:58 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.5.88])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8E9A219F593;
 Wed,  8 Jun 2022 23:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654722175;
 bh=tf8bBFVHtn5Zz+Ku7xlMrS9m6UAF4HZIf1Nv/UUzEZA=;
 h=From:To:Cc:Subject:Date:From;
 b=TdaDo8bnj4W/yFzTpncZ3/738iWFGHOCXejeEWce991JE/OeDo+qC7LNI8FCGhOBD
 zSGnPXg37QLBHNls4x+RJFTe3YUbpiWckRmWu3wTvnedtGrFUKgZ6SrnSarYFe7u5J
 F4aw7ZWY8p+HLl6kqzr9+XTW0x6H5vmRuT5RGn1TU0rFunL/vuzk0CsKyk9nS20ycG
 BE7HpOcRkgw72YTTJrAzUE7kiXla8d4bUZWbR/ZP1YVLR8lxI6Mwjq69GKw71l1iRL
 msCHNvVKO6uRXUklPTxvleyxbiFrGVC3dkoPPJA+skQ2KT2IIVUgJ4R4Zq1T/KynPn
 Vy0TSLY9aS9Ng==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 23:02:46 +0200
Message-Id: <20220608210246.336928-1-ju.o@free.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/poco: bump to version 1.11.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit also drop a patch which is now included upstream.

For changelog, see:
https://raw.githubusercontent.com/pocoproject/poco/poco-1.11.2-release/CHANGELOG

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ouble-conversion-detection-to-fix-co.patch | 36 -------------------
 package/poco/poco.hash                        |  2 +-
 package/poco/poco.mk                          |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch

diff --git a/package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch b/package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch
deleted file mode 100644
index 7b31729347..0000000000
--- a/package/poco/0001-Add-back-NIOS2-double-conversion-detection-to-fix-co.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d328829e9cb8b9fde9e70b07f2b991972cf474d1 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Sat, 12 Mar 2022 10:34:04 +0100
-Subject: [PATCH] Add back NIOS2 double conversion detection to fix compile
- errors
-
-The commit
-https://github.com/pocoproject/poco/commit/558324f672d824300498060aff63356bc6bb8097
-
-removed the nios2 support, which was originally added in
-https://github.com/pocoproject/poco/commit/e7b91e8125d6910b53f94de5be4bb53f38dc77c1
-
-This commit add it back.
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- Foundation/src/utils.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index 4328344d7..0a222c77d 100644
---- a/Foundation/src/utils.h
-+++ b/Foundation/src/utils.h
-@@ -102,7 +102,8 @@ int main(int argc, char** argv) {
-     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
-     defined(__riscv) || \
-     defined(__or1k__) || defined(__arc__) || \
--    defined(__EMSCRIPTEN__)
-+    defined(__EMSCRIPTEN__) || \
-+    defined(nios2) || defined(__nios2) || defined(__nios2__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__) || \
-     defined(__pnacl__) || defined(__native_client__)
--- 
-2.35.1
-
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 78d7d0b96e..4bf20f3f6b 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2412a5819a239ff2ee58f81033bcc39c40460d7a8b330013a687c8c0bd2b4ac0  poco-1.11.1.tar.gz
+sha256  9774651a02e4cfa79fc43b7db617e45d353ede00b7be8afd0e74e6afb23d3793  poco-1.11.2.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index fcf480c2a8..c06e55210e 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.11.1
+POCO_VERSION = 1.11.2
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
