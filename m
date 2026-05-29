Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB1ECD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A105F85A93;
	Tue,  9 Jun 2026 13:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3nZFFJdurgT; Tue,  9 Jun 2026 13:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D5085A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010215;
	bh=OI59kP3wYSH2CZsJBjfrHZMTEFYF7ictEey4vsAAJ9U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g97wRqnV+UdEv7mBad5EUWtHy3KMEv1zmxnYq8vUPEiY8x2uep9rT6ZeJJZGcXAzN
	 2+viZ1WqQ689Aly9Vs5EdlrwXFqO6pLRfyxY37JJDrnSD2EAxzGaDqc0yfumn2zDug
	 Ghfvta5k5cuT/HgMbgjHTjOVXjUL2rz2Dob/a+qExWz4zd6DW1AnMunPu0RqF+0oH+
	 bWvVide5JN0hBRoh/fvixvPq9Ixl8X/w18t6pHiLVLuOGRBdZWIA2bKV9YvEbkyVNU
	 DVZagV/rYck1wS2EHQhr+JL7V6ltn21rfj1+chLq+dYoNj/RuQ/pbJUUafvduUBCQ3
	 4nC48FMWYwfCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D5085A55;
	Tue,  9 Jun 2026 13:03:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74283196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62E234270A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z65TIdW_-0KL for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34683423C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34683423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7097587E68; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cbfc9e9911471ff60ba7630dec7ef8f88bdaf3e
X-Git-Newrev: 190bb8890e2098b1362609f387a3db42eaf784db
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.7097587E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libudev-zero: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/190bb8890e2098b1362609f387a3db42eaf784db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Arnout: rewrite install steps so they use the same make arguments as
the build step.]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../0001-Avoidable-OOM-on-small-systems-62.patch   | 176 +++++++++++++++++++++
 package/libudev-zero/Config.in                     |  10 ++
 package/libudev-zero/libudev-zero.hash             |   3 +
 package/libudev-zero/libudev-zero.mk               |  27 ++++
 6 files changed, 218 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 25a047cb3e..fea3311076 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -446,6 +446,7 @@ F:	package/libsidplay2/
 F:	package/libsilk/
 F:	package/libsndfile/
 F:	package/libsoundtouch/
+F:	package/libudev-zero/
 F:	package/libudfread/
 F:	package/libunibreak/
 F:	package/liburiparser/
diff --git a/package/Config.in b/package/Config.in
index 9cae377fb5..b7c799d9db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1860,6 +1860,7 @@ menu "Hardware handling"
 	source "package/libsigrokdecode/Config.in"
 	source "package/libsoc/Config.in"
 	source "package/libss7/Config.in"
+	source "package/libudev-zero/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
 	source "package/libusbgx/Config.in"
diff --git a/package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch b/package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch
new file mode 100644
index 0000000000..275581becf
--- /dev/null
+++ b/package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch
@@ -0,0 +1,176 @@
+From 5eca08d71d51074bfe7b14fcf7d89318f4f6ff47 Mon Sep 17 00:00:00 2001
+From: liamHowatt <30486941+liamHowatt@users.noreply.github.com>
+Date: Tue, 5 Dec 2023 04:15:26 -0500
+Subject: [PATCH] Avoidable OOM on small systems (#62)
+
+* bandaid fix OOM
+
+* refactor fix OOM
+
+* Makefile: remove no longer needed -pthread option
+
+* libudev.pc.in: remove threads requirement
+
+---------
+
+Co-authored-by: illiliti <illiliti@protonmail.com>
+
+Upstream: https://github.com/illiliti/libudev-zero/commit/5eca08d71d51074bfe7b14fcf7d89318f4f6ff47
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile         |  2 +-
+ libudev.pc.in    |  1 -
+ udev_enumerate.c | 65 +++++++++++-------------------------------------
+ 3 files changed, 15 insertions(+), 53 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4e970b8..1fc5a1f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,7 +5,7 @@ PREFIX = /usr/local
+ LIBDIR = ${PREFIX}/lib
+ INCLUDEDIR = ${PREFIX}/include
+ PKGCONFIGDIR = ${LIBDIR}/pkgconfig
+-XCFLAGS = ${CPPFLAGS} ${CFLAGS} -std=c99 -fPIC -pthread -D_XOPEN_SOURCE=700 \
++XCFLAGS = ${CPPFLAGS} ${CFLAGS} -std=c99 -fPIC -D_XOPEN_SOURCE=700 \
+ 		  -Wall -Wextra -Wpedantic -Wmissing-prototypes -Wstrict-prototypes \
+ 		  -Wno-unused-parameter
+ XLDFLAGS = ${LDFLAGS} -shared -Wl,-soname,libudev.so.1
+diff --git a/libudev.pc.in b/libudev.pc.in
+index 7e29d8c..2d3f0b0 100644
+--- a/libudev.pc.in
++++ b/libudev.pc.in
+@@ -9,5 +9,4 @@ Description: Daemonless replacement for libudev
+ Version: @VERSION@
+ URL: https://github.com/illiliti/libudev-zero
+ Libs: -L${libdir} -ludev
+-Libs.private: -pthread
+ Cflags: -I${includedir}
+diff --git a/udev_enumerate.c b/udev_enumerate.c
+index c553269..6fd49c0 100644
+--- a/udev_enumerate.c
++++ b/udev_enumerate.c
+@@ -21,7 +21,6 @@
+ #include <string.h>
+ #include <limits.h>
+ #include <fnmatch.h>
+-#include <pthread.h>
+ 
+ #include "udev.h"
+ #include "udev_list.h"
+@@ -38,13 +37,6 @@ struct udev_enumerate {
+     int refcount;
+ };
+ 
+-struct udev_enumerate_thread {
+-    struct udev_enumerate *udev_enumerate;
+-    pthread_mutex_t *mutex;
+-    char path[PATH_MAX];
+-    pthread_t thread;
+-};
+-
+ int udev_enumerate_add_match_subsystem(struct udev_enumerate *udev_enumerate, const char *subsystem)
+ {
+     return udev_enumerate ? !!udev_list_entry_add(&udev_enumerate->subsystem_match, subsystem, NULL, 0) - 1 : -1;
+@@ -231,31 +223,27 @@ static int filter_sysattr(struct udev_enumerate *udev_enumerate, struct udev_dev
+     return 1;
+ }
+ 
+-static void *add_device(void *ptr)
++static void add_device(struct udev_enumerate *udev_enumerate, const char *path)
+ {
+-    struct udev_enumerate_thread *thread = ptr;
+     struct udev_device *udev_device;
+ 
+-    udev_device = udev_device_new_from_syspath(thread->udev_enumerate->udev, thread->path);
++    udev_device = udev_device_new_from_syspath(udev_enumerate->udev, path);
+ 
+     if (!udev_device) {
+-        return NULL;
++        return;
+     }
+ 
+-    if (!filter_subsystem(thread->udev_enumerate, udev_device) ||
+-        !filter_sysname(thread->udev_enumerate, udev_device) ||
+-        !filter_property(thread->udev_enumerate, udev_device) ||
+-        !filter_sysattr(thread->udev_enumerate, udev_device)) {
++    if (!filter_subsystem(udev_enumerate, udev_device) ||
++        !filter_sysname(udev_enumerate, udev_device) ||
++        !filter_property(udev_enumerate, udev_device) ||
++        !filter_sysattr(udev_enumerate, udev_device)) {
+         udev_device_unref(udev_device);
+-        return NULL;
++        return;
+     }
+ 
+-    pthread_mutex_lock(thread->mutex);
+-    udev_list_entry_add(&thread->udev_enumerate->devices, udev_device_get_syspath(udev_device), NULL, 0);
+-    pthread_mutex_unlock(thread->mutex);
++    udev_list_entry_add(&udev_enumerate->devices, udev_device_get_syspath(udev_device), NULL, 0);
+ 
+     udev_device_unref(udev_device);
+-    return NULL;
+ }
+ 
+ static int filter_dot(const struct dirent *de)
+@@ -265,9 +253,7 @@ static int filter_dot(const struct dirent *de)
+ 
+ static int scan_devices(struct udev_enumerate *udev_enumerate, const char *path)
+ {
+-    struct udev_enumerate_thread *thread;
+-    pthread_mutex_t mutex;
+-    int i, cnt, ret = 1;
++    int i, cnt;
+     struct dirent **de;
+ 
+     cnt = scandir(path, &de, filter_dot, NULL);
+@@ -276,41 +262,18 @@ static int scan_devices(struct udev_enumerate *udev_enumerate, const char *path)
+         return 0;
+     }
+ 
+-    thread = calloc(cnt, sizeof(*thread));
+-
+-    if (!thread) {
+-        ret = 0;
+-        goto free_de;
+-    }
+-
+-    pthread_mutex_init(&mutex, NULL);
+-
+     for (i = 0; i < cnt; i++) {
+-        thread[i].mutex = &mutex;
+-        thread[i].udev_enumerate = udev_enumerate;
+-
+-        snprintf(thread[i].path, sizeof(thread[i].path), "%s/%s", path, de[i]->d_name);
+-
+-        if (pthread_create(&thread[i].thread, NULL, add_device, &thread[i]) != 0) {
+-            ret = 0;
+-            break;
+-        }
++        char device_path[PATH_MAX];
++        snprintf(device_path, sizeof(device_path), "%s/%s", path, de[i]->d_name);
++        add_device(udev_enumerate, device_path);
+     }
+ 
+-    for (i = 0; i < cnt; i++) {
+-        pthread_join(thread[i].thread, NULL);
+-    }
+-
+-    free(thread);
+-    pthread_mutex_destroy(&mutex);
+-
+-free_de:
+     for (i = 0; i < cnt; i++) {
+         free(de[i]);
+     }
+ 
+     free(de);
+-    return ret;
++    return 1;
+ }
+ 
+ int udev_enumerate_scan_devices(struct udev_enumerate *udev_enumerate)
+-- 
+2.47.3
+
diff --git a/package/libudev-zero/Config.in b/package/libudev-zero/Config.in
new file mode 100644
index 0000000000..78263406a4
--- /dev/null
+++ b/package/libudev-zero/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBUDEV_ZERO
+	bool "libudev-zero"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Daemonless replacement for libudev
+
+	  https://github.com/illiliti/libudev-zero
+
+comment "libudev-zero needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libudev-zero/libudev-zero.hash b/package/libudev-zero/libudev-zero.hash
new file mode 100644
index 0000000000..4d8e19148a
--- /dev/null
+++ b/package/libudev-zero/libudev-zero.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0bd89b657d62d019598e6c7ed726ff8fed80e8ba092a83b484d66afb80b77da5  libudev-zero-1.0.3.tar.gz
+sha256  9169cc15bda9e4597784ea29530d6754af6fb00adce5907bf0a794c575591d3f  LICENSE
diff --git a/package/libudev-zero/libudev-zero.mk b/package/libudev-zero/libudev-zero.mk
new file mode 100644
index 0000000000..3097beccfb
--- /dev/null
+++ b/package/libudev-zero/libudev-zero.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libudev-zero
+#
+################################################################################
+
+LIBUDEV_ZERO_VERSION = 1.0.3
+LIBUDEV_ZERO_SITE = $(call github,illiliti,libudev-zero,$(LIBUDEV_ZERO_VERSION))
+LIBUDEV_ZERO_LICENSE = ISC
+LIBUDEV_ZERO_LICENSE_FILES = LICENSE
+LIBUDEV_ZERO_INSTALL_STAGING = YES
+
+define LIBUDEV_ZERO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define LIBUDEV_ZERO_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+define LIBUDEV_ZERO_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
