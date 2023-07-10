Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A98EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8735820BB;
	Mon, 10 Jul 2023 17:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8735820BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlU_3w7fAbRt; Mon, 10 Jul 2023 17:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA2B82070;
	Mon, 10 Jul 2023 17:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA2B82070
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94DBB1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B4A482070
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B4A482070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ry6Zu1SP3owS for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:42:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A91B82068
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A91B82068
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7796786C05; Mon, 10 Jul 2023 17:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:41:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 568dd29c2f9c3c55355469897bf29236fb2f364b
X-Git-Newrev: ea7caf9c47fb271d24b8bec6df08d6b60596759a
X-Patchwork-Hint: ignore
Message-Id: <20230710174220.7796786C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: update after patch
 removals
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea7caf9c47fb271d24b8bec6df08d6b60596759a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several recent commits removed patches without updating
.checkpatchignore, let's fix that.

Fixes:

.checkpackageignore:882: ignored file package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch is missing
.checkpackageignore:883: ignored file package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch is missing
.checkpackageignore:949: ignored file package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch is missing
.checkpackageignore:1357: ignored file package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch is missing
.checkpackageignore:1685: ignored file package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch is missing
.checkpackageignore:1686: ignored file package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch is missing
.checkpackageignore:1687: ignored file package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch is missing

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7f45b6a808..b583c3db6a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -879,8 +879,6 @@ package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch Upstream
 package/linux-tools/S10hyperv Variables
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch Upstream
 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch Upstream
-package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch Upstream
-package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch Upstream
 package/linuxptp/S65ptp4l Indent Shellcheck
 package/linuxptp/S66phc2sys Indent Shellcheck
 package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch Upstream
@@ -946,7 +944,6 @@ package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch Upst
 package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch Upstream
 package/makedumpfile/0002-Handle-__mips64.patch Upstream
 package/mariadb/0001-add-extra-check-for-librt.patch Upstream
-package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch Upstream
 package/mariadb/S97mysqld Indent Shellcheck Variables
 package/matchbox-keyboard/mb-applet-kbd-wrapper.sh Shellcheck TrailingSpace
 package/matchbox-lib/0001-index-is-legacy.patch Upstream
@@ -1354,7 +1351,6 @@ package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.p
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch Upstream
 package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch Upstream
-package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch Upstream
 package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch Upstream
 package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch Upstream
 package/rtmpdump/0001-include-limits.h.patch Upstream
@@ -1682,9 +1678,6 @@ package/zip/0005-unix-configure-remove-GID-UID-size-check.patch Upstream
 package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch Upstream
 package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch Upstream
 package/zip/0008-fix-musl-static-build.patch Upstream
-package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch Upstream
-package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch Upstream
-package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch Upstream
 package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch Upstream
 package/znc/0001-LibreSSL-3.5-opaqued-structures.patch Upstream
 package/znc/0002-Fix-build-with-libressl.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
