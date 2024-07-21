Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77610C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1490606B4;
	Sun, 21 Jul 2024 16:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdwN1O8k4KPc; Sun, 21 Jul 2024 16:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB96560703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB96560703;
	Sun, 21 Jul 2024 16:33:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 801141BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EACD840120
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqxbf9Ia2rxB for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86C0400F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C86C0400F3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:32:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5E3786F4C; Sun, 21 Jul 2024 16:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:31:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13c0b7cd08c8300d288409ab88907f97b1a95687
X-Git-Newrev: b22828cb0b4c6e467c86c10588bea2e247eca7ec
X-Patchwork-Hint: ignore
Message-Id: <20240721163223.B5E3786F4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtmpdump: bump to latest git
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

commit: https://git.buildroot.net/buildroot/commit/?id=b22828cb0b4c6e467c86c10588bea2e247eca7ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (not needed since
https://git.ffmpeg.org/gitweb/rtmpdump.git/commit/06142d3ef4754c9ebd6c4c5f52c858aa63811161)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                          |  1 -
 package/rtmpdump/0001-include-limits.h.patch | 39 ----------------------------
 package/rtmpdump/rtmpdump.hash               |  2 +-
 package/rtmpdump/rtmpdump.mk                 |  2 +-
 4 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6505cd6f76..905d14178f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1225,7 +1225,6 @@ package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch lib_patc
 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch lib_patch.Upstream
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch lib_patch.Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
-package/rtmpdump/0001-include-limits.h.patch lib_patch.Upstream
 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patch.Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
diff --git a/package/rtmpdump/0001-include-limits.h.patch b/package/rtmpdump/0001-include-limits.h.patch
deleted file mode 100644
index 172a9630f7..0000000000
--- a/package/rtmpdump/0001-include-limits.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b9d010d2c07e07eeffa510f14ff833ecb10dc0c8 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 24 Jun 2019 21:11:33 +0200
-Subject: [PATCH] include <limits.h>
-
-Needed after
-https://repo.or.cz/rtmpdump.git/commitdiff/c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
-
-to fix
-
-rtmp.c: In function 'HTTP_read':
-rtmp.c:4459:26: error: 'INT_MAX' undeclared (first use in this function); did you mean 'INT8_MAX'?
-
-reported by buildroot autobuilders:
-http://autobuild.buildroot.net/?reason=rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
-
-Patch sent upstream by e-mail to author of
-https://repo.or.cz/rtmpdump.git/patch/c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- librtmp/rtmp.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/librtmp/rtmp.h b/librtmp/rtmp.h
-index 6d7dd89..48d4fc3 100644
---- a/librtmp/rtmp.h
-+++ b/librtmp/rtmp.h
-@@ -32,6 +32,7 @@
- #include <errno.h>
- #include <stdint.h>
- #include <stddef.h>
-+#include <limits.h>
- 
- #include "amf.h"
- 
--- 
-2.20.1
-
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index feec5f4878..3aca9bda39 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  810908e60c8f4e453bc828775937e4bad996fafac89b9546652f17e08a3dac81  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-git4.tar.gz
+sha256  372b5574af90ad3ec8cb7fde9bb3db76f7f7379c135a31d7af2c1ebba3051526  rtmpdump-6f6bb1353fc84f4cc37138baa99f586750028a01-git4.tar.gz
 sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 4c8ecfe127..4dfacb594a 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTMPDUMP_VERSION = c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
+RTMPDUMP_VERSION = 6f6bb1353fc84f4cc37138baa99f586750028a01
 RTMPDUMP_SITE = https://git.ffmpeg.org/rtmpdump
 RTMPDUMP_SITE_METHOD = git
 RTMPDUMP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
