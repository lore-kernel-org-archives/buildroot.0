Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE30C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D6761138;
	Thu,  9 Jun 2022 20:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2J8HQjaua8A1; Thu,  9 Jun 2022 20:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF8861135;
	Thu,  9 Jun 2022 20:32:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3331BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73E2061135
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzjPdbM_X7QZ for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:32:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 921AF60FD5
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CCC4086EC1; Thu,  9 Jun 2022 20:20:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:32:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66d7d3bec341188bcfd83fa70b44dd62e0073431
X-Git-Newrev: 53dea1599adb5a3f131cab68aadb704285a894af
X-Patchwork-Hint: ignore
Message-Id: <20220609202028.CCC4086EC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: bump to version 1.11.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53dea1599adb5a3f131cab68aadb704285a894af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit also drop a patch which is now included upstream.

For changelog, see:
https://raw.githubusercontent.com/pocoproject/poco/poco-1.11.2-release/CHANGELOG

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...OS2-double-conversion-detection-to-fix-co.patch | 36 ----------------------
 package/poco/poco.hash                             |  2 +-
 package/poco/poco.mk                               |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
