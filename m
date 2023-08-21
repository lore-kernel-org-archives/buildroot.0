Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E0AEE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 11:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B2F2818CD;
	Mon, 21 Aug 2023 11:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B2F2818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udJ8XOBpnFkY; Mon, 21 Aug 2023 11:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585E3818D4;
	Mon, 21 Aug 2023 11:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 585E3818D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9AE1BF2A3
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1634E60ADE
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1634E60ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqiLLRGYK0Mz for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 11:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8427960A9F
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 11:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8427960A9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7133085F35; Mon, 21 Aug 2023 11:09:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 12:51:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 90031397ed65078e88145397ec434b6574ff3459
X-Git-Newrev: 57ff5f7d2a9d2cf49e76a0c1e874fc1698eb7778
X-Patchwork-Hint: ignore
Message-Id: <20230821110951.7133085F35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ledmon: new package
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
Content-Type: multipart/mixed; boundary="===============7832180894083534537=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7832180894083534537==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=57ff5f7d2a9d2cf49e76a0c1e874fc1698eb7778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enclosure LED Utilities

ledmon and ledctl are userspace tools designed to control storage
enclosure LEDs. The user must have root privileges to use these tools.

These tools use the SGPIO and SES-2 protocols to monitor and control LEDs.
They been verified to work with Intel(R) storage controllers (i.e. the
Intel(R) AHCI controller) and have not been tested with storage controllers of
other vendors (especially SAS/SCSI controllers).

For backplane enclosures attached to ISCI controllers, support is limited to
Intel(R) Intelligent Backplanes.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   3 +
 package/Config.in                                  |   1 +
 ...ce-nonstandard-on_exit-function-by-atexit.patch | 223 +++++++++++++++++++++
 .../0002-Fix-unknown-type-name-ssize_t-error.patch |  44 ++++
 package/ledmon/0003-Add-disable-doc-option.patch   |  63 ++++++
 package/ledmon/Config.in                           |  15 ++
 package/ledmon/ledmon.hash                         |   3 +
 package/ledmon/ledmon.mk                           |  19 ++
 8 files changed, 371 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 705aae9501..10a16b03c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2123,6 +2123,9 @@ F:	package/python-txaio/
 F:	package/python-ujson/
 F:	package/python-wsaccel/
 
+N:	Maksim Kiselev <bigunclemax@gmail.com>
+F:	package/ledmon/
+
 N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
diff --git a/package/Config.in b/package/Config.in
index 15b1866630..0378566305 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -527,6 +527,7 @@ endmenu
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/ledmon/Config.in"
 	source "package/libiec61850/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
diff --git a/package/ledmon/0001-Replace-nonstandard-on_exit-function-by-atexit.patch b/package/ledmon/0001-Replace-nonstandard-on_exit-function-by-atexit.patch
new file mode 100644
index 0000000000..7a89c3f1a4
--- /dev/null
+++ b/package/ledmon/0001-Replace-nonstandard-on_exit-function-by-atexit.patch
@@ -0,0 +1,223 @@
+From e57ad4c71cce734de7f8aa75e84fce97bc148c2b Mon Sep 17 00:00:00 2001
+From: Maksim Kiselev <bigunclemax@gmail.com>
+Date: Mon, 15 May 2023 14:46:56 +0300
+Subject: [PATCH] Replace nonstandard on_exit() function by atexit()
+
+on_exit() is not portable and not available on the C libraries musl
+and uClibc.
+
+So let's replace it with standard atexit() function.
+
+Upstream: https://github.com/intel/ledmon/pull/139
+
+Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
+---
+ src/ledctl.c | 12 ++++-------
+ src/ledmon.c | 59 +++++++++++++++++++++++++++-------------------------
+ 2 files changed, 35 insertions(+), 36 deletions(-)
+
+diff --git a/src/ledctl.c b/src/ledctl.c
+index 7a89a24..10fd57a 100644
+--- a/src/ledctl.c
++++ b/src/ledctl.c
+@@ -214,15 +214,11 @@ static void ibpi_state_fini(struct ibpi_state *p)
+  *
+  * This is internal function of ledctl utility. The function cleans up a memory
+  * allocated for the application and closes all opened handles. This function is
+- * design to be registered as on_exit() handler function.
+- *
+- * @param[in]      status         exit status of the ledctl application.
+- * @param[in]      ignored        function ignores this argument.
++ * design to be registered as atexit() handler function.
+  *
+  * @return The function does not return a value.
+  */
+-static void _ledctl_fini(int status __attribute__ ((unused)),
+-			 void *ignore __attribute__ ((unused)))
++static void _ledctl_fini(void)
+ {
+ 	sysfs_reset();
+ 	list_erase(&ibpi_list);
+@@ -948,7 +944,7 @@ static char *ledctl_strstatus(ledctl_status_code_t s)
+  * @brief Application's entry point.
+  *
+  * This is the entry point of ledctl utility. This function does all the work.
+- * It allocates and initializes all used structures. Registers on_exit()
++ * It allocates and initializes all used structures. Registers atexit()
+  * handlers.
+  * Then the function parses command line options and commands given and scans
+  * sysfs tree for controllers, block devices and RAID devices. If no error is
+@@ -983,7 +979,7 @@ int main(int argc, char *argv[])
+ 	status = _init_ledctl_conf();
+ 	if (status != LEDCTL_STATUS_SUCCESS)
+ 		return status;
+-	if (on_exit(_ledctl_fini, progname))
++	if (atexit(_ledctl_fini))
+ 		exit(LEDCTL_STATUS_ONEXIT_ERROR);
+ 	slot_request_init(&slot_req);
+ 	status = _cmdline_parse(argc, argv, &slot_req);
+diff --git a/src/ledmon.c b/src/ledmon.c
+index 6f52fd6..1329295 100644
+--- a/src/ledmon.c
++++ b/src/ledmon.c
+@@ -57,6 +57,19 @@
+ #include "utils.h"
+ #include "vmdssd.h"
+ 
++/**
++ * This macro is the alternative way to get exit status
++ * in atexit() callback function
++ */
++#define EXIT(x) ((exit)(exit_status = (x)))
++
++static int exit_status;
++
++/**
++ * Flag to print exit status
++ */
++static int ignore;
++
+ /**
+  * @brief List of active block devices.
+  *
+@@ -151,20 +164,16 @@ static int possible_params_size = ARRAY_SIZE(possible_params);
+  *
+  * This is internal function of monitor service. It is used to finalize daemon
+  * process i.e. free allocated memory, unlock and remove pidfile and close log
+- * file and syslog. The function is registered as on_exit() handler.
+- *
+- * @param[in]     status          The function ignores this parameter.
+- * @param[in]     program_name    The name of the binary file. This argument
+- *                                is passed via on_exit() function.
++ * file and syslog. The function is registered as atexit() handler.
+  *
+  * @return The function does not return a value.
+  */
+-static void _ledmon_fini(int __attribute__ ((unused)) status, void *program_name)
++static void _ledmon_fini(void)
+ {
+ 	sysfs_reset();
+ 	list_erase(&ledmon_block_list);
+ 	log_close();
+-	pidfile_remove(program_name);
++	pidfile_remove(progname);
+ }
+ 
+ typedef enum {
+@@ -207,30 +216,25 @@ static char *ledmon_strstatus(ledmon_status_code_t s)
+  *
+  * This is internal function of monitor service. It is used to report an exit
+  * status of the monitor service. The message is logged in to syslog and to log
+- * file. The function is registered as on_exit() hander.
+- *
+- * @param[in]     status            Status given in the last call to exit()
+- *                                  function.
+- * @param[in]     arg               Argument passed to on_exit().
++ * file. The function is registered as atexit() handler.
+  *
+  * @return The function does not return a value.
+  */
+-static void _ledmon_status(int status, void *arg)
++static void _ledmon_status(void)
+ {
+ 	int log_level;
+ 	char message[4096];
+-	int ignore = *((int *)arg);
+ 
+ 	if (ignore)
+ 		return;
+ 
+-	if (status == LEDMON_STATUS_SUCCESS)
++	if (exit_status == LEDMON_STATUS_SUCCESS)
+ 		log_level = LOG_LEVEL_INFO;
+ 	else
+ 		log_level = LOG_LEVEL_ERROR;
+ 
+ 	snprintf(message, sizeof(message), "exit status is %s.",
+-		 ledmon_strstatus(status));
++		 ledmon_strstatus(exit_status));
+ 
+ 	if (get_log_fd() >= 0)
+ 		_log(log_level, message);
+@@ -364,10 +368,10 @@ static ledmon_status_code_t _cmdline_parse_non_daemonise(int argc, char *argv[])
+ 			break;
+ 		case 'h':
+ 			_ledmon_help();
+-			exit(EXIT_SUCCESS);
++			EXIT(EXIT_SUCCESS);
+ 		case 'v':
+ 			_ledmon_version();
+-			exit(EXIT_SUCCESS);
++			EXIT(EXIT_SUCCESS);
+ 		case ':':
+ 		case '?':
+ 			return LEDMON_STATUS_CMDLINE_ERROR;
+@@ -890,14 +894,13 @@ static void _close_parent_fds(void)
+ int main(int argc, char *argv[])
+ {
+ 	ledmon_status_code_t status = LEDMON_STATUS_SUCCESS;
+-	static int ignore;
+ 
+ 	setup_options(&longopt, &shortopt, possible_params,
+ 			possible_params_size);
+ 	set_invocation_name(argv[0]);
+ 	openlog(progname, LOG_PID | LOG_PERROR, LOG_DAEMON);
+ 
+-	if (on_exit(_ledmon_status, &ignore))
++	if (atexit(_ledmon_status))
+ 		return LEDMON_STATUS_ONEXIT_ERROR;
+ 
+ 	if (_cmdline_parse_non_daemonise(argc, argv) != LEDMON_STATUS_SUCCESS)
+@@ -935,18 +938,18 @@ int main(int argc, char *argv[])
+ 
+ 		if (pid < 0) {
+ 			log_debug("main(): fork() failed (errno=%d).", errno);
+-			exit(EXIT_FAILURE);
++			EXIT(EXIT_FAILURE);
+ 		}
+ 		if (pid > 0) {
+ 			ignore = 1; /* parent: don't print exit status */
+-			exit(EXIT_SUCCESS);
++			EXIT(EXIT_SUCCESS);
+ 		}
+ 
+ 		pid_t sid = setsid();
+ 
+ 		if (sid < 0) {
+ 			log_debug("main(): setsid() failed (errno=%d).", errno);
+-			exit(EXIT_FAILURE);
++			EXIT(EXIT_FAILURE);
+ 		}
+ 
+ 		_close_parent_fds();
+@@ -960,16 +963,16 @@ int main(int argc, char *argv[])
+ 
+ 	if (chdir("/") < 0) {
+ 		log_debug("main(): chdir() failed (errno=%d).", errno);
+-		exit(EXIT_FAILURE);
++		EXIT(EXIT_FAILURE);
+ 	}
+ 	if (pidfile_create(progname)) {
+ 		log_debug("main(): pidfile_creat() failed.");
+-		exit(EXIT_FAILURE);
++		EXIT(EXIT_FAILURE);
+ 	}
+ 	_ledmon_setup_signals();
+ 
+-	if (on_exit(_ledmon_fini, progname))
+-		exit(LEDMON_STATUS_ONEXIT_ERROR);
++	if (atexit(_ledmon_fini))
++		EXIT(LEDMON_STATUS_ONEXIT_ERROR);
+ 	list_init(&ledmon_block_list, (item_free_t)block_device_fini);
+ 	sysfs_init();
+ 	log_info("monitor service has been started...");
+@@ -987,5 +990,5 @@ int main(int argc, char *argv[])
+ 	}
+ 	ledmon_remove_shared_conf();
+ 	stop_udev_monitor();
+-	exit(EXIT_SUCCESS);
++	EXIT(EXIT_SUCCESS);
+ }
+-- 
+2.39.2
+
diff --git a/package/ledmon/0002-Fix-unknown-type-name-ssize_t-error.patch b/package/ledmon/0002-Fix-unknown-type-name-ssize_t-error.patch
new file mode 100644
index 0000000000..4aeadbbbf8
--- /dev/null
+++ b/package/ledmon/0002-Fix-unknown-type-name-ssize_t-error.patch
@@ -0,0 +1,44 @@
+From b9f454cd29b6b5a0927b3c1e98807d54ffacd73e Mon Sep 17 00:00:00 2001
+From: Maksim Kiselev <bigunclemax@gmail.com>
+Date: Mon, 15 May 2023 19:29:45 +0300
+Subject: [PATCH] Fix unknown type name ‘ssize_t’ error
+
+This error occurs for builds with musl libc.
+Move include <sys/types.h> to utils header to
+resolve this issue.
+
+Upstream: https://github.com/intel/ledmon/pull/139
+
+Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
+---
+ src/utils.c | 1 -
+ src/utils.h | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/utils.c b/src/utils.c
+index 86b9593..0b83d5a 100644
+--- a/src/utils.c
++++ b/src/utils.c
+@@ -33,7 +33,6 @@
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+-#include <sys/types.h>
+ #include <time.h>
+ #include <unistd.h>
+ #include <assert.h>
+diff --git a/src/utils.h b/src/utils.h
+index 5d590b9..d02da8f 100644
+--- a/src/utils.h
++++ b/src/utils.h
+@@ -22,6 +22,7 @@
+ #define _UTILS_H_INCLUDED_
+ 
+ #include <getopt.h>
++#include <sys/types.h>
+ #include "config_file.h"
+ #include "stdlib.h"
+ #include "stdint.h"
+-- 
+2.39.2
+
diff --git a/package/ledmon/0003-Add-disable-doc-option.patch b/package/ledmon/0003-Add-disable-doc-option.patch
new file mode 100644
index 0000000000..ab7a242289
--- /dev/null
+++ b/package/ledmon/0003-Add-disable-doc-option.patch
@@ -0,0 +1,63 @@
+From 141628519d227b59be3977b16ebaab0feb22b295 Mon Sep 17 00:00:00 2001
+From: Maksim Kiselev <bigunclemax@gmail.com>
+Date: Sun, 20 Aug 2023 11:35:57 +0300
+Subject: [PATCH] Add '--disable-doc' option
+
+Introduce a configure option to disable documentation installation
+in case if it is not required.
+
+Upstream: https://github.com/intel/ledmon/pull/154
+
+Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
+---
+ Makefile.am  |  8 ++++++--
+ configure.ac | 11 ++++++++++-
+ 2 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ddcd200..644a8d2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,6 +20,10 @@ if SYSTEMD_CONDITION
+   OPTIONAL_SUBDIR = systemd
+ endif
+ 
+-SUBDIRS = doc src $(OPTIONAL_SUBDIR)
++if WITH_DOC
++  DOC_SUBDIR = doc
++  dist_doc_DATA = README.md
++endif
++
++SUBDIRS = src $(DOC_SUBDIR) $(OPTIONAL_SUBDIR)
+ EXTRA_DIST = config/config.h systemd/ledmon.service.in
+-dist_doc_DATA = README.md
+diff --git a/configure.ac b/configure.ac
+index 05baa62..114957f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,6 +74,15 @@ AM_CONDITIONAL([SYSTEMD_CONDITION], [test "$SYSTEMD_STR" = yes])
+ # target directory for ledmon service file
+ AC_SUBST([SYSTEMD_PATH], "$(pkg-config systemd --variable=systemdsystemunitdir)")
+ 
++# Add configure option to disable documentation building
++AC_ARG_ENABLE([doc],
++    [AS_HELP_STRING([--disable-doc],
++        [do not install ledmon documentaion])],
++    [with_doc=${enableval}],
++    [with_doc=yes])
++
++AM_CONDITIONAL([WITH_DOC], [test "x$with_doc" = "xyes"])
++
+ AC_CONFIG_FILES([Makefile
+                  doc/Makefile
+                  src/Makefile
+@@ -86,5 +95,5 @@ $PACKAGE_NAME $VERSION configuration:
+   Preprocessor flags:      ${AM_CPPFLAGS} ${CPPFLAGS}
+   C compiler flags:        ${AM_CFLAGS} ${CFLAGS}
+   Common install location: ${prefix}
+-  configure parameters:    --enable-systemd=${SYSTEMD_STR}
++  configure parameters:    --enable-systemd=${SYSTEMD_STR} --enable-doc=${with_doc}
+ ])
+-- 
+2.39.2
+
diff --git a/package/ledmon/Config.in b/package/ledmon/Config.in
new file mode 100644
index 0000000000..d08be715c3
--- /dev/null
+++ b/package/ledmon/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LEDMON
+	bool "ledmon"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS # sg3_utils
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_SG3_UTILS
+	help
+	  Enclosure LED Utilities. The ledmon application is
+	  a daemon process used to monitor a state of software
+	  RAID devices (md only) or a state of block devices.
+
+	  https://github.com/intel/ledmon
+
+comment "ledmon needs udev and a toolchain w/ threads"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ledmon/ledmon.hash b/package/ledmon/ledmon.hash
new file mode 100644
index 0000000000..dfc5d74242
--- /dev/null
+++ b/package/ledmon/ledmon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  40ee7e462b78c77468cc2ef356a06c5b6db44747d596dc11532f7b6f378d2d4b  ledmon-0.97.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/ledmon/ledmon.mk b/package/ledmon/ledmon.mk
new file mode 100644
index 0000000000..473d0de7a3
--- /dev/null
+++ b/package/ledmon/ledmon.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# ledmon
+#
+################################################################################
+
+LEDMON_VERSION = 0.97
+LEDMON_SITE = $(call github,intel,ledmon,v$(LEDMON_VERSION))
+LEDMON_DEPENDENCIES = host-pkgconf pciutils sg3_utils udev
+# The code base also include a COPYING.LIB file with the LGPL-2.1 text,
+# and some source files are published under LGPL-2.1, but all of them are
+# at some point linked with GPL-2.0 code, making the resulting binaries
+# GPL-2.0 licensed
+LEDMON_LICENSE = GPL-2.0
+LEDMON_LICENSE_FILES = COPYING
+# 0002-Fix-unknown-type-name-ssize_t-error.patch
+LEDMON_AUTORECONF = YES
+
+$(eval $(autotools-package))

--===============7832180894083534537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7832180894083534537==--
