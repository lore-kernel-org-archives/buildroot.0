Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44490ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFAC41DE8;
	Sun, 11 Sep 2022 09:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFFAC41DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0wx1IMMIXpc; Sun, 11 Sep 2022 09:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 463FD41DED;
	Sun, 11 Sep 2022 09:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 463FD41DED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 033FB1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6400F61094
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6400F61094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3JDxlxILr9p for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9852C60777
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9852C60777
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82A83835E4; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 22:22:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 169943e8d9170917e0f9f65177e1d9a497d691ee
X-Git-Newrev: 54e033785cfead216db256d2dc3389b2486806f4
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.82A83835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: bump to version 1.80.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=54e033785cfead216db256d2dc3389b2486806f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- drop upstreamed patches

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/0001-json-array-erase-relocate.patch | 65 ----------------------
 ...ame-mips1-to-mips-and-alias-mips1-to-mips.patch | 48 ----------------
 package/boost/boost.hash                           |  4 +-
 package/boost/boost.mk                             |  2 +-
 4 files changed, 3 insertions(+), 116 deletions(-)

diff --git a/package/boost/0001-json-array-erase-relocate.patch b/package/boost/0001-json-array-erase-relocate.patch
deleted file mode 100644
index 899b202279..0000000000
--- a/package/boost/0001-json-array-erase-relocate.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 07d7c3b2e0f8c6b269ba167117cd3e549df2f342 Mon Sep 17 00:00:00 2001
-From: Vinnie Falco <vinnie.falco@gmail.com>
-Date: Wed, 13 Apr 2022 05:49:05 -0700
-Subject: [PATCH] array::erase relocates correctly
-
-fix #692
-
-Signed-off-by: Michael Nosthoff<buildroot@heine.tech>
-[Upstream status: https://github.com/boostorg/json/issues/692]
----
- boost/json/impl/array.ipp |  5 ++++-
- test/array.cpp                    | 16 ++++++++++++++++
- 2 files changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/boost/json/impl/array.ipp b/boost/json/impl/array.ipp
-index 4d067fb5..a2c7fd6d 100644
---- a/boost/json/impl/array.ipp
-+++ b/boost/json/impl/array.ipp
-@@ -491,8 +491,11 @@ erase(
-     auto const p = &(*t_)[0] +
-         (pos - &(*t_)[0]);
-     destroy(p, p + 1);
--    relocate(p, p + 1, 1);
-     --t_->size;
-+    if(t_->size > 0)
-+        relocate(p, p + 1,
-+            t_->size - (p -
-+                &(*t_)[0]));
-     return p;
- }
- 
-diff --git a/libs/json/test/array.cpp b/libs/json/test/array.cpp
-index 1cc87566..4516cc78 100644
---- a/libs/json/test/array.cpp
-+++ b/libs/json/test/array.cpp
-@@ -1269,6 +1269,21 @@ class array_test
-             array{nullptr, "a", "b"}));
-     }
- 
-+    void
-+    testIssue692()
-+    {
-+	    array a;
-+	    object obj;
-+	    obj["test1"] = "hello";
-+	    a.push_back(obj);
-+	    a.push_back(obj);
-+	    a.push_back(obj);
-+	    a.push_back(obj);
-+	    a.push_back(obj);
-+	    while(a.size())
-+		    a.erase(a.begin());
-+    }
-+
-     void
-     run()
-     {
-@@ -1283,6 +1298,7 @@ class array_test
-         testExceptions();
-         testEquality();
-         testHash();
-+        testIssue692();
-     }
- };
- 
diff --git a/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch b/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch
deleted file mode 100644
index cc4ab8a2f8..0000000000
--- a/package/boost/0002-Rename-mips1-to-mips-and-alias-mips1-to-mips.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1a55d1d9c6d1cf7739645080bdd92fe903b4211e Mon Sep 17 00:00:00 2001
-From: Nikita Kniazev <nok.raven@gmail.com>
-Date: Wed, 28 Jul 2021 21:06:54 +0300
-Subject: [PATCH] Rename mips1 to mips and alias mips1 to mips
-
-[Retrieved from:
-https://github.com/boostorg/config/commit/1a55d1d9c6d1cf7739645080bdd92fe903b4211e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- checks/architecture/Jamfile.jam             | 3 ++-
- checks/architecture/{mips1.cpp => mips.cpp} | 4 ++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
- rename checks/architecture/{mips1.cpp => mips.cpp} (89%)
-
-diff --git a/libs/config/checks/architecture/Jamfile.jam b/libs/config/checks/architecture/Jamfile.jam
-index 2ba54f9ad..c3779d917 100644
---- a/libs/config/checks/architecture/Jamfile.jam
-+++ b/libs/config/checks/architecture/Jamfile.jam
-@@ -18,7 +18,8 @@ obj 64 : 64.cpp ;
- 
- obj arm      : arm.cpp ;
- obj combined : combined.cpp ;
--obj mips1    : mips1.cpp ;
-+obj mips     : mips.cpp ;
-+alias mips1  : mips ; # Backwards compatibility
- obj power    : power.cpp ;
- obj riscv    : riscv.cpp ;
- obj sparc    : sparc.cpp ;
-diff --git a/libs/config/checks/architecture/mips1.cpp b/libs/config/checks/architecture/mips.cpp
-similarity index 89%
-rename from checks/architecture/mips1.cpp
-rename to checks/architecture/mips.cpp
-index b4a670b89..85f85583d 100644
---- a/libs/config/checks/architecture/mips1.cpp
-+++ b/libs/config/checks/architecture/mips.cpp
-@@ -1,4 +1,4 @@
--// mips1.cpp
-+// mips.cpp
- //
- // Copyright (c) 2012 Steven Watanabe
- //
-@@ -7,5 +7,5 @@
- // http://www.boost.org/LICENSE_1_0.txt)
- 
- #if !(defined(__mips) || defined(_MIPS_ISA_MIPS1) || defined(_R3000))
--#error "Not MIPS1"
-+#error "Not MIPS"
- #endif
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 0f46befc0c..ab54a4b2fc 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_79_0.html
-sha256  475d589d51a7f8b3ba2ba4eda022b170e562ca3b760ee922c146b6c65856ef39  boost_1_79_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_80_0.html
+sha256  1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0  boost_1_80_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 557c260693..bd1d329982 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.79.0
+BOOST_VERSION = 1.80.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
