Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C07C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE7D140407;
	Sun, 23 Jan 2022 09:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JNsC_jgsO4G; Sun, 23 Jan 2022 09:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B97F40329;
	Sun, 23 Jan 2022 09:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 128921BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008BF60864
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgxdHFxfsdNZ for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:11:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 270D460783
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:11:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7B65B81393; Sun, 23 Jan 2022 09:05:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:11:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 653dc2e710534494ea41c68c22a279cf8736b125
X-Git-Newrev: d824fc1145de69ef00415232668f6f1efe814668
X-Patchwork-Hint: ignore
Message-Id: <20220123090507.7B65B81393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cereal: bump to version 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d824fc1145de69ef00415232668f6f1efe814668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of LICENSE file (license updated to match BSD template:
  https://github.com/USCiLab/cereal/commit/8291f44e05d3e3ee3c4fc9e088231789b701e17e)
- Update indentation in hash file (two spaces)

https://github.com/USCiLab/cereal/releases/tag/v1.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-serialized-shared_ptr-within-the-archive.patch | 67 ----------------------
 package/cereal/cereal.hash                         | 10 ++--
 package/cereal/cereal.mk                           |  5 +-
 3 files changed, 6 insertions(+), 76 deletions(-)

diff --git a/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch b/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
deleted file mode 100644
index 3458ec1b59..0000000000
--- a/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f27c12d491955c94583512603bf32c4568f20929 Mon Sep 17 00:00:00 2001
-From: Michael Walz <code@serpedon.de>
-Date: Tue, 2 Feb 2021 00:50:29 +0100
-Subject: [PATCH] Store a copy of each serialized shared_ptr within the archive
- to prevent the shared_ptr to be freed to early. (#667)
-
-The archives use the memory address pointed by the shared_ptr as a
-unique id which must not be reused during lifetime of the archive.
-Therefore, the archives stores a copy of it.
-This problem was also reported as CVE-2020-11105.
-
-[Retrieved from:
-https://github.com/USCiLab/cereal/commit/f27c12d491955c94583512603bf32c4568f20929]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/cereal/cereal.hpp       | 13 +++++++++++--
- include/cereal/types/memory.hpp |  2 +-
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/include/cereal/cereal.hpp b/include/cereal/cereal.hpp
-index 99bed9d6..f0d15e8b 100644
---- a/include/cereal/cereal.hpp
-+++ b/include/cereal/cereal.hpp
-@@ -369,12 +369,17 @@ namespace cereal
-           point to the same data.
- 
-           @internal
--          @param addr The address (see shared_ptr get()) pointed to by the shared pointer
-+          @param sharedPointer The shared pointer itself (the adress is taked via get()).
-+                               The archive takes a copy to prevent the memory location to be freed
-+                               as long as the address is used as id. This is needed to prevent CVE-2020-11105.
-           @return A key that uniquely identifies the pointer */
--      inline std::uint32_t registerSharedPointer( void const * addr )
-+      inline std::uint32_t registerSharedPointer(const std::shared_ptr<const void>& sharedPointer)
-       {
-+        void const * addr = sharedPointer.get();
-+
-         // Handle null pointers by just returning 0
-         if(addr == 0) return 0;
-+        itsSharedPointerStorage.push_back(sharedPointer);
- 
-         auto id = itsSharedPointerMap.find( addr );
-         if( id == itsSharedPointerMap.end() )
-@@ -645,6 +650,10 @@ namespace cereal
-       //! Maps from addresses to pointer ids
-       std::unordered_map<void const *, std::uint32_t> itsSharedPointerMap;
- 
-+      //! Copy of shared pointers used in #itsSharedPointerMap to make sure they are kept alive
-+      //  during lifetime of itsSharedPointerMap to prevent CVE-2020-11105.
-+      std::vector<std::shared_ptr<const void>> itsSharedPointerStorage;
-+
-       //! The id to be given to the next pointer
-       std::uint32_t itsCurrentPointerId;
- 
-diff --git a/include/cereal/types/memory.hpp b/include/cereal/types/memory.hpp
-index 59e9da9b..cac1f334 100644
---- a/include/cereal/types/memory.hpp
-+++ b/include/cereal/types/memory.hpp
-@@ -263,7 +263,7 @@ namespace cereal
-   {
-     auto & ptr = wrapper.ptr;
- 
--    uint32_t id = ar.registerSharedPointer( ptr.get() );
-+    uint32_t id = ar.registerSharedPointer( ptr );
-     ar( CEREAL_NVP_("id", id) );
- 
-     if( id & detail::msb_32bit )
diff --git a/package/cereal/cereal.hash b/package/cereal/cereal.hash
index ddaf54e7b4..18889b4d42 100644
--- a/package/cereal/cereal.hash
+++ b/package/cereal/cereal.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256 329ea3e3130b026c03a4acc50e168e7daff4e6e661bc6a7dfec0d77b570851d5  cereal-1.3.0.tar.gz
-sha256 18fd7618c44c9fe28b5f54cd19747df3c0472ed33e8507fea571e2acf6e72f34  LICENSE
-sha256 d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
-sha256 7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
-sha256 794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  include/cereal/external/rapidxml/license.txt
+sha256  65ea6ddda98f4274f5c10fb3e07b2269ccdd1e5cbb227be6a2fd78b8f382c976  cereal-1.3.1.tar.gz
+sha256  58604a126af6a671ea390ee3d5b3e42228aa59b2858fb7af1d5b20b31739ccbb  LICENSE
+sha256  d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
+sha256  7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
+sha256  794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  include/cereal/external/rapidxml/license.txt
diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
index 19faa2ac4e..a44f09c743 100644
--- a/package/cereal/cereal.mk
+++ b/package/cereal/cereal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CEREAL_VERSION = 1.3.0
+CEREAL_VERSION = 1.3.1
 CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
 # For licensing, see also: https://github.com/USCiLab/cereal/issues/609
 CEREAL_LICENSE = BSD-3-Clause (cereal), Zlib (base64.hpp), MIT (rapidjson), BSL-1.0 or MIT (rapidxml)
@@ -16,7 +16,4 @@ CEREAL_CONF_OPTS = \
 	-DTHREAD_SAFE=ON \
 	-DJUST_INSTALL_CEREAL=ON
 
-# 0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
-CEREAL_IGNORE_CVES += CVE-2020-11105
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
