Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4D0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA3DF41D69;
	Fri, 28 Jan 2022 21:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6dNMWGzd6Xg; Fri, 28 Jan 2022 21:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FE041D7C;
	Fri, 28 Jan 2022 21:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CEA61BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3819040BC1
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeL0uHSEDUeb for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:19:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30E6B40605
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:19:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6063182B52; Fri, 28 Jan 2022 21:12:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:16:56 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 9a76cdac04445e8d2003f45522827c7cd959c7a9
X-Git-Newrev: 8ed039eafbc418b271d24eb16dba5b924d02c914
X-Patchwork-Hint: ignore
Message-Id: <20220128211214.6063182B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/mongodb: security
 bump to version 4.2.18
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ed039eafbc418b271d24eb16dba5b924d02c914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix CVE-2021-20330: An attacker with basic CRUD permissions on a
replicated collection can run the applyOps command with specially
malformed oplog entries, resulting in a potential denial of service on
secondaries. This issue affects MongoDB Server v4.0 versions prior to
4.0.25; MongoDB Server v4.2 versions prior to 4.2.14; MongoDB Server
v4.4 versions prior to 4.4.6.

Drop third patch (already in version)

https://docs.mongodb.com/master/release-notes/4.2/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 49bbf644d4acd3dfe6f3fd0db39e6fed78abf58f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch | 49 ----------------------
 package/mongodb/mongodb.hash                       |  2 +-
 package/mongodb/mongodb.mk                         |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
deleted file mode 100644
index 02b35c6e4f..0000000000
--- a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ef08d0dbc99db8c4620512e92bfb3154282eb5d3 Mon Sep 17 00:00:00 2001
-From: Andrew Morrow <acm@mongodb.com>
-Date: Wed, 15 Sep 2021 15:23:42 -0400
-Subject: [PATCH] SERVER-59459 With glibc-2.34, MINSIGSTKSZ is no longer a
- constant
-
-[Retrieved (and backported) from:
-https://github.com/mongodb/mongo/commit/ef08d0dbc99db8c4620512e92bfb3154282eb5d3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mongo/stdx/thread.h | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
-index 7b15bb561bd9..6f1e16cdeb36 100644
---- a/src/mongo/stdx/thread.h
-+++ b/src/mongo/stdx/thread.h
-@@ -76,11 +76,19 @@ class SigAltStackController {
-     }
- 
- private:
-+    static size_t _getStackSize() {
-+        // It would be nice for this to be a constexpr, but
-+        // MINSIGSTKSZ became a macro that invoked `sysconf` in glibc
-+        // 2.34.
-+        static const std::size_t kMinSigStkSz = MINSIGSTKSZ;
-+        return std::max(kMongoMinSignalStackSize, kMinSigStkSz);
-+    }
-+
-     void _install() const {
-         stack_t ss;
-         ss.ss_sp = _stackStorage.get();
-         ss.ss_flags = 0;
--        ss.ss_size = kStackSize;
-+        ss.ss_size = _getStackSize();
-         if (sigaltstack(&ss, nullptr)) {
-             abort();
-         }
-@@ -107,9 +115,7 @@ class SigAltStackController {
-     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
-     static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
- 
--    static constexpr std::size_t kStackSize =
--        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
--    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
-+    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(_getStackSize());
- 
- #else   // !MONGO_HAS_SIGALTSTACK
-     auto makeInstallGuard() const {
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 3b2580cc43..02da8ad452 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ab5a8b6e967614a8ad67c0ca87124c4f380d4a476508973a7995d54ed902b02e  mongodb-src-r4.2.11.tar.gz
+sha256  5bbb9567cc1f358ac7d9f37d9fe749862728bdf9f742d1dfc5e35a8b6c2985ba  mongodb-src-r4.2.18.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index ede03e44d6..8c2e0db2bb 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION = 4.2.11
+MONGODB_VERSION = 4.2.18
 MONGODB_SITE = https://fastdl.mongodb.org/src
 MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
