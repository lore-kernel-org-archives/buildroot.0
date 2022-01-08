Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAC6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B64403D0;
	Sat,  8 Jan 2022 15:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9Hf_xygPZsh; Sat,  8 Jan 2022 15:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA27402A9;
	Sat,  8 Jan 2022 15:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F24651BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C495040103
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8wan4jHaLTh for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABFF8400F2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 32E9A82DF1; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:48:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff375358383f3a355b022d1061f5ad43b5920fe4
X-Git-Newrev: df22a9d6b77d9e245dceb7c8fd3f9d80c8917ca0
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.32E9A82DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mp4v2: bump to version 5.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=df22a9d6b77d9e245dceb7c8fd3f9d80c8917ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mp4v2/0001-Fix-GCC7-build.patch            | 33 ----------------------
 ...src-mp4track.cpp-replace-nullptr-by-NULL.patch} |  2 +-
 ...02-Static-cast-to-unsigned-int-for-cases.patch} |  0
 package/mp4v2/mp4v2.hash                           |  2 +-
 package/mp4v2/mp4v2.mk                             |  2 +-
 5 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/mp4v2/0001-Fix-GCC7-build.patch b/package/mp4v2/0001-Fix-GCC7-build.patch
deleted file mode 100644
index 4e39be4a79..0000000000
--- a/package/mp4v2/0001-Fix-GCC7-build.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 855e9674232808ff3be7191b697dfb56917db21f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?S=C3=A9rgio=20M=2E=20Basto?= <sergio@serjux.com>
-Date: Wed, 8 Feb 2017 00:56:32 +0000
-Subject: [PATCH] Fix GCC7 build
-
-if (*pSlash != '\0') {
-
-As it stands the body of that if will always execute and when there are
-no encoding parameters ppEncodingParams will be returned as a pointer to
-an empty string rather than as a null pointer
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Upstream status: https://github.com/TechSmith/mp4v2/pull/36]
----
- src/rtphint.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rtphint.cpp b/src/rtphint.cpp
-index e07309d..1eb01f5 100644
---- a/src/rtphint.cpp
-+++ b/src/rtphint.cpp
-@@ -339,7 +339,7 @@ void MP4RtpHintTrack::GetPayload(
-                 pSlash = strchr(pSlash, '/');
-                 if (pSlash != NULL) {
-                     pSlash++;
--                    if (pSlash != '\0') {
-+                    if (*pSlash != '\0') {
-                         length = (uint32_t)strlen(pRtpMap) - (pSlash - pRtpMap);
-                         *ppEncodingParams = (char *)MP4Calloc(length + 1);
-                         strncpy(*ppEncodingParams, pSlash, length);
--- 
-2.11.0
-
diff --git a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
similarity index 96%
rename from package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
rename to package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
index 72bae463c9..c279b9c56a 100644
--- a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
+++ b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
@@ -16,7 +16,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
+[Upstream status: https://github.com/TechSmith/mp4v2/pull/62]
 ---
  src/mp4track.cpp | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/package/mp4v2/0003-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
similarity index 100%
rename from package/mp4v2/0003-Static-cast-to-unsigned-int-for-cases.patch
rename to package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index 85fce49384..7aa5402c8f 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e3ad6c2dc451b0875dbe34bfe7f51f4fe278b391434c886083e6d3ecd5fa08c2  mp4v2-4.1.3.tar.gz
+sha256  de31e430e2641f25b67d10c47b0cda35279881b0196120e33bcd71b9cef1bd58  mp4v2-5.0.1.tar.gz
 sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 478d10d472..6d29228a13 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 4.1.3
+MP4V2_VERSION = 5.0.1
 MP4V2_SITE = \
 	$(call github,TechSmith,mp4v2,Release-ThirdParty-MP4v2-$(MP4V2_VERSION))
 MP4V2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
