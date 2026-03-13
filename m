Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F7D107BCE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0FF060E18;
	Fri, 13 Mar 2026 20:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02BO887VqWFW; Fri, 13 Mar 2026 20:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEF3760E03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434203;
	bh=J4wAE5UjRNtx5HAjmjwGgwJuEzZTLQ0hktvyK4DXeAU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sJfE7MD6ic0X964zX7CzLR6238AilpBu8eQ5ouLKmVxnC3c5epEOitCGifRIZ+KU3
	 ququjn0OtRRRO+ax+GgDjO76E1Z7Gi3IWb3y02mM8J/5/VYWkxt0Be4AlmonpSPgq2
	 mTV2EEBINKzUE+64yYAo9yB4lkJf8KvTtusBYHFzrRet3uI3CBQ3Qb8iGYjhHhEweS
	 1r6yQNY7EwRWP/qdumlV6KPxFC+WO2qnExmaIawbyi5068Zotva79Bzg9rt6QVu6cL
	 RHmVpJhM09JPNKmKcr3aP4c0k4tIVnfUtFzmBVVPC4Wu30/8tdxdIVuRDYV3kIoIKk
	 gnIQ7vtp3wRyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF3760E03;
	Fri, 13 Mar 2026 20:36:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6F1A1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A90405D7
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-se6vjiPUYn for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D3A405B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D3A405B6
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D77C86F30; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:05:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d31472e26082505ff6b8b7b6ece3b7c7af31dd45
X-Git-Newrev: 583a02e398888a9fb39b9b20cf98f1edd646584c
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.2D77C86F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: bump to version 2.1.2
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1741158737266407358=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1741158737266407358==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/583a02e398888a9fb39b9b20cf98f1edd646584c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 2.1.x has introduced a cmake-based build, and upstream strongly
recomends using it over the legacy Makefiles, which will ultimately be
retired.

So we do the switch, which cause quite some noise in the .mk file, but
at the same time allows for a bit of cleanup in the build process, as we
can now use the cmake-package infra.

Mosquitto now wants to peek into the malloc() internals for memory
tracking, and that only works on systems with an MMU (uClibc-ng does not
expose it for noMMU builds, as it's part of its malloc-standard
implementation).

Static-only builds are broken, even when only building the library. This
seems beyond a simple repair, so just require shared libs now (since
we're requiring an MMU as well, requiring shared libs is not too much of
an additional burden).

cJSON is now a required dependency, used in common parts of the code
(not just for the plugins).

There are a few options that we forcibly disable; they'll get addressed
in followup patches.

There are still a few build failures that are difficult to account for
(except):

    $ printf 'BR2_PACKAGE_MOSQUITTO=y\n' >mosq.cfg
    $ ./utils/docker-run ./utils/test-pkg -d $(pwd)/run-tests -c mosq.cfg -p mosquitto
    br-arm-full-static [5/6]: FAILED
    => old uClibc-ng, would need __GNU_SOURCE (with dunder) to define
       getrandom(); no longer needed since uClibc-ng 1.0.50; would need
       openssl otherwise

    bootlin-aarch64-glibc-old [6/6]: FAILED
    => really old glibc, missing getrandom(); would need openssl

Drop our existing patches, they've either been applied upstream, or are
no longer needed. Add new patches to fix various build issues
(submission upstream pending the signature of the CLA..,).

Thanks a lot to Titouan for providing his initial work on the update!
Some of his findings ended up in this patch. 👍

Note: by lack of a trusted path back to the PGP key that signed the
archive, the comment was dropped, as checking a signature without a
trust-chain does not make much sense...

Co-developped-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
[Romain: remove "mosquitto broker" comment for static builds]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch  |  50 -----
 ...T_DISCONNECT-being-called-before-MOSQ_EVT.patch |  40 ++++
 .../0002-Add-configure-time-check-for-lanl.patch   |  47 -----
 ...ntial-crash-if-group-id-has-no-group-name.patch |  33 +++
 ...to_loop_start-leaving-the-mosq-struct-in-.patch |  59 ++++++
 package/mosquitto/0004-Fix-missing-SONAME.patch    | 136 ++++++++++++
 ...d-length-not-being-passed-to-MOSQ_EVT_BAS.patch | 231 +++++++++++++++++++++
 ...-outgoing-maximum-packet-size-limit-check.patch | 152 ++++++++++++++
 ...x-will-messages-being-incorrectly-delayed.patch | 212 +++++++++++++++++++
 ...ct-parsing-of-unix-socket-address-in-prox.patch |  27 +++
 ...ct-maximum-packet-size-restriction-for-in.patch | 116 +++++++++++
 ...0-broker-properly-check-for-getaddrinfo_a.patch |  35 ++++
 ...make-Only-include-C-support-when-required.patch |  56 +++++
 .../0012-libcommon-check-for-getrandom.patch       |  90 ++++++++
 package/mosquitto/Config.in                        |  14 +-
 package/mosquitto/mosquitto.hash                   |   7 +-
 package/mosquitto/mosquitto.mk                     | 177 ++++++++--------
 17 files changed, 1284 insertions(+), 198 deletions(-)

diff --git a/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch b/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
deleted file mode 100644
index 9445148f44..0000000000
--- a/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 1ecc94d7b4ff495afd7f32c42072cdf4ea5407aa Mon Sep 17 00:00:00 2001
-From: Ben Marsh <ben.marsh555@googlemail.com>
-Date: Mon, 21 Jul 2025 17:46:16 +0100
-Subject: [PATCH] Fix CMake builds with WITH_TLS=OFF
-
-Recent CMake changes caused CMake builds with the WITH_TLS option set to OFF to fail. The OpenSSL package is only found (find_package()) if WITH_TLS is ON, but linking to OpenSSL for the broker and library is not guarded by WITH_TLS. The build therefore fails.
-
-Guard linking to OpenSSL, only linking if WITH_TLS is set.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3321
-Signed-off-by: Scott Fan <fancp2007@gmail.com>
----
- lib/CMakeLists.txt | 4 +++-
- src/CMakeLists.txt | 5 ++++-
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index 21b61497..e6b8235b 100644
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -60,7 +60,9 @@ set(C_SRC
- 	util_mosq.c util_topic.c util_mosq.h
- 	will_mosq.c will_mosq.h)
- 
--set (LIBRARIES OpenSSL::SSL)
-+if (WITH_TLS)
-+	set (LIBRARIES OpenSSL::SSL)
-+endif()
- 
- if (UNIX AND NOT APPLE AND NOT ANDROID)
- 	find_library(LIBRT rt)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index d4bae7cd..6fd0ee53 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -163,7 +163,10 @@ if (WITH_DLT)
-     set (MOSQ_LIBS ${MOSQ_LIBS} ${DLT_LIBRARIES})
- endif (WITH_DLT)
- 
--set (MOSQ_LIBS ${MOSQ_LIBS} OpenSSL::SSL)
-+if (WITH_TLS)
-+	set (MOSQ_LIBS ${MOSQ_LIBS} OpenSSL::SSL)
-+endif()
-+
- # Check for getaddrinfo_a
- include(CheckLibraryExists)
- check_library_exists(anl getaddrinfo_a  "" HAVE_GETADDRINFO_A)
--- 
-2.43.0
-
diff --git a/package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch b/package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch
new file mode 100644
index 0000000000..23345183dd
--- /dev/null
+++ b/package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch
@@ -0,0 +1,40 @@
+From 7ee523213c30b86ff723c192462f55b84d7714b9 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Tue, 10 Feb 2026 18:42:36 +0000
+Subject: [PATCH] Fix MOSQ_EVT_DISCONNECT being called before
+ MOSQ_EVT_ACL_CHECK
+
+This occurs for the will of that client.
+
+Closes #3487. Thanks to ChrisBFX.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/5f2a45d96a52e1e0135b48aec281d612aa1ecdea
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ src/context.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/context.c b/src/context.c
+index ca4784d9..6b397d47 100644
+--- a/src/context.c
++++ b/src/context.c
+@@ -269,13 +269,14 @@ void context__disconnect(struct mosquitto *context, int reason)
+ 		}
+ 	}
+ 
++	context__send_will(context);
++
+ 	if(context->session_expiry_interval == MQTT_SESSION_EXPIRY_IMMEDIATE){
+ 		plugin__handle_disconnect(context, reason);
+ 	}else{
+ 		plugin__handle_client_offline(context, reason);
+ 	}
+ 
+-	context__send_will(context);
+ 	net__socket_close(context);
+ #ifdef WITH_BRIDGE
+ 	if(context->bridge == NULL)
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
deleted file mode 100644
index b67164123a..0000000000
--- a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 447a6aa8df882a67ca3df6f5e95be42e1463eaf0 Mon Sep 17 00:00:00 2001
-From: Titouan Christophe <titouan.christophe@mind.be>
-Date: Fri, 29 Aug 2025 19:47:34 +0200
-Subject: [PATCH] Add configure-time check for -lanl
-
-Since glibc 2.34, libanl features have been integrated directly into libc [1].
-For backward compatibility, some toolchains still provide a shim for
-libanl as a separate .so, but new toolchains (for example for new archs
-like loongarch) do not provide it anymore.
-
-In such a case, building mosquitto fails at link time with (see [2])
-    > cannot find -lanl: No such file or directory
-
-To fix this problem while maintaining compatibility with older toolchains,
-check if a simple program that uses libanl can be compiled without -lanl,
-and only add the linker flag otherwise.
-
-[1] https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
-[2] https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/build-end.log
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3358
-
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- config.mk | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/config.mk b/config.mk
-index 34d5163f..cc7987c4 100644
---- a/config.mk
-+++ b/config.mk
-@@ -318,8 +318,11 @@ ifeq ($(WITH_EC),yes)
- endif
- 
- ifeq ($(WITH_ADNS),yes)
--	BROKER_LDADD:=$(BROKER_LDADD) -lanl
- 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
-+	NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\nint main(){return getaddrinfo_a(0, NULL, 0, NULL);}'| $(CC) -D_GNU_SOURCE -o /dev/null -x c - 2>/dev/null || echo YES)
-+	ifeq ($(NEED_LIBANL),YES)
-+		BROKER_LDADD:=$(BROKER_LDADD) -lanl
-+	endif
- endif
- 
- ifeq ($(WITH_CONTROL),yes)
--- 
-2.50.1
-
diff --git a/package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch b/package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch
new file mode 100644
index 0000000000..4c62644cfe
--- /dev/null
+++ b/package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch
@@ -0,0 +1,33 @@
+From 6834ff7b8304f74c044b8399f23fe69455bfeda8 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 13 Feb 2026 00:36:47 +0000
+Subject: [PATCH] Fix potential crash if group id has no group name.
+
+This can occur if reading a file in restricted mode and the group id
+does not have an entry in /etc/groups.
+
+Closes #3498. Thanks to Stefan Kranich.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/7958a85bae06c22c3beff2942b8c1ac04f6a6353
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ libcommon/file_common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcommon/file_common.c b/libcommon/file_common.c
+index 1998e6d0..8bde3009 100644
+--- a/libcommon/file_common.c
++++ b/libcommon/file_common.c
+@@ -235,7 +235,7 @@ FILE *mosquitto_fopen(const char *path, const char *mode, bool restrict_read)
+ 			char buf[4096];
+ 			struct group grp, *result;
+ 
+-			if(getgrgid_r(getgid(), &grp, buf, sizeof(buf), &result) == 0){
++			if(getgrgid_r(getgid(), &grp, buf, sizeof(buf), &result) == 0 && result){
+ 				libcommon_printf(
+ 						"Warning: File %s group is not %s. Future versions will refuse to load this file.\n",
+ 						path, result->gr_name);
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch b/package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch
new file mode 100644
index 0000000000..026cb0c0d3
--- /dev/null
+++ b/package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch
@@ -0,0 +1,59 @@
+From cf74866a6d707d7bd2d76831f60af789e4f3ce77 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 13 Feb 2026 08:33:32 +0000
+Subject: [PATCH] Fix mosquitto_loop_start() leaving the mosq struct in an
+ invalid state
+
+This occurs if thread creation fails.
+
+Closes #3496. Thanks to ehoffman2.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/da7d02690b4c998ec4b842ae066fa642f59eb509
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ ChangeLog.txt     | 4 ++--
+ lib/thread_mosq.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 7d6a92cf..a76fc6e1 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,11 +1,11 @@
+ 2.1.2 - 2026-02-09
+ ==================
+ 
+-Broker:
++# Broker
+ - Forbid running with `persistence true` and with a persistence plugin at the
+   same time.
+ 
+-Build:
++# Build
+ - Build fixes for OpenBSD. Closes #3474.
+ - Add missing libedit to docker builds. Closes #3476.
+ - Fix static/shared linking of libwebsockets under cmake.
+diff --git a/lib/thread_mosq.c b/lib/thread_mosq.c
+index 931bf9eb..62ddadb7 100644
+--- a/lib/thread_mosq.c
++++ b/lib/thread_mosq.c
+@@ -48,7 +48,6 @@ int mosquitto_loop_start(struct mosquitto *mosq)
+ 		return MOSQ_ERR_INVAL;
+ 	}
+ 
+-	mosq->threaded = mosq_ts_self;
+ 	if(!COMPAT_pthread_create(&mosq->thread_id, NULL, mosquitto__thread_main, mosq)){
+ #if defined(__linux__)
+ 		pthread_setname_np(mosq->thread_id, "mosquitto loop");
+@@ -57,6 +56,7 @@ int mosquitto_loop_start(struct mosquitto *mosq)
+ #elif defined(__FreeBSD__) || defined(__OpenBSD__)
+ 		pthread_set_name_np(mosq->thread_id, "mosquitto loop");
+ #endif
++		mosq->threaded = mosq_ts_self;
+ 		return MOSQ_ERR_SUCCESS;
+ 	}else{
+ 		return MOSQ_ERR_ERRNO;
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0004-Fix-missing-SONAME.patch b/package/mosquitto/0004-Fix-missing-SONAME.patch
new file mode 100644
index 0000000000..9ce6c14338
--- /dev/null
+++ b/package/mosquitto/0004-Fix-missing-SONAME.patch
@@ -0,0 +1,136 @@
+From cef817f226637fe3ca07a0e154fcdb9bd7759682 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 13 Feb 2026 11:21:28 +0000
+Subject: [PATCH] Fix missing SONAME.
+
+Closes #3483. Thanks to Matt Turner.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/64ccdc712df212b370858acff881ed884c97b715
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ libcommon/Makefile       |  2 +-
+ libcommon/linker.version | 98 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 99 insertions(+), 1 deletion(-)
+ create mode 100644 libcommon/linker.version
+
+diff --git a/libcommon/Makefile b/libcommon/Makefile
+index d0a467af..e45e45cb 100644
+--- a/libcommon/Makefile
++++ b/libcommon/Makefile
+@@ -3,7 +3,7 @@ include ${R}/config.mk
+ 
+ LOCAL_CFLAGS+=-fPIC
+ LOCAL_CPPFLAGS+=
+-LOCAL_LDFLAGS+=-fPIC
++LOCAL_LDFLAGS+=-Wl,--version-script=linker.version -Wl,-soname,libmosquitto_common.so.$(SOVERSION) -fPIC
+ LOCAL_LIBADD+=-lcjson
+ 
+ ifeq ($(WITH_MEMORY_TRACKING),yes)
+diff --git a/libcommon/linker.version b/libcommon/linker.version
+new file mode 100644
+index 00000000..583d9663
+--- /dev/null
++++ b/libcommon/linker.version
+@@ -0,0 +1,98 @@
++/* Linker version script - currently used here primarily to control which
++ * symbols are exported.
++ */
++
++MOSQ_2.1 {
++	global:
++		libcommon_printf;
++		mosquitto_base64_decode;
++		mosquitto_base64_encode;
++		mosquitto_calloc;
++		mosquitto_connack_string;
++		mosquitto_fgets;
++		mosquitto_fopen;
++		mosquitto_free;
++		mosquitto_free;
++		mosquitto_getrandom;
++		mosquitto_malloc;
++		mosquitto_malloc;
++		mosquitto_max_memory_used;
++		mosquitto_memory_set_limit;
++		mosquitto_memory_used;
++		mosquitto_properties_to_json;
++		mosquitto_property_next;
++		mosquitto_property_read_binary;
++		mosquitto_property_read_byte;
++		mosquitto_property_read_int16;
++		mosquitto_property_read_int32;
++		mosquitto_property_read_string;
++		mosquitto_property_read_string_pair;
++		mosquitto_property_read_varint;
++		mosquitto_property_add_binary;
++		mosquitto_property_add_byte;
++		mosquitto_property_add_int16;
++		mosquitto_property_add_int32;
++		mosquitto_property_add_string;
++		mosquitto_property_add_string_pair;
++		mosquitto_property_add_varint;
++		mosquitto_property_binary_value;
++		mosquitto_property_binary_value_length;
++		mosquitto_property_byte_value;
++		mosquitto_property_check_all;
++		mosquitto_property_check_command;
++		mosquitto_property_copy_all;
++		mosquitto_property_free;
++		mosquitto_property_free_all;
++		mosquitto_property_get_length;
++		mosquitto_property_get_length_all;
++		mosquitto_property_get_remaining_length;
++		mosquitto_property_identifier;
++		mosquitto_property_identifier_to_string;
++		mosquitto_property_int16_value;
++		mosquitto_property_int32_value;
++		mosquitto_property_remove;
++		mosquitto_property_string_name;
++		mosquitto_property_string_name_length;
++		mosquitto_property_string_value;
++		mosquitto_property_string_value_length;
++		mosquitto_property_type;
++		mosquitto_property_varint_value;
++		mosquitto_pub_topic_check;
++		mosquitto_pub_topic_check2;
++		mosquitto_pw_cleanup;
++		mosquitto_pw_decode;
++		mosquitto_pw_get_encoded;
++		mosquitto_pw_hash_encoded;
++		mosquitto_pw_is_valid;
++		mosquitto_pw_new;
++		mosquitto_pw_set_param;
++		mosquitto_pw_set_valid;
++		mosquitto_pw_verify;
++		mosquitto_read_file;
++		mosquitto_realloc;
++		mosquitto_realloc;
++		mosquitto_reason_string;
++		mosquitto_strdup;
++		mosquitto_strerror;
++		mosquitto_string_to_command;
++		mosquitto_string_to_property_info;
++		mosquitto_strndup;
++		mosquitto_sub_matches_acl;
++		mosquitto_sub_matches_acl_with_pattern;
++		mosquitto_sub_topic_check;
++		mosquitto_sub_topic_check2;
++		mosquitto_sub_topic_tokenise;
++		mosquitto_sub_topic_tokens_free;
++		mosquitto_time;
++		mosquitto_time_cmp;
++		mosquitto_time_init;
++		mosquitto_time_ns;
++		mosquitto_topic_matches_sub;
++		mosquitto_topic_matches_sub2;
++		mosquitto_topic_matches_sub_with_pattern;
++		mosquitto_trimblanks;
++		mosquitto_validate_utf8;
++		mosquitto_varint_bytes;
++		mosquitto_write_file;
++	local: *;
++};
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch b/package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch
new file mode 100644
index 0000000000..45231fbafa
--- /dev/null
+++ b/package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch
@@ -0,0 +1,231 @@
+From 5a9562e74bc59facd351c183fe085f55dc370fbf Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 13 Feb 2026 12:18:47 +0000
+Subject: [PATCH] Fix password length not being passed to MOSQ_EVT_BASIC_AUTH
+ events.
+
+Closes #3490. Thanks to thehouseisonfire.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/43c271504277941a4423a7e8c6b07bbcb611080b
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ include/mosquitto/broker.h                  |  7 ++++++-
+ lib/mosquitto_internal.h                    |  1 +
+ src/handle_connect.c                        | 16 +++++++++-------
+ src/plugin_basic_auth.c                     |  1 +
+ test/broker/09-plugin-auth-unpwd-fail.py    | 11 ++++++++++-
+ test/broker/09-plugin-auth-unpwd-success.py |  7 ++++++-
+ test/broker/c/auth_plugin_v5.c              | 17 ++++++++++++++++-
+ 7 files changed, 49 insertions(+), 11 deletions(-)
+
+diff --git a/include/mosquitto/broker.h b/include/mosquitto/broker.h
+index 9a4cd1f1..00be4b5e 100644
+--- a/include/mosquitto/broker.h
++++ b/include/mosquitto/broker.h
+@@ -198,7 +198,12 @@ struct mosquitto_evt_basic_auth {
+ 	struct mosquitto *client;
+ 	char *username;
+ 	char *password;
+-	void *future2[4];
++	union{
++		void *future2[4];
++		struct {
++			uint16_t password_len;
++		};
++	};
+ };
+ 
+ /* Data for the MOSQ_EVT_PSK_KEY event */
+diff --git a/lib/mosquitto_internal.h b/lib/mosquitto_internal.h
+index 0dd27b31..93323891 100644
+--- a/lib/mosquitto_internal.h
++++ b/lib/mosquitto_internal.h
+@@ -322,6 +322,7 @@ struct mosquitto {
+ 	unsigned id_hashv;
+ 	uint16_t keepalive;
+ 	uint16_t last_mid;
++	uint16_t password_len;
+ 	enum mosquitto_client_state state;
+ 	uint8_t transport;
+ 	time_t last_msg_in;
+diff --git a/src/handle_connect.c b/src/handle_connect.c
+index 47bb12c0..9a5b9f14 100644
+--- a/src/handle_connect.c
++++ b/src/handle_connect.c
+@@ -776,11 +776,11 @@ static int set_username_from_packet(struct mosquitto *context, char **username,
+ }
+ 
+ 
+-static int set_password_from_packet(struct mosquitto *context, char **password, const char *clientid)
++static int set_password_from_packet(struct mosquitto *context, char **password, uint16_t *password_len, const char *clientid)
+ {
+ 	int rc;
+ 
+-	rc = packet__read_binary(&context->in_packet, (uint8_t **)password, &(uint16_t){0});
++	rc = packet__read_binary(&context->in_packet, (uint8_t **)password, password_len);
+ 	if(rc == MOSQ_ERR_NOMEM){
+ 		return MOSQ_ERR_NOMEM;
+ 	}
+@@ -801,7 +801,7 @@ static int set_password_from_packet(struct mosquitto *context, char **password,
+ 
+ static int read_and_verify_client_credentials_from_packet(struct mosquitto *context,
+ 		char **username, uint8_t username_flag,
+-		char **password, uint8_t password_flag,
++		char **password, uint16_t *password_len, uint8_t password_flag,
+ 		const char *clientid)
+ {
+ 	int rc;
+@@ -821,7 +821,7 @@ static int read_and_verify_client_credentials_from_packet(struct mosquitto *cont
+ 		}
+ 	}
+ 	if(password_flag){
+-		rc = set_password_from_packet(context, password, clientid);
++		rc = set_password_from_packet(context, password, password_len, clientid);
+ 		if(rc != MOSQ_ERR_SUCCESS){
+ 			return rc;
+ 		}
+@@ -971,7 +971,7 @@ static int set_username_from_cert_subject_name(struct mosquitto *context)
+ #endif
+ 
+ 
+-static int handle_username_from_cert_options(struct mosquitto *context, char **username, char **password)
++static int handle_username_from_cert_options(struct mosquitto *context, char **username, char **password, uint16_t password_len)
+ {
+ 	int rc;
+ 
+@@ -1020,6 +1020,7 @@ static int handle_username_from_cert_options(struct mosquitto *context, char **u
+ 			* mosquitto_client_username() functions work, but is hacky */
+ 			context->username = *username;
+ 			context->password = *password;
++			context->password_len = password_len;
+ 			*username = NULL; /* Avoid free() in error: below. */
+ 			*password = NULL;
+ 		}
+@@ -1059,6 +1060,7 @@ int handle__connect(struct mosquitto *context)
+ 	uint8_t will, will_retain, will_qos, clean_start;
+ 	uint8_t username_flag, password_flag;
+ 	char *username = NULL, *password = NULL;
++	uint16_t password_len = 0;
+ 	int rc;
+ 	mosquitto_property *properties = NULL;
+ 	void *auth_data = NULL;
+@@ -1176,7 +1178,7 @@ int handle__connect(struct mosquitto *context)
+ 	// Client credentials
+ 	password_flag = connect_flags & 0x40;
+ 	username_flag = connect_flags & 0x80;
+-	rc = read_and_verify_client_credentials_from_packet(context, &username, username_flag, &password, password_flag, clientid);
++	rc = read_and_verify_client_credentials_from_packet(context, &username, username_flag, &password, &password_len, password_flag, clientid);
+ 	if(rc != MOSQ_ERR_SUCCESS){
+ 		goto handle_connect_error;
+ 	}
+@@ -1193,7 +1195,7 @@ int handle__connect(struct mosquitto *context)
+ 	clientid = NULL;
+ 
+ 	/* use_identity_as_username or use_subject_as_username */
+-	rc = handle_username_from_cert_options(context, &username, &password);
++	rc = handle_username_from_cert_options(context, &username, &password, password_len);
+ 	if(rc != MOSQ_ERR_SUCCESS){
+ 		goto handle_connect_error;
+ 	}
+diff --git a/src/plugin_basic_auth.c b/src/plugin_basic_auth.c
+index dfc0a57d..49d4f508 100644
+--- a/src/plugin_basic_auth.c
++++ b/src/plugin_basic_auth.c
+@@ -40,6 +40,7 @@ static int plugin__basic_auth(struct mosquitto__security_options *opts, struct m
+ 		event_data.client = context;
+ 		event_data.username = context->username;
+ 		event_data.password = context->password;
++		event_data.password_len = context->password_len;
+ 		rc = cb_base->cb(MOSQ_EVT_BASIC_AUTH, &event_data, cb_base->userdata);
+ 		if(rc == MOSQ_ERR_PLUGIN_IGNORE){
+ 			/* Do nothing, this is as if the plugin doesn't exist */
+diff --git a/test/broker/09-plugin-auth-unpwd-fail.py b/test/broker/09-plugin-auth-unpwd-fail.py
+index bdbf8b54..14520aa5 100755
+--- a/test/broker/09-plugin-auth-unpwd-fail.py
++++ b/test/broker/09-plugin-auth-unpwd-fail.py
+@@ -20,13 +20,22 @@ def do_test(plugin_ver):
+     connect_packet = mosq_test.gen_connect("connect-uname-pwd-test", username="test-username", password="wrong")
+     connack_packet = mosq_test.gen_connack(rc=5)
+ 
++    connect_packet_binary_pw1 = mosq_test.gen_connect("connect-uname-pwd-test", username="binary-password", password="\x00\x01\x02\x03\x04\x05\x06\x08")
++    connect_packet_binary_pw2 = mosq_test.gen_connect("connect-uname-pwd-test", username="binary-password", password="\x00\x01\x02\x03\x04\x05\x06")
++
+     broker = mosq_test.start_broker(filename=os.path.basename(__file__), use_conf=True, port=port)
+ 
+     try:
+         sock = mosq_test.do_client_connect(connect_packet, connack_packet, timeout=20, port=port)
++        sock.close()
++
++        if plugin_ver == 5:
++            sock = mosq_test.do_client_connect(connect_packet_binary_pw1, connack_packet, port=port)
++            sock.close()
++            sock = mosq_test.do_client_connect(connect_packet_binary_pw2, connack_packet, port=port)
++            sock.close()
+         rc = 0
+ 
+-        sock.close()
+     except mosq_test.TestError:
+         pass
+     finally:
+diff --git a/test/broker/09-plugin-auth-unpwd-success.py b/test/broker/09-plugin-auth-unpwd-success.py
+index 1eaf4e5f..91c7b80c 100755
+--- a/test/broker/09-plugin-auth-unpwd-success.py
++++ b/test/broker/09-plugin-auth-unpwd-success.py
+@@ -20,12 +20,17 @@ def do_test(plugin_ver):
+     connect_packet = mosq_test.gen_connect("connect-uname-pwd-test", username="test-username", password="cnwTICONIURW")
+     connack_packet = mosq_test.gen_connack(rc=0)
+ 
++    connect_packet_binary_pw = mosq_test.gen_connect("connect-uname-pwd-test", username="binary-password", password="\x00\x01\x02\x03\x04\x05\x06\x07")
++
+     broker = mosq_test.start_broker(filename=os.path.basename(__file__), use_conf=True, port=port)
+ 
+     try:
+         sock = mosq_test.do_client_connect(connect_packet, connack_packet, timeout=20, port=port)
+-        rc = 0
+         sock.close()
++        if plugin_ver == 5:
++            sock = mosq_test.do_client_connect(connect_packet_binary_pw, connack_packet, port=port)
++            sock.close()
++        rc = 0
+     except mosq_test.TestError:
+         pass
+     finally:
+diff --git a/test/broker/c/auth_plugin_v5.c b/test/broker/c/auth_plugin_v5.c
+index 4fbb622c..0f72a0da 100644
+--- a/test/broker/c/auth_plugin_v5.c
++++ b/test/broker/c/auth_plugin_v5.c
+@@ -82,6 +82,7 @@ int mosquitto_auth_acl_check_v5(int event, void *event_data, void *user_data)
+ int mosquitto_auth_unpwd_check_v5(int event, void *event_data, void *user_data)
+ {
+ 	struct mosquitto_evt_basic_auth *ed = event_data;
++	const char binary_pw[8] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07};
+ 
+ 	(void)user_data;
+ 
+@@ -89,7 +90,21 @@ int mosquitto_auth_unpwd_check_v5(int event, void *event_data, void *user_data)
+ 		abort();
+ 	}
+ 
+-	if(ed->username && !strcmp(ed->username, "test-username") && ed->password && !strcmp(ed->password, "cnwTICONIURW")){
++	if(ed->username
++			&& !strcmp(ed->username, "test-username")
++			&& ed->password
++			&& !strcmp(ed->password, "cnwTICONIURW")
++			&& strlen("cnwTICONIURW") == ed->password_len
++			){
++
++		return MOSQ_ERR_SUCCESS;
++	}else if(ed->username
++			&& !strcmp(ed->username, "binary-password")
++			&& ed->password
++			&& ed->password_len == sizeof(binary_pw)
++			&& !memcmp(ed->password, binary_pw, ed->password_len)
++			){
++
+ 		return MOSQ_ERR_SUCCESS;
+ 	}else if(ed->username && (!strcmp(ed->username, "readonly") || !strcmp(ed->username, "readwrite"))){
+ 		return MOSQ_ERR_SUCCESS;
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch b/package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch
new file mode 100644
index 0000000000..968dd85b69
--- /dev/null
+++ b/package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch
@@ -0,0 +1,152 @@
+From ea6d1c5847f16b3fe8877ff4e90cc33b36b0b511 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Sun, 15 Feb 2026 21:39:51 +0000
+Subject: [PATCH] Fix outgoing maximum-packet-size limit check.
+
+Closes #3503. Thanks to Julian Graf.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/3a0f46aa209c4b2d15b36f866b23e9a0df696810
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ lib/packet_mosq.c                              |  2 +-
+ ...12-prop-maximum-packet-size-publish-qos1.py | 18 +++++++++++++-----
+ ...12-prop-maximum-packet-size-publish-qos2.py |  4 ++--
+ test/lib/11-prop-oversize-packet.py            |  4 ++--
+ test/lib/c/11-prop-oversize-packet.c           |  4 ++--
+ test/lib/cpp/11-prop-oversize-packet.cpp       |  4 ++--
+ 6 files changed, 22 insertions(+), 14 deletions(-)
+
+diff --git a/lib/packet_mosq.c b/lib/packet_mosq.c
+index d1379d3d..48b0efbd 100644
+--- a/lib/packet_mosq.c
++++ b/lib/packet_mosq.c
+@@ -238,7 +238,7 @@ int packet__check_oversize(struct mosquitto *mosq, uint32_t remaining_length)
+ 		return MOSQ_ERR_SUCCESS;
+ 	}
+ 
+-	len = remaining_length + mosquitto_varint_bytes(remaining_length);
++	len = 1 + remaining_length + mosquitto_varint_bytes(remaining_length);
+ 	if(len > mosq->maximum_packet_size){
+ 		return MOSQ_ERR_OVERSIZE_PACKET;
+ 	}else{
+diff --git a/test/broker/12-prop-maximum-packet-size-publish-qos1.py b/test/broker/12-prop-maximum-packet-size-publish-qos1.py
+index 2900c3c7..2530a377 100755
+--- a/test/broker/12-prop-maximum-packet-size-publish-qos1.py
++++ b/test/broker/12-prop-maximum-packet-size-publish-qos1.py
+@@ -17,13 +17,18 @@ def do_test(start_broker):
+     suback_packet = mosq_test.gen_suback(mid, 1, proto_ver=5)
+ 
+     mid=1
+-    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="12345678901234567890", proto_ver=5)
++    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="1234", proto_ver=5)
+     puback1_packet = mosq_test.gen_puback(mid, proto_ver=5)
+ 
+     mid=2
+-    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="7890", proto_ver=5)
++    props = mqtt5_props.gen_byte_prop(mqtt5_props.PAYLOAD_FORMAT_INDICATOR, 1)
++    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="56", proto_ver=5, properties=props)
+     puback2_packet = mosq_test.gen_puback(mid, proto_ver=5)
+ 
++    mid=3
++    publish3_packet = mosq_test.gen_publish(topic="12/max/publish/qos1/test/topic", mid=mid, qos=1, payload="789", proto_ver=5)
++    puback3_packet = mosq_test.gen_puback(mid, proto_ver=5)
++
+     port = mosq_test.get_port()
+     if start_broker:
+         broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
+@@ -33,12 +38,15 @@ def do_test(start_broker):
+         mosq_test.do_send_receive(sock, subscribe_packet, suback_packet)
+ 
+         mosq_test.do_send_receive(sock, publish1_packet, puback1_packet, "puback 1")
+-
+         # We shouldn't receive the publish here because it is > MAXIMUM_PACKET_SIZE
+         mosq_test.do_ping(sock)
+ 
+-        sock.send(publish2_packet)
+-        mosq_test.receive_unordered(sock, puback2_packet, publish2_packet, "puback 2/publish2")
++        mosq_test.do_send_receive(sock, publish2_packet, puback2_packet, "puback 2")
++        # We shouldn't receive the publish here because it is > MAXIMUM_PACKET_SIZE
++        mosq_test.do_ping(sock)
++
++        sock.send(publish3_packet)
++        mosq_test.receive_unordered(sock, puback3_packet, publish3_packet, "puback 3/publish3")
+         rc = 0
+     except mosq_test.TestError:
+         pass
+diff --git a/test/broker/12-prop-maximum-packet-size-publish-qos2.py b/test/broker/12-prop-maximum-packet-size-publish-qos2.py
+index e0ad9343..7256d254 100755
+--- a/test/broker/12-prop-maximum-packet-size-publish-qos2.py
++++ b/test/broker/12-prop-maximum-packet-size-publish-qos2.py
+@@ -17,13 +17,13 @@ def do_test(start_broker):
+     suback_packet = mosq_test.gen_suback(mid, 2, proto_ver=5)
+ 
+     mid=1
+-    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="12345678901234567890", proto_ver=5)
++    publish1_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="1234", proto_ver=5)
+     pubrec1_packet = mosq_test.gen_pubrec(mid, proto_ver=5)
+     pubrel1_packet = mosq_test.gen_pubrel(mid, proto_ver=5)
+     pubcomp1_packet = mosq_test.gen_pubcomp(mid, proto_ver=5)
+ 
+     mid=2
+-    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="7890", proto_ver=5)
++    publish2_packet = mosq_test.gen_publish(topic="12/max/publish/qos2/test/topic", mid=mid, qos=2, payload="789", proto_ver=5)
+     pubrec2_packet = mosq_test.gen_pubrec(mid, proto_ver=5)
+     pubrel2_packet = mosq_test.gen_pubrel(mid, proto_ver=5)
+     pubcomp2_packet = mosq_test.gen_pubcomp(mid, proto_ver=5)
+diff --git a/test/lib/11-prop-oversize-packet.py b/test/lib/11-prop-oversize-packet.py
+index f8f56697..e537eef3 100755
+--- a/test/lib/11-prop-oversize-packet.py
++++ b/test/lib/11-prop-oversize-packet.py
+@@ -13,8 +13,8 @@ def do_test(conn, data):
+     props += mqtt5_props.gen_uint16_prop(mqtt5_props.RECEIVE_MAXIMUM, 20)
+     connack_packet = mosq_test.gen_connack(rc=0, proto_ver=5, properties=props, property_helper=False)
+ 
+-    bad_publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="0123456789012345678", proto_ver=5)
+-    publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="012345678901234567", proto_ver=5)
++    bad_publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="123456789012345678", proto_ver=5)
++    publish_packet = mosq_test.gen_publish("pub/test", qos=0, payload="12345678901234567", proto_ver=5)
+ 
+     disconnect_packet = mosq_test.gen_disconnect()
+ 
+diff --git a/test/lib/c/11-prop-oversize-packet.c b/test/lib/c/11-prop-oversize-packet.c
+index 6f9624a8..a857e936 100644
+--- a/test/lib/c/11-prop-oversize-packet.c
++++ b/test/lib/c/11-prop-oversize-packet.c
+@@ -27,12 +27,12 @@ static void on_connect(struct mosquitto *mosq, void *obj, int rc)
+ 			exit(1);
+ 		}
+ 
+-		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("0123456789012345678"), "0123456789012345678", 0, false);
++		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("123456789012345678"), "123456789012345678", 0, false);
+ 		if(rc != MOSQ_ERR_OVERSIZE_PACKET){
+ 			printf("Fail on publish 1\n");
+ 			exit(1);
+ 		}
+-		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("012345678901234567"), "012345678901234567", 0, false);
++		rc = mosquitto_publish(mosq, &sent_mid, "pub/test", strlen("12345678901234567"), "12345678901234567", 0, false);
+ 		if(rc != MOSQ_ERR_SUCCESS){
+ 			printf("Fail on publish 2\n");
+ 			exit(1);
+diff --git a/test/lib/cpp/11-prop-oversize-packet.cpp b/test/lib/cpp/11-prop-oversize-packet.cpp
+index 880df48e..abd76186 100644
+--- a/test/lib/cpp/11-prop-oversize-packet.cpp
++++ b/test/lib/cpp/11-prop-oversize-packet.cpp
+@@ -36,12 +36,12 @@ void mosquittopp_test::on_connect(int rc)
+ 			exit(1);
+ 		}
+ 
+-		rc = publish(&sent_mid, "pub/test", strlen("0123456789012345678"), "0123456789012345678", 0, false);
++		rc = publish(&sent_mid, "pub/test", strlen("123456789012345678"), "123456789012345678", 0, false);
+ 		if(rc != MOSQ_ERR_OVERSIZE_PACKET){
+ 			printf("Fail on publish 1\n");
+ 			exit(1);
+ 		}
+-		rc = publish(&sent_mid, "pub/test", strlen("012345678901234567"), "012345678901234567", 0, false);
++		rc = publish(&sent_mid, "pub/test", strlen("12345678901234567"), "12345678901234567", 0, false);
+ 		if(rc != MOSQ_ERR_SUCCESS){
+ 			printf("Fail on publish 2\n");
+ 			exit(1);
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch b/package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch
new file mode 100644
index 0000000000..b76c422b63
--- /dev/null
+++ b/package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch
@@ -0,0 +1,212 @@
+From 910971ffe895ea96862857b94a26c92d3a24f4f6 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Mon, 16 Feb 2026 00:11:20 +0000
+Subject: [PATCH] Fix will messages being incorrectly delayed.
+
+This occured if a client set session-expiry-interval=0 when using
+will-delay-interval>0.
+
+Closes #3505. Thanks to Julian Graf.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/d0152406e32afc6a014097de0714fbb371c2b902
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ src/context.c                                 |  2 +-
+ test/broker/07-will-delay-reconnect.py        |  9 +++--
+ test/broker/07-will-delay-recover.py          | 11 +++++-
+ ...y.py => 07-will-delay-session-expiry-0.py} | 37 +++++++++----------
+ test/broker/07-will-delay.py                  |  5 ++-
+ test/broker/Makefile                          |  1 +
+ test/broker/test.py                           |  1 +
+ 7 files changed, 37 insertions(+), 29 deletions(-)
+ copy test/broker/{07-will-delay.py => 07-will-delay-session-expiry-0.py} (51%)
+
+diff --git a/src/context.c b/src/context.c
+index 6b397d47..bb3dae96 100644
+--- a/src/context.c
++++ b/src/context.c
+@@ -216,7 +216,7 @@ void context__cleanup(struct mosquitto *context, bool force_free)
+ void context__send_will(struct mosquitto *ctxt)
+ {
+ 	if(ctxt->state != mosq_cs_disconnecting && ctxt->will){
+-		if(ctxt->will_delay_interval > 0){
++		if(ctxt->session_expiry_interval > 0 && ctxt->will_delay_interval > 0){
+ 			will_delay__add(ctxt);
+ 			return;
+ 		}
+diff --git a/test/broker/07-will-delay-reconnect.py b/test/broker/07-will-delay-reconnect.py
+index e0355a48..504c074e 100755
+--- a/test/broker/07-will-delay-reconnect.py
++++ b/test/broker/07-will-delay-reconnect.py
+@@ -14,12 +14,13 @@ def do_test(start_broker):
+     connect1_packet = mosq_test.gen_connect("will-delay-reconnect-test", proto_ver=5)
+     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
+ 
+-    props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
+-    connect2a_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, will_topic="will/delay/reconnect/test", will_payload=b"will delay", will_properties=props, clean_session=False)
++    props = mqtt5_props.gen_uint32_prop(mqtt5_props.SESSION_EXPIRY_INTERVAL, 60)
++    will_props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
++    connect2a_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, will_topic="will/delay/reconnect/test", will_payload=b"will delay", will_properties=will_props, clean_session=False, properties=props)
+     connack2a_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
+ 
+-    connect2b_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, clean_session=True)
+-    connack2b_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
++    connect2b_packet = mosq_test.gen_connect("will-delay-reconnect-helper", proto_ver=5, clean_session=False)
++    connack2b_packet = mosq_test.gen_connack(rc=0, flags=1, proto_ver=5)
+ 
+     subscribe_packet = mosq_test.gen_subscribe(mid, "will/delay/reconnect/test", 0, proto_ver=5)
+     suback_packet = mosq_test.gen_suback(mid, 0, proto_ver=5)
+diff --git a/test/broker/07-will-delay-recover.py b/test/broker/07-will-delay-recover.py
+index ffdb9612..7e5c196d 100755
+--- a/test/broker/07-will-delay-recover.py
++++ b/test/broker/07-will-delay-recover.py
+@@ -27,6 +27,8 @@ def do_test(start_broker, clean_session):
+ 
+     connect2_packet_clear = mosq_test.gen_connect("will-delay-recovery-helper", proto_ver=5)
+ 
++    will_packet = mosq_test.gen_publish(topic="will/delay/recovery/test", payload="will delay", qos=0, proto_ver=5)
++
+     port = mosq_test.get_port()
+     if start_broker:
+         broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
+@@ -43,8 +45,13 @@ def do_test(start_broker, clean_session):
+         time.sleep(3)
+ 
+         # The client2 has reconnected within the will delay interval, which has now
+-        # passed. We should not have received the will at this point.
+-        mosq_test.do_ping(sock1)
++        # passed.
++        if clean_session:
++            # The old session has ended, so we should receive the will
++            mosq_test.expect_packet(sock1, "will", will_packet)
++        else:
++            # We should not have received the will at this point.
++            mosq_test.do_ping(sock1)
+         rc = 0
+ 
+         sock1.close()
+diff --git a/test/broker/07-will-delay.py b/test/broker/07-will-delay-session-expiry-0.py
+similarity index 51%
+copy from test/broker/07-will-delay.py
+copy to test/broker/07-will-delay-session-expiry-0.py
+index d1e39828..eded4be9 100755
+--- a/test/broker/07-will-delay.py
++++ b/test/broker/07-will-delay-session-expiry-0.py
+@@ -1,42 +1,45 @@
+ #!/usr/bin/env python3
+ 
+-# Test whether a client will is transmitted with a delay correctly.
++# Test whether a client that connects with a will delay that is longer than
++# their session expiry interval has their will published.
+ # MQTT 5
++# https://github.com/eclipse/mosquitto/issues/1401
+ 
+ from mosq_test_helper import *
+ 
+-def do_test(start_broker, clean_session):
++def do_test(start_broker):
+     rc = 1
+ 
+     mid = 1
+-    connect1_packet = mosq_test.gen_connect("will-delay-test", proto_ver=5)
++    connect1_packet = mosq_test.gen_connect("will-session-exp", proto_ver=5)
+     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
+ 
+-    props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
+-    connect2_packet = mosq_test.gen_connect("will-delay-helper", proto_ver=5, will_topic="will/delay/test", will_payload=b"will delay", will_qos=2, will_properties=props, clean_session=clean_session)
++    will_props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 60)
++    connect_props = mqtt5_props.gen_uint32_prop(mqtt5_props.SESSION_EXPIRY_INTERVAL, 0)
++
++    connect2_packet = mosq_test.gen_connect("will-session-exp-helper", proto_ver=5, properties=connect_props, will_topic="will/session-expiry/test", will_payload=b"will delay", will_qos=2, will_properties=will_props)
+     connack2_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
+ 
+-    subscribe_packet = mosq_test.gen_subscribe(mid, "will/delay/test", 0, proto_ver=5)
++    subscribe_packet = mosq_test.gen_subscribe(mid, "will/session-expiry/test", 0, proto_ver=5)
+     suback_packet = mosq_test.gen_suback(mid, 0, proto_ver=5)
+ 
+-    publish_packet = mosq_test.gen_publish("will/delay/test", qos=0, payload="will delay", proto_ver=5)
++    publish_packet = mosq_test.gen_publish("will/session-expiry/test", qos=0, payload="will delay", proto_ver=5)
+ 
+     port = mosq_test.get_port()
+     if start_broker:
+         broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
+ 
+     try:
+-        sock1 = mosq_test.do_client_connect(connect1_packet, connack1_packet, timeout=30, port=port)
++        sock1 = mosq_test.do_client_connect(connect1_packet, connack1_packet, timeout=5, port=port, connack_error="connack1")
+         mosq_test.do_send_receive(sock1, subscribe_packet, suback_packet, "suback")
+ 
+-        sock2 = mosq_test.do_client_connect(connect2_packet, connack2_packet, timeout=30, port=port)
++        sock2 = mosq_test.do_client_connect(connect2_packet, connack2_packet, timeout=5, port=port, connack_error="connack2")
++        time.sleep(1)
+         sock2.close()
+ 
+-        t_start = time.time()
++        # Will should be sent immediately due to session-expiry-interval=0. If not, the read will timeout
+         mosq_test.expect_packet(sock1, "publish", publish_packet)
+-        t_finish = time.time()
+-        if t_finish - t_start > 2 and t_finish - t_start < 5:
+-            rc = 0
++        rc = 0
+ 
+         sock1.close()
+     except mosq_test.TestError:
+@@ -56,13 +59,7 @@ def do_test(start_broker, clean_session):
+ 
+ 
+ def all_tests(start_broker=False):
+-    rc = do_test(start_broker, clean_session=True)
+-    if rc:
+-        return rc
+-    rc = do_test(start_broker, clean_session=False)
+-    if rc:
+-        return rc
+-    return 0
++    return do_test(start_broker)
+ 
+ if __name__ == '__main__':
+     all_tests(True)
+diff --git a/test/broker/07-will-delay.py b/test/broker/07-will-delay.py
+index d1e39828..e148ea1e 100755
+--- a/test/broker/07-will-delay.py
++++ b/test/broker/07-will-delay.py
+@@ -12,8 +12,9 @@ def do_test(start_broker, clean_session):
+     connect1_packet = mosq_test.gen_connect("will-delay-test", proto_ver=5)
+     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
+ 
+-    props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
+-    connect2_packet = mosq_test.gen_connect("will-delay-helper", proto_ver=5, will_topic="will/delay/test", will_payload=b"will delay", will_qos=2, will_properties=props, clean_session=clean_session)
++    props = mqtt5_props.gen_uint32_prop(mqtt5_props.SESSION_EXPIRY_INTERVAL, 60)
++    will_props = mqtt5_props.gen_uint32_prop(mqtt5_props.WILL_DELAY_INTERVAL, 3)
++    connect2_packet = mosq_test.gen_connect("will-delay-helper", proto_ver=5, properties=props, will_topic="will/delay/test", will_payload=b"will delay", will_qos=2, will_properties=will_props, clean_session=clean_session)
+     connack2_packet = mosq_test.gen_connack(rc=0, proto_ver=5)
+ 
+     subscribe_packet = mosq_test.gen_subscribe(mid, "will/delay/test", 0, proto_ver=5)
+diff --git a/test/broker/Makefile b/test/broker/Makefile
+index f2a6fb7c..fb6eef22 100644
+--- a/test/broker/Makefile
++++ b/test/broker/Makefile
+@@ -148,6 +148,7 @@ msg_sequence_test:
+ 	./07-will-delay-invalid-573191.py
+ 	./07-will-delay-reconnect.py
+ 	./07-will-delay-recover.py
++	./07-will-delay-session-expiry-0.py
+ 	./07-will-delay-session-expiry.py
+ 	./07-will-delay-session-expiry2.py
+ 	./07-will-delay.py
+diff --git a/test/broker/test.py b/test/broker/test.py
+index 02bcae26..4c8003d5 100755
+--- a/test/broker/test.py
++++ b/test/broker/test.py
+@@ -125,6 +125,7 @@ tests = [
+     (1, './07-will-delay-invalid-573191.py'),
+     (1, './07-will-delay-reconnect.py'),
+     (1, './07-will-delay-recover.py'),
++    (1, './07-will-delay-session-expiry-0.py'),
+     (1, './07-will-delay-session-expiry.py'),
+     (1, './07-will-delay-session-expiry2.py'),
+     (1, './07-will-delay.py'),
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch b/package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch
new file mode 100644
index 0000000000..521391fcec
--- /dev/null
+++ b/package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch
@@ -0,0 +1,27 @@
+From 5ff7991df2743afaa7777822b7b4ffa471cf9b97 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Wed, 18 Feb 2026 09:05:44 +0000
+Subject: [PATCH] Fix incorrect parsing of unix socket address in proxy v2
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/b21c9f2c9af97ac4bc90efea388ca27ce7f6e73a
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ src/proxy_v2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/proxy_v2.c b/src/proxy_v2.c
+index 97932ad3..47adb302 100644
+--- a/src/proxy_v2.c
++++ b/src/proxy_v2.c
+@@ -280,7 +280,7 @@ int proxy_v2__read(struct mosquitto *context)
+ 			union proxy_addr *addr = (union proxy_addr *)context->proxy.buf;
+ 			context->address = mosquitto_strndup((char *)addr->unix_addr.src_addr, sizeof(addr->unix_addr.src_addr));
+ 			context->remote_port = 0;
+-			context->proxy.pos = (uint16_t)(strlen(context->address) + 1);
++			context->proxy.pos = (uint16_t)(sizeof(addr->unix_addr.src_addr) + 1);
+ 		}else{
+ 			/* Must be LOCAL */
+ 			/* Ignore address */
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch b/package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch
new file mode 100644
index 0000000000..dbf8d42aa8
--- /dev/null
+++ b/package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch
@@ -0,0 +1,116 @@
+From bb023cc9f6aceddbb77cd854659eac0a200ab017 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Mon, 23 Feb 2026 18:45:34 +0000
+Subject: [PATCH] Fix incorrect maximum-packet-size restriction for incoming
+ packets.
+
+Closes #3515. Thanks to Julian Graf.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/7a1905006a629f264d3657abf335d09cb5555980
+[yann.morin@orange.com: drop the Changelog.txt entry]
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ lib/packet_mosq.c                                 | 14 ++++++++------
+ test/broker/12-prop-maximum-packet-size-broker.py | 11 +++++++----
+ 2 files changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/lib/packet_mosq.c b/lib/packet_mosq.c
+index 48b0efbd..64651b73 100644
+--- a/lib/packet_mosq.c
++++ b/lib/packet_mosq.c
+@@ -399,9 +399,11 @@ static int read_header(struct mosquitto *mosq, ssize_t (*func_read)(struct mosqu
+ 
+ static int packet__check_in_packet_oversize(struct mosquitto *mosq)
+ {
++	uint32_t packet_length = 1 + mosquitto_varint_bytes(mosq->in_packet.remaining_length) + mosq->in_packet.remaining_length;
++
+ 	switch(mosq->in_packet.command & 0xF0){
+ 		case CMD_CONNECT:
+-			if(mosq->in_packet.remaining_length > db.config->packet_max_connect){
++			if(packet_length > db.config->packet_max_connect){
+ 				return MOSQ_ERR_OVERSIZE_PACKET;
+ 			}
+ 			break;
+@@ -412,7 +414,7 @@ static int packet__check_in_packet_oversize(struct mosquitto *mosq)
+ 		case CMD_PUBCOMP:
+ 		case CMD_UNSUBACK:
+ 			if(mosq->protocol == mosq_p_mqtt5){
+-				if(mosq->in_packet.remaining_length > db.config->packet_max_simple){
++				if(packet_length > db.config->packet_max_simple){
+ 					return MOSQ_ERR_OVERSIZE_PACKET;
+ 				}
+ 			}else{
+@@ -431,7 +433,7 @@ static int packet__check_in_packet_oversize(struct mosquitto *mosq)
+ 
+ 		case CMD_DISCONNECT:
+ 			if(mosq->protocol == mosq_p_mqtt5){
+-				if(mosq->in_packet.remaining_length > db.config->packet_max_simple){
++				if(packet_length > db.config->packet_max_simple){
+ 					return MOSQ_ERR_OVERSIZE_PACKET;
+ 				}
+ 			}else{
+@@ -443,20 +445,20 @@ static int packet__check_in_packet_oversize(struct mosquitto *mosq)
+ 
+ 		case CMD_SUBSCRIBE:
+ 		case CMD_UNSUBSCRIBE:
+-			if(mosq->protocol == mosq_p_mqtt5 && mosq->in_packet.remaining_length > db.config->packet_max_sub){
++			if(mosq->protocol == mosq_p_mqtt5 && packet_length > db.config->packet_max_sub){
+ 				return MOSQ_ERR_OVERSIZE_PACKET;
+ 			}
+ 			break;
+ 
+ 		case CMD_AUTH:
+-			if(mosq->in_packet.remaining_length > db.config->packet_max_auth){
++			if(packet_length > db.config->packet_max_auth){
+ 				return MOSQ_ERR_OVERSIZE_PACKET;
+ 			}
+ 			break;
+ 
+ 	}
+ 
+-	if(db.config->max_packet_size > 0 && mosq->in_packet.remaining_length+1 > db.config->max_packet_size){
++	if(db.config->max_packet_size > 0 && packet_length > db.config->max_packet_size){
+ 		if(mosq->protocol == mosq_p_mqtt5){
+ 			send__disconnect(mosq, MQTT_RC_PACKET_TOO_LARGE, NULL);
+ 		}
+diff --git a/test/broker/12-prop-maximum-packet-size-broker.py b/test/broker/12-prop-maximum-packet-size-broker.py
+index 9df91b68..73be989c 100755
+--- a/test/broker/12-prop-maximum-packet-size-broker.py
++++ b/test/broker/12-prop-maximum-packet-size-broker.py
+@@ -8,7 +8,7 @@ def write_config(filename, port):
+     with open(filename, 'w') as f:
+         f.write("listener %d\n" % (port))
+         f.write("allow_anonymous true\n")
+-        f.write("max_packet_size 40\n")
++        f.write("max_packet_size 50\n")
+ 
+ port = mosq_test.get_port()
+ conf_file = os.path.basename(__file__).replace('.py', '.conf')
+@@ -18,18 +18,21 @@ rc = 1
+ 
+ connect_packet = mosq_test.gen_connect("12-max-packet-broker", proto_ver=5)
+ props = mqtt5_props.gen_uint16_prop(mqtt5_props.TOPIC_ALIAS_MAXIMUM, 10)
+-props += mqtt5_props.gen_uint32_prop(mqtt5_props.MAXIMUM_PACKET_SIZE, 40)
++props += mqtt5_props.gen_uint32_prop(mqtt5_props.MAXIMUM_PACKET_SIZE, 50)
+ props += mqtt5_props.gen_uint16_prop(mqtt5_props.RECEIVE_MAXIMUM, 20)
+ connack_packet = mosq_test.gen_connack(rc=0, proto_ver=5, properties=props, property_helper=False)
+ 
+-publish_packet = mosq_test.gen_publish("12/max/packet/size/broker/test/topic", qos=0, payload="0123456789012345678901234567890", proto_ver=5)
++publish_packet_ok = mosq_test.gen_publish("12/max/packet/size/broker/test/topic", qos=0, payload="012345678", proto_ver=5)
++publish_packet_bad = mosq_test.gen_publish("12/max/packet/size/broker/test/topic", qos=0, payload="0123456789", proto_ver=5)
+ disconnect_packet = mosq_test.gen_disconnect(reason_code=149, proto_ver=5)
+ 
+ broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port, use_conf=True)
+ 
+ try:
+     sock = mosq_test.do_client_connect(connect_packet, connack_packet, port=port)
+-    mosq_test.do_send_receive(sock, publish_packet, disconnect_packet, "disconnect")
++    sock.send(publish_packet_ok)
++    mosq_test.do_ping(sock)
++    mosq_test.do_send_receive(sock, publish_packet_bad, disconnect_packet, "disconnect")
+     rc = 0
+ except mosq_test.TestError:
+     pass
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch b/package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch
new file mode 100644
index 0000000000..6c73495113
--- /dev/null
+++ b/package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch
@@ -0,0 +1,35 @@
+From bc830cffee22a3498700f9038a4ceea47efe45de Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin@orange.com>
+Date: Tue, 10 Feb 2026 09:21:11 +0100
+Subject: [PATCH] broker: properly check for getaddrinfo_a()
+
+getaddrinfo_a( is protected by _GNU_SOURCE.
+
+This is properly accounted for in the source code, in lib/net_mosq.c,
+but the check in the CmakeList is missing that define, which causes
+the check to actually fail.
+
+Add that define when checking; this fixes builds on various C libraries,
+like uClibc-ng, musl, or newer/older glibc.
+
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/8c3bc32689346d7b86e2dad954ff482b5ad7aef1
+---
+ src/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 8ac47d87..8576fea9 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -184,6 +184,7 @@ endif()
+ if(WITH_ADNS)
+ 	cmake_push_check_state()
+ 	set(ANL_CODE "
++		#define _GNU_SOURCE
+ 		#include <stdlib.h>
+ 		#include <netdb.h>
+ 		int main(){
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch b/package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch
new file mode 100644
index 0000000000..6cf1bc2fa9
--- /dev/null
+++ b/package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch
@@ -0,0 +1,56 @@
+From 8db331b93053debfb2c0e42982847eeacd571aee Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Tue, 24 Feb 2026 10:26:50 +0000
+Subject: [PATCH] cmake: Only include C++ support when required
+
+Thanks to Yann Morin
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/ae19460c132ec7b2b62c0703e1fafd3a0a3527aa)
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ CMakeLists.txt     | 8 +++++++-
+ lib/CMakeLists.txt | 1 -
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6c68bb9c..b3e28300 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10,7 +10,7 @@ set (VERSION 2.1.2)
+ project(mosquitto
+ 	VERSION ${VERSION}
+ 	DESCRIPTION "Eclipse Mosquitto"
+-	LANGUAGES C CXX
++	LANGUAGES C
+ )
+ 
+ set(CMAKE_C_STANDARD 99)
+@@ -46,10 +46,16 @@ include(CMakePushCheckState)
+ include(CheckSourceCompiles)
+ 
+ option(WITH_BUNDLED_DEPS "Build with bundled dependencies?" ON)
++option(WITH_LIB_CPP "Build C++ library?" ON)
+ option(WITH_TLS "Include SSL/TLS support?" ON)
+ option(WITH_TLS_PSK "Include TLS-PSK support (requires WITH_TLS)?" ON)
+ option(WITH_TESTS "Enable tests" ON)
+ option(INC_MEMTRACK "Include memory tracking support?" ON)
++
++if (WITH_LIB_CPP OR WITH_TESTS)
++	ENABLE_LANGUAGE(CXX)
++endif()
++
+ if (WITH_TLS)
+ 	find_package(OpenSSL REQUIRED)
+ 	add_definitions("-DWITH_TLS")
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index 4585a51a..d8bb3d8b 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -1,4 +1,3 @@
+-option(WITH_LIB_CPP "Build C++ library?" ON)
+ if(WITH_LIB_CPP)
+ 	add_subdirectory(cpp)
+ endif()
+-- 
+2.34.1
+
diff --git a/package/mosquitto/0012-libcommon-check-for-getrandom.patch b/package/mosquitto/0012-libcommon-check-for-getrandom.patch
new file mode 100644
index 0000000000..46b104657a
--- /dev/null
+++ b/package/mosquitto/0012-libcommon-check-for-getrandom.patch
@@ -0,0 +1,90 @@
+From a1d0c56984f8a65d5ffb7fbde7f200b36b5ddae5 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin@orange.com>
+Date: Tue, 10 Feb 2026 12:01:32 +0100
+Subject: [PATCH] libcommon: check for getrandom()
+
+Not all C libraries are glibc, or impersonating it; for example, musl
+does not pretend to be any version of glibc. Thus, building on musl
+fails when openssl is disabled, because no random-providing function is
+detected, although musl does provide getrandom().
+
+uClibc-ng on the other hand, can impersonate glibc, but availability of
+getrandom() is not guatranteed there: getrandom() can be compiled out of
+uClinbc-ng, or uClibc-ng can be too old to have it.
+
+Add a configure-time check that getrandom() is available, as a fallback
+when TLS is not enabled (and thus openssl is not used), and when not on
+Win32 (where getting random numbers is always possible, at least from a
+build perspective).
+
+However, building with the plain Makefiles should keep working, so
+slightly rework the defines checks in the code to account for the fact
+that HAVE_GETRANDOM may already be defined at configure time.
+
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/a487cd4f8f56a9352eec1b6e05592a73794b162b)
+---
+ libcommon/CMakeLists.txt  |  8 ++++++++
+ libcommon/random_common.c | 14 +++++++-------
+ 2 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/libcommon/CMakeLists.txt b/libcommon/CMakeLists.txt
+index 8f3474a0..7b9118bc 100644
+--- a/libcommon/CMakeLists.txt
++++ b/libcommon/CMakeLists.txt
+@@ -57,6 +57,14 @@ if (WITH_TLS)
+ 		PUBLIC
+ 			OpenSSL::SSL
+ 	)
++elseif(NOT WIN32)
++	include(CheckSymbolExists)
++	check_symbol_exists(getrandom "sys/random.h" GETRANDOM_FOUND)
++	if(GETRANDOM_FOUND)
++		add_definitions("-DHAVE_GETRANDOM")
++	else()
++		message(FATAL_ERROR "C library does not provide getrandom(); enable WITH_TLS instead")
++	endif()
+ endif()
+ 
+ if(INC_MEMTRACK)
+diff --git a/libcommon/random_common.c b/libcommon/random_common.c
+index 555bd801..e2c8d23a 100644
+--- a/libcommon/random_common.c
++++ b/libcommon/random_common.c
+@@ -26,18 +26,18 @@ Contributors:
+ #  include <lmcons.h>
+ #endif
+ 
+-#if !defined(WITH_TLS) && defined(__linux__) && defined(__GLIBC__)
++#ifdef WITH_TLS
++#  include <openssl/bn.h>
++#  include <openssl/rand.h>
++#elif defined(HAVE_GETRANDOM)  /* From CMakeLists.txt */
++# include <sys/random.h>
++#elif defined(__linux__) && defined(__GLIBC__) /* For legacy Makefiles */
+ #  if __GLIBC_PREREQ(2, 25)
+ #    include <sys/random.h>
+ #    define HAVE_GETRANDOM 1
+ #  endif
+ #endif
+ 
+-#ifdef WITH_TLS
+-#  include <openssl/bn.h>
+-#  include <openssl/rand.h>
+-#endif
+-
+ #include "mosquitto.h"
+ 
+ 
+@@ -65,7 +65,7 @@ int mosquitto_getrandom(void *bytes, int count)
+ 	}
+ 
+ 	CryptReleaseContext(provider, 0);
+-#else
++#else /* For legacy Makefiles */
+ #  error "No suitable random function found."
+ #endif
+ 	return rc;
+-- 
+2.34.1
+
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 339df8fddb..cb1c037daa 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
+	depends on BR2_USE_MMU  # lib peeks in malloc() internals; broker fork()s
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_CJSON
 	help
 	  Eclipse Mosquitto is an open source (EPL/EDL licensed) message
 	  broker that implements the MQTT protocol versions 5.0, 3.1.1
@@ -19,12 +22,11 @@ config BR2_PACKAGE_MOSQUITTO
 
 	  https://mosquitto.org/
 
+if BR2_PACKAGE_MOSQUITTO
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
-	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # include <dlfcn.h>
-	depends on BR2_PACKAGE_MOSQUITTO
 	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
 	help
 	  Build and install the mosquitto broker onto target.
@@ -32,13 +34,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	bool "dynamic security plugin"
 	depends on BR2_PACKAGE_MOSQUITTO_BROKER
-	select BR2_PACKAGE_CJSON
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Build and install the dynamic security plugin for
 	  mosquitto broker onto target.
 
-comment "mosquitto broker needs a toolchain w/ dynamic library"
+endif
+
+comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_MOSQUITTO
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index cf031f91e5..c0306161c7 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,8 +1,7 @@
-# Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.22.tar.gz.asc
-sha256  2f752589ef7db40260b633fbdb536e9a04b446a315138d64a7ff3c14e2de6b68  mosquitto-2.0.22.tar.gz
+# Locally calculated
+sha256  fd905380691ac65ea5a93779e8214941829e3d6e038d5edff9eac5fd74cbed02  mosquitto-2.1.2.tar.gz
 
 # License files
-sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
+sha256  33d1851e40fddba7eff95bcc01d1a178a87340a1126893012892913d5e6fdfa6  LICENSE.txt
 sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
 sha256  86fc4a3f97cb769c04e8da557036c1066eb8bb22b2d0a5dd31464990fe84047c  edl-v10
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 8539f28d08..6e9ad434ba 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,119 +4,98 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.22
+MOSQUITTO_VERSION = 2.1.2
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
 MOSQUITTO_CPE_ID_VENDOR = eclipse
 MOSQUITTO_INSTALL_STAGING = YES
 
-MOSQUITTO_MAKE_OPTS = \
-	CLIENT_STATIC_LDADD="$(MOSQUITTO_STATIC_LIBS)" \
-	UNAME=Linux \
-	STRIP=true \
-	prefix=/usr \
-	WITH_WRAP=no \
-	WITH_DOCS=no
+MOSQUITTO_DEPENDENCIES = cjson
 
-ifeq ($(BR2_SHARED_LIBS),y)
-MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no
-else
-MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=no
-else
-MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=yes
-endif
-
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-MOSQUITTO_MAKE_OPTS += WITH_SYSTEMD=yes
-MOSQUITTO_DEPENDENCIES += systemd
-endif
+MOSQUITTO_CONF_OPTS = \
+	-DUSE_LIBWRAP=OFF \
+	-DWITH_DOCS=OFF \
+	-DWITH_TESTS=OFF \
+	-DWITH_STATIC_LIBRARIES=OFF \
+	-DWITH_BUNDLED_DEPS=ON \
+	-DWITH_CLIENTS=ON \
+	-DWITH_HTTP_API=OFF \
+	-DWITH_CTRL_SHELL=OFF
 
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-MOSQUITTO_MAKE_OPTS += WITH_ADNS=yes
+MOSQUITTO_CONF_OPTS += -DWITH_ADNS=ON
 else
-MOSQUITTO_MAKE_OPTS += WITH_ADNS=no
+MOSQUITTO_CONF_OPTS += -DWITH_ADNS=OFF
 endif
 
 # threaded API uses pthread_setname_np
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
-MOSQUITTO_MAKE_OPTS += WITH_THREADING=yes
+MOSQUITTO_CONF_OPTS += -DWITH_THREADING=ON
 else
-MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
+MOSQUITTO_CONF_OPTS += -DWITH_THREADING=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MOSQUITTO_DEPENDENCIES += host-pkgconf openssl
-MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
-MOSQUITTO_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+MOSQUITTO_CONF_OPTS += \
+	-DWITH_TLS=ON \
+	-DWITH_TLS_PSK=ON
+
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+MOSQUITTO_DEPENDENCIES += libwebsockets
+MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=OFF
 else
-MOSQUITTO_MAKE_OPTS += WITH_TLS=no
+MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=OFF -DWITH_WEBSOCKETS_BUILTIN=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_CJSON),y)
-MOSQUITTO_DEPENDENCIES += cjson
-MOSQUITTO_MAKE_OPTS += WITH_CJSON=yes
-MOSQUITTO_STATIC_LIBS += -lcjson
-else
-MOSQUITTO_MAKE_OPTS += WITH_CJSON=no
+else # !OPENSSL
+MOSQUITTO_CONF_OPTS += \
+	-DWITH_TLS=OFF \
+	-DWITH_TLS_PSK=OFF \
+	-DWITH_WEBSOCKETS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_C_ARES),y)
 MOSQUITTO_DEPENDENCIES += c-ares
-MOSQUITTO_MAKE_OPTS += WITH_SRV=yes
+MOSQUITTO_CONF_OPTS += -DWITH_SRV=ON
 else
-MOSQUITTO_MAKE_OPTS += WITH_SRV=no
+MOSQUITTO_CONF_OPTS += -DWITH_SRV=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
-MOSQUITTO_DEPENDENCIES += libwebsockets
-MOSQUITTO_MAKE_OPTS += WITH_WEBSOCKETS=yes
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+MOSQUITTO_CONF_OPTS += -DWITH_LIB_CPP=ON
 else
-MOSQUITTO_MAKE_OPTS += WITH_WEBSOCKETS=no
+MOSQUITTO_CONF_OPTS += -DWITH_LIB_CPP=OFF
 endif
 
-# C++ support is only used to create a wrapper library
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-define MOSQUITTO_DISABLE_CPP
-	$(SED) '/-C cpp/d' $(@D)/lib/Makefile
-endef
-
-MOSQUITTO_POST_PATCH_HOOKS += MOSQUITTO_DISABLE_CPP
-endif
-
-MOSQUITTO_MAKE_DIRS = lib client
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
-MOSQUITTO_MAKE_DIRS += src apps/mosquitto_ctrl apps/mosquitto_passwd
-endif
+
+MOSQUITTO_CONF_OPTS += \
+	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
+	-DWITH_BROKER=ON \
+	-DWITH_APPS=ON \
+	-DWITH_PLUGINS=ON \
+	-DWITH_PLUGIN_ACL_FILE=ON \
+	-DWITH_PLUGIN_PASSWORD_FILE=ON \
+	-DWITH_PLUGIN_EXAMPLES=OFF \
+	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
+	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),y)
-MOSQUITTO_MAKE_DIRS += plugins/dynamic-security
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=OFF
 endif
 
-define MOSQUITTO_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
-		$(MOSQUITTO_MAKE_OPTS)
-endef
-
-define MOSQUITTO_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
-		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-endef
-
-define MOSQUITTO_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DIRS="$(MOSQUITTO_MAKE_DIRS)" \
-		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-	rm -f $(TARGET_DIR)/etc/mosquitto/*.example
-	$(INSTALL) -D -m 0644 $(@D)/mosquitto.conf \
-		$(TARGET_DIR)/etc/mosquitto/mosquitto.conf
-endef
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MOSQUITTO_DEPENDENCIES += systemd
+MOSQUITTO_CONF_OPTS += -DWITH_SYSTEMD=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_SYSTEMD=OFF
+endif
 
-ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 define MOSQUITTO_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/mosquitto/S50mosquitto \
 		$(TARGET_DIR)/etc/init.d/S50mosquitto
@@ -130,26 +109,42 @@ endef
 define MOSQUITTO_USERS
 	mosquitto -1 mosquitto -1 * - - - Mosquitto user
 endef
-endif
-
-HOST_MOSQUITTO_DEPENDENCIES = host-pkgconf host-openssl
-
-HOST_MOSQUITTO_MAKE_OPTS = \
-	$(HOST_CONFIGURE_OPTS) \
-	UNAME=Linux \
-	STRIP=true \
-	prefix=$(HOST_DIR) \
-	WITH_WRAP=no \
-	WITH_DOCS=no \
-	WITH_TLS=yes
 
-define HOST_MOSQUITTO_BUILD_CMDS
-	$(MAKE) -C $(@D)/apps/mosquitto_passwd $(HOST_MOSQUITTO_MAKE_OPTS)
+define MOSQUITTO_INSTALL_TARGET_CONF
+	rm -f $(TARGET_DIR)/etc/mosquitto/*.example
+	$(INSTALL) -D -m 0644 $(@D)/mosquitto.conf \
+		$(TARGET_DIR)/etc/mosquitto/mosquitto.conf
 endef
+MOSQUITTO_POST_INSTALL_TARGET_HOOKS += MOSQUITTO_INSTALL_TARGET_CONF
+
+else # !BR2_PACKAGE_MOSQUITTO_BROKER
+MOSQUITTO_CONF_OPTS += \
+	-DWITH_BROKER=OFF \
+	-DWITH_APPS=OFF \
+	-DWITH_PLUGINS=OFF
+endif
 
+HOST_MOSQUITTO_DEPENDENCIES = \
+	host-cjson \
+	host-openssl \
+	host-pkgconf
+
+HOST_MOSQUITTO_CONF_OPTS = \
+	-DWITH_DOCS=OFF \
+	-DWITH_BUNDLED_DEPS=ON \
+	-DWITH_CLIENTS=OFF \
+	-DWITH_BROKER=OFF \
+	-DWITH_PLUGINS=OFF \
+	-DWITH_TESTS=OFF \
+	-DWITH_APPS=ON \
+	-DWITH_TLS=ON
+
+# Manually install just the one tool we need
 define HOST_MOSQUITTO_INSTALL_CMDS
-	$(MAKE) -C $(@D)/apps/mosquitto_passwd $(HOST_MOSQUITTO_MAKE_OPTS) install
+	$(INSTALL) -D -m 0755 \
+		$(@D)/apps/mosquitto_passwd/mosquitto_passwd \
+		$(HOST_DIR)/bin/mosquitto_passwd
 endef
 
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))

--===============1741158737266407358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1741158737266407358==--
