Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64724C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B620160B4E;
	Sat,  6 Jan 2024 14:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B620160B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLb-UFA8-vC4; Sat,  6 Jan 2024 14:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF3DC60BAE;
	Sat,  6 Jan 2024 14:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF3DC60BAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 268FA1BF861
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D87E60B4E
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D87E60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPlMQEo2Aus0 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33CC560B48
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33CC560B48
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23681846CF; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 14:43:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24f73b85f887122df8343346a106be144e6d814a
X-Git-Newrev: b37249581fa4a221923540478db7fa720e04035d
X-Patchwork-Hint: ignore
Message-Id: <20240106141132.23681846CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trace-cmd: bump to 3.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b37249581fa4a221923540478db7fa720e04035d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

trace-cmd's dependencies 'libtracefs' and 'libtraceevent' were split
into dedicated projects, maintained outside of trace-cmd.

This release, on top of bumping the version, adds this new dependencies.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: bump to version 3.1.7]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr: alphabetical order in dependencies]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/trace-cmd/Config.in      | 2 ++
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 6 ++++--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 2d0accd7ae..00b9ebbd9a 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_TRACE_CMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_LIBTRACEEVENT
+	select BR2_PACKAGE_LIBTRACEFS
 	help
 	  Command line reader for ftrace.
 
diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 4d39e4d5ea..6edcaf0e1c 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a74d9ade2633b88d0ad199360d51996427e23f4835594133e456cd6e3bd3a651  trace-cmd-v2.9.7.tar.gz
+sha256  e496d41e599f8ef3c9a74675da05f86be0d8d48d524f0182c73ab98cd16da0b0  trace-cmd-v3.1.7.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 52bb99036c..ab8e9149f7 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 2.9.7
+TRACE_CMD_VERSION = 3.1.7
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
-TRACE_CMD_DEPENDENCIES = host-pkgconf
+TRACE_CMD_DEPENDENCIES = host-pkgconf libtraceevent libtracefs
 TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
@@ -34,6 +34,8 @@ ifeq ($(BR2_sparc64),y)
 TRACE_CMD_CFLAGS += -fPIC
 endif
 
+TRACE_CMD_CFLAGS += $($(HOST_DIR)/bin/pkg-config --cflags libtracefs)
+
 # trace-cmd use CPPFLAGS to add some extra flags.
 # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
 # that causes build problems.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
