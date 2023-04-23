Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C31C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4331E4059F;
	Sun, 23 Apr 2023 10:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4331E4059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDBV1t2_yYtd; Sun, 23 Apr 2023 10:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFEC240BBB;
	Sun, 23 Apr 2023 10:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFEC240BBB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6841C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6176160BA6
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6176160BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4xfynv81Kdv for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:43:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD7960B78
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD7960B78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE1148444D; Sun, 23 Apr 2023 10:43:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 12:42:32 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: af738be309376fec8f888c8f4f831a7855ebea03
X-Git-Newrev: ab0507cd5abf6b68ab73a793e95306008957ef41
X-Patchwork-Hint: ignore
Message-Id: <20230423104343.DE1148444D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openocd: bump to
 0.12.0
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
Content-Type: multipart/mixed; boundary="===============4555086730206663716=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4555086730206663716==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ab0507cd5abf6b68ab73a793e95306008957ef41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

As reported by [1], version 0.12.0 fixes these errors:

Error executing event examine-end on target stm32f7x.cpu:
buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
Info : starting gdb server for stm32f7x.cpu on 3333
Info : Listening on port 3333 for gdb connections
Info : Unable to match requested speed 2000 kHz, using 1800 kHz
Info : Unable to match requested speed 2000 kHz, using 1800 kHz
Error executing event examine-end on target stm32f7x.cpu:
buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
in procedure 'ocd_process_reset'
in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
target halted due to debug-request, current mode: Thread
xPSR: 0x01000000 pc: 0x080003fc msp: 0x20050000
Error executing event reset-init on target stm32f7x.cpu:
buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
in procedure 'ocd_process_reset'
in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/board/stm32f769i-disco.cfg", line 71
at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37

Remove upstream patches.

The new version moves the GPL-2.0 license from COPYING to the subfolder
"preferred", adding the header required by spdxcheck.py. A minimalist
COPYING is added in the top directory, as required by automake, pointing
to the files in LICENSES.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1014849
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[yann.morin.1998@free.fr:
  - one license or license file per line
  - reorder licenses to match file order
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 53bad8f502687c5430cd7a4dc852314a3d75be2c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gure.ac-fix-autoreconf-with-autoconf-2.70.patch | 32 --------
 ...SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch | 89 ----------------------
 package/openocd/openocd.hash                       | 18 ++++-
 package/openocd/openocd.mk                         | 33 +++++++-
 4 files changed, 44 insertions(+), 128 deletions(-)

diff --git a/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
deleted file mode 100644
index ecb716b6fa..0000000000
--- a/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3106d16bbc45de52bc0a8b638a84aa9d7c9abc46 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 6 Oct 2021 17:43:16 +0200
-Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
-
-Fix the following build failure raised with openocd and autoconf >= 2.70
-due to
-http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=aba75f6d4a9c875a9d5d90a07c6b3678db66a4bf:
-
->>> openocd 0.11.0 Autoreconfiguring
-autoreconf: error: configure.ac: AC_INIT not found; not an autoconf script?
-
-Fixes:
- - http://autobuild.buildroot.org/results/5fb7aa28703aff61ba850eac11bd35c8804528ae
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/msteveb/jimtcl/pull/209]
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/jimtcl/configure.ac b/jimtcl/configure.ac
-index b70b5d8..8c45114 100644
---- a/jimtcl/configure.ac
-+++ b/jimtcl/configure.ac
-@@ -1 +1,3 @@
- # Dummy configure.ac to make automake happy
-+AC_INIT([jimtcl], [0.80])
-+AC_OUTPUT
--- 
-2.33.0
-
diff --git a/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch b/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch
deleted file mode 100644
index 776816892b..0000000000
--- a/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From cff0e417da58adef1ceef9a63a99412c2cc87ff3 Mon Sep 17 00:00:00 2001
-From: Antonio Borneo <borneo.antonio@gmail.com>
-Date: Wed, 23 Jun 2021 16:52:16 +0200
-Subject: [PATCH] stlink: fix SIGSEGV with libusb v1.0.24-33-g32a2206 (11618)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The stlink driver incorrectly uses a NULL pointer for libusb's
-struct libusb_context.
-The correct value to be used is local in libusb_helper.c.
-
-Move in the helper file, in a wrapper function, the only call that
-requires the above value, and let stlink driver to use this
-wrapper.
-
-This issue has not triggered any visible problem until a code
-refactoring [1] in libusb has made OpenOCD crashing on Windows and
-on MacOS.
-
-Change-Id: Id1818c8af7cf0d4d17dfa1d22aad079da01ef740
-Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
-Fixes: https://sourceforge.net/p/openocd/tickets/308/
-Fixes: https://github.com/libusb/libusb/issues/928/
-Fixes: 42d8fa899c6a ("stlink_usb: Submit multiple USB URBs at once to improve performance")
-Link: [1] https://github.com/libusb/libusb/commit/32a22069428c
-Reported-by: Andrzej Sierżęga <asier70@gmail.com>
-Co-developed-by: Andrzej Sierżęga <asier70@gmail.com>
-Co-developed-by: Xiaofan Chen <xiaofanc@gmail.com>
-Reviewed-on: http://openocd.zylin.com/6331
-Tested-by: jenkins
-Reviewed-by: Marc Schink <dev@zapb.de>
-Reviewed-by: Xiaofan <xiaofanc@gmail.com>
-Reviewed-by: Andrzej Sierżęga <asier70@gmail.com>
-Reviewed-by: Oleksij Rempel <linux@rempel-privat.de>
-Reviewed-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
-Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
----
- src/jtag/drivers/libusb_helper.c | 5 +++++
- src/jtag/drivers/libusb_helper.h | 1 +
- src/jtag/drivers/stlink_usb.c    | 7 +------
- 3 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/src/jtag/drivers/libusb_helper.c b/src/jtag/drivers/libusb_helper.c
-index f0122d534..18fe4bad4 100644
---- a/src/jtag/drivers/libusb_helper.c
-+++ b/src/jtag/drivers/libusb_helper.c
-@@ -363,3 +363,8 @@ int jtag_libusb_get_pid(struct libusb_device *dev, uint16_t *pid)
- 
- 	return ERROR_FAIL;
- }
-+
-+int jtag_libusb_handle_events_completed(int *completed)
-+{
-+	return libusb_handle_events_completed(jtag_libusb_context, completed);
-+}
-diff --git a/src/jtag/drivers/libusb_helper.h b/src/jtag/drivers/libusb_helper.h
-index fa7d06e28..3e77865d6 100644
---- a/src/jtag/drivers/libusb_helper.h
-+++ b/src/jtag/drivers/libusb_helper.h
-@@ -60,5 +60,6 @@ int jtag_libusb_choose_interface(struct libusb_device_handle *devh,
- 		unsigned int *usb_write_ep,
- 		int bclass, int subclass, int protocol, int trans_type);
- int jtag_libusb_get_pid(struct libusb_device *dev, uint16_t *pid);
-+int jtag_libusb_handle_events_completed(int *completed);
- 
- #endif /* OPENOCD_JTAG_DRIVERS_LIBUSB_HELPER_H */
-diff --git a/src/jtag/drivers/stlink_usb.c b/src/jtag/drivers/stlink_usb.c
-index c68bbb3ca..7b1932b9f 100644
---- a/src/jtag/drivers/stlink_usb.c
-+++ b/src/jtag/drivers/stlink_usb.c
-@@ -497,13 +497,8 @@ static void sync_transfer_wait_for_completion(struct libusb_transfer *transfer)
- {
- 	int r, *completed = transfer->user_data;
- 
--	/* Assuming a single libusb context exists.  There no existing interface into this
--	 * module to pass a libusb context.
--	 */
--	struct libusb_context *ctx = NULL;
--
- 	while (!*completed) {
--		r = libusb_handle_events_completed(ctx, completed);
-+		r = jtag_libusb_handle_events_completed(completed);
- 		if (r < 0) {
- 			if (r == LIBUSB_ERROR_INTERRUPTED)
- 				continue;
--- 
-2.35.1
-
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index 91eb56d930..938711d86c 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,3 +1,15 @@
-# From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
-sha256  43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d  openocd-0.11.0.tar.bz2
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+# From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/
+sha256  af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  openocd-0.12.0.tar.bz2
+sha256  1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING
+sha256  034da732b4f3079b8783fff756613c1cff89dec5ac80c5cdd90532b7539922a1  LICENSES/exceptions/eCos-exception-2.0
+sha256  0a37155eb8bc0cb94477a0cae4f030e39da9317374e8a9f597e9229fd09aff78  LICENSES/license-rules.txt
+sha256  f3ba76203a7b6993db31f987559cc4c621ae1ff78119ced2a669756c2c5fd3b1  LICENSES/preferred/BSD-1-Clause
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSES/preferred/BSD-2-Clause
+sha256  1483f15e9fddc73b5df0acab1c42d21ecd0bf6ade8a79179fb90c09f13d03dcd  LICENSES/preferred/BSD-2-Clause-Views
+sha256  7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  LICENSES/preferred/BSD-3-Clause
+sha256  5cf024f6e3611d5c6fb98748d1a0ad99b8cf9ffe46f2d60fa10c299cd29e0a75  LICENSES/preferred/BSD-Source-Code
+sha256  f35396f4095619f986736ca5e2976b313d381463a35c921c9ae677cc7eb83e28  LICENSES/preferred/GFDL-1.2
+sha256  76515be2d7334a1a038f775238c9a4c2b37e19514248e5eea0434cdfee526f9d  LICENSES/preferred/gfdl-1.2.texi.readme
+sha256  7d35bc44da7bb763022e3c2c32cfc0125dd222060bc50992420599d8e65f6c0a  LICENSES/preferred/GPL-2.0
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
+sha256  9a41b56594cd89743ca72f188318c9871661847074dd16497ae0c695fe3ab9c9  LICENSES/stand-alone/GPL-3.0
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 37a06ca848..9973498cf5 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,12 +4,37 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.11.0
+OPENOCD_VERSION = 0.12.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
-OPENOCD_LICENSE = GPL-2.0+
-OPENOCD_LICENSE_FILES = COPYING
-# 0002-configure-enable-build-on-uclinux.patch patches configure.ac
+OPENOCD_LICENSE = \
+	eCos-exception-2.0, \
+	BSD-1-clause, \
+	BSD-2-clause, \
+	BSD-2-Clause-Views, \
+	BSD-3-clause, \
+	BSD-Source-Code, \
+	GFDL-1.2-no-invariants-or-later (docs), \
+	GPL-2.0+ (code), \
+	GPL-3.0+ (stand-alone code), \
+	MIT
+
+OPENOCD_LICENSE_FILES = \
+	COPYING \
+	LICENSES/license-rules.txt \
+	LICENSES/exceptions/eCos-exception-2.0 \
+	LICENSES/preferred/BSD-1-Clause \
+	LICENSES/preferred/BSD-2-Clause \
+	LICENSES/preferred/BSD-2-Clause-Views \
+	LICENSES/preferred/BSD-3-Clause \
+	LICENSES/preferred/BSD-Source-Code \
+	LICENSES/preferred/GFDL-1.2 \
+	LICENSES/preferred/gfdl-1.2.texi.readme \
+	LICENSES/preferred/GPL-2.0 \
+	LICENSES/preferred/MIT \
+	LICENSES/stand-alone/GPL-3.0
+
+# 0001-configure-enable-build-on-uclinux.patch patches configure.ac
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 

--===============4555086730206663716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4555086730206663716==--
