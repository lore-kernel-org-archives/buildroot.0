Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE01CCD1A4
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A628A83653;
	Sat, 18 Oct 2025 16:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rNx71Zf566f; Sat, 18 Oct 2025 16:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8869583657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8869583657;
	Sat, 18 Oct 2025 16:13:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 102841CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA13A40D52
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CG3t_-L8iJlo for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B22340D54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B22340D54
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:13:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA246874A3; Sat, 18 Oct 2025 16:13:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 18:02:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8923662cc7e1f0a1d30d0926f979c21d36aa9df
X-Git-Newrev: 7410161d2b431616f5b28bc169e4241ae3ca9331
X-Patchwork-Hint: ignore
Message-Id: <20251018161320.EA246874A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ledmon: bump to version 1.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7410161d2b431616f5b28bc169e4241ae3ca9331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patches have been merged in version 1.1.0.

Release notes:
https://github.com/intel/ledmon/releases/tag/v1.1.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ledctl-ledctl.c-replace-on_exit-by-atexit.patch | 40 ------------------
 ...c-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch | 49 ----------------------
 package/ledmon/0003-Correct-get_uint64.patch       | 43 -------------------
 package/ledmon/ledmon.hash                         |  2 +-
 package/ledmon/ledmon.mk                           |  2 +-
 5 files changed, 2 insertions(+), 134 deletions(-)

diff --git a/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch b/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
deleted file mode 100644
index 4e1536df4f..0000000000
--- a/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 9 May 2024 10:04:38 +0200
-Subject: [PATCH] ledctl: replace on_exit() by atexit()
-
-Replace on_exit() by atexit() to avoid the following musl build failure
-raised since bcb9042 ("ledctl: Remove enum ledctl_status_code_t")
-which partially reverted f08dd2c ("Fix build with Musl libc (#139)")
-
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ledctl-ledctl.o: in function `main':
-ledctl.c:(.text.startup+0x140): undefined reference to `on_exit'
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/intel/ledmon/commit/ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401
----
- src/ledctl/ledctl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
-index 231253dc..95db2d86 100644
---- a/src/ledctl/ledctl.c
-+++ b/src/ledctl/ledctl.c
-@@ -230,7 +230,7 @@ static void ibpi_state_fini(struct ibpi_state *p)
-  *
-  * @return The function does not return a value.
-  */
--static void _ledctl_fini(int _i, void *_arg)
-+static void _ledctl_fini(void)
- {
- 	led_free(ctx);
- 	list_erase(&ibpi_list);
-@@ -1101,7 +1101,7 @@ int main(int argc, char *argv[])
- 	if (status != LED_STATUS_SUCCESS)
- 		return status;
- 
--	if (on_exit(_ledctl_fini, progname))
-+	if (atexit(_ledctl_fini))
- 		exit(LED_STATUS_ONEXIT_ERROR);
- 
- 	status = _read_shared_conf();
diff --git a/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch b/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
deleted file mode 100644
index 730eb29595..0000000000
--- a/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 0d391dbcb808755a65fcc9a8a0ceaf3aa53d153f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 19 Aug 2024 00:08:40 +0200
-Subject: [PATCH] configure.ac: use AX_CHECK_LINK_FLAG() to test gcc flags
-
-ledmon's configure.ac defines an AX_AM_CFLAGS_ADD() macro that allows
-to test if a flag is supported by gcc, and if so add it to
-AM_CFLAGS. In order to test if the flag works, it uses
-AX_CHECK_COMPILE_FLAG(), which only does a *compile* test, but not
-a *link* test. However, some flags such as -fstack-protector might
-appear to work at compile time, but not link time. Therefore
--fstack-protector is considered functional:
-
-checking whether C compiler accepts -fstack-protector-strong... yes
-
-but the build later fails:
-
-/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared: No such file or directory
-/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp: No such file or directory
-collect2: error: ld returned 1 exit status
-
-In order to fix this, we test all flags with AX_CHECK_LINK_FLAG()
-which does a full *link* of the test program. This allows to make sure
-that the flag is fully functional. In our test case,
--fstack-protector-strong will be determined as being non-functional,
-and therefore won't be used.
-
-Upstream: https://github.com/intel/ledmon/pull/244
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d3fada5..747b168 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,7 +52,7 @@ AC_CONFIG_HEADERS([config_ac.h])
- AM_CFLAGS='-Wall -I../config'
- AM_CPPFLAGS='-D_DEBUG -D_GNU_SOURCE -D_DEFAULT_SOURCE -DDMALLOC_DISABLE -DBUILD_LABEL=\""$(BUILD_LABEL)"\"'
- 
--AC_DEFUN([AX_AM_CFLAGS_ADD],[AX_CHECK_COMPILE_FLAG($1, AM_CFLAGS="$AM_CFLAGS $1")])
-+AC_DEFUN([AX_AM_CFLAGS_ADD],[AX_CHECK_LINK_FLAG($1, AM_CFLAGS="$AM_CFLAGS $1")])
- AX_AM_CFLAGS_ADD([-Wformat -Wformat-security])
- AX_AM_CFLAGS_ADD([-Wformat-overflow=2])
- AX_AM_CFLAGS_ADD([-Wno-strict-overflow])
--- 
-2.46.0
-
diff --git a/package/ledmon/0003-Correct-get_uint64.patch b/package/ledmon/0003-Correct-get_uint64.patch
deleted file mode 100644
index 2db4c04a6e..0000000000
--- a/package/ledmon/0003-Correct-get_uint64.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ed747ac3540cb38797f56533f9f51f5627e6b994 Mon Sep 17 00:00:00 2001
-From: Tony Asleson <tasleson@redhat.com>
-Date: Wed, 21 Aug 2024 12:27:28 -0500
-Subject: [PATCH] Correct get_uint64
-
-For large integer values, the existing implementation will be
-incorrect.
-
-The current implementation of converting strings to integer values
-uses a signed integer for the intermediate conversion and performs
-a range check. Since any value in an unsigned 64-bit integer is valid,
-the range check seems unnecessary. To mimic the same code path, we would
-need a larger integer type.
-
-Signed-off-by: Tony Asleson <tasleson@redhat.com>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/intel/ledmon/commit/ed747ac3540cb38797f56533f9f51f5627e6b994
----
- src/lib/utils.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/utils.c b/src/lib/utils.c
-index a7936c69b242..a6ee29ba7f22 100644
---- a/src/lib/utils.c
-+++ b/src/lib/utils.c
-@@ -98,8 +98,12 @@ uint64_t get_uint64(const char *path, uint64_t defval, const char *name)
- 	if (!p)
- 		return defval;
- 
--	str_toul(&defval, p, NULL, 16);
--	return defval;
-+	errno = 0;
-+	uint64_t t = strtoull(p, NULL, 16);
-+
-+	if (errno)
-+		return defval;
-+	return t;
- }
- 
- int get_int(const char *path, int defval, const char *name)
--- 
-2.43.0
-
diff --git a/package/ledmon/ledmon.hash b/package/ledmon/ledmon.hash
index e9cfcc63cb..97f379e3a6 100644
--- a/package/ledmon/ledmon.hash
+++ b/package/ledmon/ledmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2826786cd5e7fe7d32d22e9d209b23124801fec9c3220dcd7fb45706f3818dc5  ledmon-1.0.0.tar.gz
+sha256  4f626400e41ab1e4317b886db5b5df1afa517e8e4faa80fd4378fd22b0bcd055  ledmon-1.1.0.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/ledmon/ledmon.mk b/package/ledmon/ledmon.mk
index 71150ad1e4..4b906b1cc7 100644
--- a/package/ledmon/ledmon.mk
+++ b/package/ledmon/ledmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEDMON_VERSION = 1.0.0
+LEDMON_VERSION = 1.1.0
 LEDMON_SITE = $(call github,intel,ledmon,v$(LEDMON_VERSION))
 LEDMON_DEPENDENCIES = host-autoconf-archive host-pkgconf pciutils sg3_utils udev
 # The code base also include a COPYING.LIB file with the LGPL-2.1 text,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
