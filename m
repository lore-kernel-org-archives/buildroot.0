Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1745FC5B567
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 19:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0CC46076A;
	Mon, 10 Aug 2026 19:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yl_IPXmW-jmW; Mon, 10 Aug 2026 19:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E60D6075F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786391786;
	bh=r800a8Pf2a+v5gvOY4CvrvvO9AmYrSUxg2lQm7833tM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e8j8YZD/fPk6OliQHWRu3AnaB1b4kO0jr4j6Xe7b5oXd5645zEG+NXZQIC0Pfh43j
	 RC+KLPtgxLIOtztzxF+jOapxBgdA0s0RW3tLotnSWScYDx3jikNsU3dmsdOM8b7WZv
	 piStzxrZRCA1tWgzSHK9k0E1er4ueg5UB6EyQX2y7YQt7CZLSZ1ewvvbO0Aj9zji0V
	 FeKCL1mBwKAGGTvxB5NVObiMbLrPBE//UG/Hn4Qo9ntWUzJJ3VILgYGhxr+ryoIorm
	 /uS9BltI9aRFO5fMqXCI02gpM3UwLDH7xfa4MqNCGY+HAiIAHsJjUe+s0li+fJcJjC
	 emlqhB7kRs+Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E60D6075F;
	Mon, 10 Aug 2026 19:56:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2B1C10E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A52F480EC4
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZhvClPrzOyu for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 19:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFEBC80C2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFEBC80C2A
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:56:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81AC88D2F1; Mon, 10 Aug 2026 19:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 21:52:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c8e2c527e1e83e0db3767accbb7822d1298e8fa
X-Git-Newrev: d38b4915e9437c5492836914c0a0fff12b4f1031
X-Patchwork-Hint: ignore
Message-Id: <20260810195535.81AC88D2F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drogon: new package
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
Content-Type: multipart/mixed; boundary="===============1244691236026230567=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1244691236026230567==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d38b4915e9437c5492836914c0a0fff12b4f1031
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drogon is a C++17/20 based HTTP application framework. It can be used to
easily build various types of web application server programs using C++.

Project page: https://github.com/drogonframework/drogon

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...HUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch | 93 ++++++++++++++++++++++
 package/drogon/Config.in                           | 52 ++++++++++++
 package/drogon/drogon.hash                         |  3 +
 package/drogon/drogon.mk                           | 63 +++++++++++++++
 6 files changed, 213 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b7749df319..75607183c6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -820,6 +820,7 @@ F:	package/babeld/
 F:	package/bc/
 F:	package/cmocka/
 F:	package/connman/
+F:	package/drogon/
 F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
diff --git a/package/Config.in b/package/Config.in
index e4deb5f00e..6058800682 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2001,6 +2001,7 @@ menu "Networking"
 	source "package/davici/Config.in"
 	source "package/dht/Config.in"
 	source "package/dpdk/Config.in"
+	source "package/drogon/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/drogon/0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch b/package/drogon/0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch
new file mode 100644
index 0000000000..7a9fab389f
--- /dev/null
+++ b/package/drogon/0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch
@@ -0,0 +1,93 @@
+From 9ecfb965e6ea02583874e534f8936ebb43a9db29 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Mon, 20 Jul 2026 16:16:22 +0200
+Subject: [PATCH] Fix EPOLLRDHUP/POLLRDHUP mismatch on Linux SPARC/SPARC64
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix a build failure reported by Buildroot autobuild for the
+bootlin-sparc64-glibc configuration:
+
+  EpollPoller.cc:41:26: error: static assertion failed:
+  EPOLLRDHUP != POLLRDHUP
+
+On SPARC/SPARC64, EPOLLRDHUP (0x2000) and POLLRDHUP (0x0800) are
+different bits, breaking the assumption elsewhere in this file that
+epoll and poll flags are interchangeable.
+
+Introduce a combined RDHUP value for this architecture and translate
+it before epoll_ctl() and after epoll_wait(), since revents_ is later
+tested against POLLRDHUP in Channel::handleEvent() — otherwise
+half-close detection would silently break at runtime.
+
+This patch is inspired by the equivalent fix in lighttpd:
+https://redmine.lighttpd.net/issues/3251
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/an-tao/trantor/pull/407
+---
+ trantor/trantor/net/inner/poller/EpollPoller.cc | 25 ++++++++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/trantor/trantor/net/inner/poller/EpollPoller.cc b/trantor/trantor/net/inner/poller/EpollPoller.cc
+index c9c4f7d481b4..812b48c30d79 100644
+--- a/trantor/trantor/net/inner/poller/EpollPoller.cc
++++ b/trantor/trantor/net/inner/poller/EpollPoller.cc
+@@ -22,6 +22,9 @@
+ #include <assert.h>
+ #include <strings.h>
+ #include <iostream>
++#if (defined(__sparc__) || defined(__sparc))
++#define TRANTOR_RDHUP 0x2800 /* EPOLLRDHUP | POLLRDHUP */
++#endif
+ #elif defined _WIN32
+ #include "Wepoll.h"
+ #include <assert.h>
+@@ -38,7 +41,12 @@ namespace trantor
+ static_assert(EPOLLIN == POLLIN, "EPOLLIN != POLLIN");
+ static_assert(EPOLLPRI == POLLPRI, "EPOLLPRI != POLLPRI");
+ static_assert(EPOLLOUT == POLLOUT, "EPOLLOUT != POLLOUT");
++#if (defined(__sparc__) || defined(__sparc))
++static_assert(EPOLLRDHUP & TRANTOR_RDHUP,
++              "EPOLLRDHUP not included in TRANTOR_RDHUP");
++#else
+ static_assert(EPOLLRDHUP == POLLRDHUP, "EPOLLRDHUP != POLLRDHUP");
++#endif
+ static_assert(EPOLLERR == POLLERR, "EPOLLERR != POLLERR");
+ static_assert(EPOLLHUP == POLLHUP, "EPOLLHUP != POLLHUP");
+ #endif
+@@ -127,7 +135,15 @@ void EpollPoller::fillActiveChannels(int numEvents,
+         assert(it != channels_.end());
+         assert(it->second == channel);
+ #endif
+-        channel->setRevents(events_[i].events);
++        int revents = events_[i].events;
++#if defined(__linux__) && (defined(__sparc__) || defined(__sparc))
++        if (revents & EPOLLRDHUP)
++        {
++            revents &= ~EPOLLRDHUP;
++            revents |= POLLRDHUP;
++        }
++#endif
++        channel->setRevents(revents);
+         activeChannels->push_back(channel);
+     }
+     // LOG_TRACE<<"active Channels num:"<<activeChannels->size();
+@@ -205,6 +221,13 @@ void EpollPoller::update(int operation, Channel *channel)
+     struct epoll_event event;
+     memset(&event, 0, sizeof(event));
+     event.events = channel->events();
++#if defined(__linux__) && (defined(__sparc__) || defined(__sparc))
++    if (event.events & TRANTOR_RDHUP)
++    {
++        event.events &= ~TRANTOR_RDHUP;
++        event.events |= EPOLLRDHUP;
++    }
++#endif
+     event.data.ptr = channel;
+     int fd = channel->fd();
+     if (::epoll_ctl(epollfd_, operation, fd, &event) < 0)
+-- 
+2.43.0
+
diff --git a/package/drogon/Config.in b/package/drogon/Config.in
new file mode 100644
index 0000000000..ce8a8313bd
--- /dev/null
+++ b/package/drogon/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_DROGON
+	bool "drogon"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZLIB
+	help
+	  Drogon is a C++17/20 based HTTP application framework.
+	  Drogon can be used to easily build various types of web
+	  application server programs using C++.
+
+	  https://github.com/drogonframework/drogon
+
+if BR2_PACKAGE_DROGON
+
+config BR2_PACKAGE_DROGON_BROTLI
+	bool "build Brotli"
+	select BR2_PACKAGE_BROTLI
+	help
+	  Add support for brotli compression.
+
+config BR2_PACKAGE_DROGON_CTL
+	bool "build drogon_ctl"
+	help
+	  drogon_ctl is a command-line tool used to generate
+	  project skeletons and source code.
+
+config BR2_PACKAGE_DROGON_EXAMPLES
+	bool "build examples"
+
+config BR2_PACKAGE_DROGON_ORM
+	bool "build orm"
+	help
+	  Enable the ORM module for typed database access.
+
+config BR2_PACKAGE_DROGON_YAML_CONFIG
+	bool "build yaml config"
+	select BR2_PACKAGE_YAML_CPP
+	help
+	  Add support for YAML configuration via yaml-cpp.
+
+endif
+
+comment "drogon needs a toolchain w/ C++, threads, gcc >= 11"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/drogon/drogon.hash b/package/drogon/drogon.hash
new file mode 100644
index 0000000000..997fd519e1
--- /dev/null
+++ b/package/drogon/drogon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1d7dc4591b61c34903362209e58a3f92903c76ce6514ffba5ccfaa86a2e3227c  drogon-v1.9.13-git4.tar.gz
+sha256  7e1ed2ca339c384279f1e195e99916eb0145a0d87659969c7e22f8fdd53e11fd  LICENSE
diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
new file mode 100644
index 0000000000..89b1b2720c
--- /dev/null
+++ b/package/drogon/drogon.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# drogon
+#
+################################################################################
+
+DROGON_VERSION = v1.9.13
+DROGON_SITE = https://github.com/drogonframework/drogon
+DROGON_SITE_METHOD = git
+DROGON_GIT_SUBMODULES = YES
+DROGON_LICENSE = MIT
+DROGON_LICENSE_FILES = LICENSE
+DROGON_INSTALL_STAGING = YES
+
+DROGON_DEPENDENCIES = jsoncpp util-linux zlib
+HOST_DROGON_DEPENDENCIES = host-jsoncpp host-util-linux host-zlib
+
+DROGON_CONF_OPTS = \
+	-DBUILD_TESTS=OFF
+
+HOST_DROGON_CONF_OPTS = \
+	-DBUILD_CTL=ON \
+	-DBUILD_EXAMPLES=OFF \
+	-DBUILD_TESTS=OFF
+
+ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
+DROGON_DEPENDENCIES += brotli
+DROGON_CONF_OPTS += -DBUILD_BROTLI=ON
+else
+DROGON_CONF_OPTS += -DBUILD_BROTLI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_CTL),y)
+# When we have drogon_ctl for the target, we need to build the
+# _drogon_ctl tool with host-drogon support so that it can be
+# run during the building process
+DROGON_DEPENDENCIES += host-drogon
+DROGON_CONF_OPTS += -DBUILD_CTL=ON
+else
+DROGON_CONF_OPTS += -DBUILD_CTL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_EXAMPLES),y)
+DROGON_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+DROGON_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_ORM),y)
+DROGON_CONF_OPTS += -DBUILD_ORM=ON
+else
+DROGON_CONF_OPTS += -DBUILD_ORM=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_YAML_CONFIG),y)
+DROGON_DEPENDENCIES += yaml-cpp
+DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=ON
+else
+DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=OFF
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))

--===============1244691236026230567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1244691236026230567==--
