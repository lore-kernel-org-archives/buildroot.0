Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949B2C67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 416F340474;
	Mon, 24 Oct 2022 21:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 416F340474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNFbiGx2yNv1; Mon, 24 Oct 2022 21:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED62A40325;
	Mon, 24 Oct 2022 21:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED62A40325
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 023C01BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAEE84031E
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAEE84031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9AtTIuyT8Q8 for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB008402E1
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB008402E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA34487049; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fa63bce3f95105220474c1bc6b940e8f2340546
X-Git-Newrev: aa371ee5341b8a3e445d83557a413c821fd0309d
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.BA34487049@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libminiupnpc: bump to version 2.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa371ee5341b8a3e445d83557a413c821fd0309d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2022/02/20:
  upnpc: use of @ to replace local lan address

2021/11/09:
  python module : Allow to specify the root description url

- Drop patch (already in version)
- Update hash of LICENSE file (license "refined" for github with
  https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13)

http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.4.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pc-CMakeLists-txt-fix-install-for-headers.patch | 43 ----------------------
 package/libminiupnpc/libminiupnpc.hash             |  4 +-
 package/libminiupnpc/libminiupnpc.mk               |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch b/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
deleted file mode 100644
index 2e4c8a69e6..0000000000
--- a/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f82b0563a72e33800f5918ead68c41bcda1fd4c1 Mon Sep 17 00:00:00 2001
-From: heitbaum <rudi@heitbaum.com>
-Date: Fri, 1 Oct 2021 00:00:27 +1000
-Subject: [PATCH] miniupnpc/CMakeLists.txt: fix install for headers
-
-[Retrieved from:
-https://github.com/miniupnp/miniupnp/commit/f82b0563a72e33800f5918ead68c41bcda1fd4c1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- miniupnpc/CMakeLists.txt | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0553eeb3..6b0904c0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -221,16 +221,16 @@ endif ()
- 
- if (NOT UPNPC_NO_INSTALL)
-   install (FILES
--    miniupnpc.h
--    miniwget.h
--    upnpcommands.h
--    igd_desc_parse.h
--    upnpreplyparse.h
--    upnperrors.h
--    upnpdev.h
--    miniupnpctypes.h
--    portlistingparse.h
--    miniupnpc_declspec.h
-+    include/miniupnpc.h
-+    include/miniwget.h
-+    include/upnpcommands.h
-+    include/igd_desc_parse.h
-+    include/upnpreplyparse.h
-+    include/upnperrors.h
-+    include/upnpdev.h
-+    include/miniupnpctypes.h
-+    include/portlistingparse.h
-+    include/miniupnpc_declspec.h
-     DESTINATION include/miniupnpc
-   )
- 
diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 4714dd6f48..5dca8dd6cf 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dce41b4a4f08521c53a0ab163ad2007d18b5e1aa173ea5803bd47a1be3159c24  miniupnpc-2.2.3.tar.gz
-sha256  90bb92bf524970569296022fea562c85a4ec4d99a16f3aef2144d13d7087b631  LICENSE
+sha256  481a5e4aede64e9ef29895b218836c3608d973e77a35b4f228ab1f3629412c4b  miniupnpc-2.2.4.tar.gz
+sha256  a0f853256954f388ce4fab5faaef6a1f5bcd5e682c3c7c70b07b7130e932a021  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index f3661396ca..9dc5c719a9 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.3
+LIBMINIUPNPC_VERSION = 2.2.4
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
