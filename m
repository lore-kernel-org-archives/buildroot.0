Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BEFECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B807F8130E;
	Thu,  1 Sep 2022 20:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B807F8130E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHfnnSci0wjA; Thu,  1 Sep 2022 20:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5323812ED;
	Thu,  1 Sep 2022 20:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5323812ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C3B81BF393
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA6241736
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA6241736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HET6UKjnhLZ2 for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 20:12:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD2F41677
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DD2F41677
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 20:12:43 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout01.t-online.de (Postfix) with SMTP id 9107B84A9;
 Thu,  1 Sep 2022 22:12:06 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.182.238]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oTqXl-2ucNhi0; Thu, 1 Sep 2022 22:12:05 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36488)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oTqXl-0003gc-0Q;
 Thu, 01 Sep 2022 22:12:05 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 22:12:04 +0200
Message-Id: <20220901201204.3514426-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
References: <20220901201204.3514426-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662063125-01453B16-50D89330/0/0 CLEAN NORMAL
X-TOI-MSGID: 34e71783-a9a1-445c-9cf2-e0f28e94ec5a
Subject: [Buildroot] [PATCH/next 3/3] package/flatbuffers: bump version to
 2.0.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated patch 0001:
- updated upstream status to reflect its rejection
- rebased
- added fix for uClibc build, fixes non-locale kodi build:
  https://lists.buildroot.org/pipermail/buildroot/2022-August/648240.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...flatbuffers-base.h-fix-build-on-musl.patch | 20 +++++++++++--------
 package/flatbuffers/flatbuffers.hash          |  2 +-
 package/flatbuffers/flatbuffers.mk            |  2 +-
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
