Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D08C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:28:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639E9610A1
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 639E9610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E8EC840A2;
	Wed, 22 Sep 2021 19:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETrsoVXiRa_X; Wed, 22 Sep 2021 19:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 849F28401F;
	Wed, 22 Sep 2021 19:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13F001BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0061140620
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x44pFVglKEae for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:28:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E36B440601
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:28:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D53578C980; Wed, 22 Sep 2021 19:26:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:19:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e4230e6e0429d0f1c0c876de41ae0b86c6b7dfc
X-Git-Newrev: 69e4493fb1e676f29347701a58f67d81bd76b1eb
X-Patchwork-Hint: ignore
Message-Id: <20210922192612.D53578C980@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: security bump to version
 4.14.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=69e4493fb1e676f29347701a58f67d81bd76b1eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes a number of bugfixes and the security fixes up to xsa-384:
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-3/

Drop the now upstream
0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch, and
renumber the remaining patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ch => 0002-Fix-build-with-64-bits-time_t.patch} |  0
 ...-Fix-osdep_xenforeignmemory_map-prototype.patch | 33 ----------------------
 ...0003-libs-light-fix-tv_sec-printf-format.patch} |  0
 ...004-libs-light-fix-tv_sec-fprintf-format.patch} |  0
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 6 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/xen/0003-Fix-build-with-64-bits-time_t.patch b/package/xen/0002-Fix-build-with-64-bits-time_t.patch
similarity index 100%
rename from package/xen/0003-Fix-build-with-64-bits-time_t.patch
rename to package/xen/0002-Fix-build-with-64-bits-time_t.patch
diff --git a/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
deleted file mode 100644
index 170d1c22c2..0000000000
--- a/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
-From: Anthony PERARD <anthony.perard@citrix.com>
-Date: Tue, 1 Jun 2021 16:41:47 +0100
-Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
-
-Commit cf8c4d3d13b8 made some preparation to have one day
-variable-length-array argument, but didn't declare the array in the
-function prototype the same way as in the function definition. And now
-GCC 11 complains about it.
-
-Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
-Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
-Reviewed-by: Jan Beulich <jbeulich@suse.com>
-[Retrieved from:
-https://github.com/xen-project/xen/commit/5d3e4ebb5c71477d74a0c503438545a0126d3863]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/libs/foreignmemory/private.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
-index 1ee3626dd278..5bb0cefb0987 100644
---- a/tools/libs/foreignmemory/private.h
-+++ b/tools/libs/foreignmemory/private.h
-@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
- void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
-                                  uint32_t dom, void *addr,
-                                  int prot, int flags, size_t num,
--                                 const xen_pfn_t arr[num], int err[num]);
-+                                 const xen_pfn_t arr[/*num*/], int err[/*num*/]);
- int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
-                                  void *addr, size_t num);
- 
diff --git a/package/xen/0004-libs-light-fix-tv_sec-printf-format.patch b/package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
similarity index 100%
rename from package/xen/0004-libs-light-fix-tv_sec-printf-format.patch
rename to package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
diff --git a/package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch b/package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
similarity index 100%
rename from package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch
rename to package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index fd0310c921..e30db09516 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e35099a963070e3c9f425d1e36cbb1c40b7874ef449bfafd6688343783cb25ad  xen-4.14.2.tar.gz
+sha256  a3dad76a772393a1875e8f44a6059a95fea4bde40f97b800966969ac6f3a498d  xen-4.14.3.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index b84214ed16..b635996afb 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.2
+XEN_VERSION = 4.14.3
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
