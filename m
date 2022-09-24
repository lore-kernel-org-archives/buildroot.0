Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE349C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75066408B7;
	Sat, 24 Sep 2022 08:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75066408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOOOxGB7hftW; Sat, 24 Sep 2022 08:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8740340A68;
	Sat, 24 Sep 2022 08:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8740340A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F11981BF861
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCD198146C
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD198146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L8_SCP8HyI8r for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4E2881469
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E2881469
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D09F185F82; Sat, 24 Sep 2022 08:24:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 10:23:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2471520c6836123e65b2cfe96275d45c84e9781f
X-Git-Newrev: f8c8886f7be7db00e70bd0362e3473a2c54663b5
X-Patchwork-Hint: ignore
Message-Id: <20220924082402.D09F185F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flatbuffers: bump version to 2.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8c8886f7be7db00e70bd0362e3473a2c54663b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated patch 0001:
- updated upstream status to reflect its rejection
- rebased
- added fix for uClibc build, fixes non-locale kodi build:
  https://lists.buildroot.org/pipermail/buildroot/2022-August/648240.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nclude-flatbuffers-base.h-fix-build-on-musl.patch | 20 ++++++++++++--------
 package/flatbuffers/flatbuffers.hash                 |  2 +-
 package/flatbuffers/flatbuffers.mk                   |  2 +-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
index b4bc0e12de..82feca3e39 100644
--- a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
+++ b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
@@ -28,7 +28,10 @@ Fixes:
  - http://autobuild.buildroot.org/results/68045b83e94f8caa337b1af7ed5f493ac1a55c47
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/google/flatbuffers/pull/6773]
+[Upstream status: Rejected:
+ https://github.com/google/flatbuffers/pull/6773]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased and added fix for uClibc-build)
 ---
  include/flatbuffers/base.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -37,15 +40,16 @@ diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
 index de7898dc..101c7598 100644
 --- a/include/flatbuffers/base.h
 +++ b/include/flatbuffers/base.h
-@@ -266,7 +266,7 @@ namespace flatbuffers {
- #ifndef FLATBUFFERS_LOCALE_INDEPENDENT
-   // Enable locale independent functions {strtof_l, strtod_l,strtoll_l, strtoull_l}.
-   #if ((defined(_MSC_VER) && _MSC_VER >= 1800)            || \
--       (defined(_XOPEN_VERSION) && (_XOPEN_VERSION>=700)) && (!defined(__ANDROID_API__) || (defined(__ANDROID_API__) && (__ANDROID_API__>=21))))
-+       (defined(__GLIBC__) && defined(_XOPEN_VERSION) && (_XOPEN_VERSION>=700)) && (!defined(__ANDROID_API__) || (defined(__ANDROID_API__) && (__ANDROID_API__>=21))))
+@@ -264,7 +264,8 @@ namespace flatbuffers {
+   // strtoull_l}.
+   #if (defined(_MSC_VER) && _MSC_VER >= 1800) || \
+       (defined(__ANDROID_API__) && __ANDROID_API__>= 21) || \
+-      (defined(_XOPEN_VERSION) && (_XOPEN_VERSION >= 700)) && \
++      (defined(_XOPEN_VERSION) && (_XOPEN_VERSION >= 700) && \
++        defined(__GLIBC__) && !defined(__UCLIBC__)) && \
+         (!defined(__Fuchsia__) && !defined(__ANDROID_API__))
      #define FLATBUFFERS_LOCALE_INDEPENDENT 1
    #else
-     #define FLATBUFFERS_LOCALE_INDEPENDENT 0
 -- 
 2.30.2
 
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 6b54dbde92..6382b86f1b 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e2dc24985a85b278dd06313481a9ca051d048f9474e0f199e372fea3ea4248c9  flatbuffers-2.0.6.tar.gz
+sha256  f97965a727d26386afaefff950badef2db3ab6af9afe23ed6d94bfb65f95f37e  flatbuffers-2.0.8.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 2cbd68c346..9d286bf9e1 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 2.0.6
+FLATBUFFERS_VERSION = 2.0.8
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
