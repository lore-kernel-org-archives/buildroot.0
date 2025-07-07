Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C259C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E658C60C27;
	Mon,  7 Jul 2025 20:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgAu_EokSN8G; Mon,  7 Jul 2025 20:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF48361544
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF48361544;
	Mon,  7 Jul 2025 20:18:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC45D1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8EDB41917
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5JQ0e61qhoX for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D77417C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06D77417C1
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E901B8616C; Mon,  7 Jul 2025 20:18:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 22:13:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a52269e221bf73ea4b2521e2297ab13bf3c687d0
X-Git-Newrev: 6d23852980d2ce92804de2c4fced38317fba6952
X-Patchwork-Hint: ignore
Message-Id: <20250707201813.E901B8616C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socketcand: bump to version
 0.6.1-103-g6dd5d33
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d23852980d2ce92804de2c4fced38317fba6952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to meson build system.

Remove an upstreamed patch.

The license files are now gathered in the LICENSES folder.

Add support for the libsocketcan library.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien:
 - use "git describe --tags" format in commit title
 - use "git describe --tags --abbrev=40" in _VERSION
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   1 -
 .../socketcand/0001-Fix-GCC10-build-failure.patch  | 113 ---------------------
 package/socketcand/socketcand.hash                 |   5 +-
 package/socketcand/socketcand.mk                   |  17 +++-
 4 files changed, 15 insertions(+), 121 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 06fca7f364..687814076e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1083,7 +1083,6 @@ package/snort/0005-fix-sparc.patch lib_patch.Upstream
 package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch lib_patch.Upstream
 package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch lib_patch.Upstream
 package/snort/0008-Fix-NO-OPTIMIZE.patch lib_patch.Upstream
-package/socketcand/0001-Fix-GCC10-build-failure.patch lib_patch.Upstream
 package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch lib_patch.Upstream
 package/softether/0002-Create-libsoftether.so-and-dynamically-link.patch lib_patch.Upstream
 package/softether/0003-use-fhs-install-directories.patch lib_patch.Upstream
diff --git a/package/socketcand/0001-Fix-GCC10-build-failure.patch b/package/socketcand/0001-Fix-GCC10-build-failure.patch
deleted file mode 100644
index 057cd40657..0000000000
--- a/package/socketcand/0001-Fix-GCC10-build-failure.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From ae0af080058a576d62c72ffc011d644d0b4dcb98 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 7 Jul 2020 19:39:41 +0200
-Subject: [PATCH] Fix GCC10 build failure (#17)
-
-GCC10 breaks on multiple definitions:
-
-ld: /tmp/ccFiGYO7.o:(.bss+0x114): multiple definition of `tv'; /tmp/cc7f6J5h.o:(.bss+0x80): first defined here
-
-Change the scope of the related variables.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-
-[Retrieved from:
-https://github.com/linux-can/socketcand/commit/ae0af080058a576d62c72ffc011d644d0b4dcb98]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- socketcand.c  | 3 ++-
- state_bcm.c   | 4 ++--
- state_isotp.c | 2 +-
- state_raw.c   | 2 +-
- 4 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/socketcand.c b/socketcand.c
-index 8d84754..6125be9 100644
---- a/socketcand.c
-+++ b/socketcand.c
-@@ -102,7 +102,6 @@ socklen_t unaddrlen;
- struct sockaddr_un remote_unaddr;
- socklen_t remote_unaddrlen;
- char* interface_string;
--struct ifreq ifr, ifr_brd;
- 
- int state_changed(char *buf, int current_state)
- {
-@@ -666,6 +665,8 @@ int receive_command(int socket, char *buffer) {
- }
- 
- void determine_adress() {
-+	struct ifreq ifr, ifr_brd;
-+
- 	int probe_socket = socket(AF_INET, SOCK_DGRAM, 0);
- 
- 	if(probe_socket < 0) {
-diff --git a/state_bcm.c b/state_bcm.c
-index cfaa8ed..05a5f7c 100644
---- a/state_bcm.c
-+++ b/state_bcm.c
-@@ -28,8 +28,6 @@
- #define RXLEN 128
- 
- int sc = -1;
--fd_set readfds;
--struct timeval tv;
- 
- void state_bcm() {
- 	int i, j, ret;
-@@ -38,6 +36,7 @@ void state_bcm() {
- 	struct ifreq ifr;
- 	char rxmsg[RXLEN];
- 	char buf[MAXLEN];
-+	fd_set readfds;
- 
- 	struct {
- 		struct bcm_msg_head msg_head;
-@@ -91,6 +90,7 @@ void state_bcm() {
- 	}
- 
- 	if (FD_ISSET(sc, &readfds)) {
-+		struct timeval tv;
- 
- 		ret = recvfrom(sc, &msg, sizeof(msg), 0,
- 			       (struct sockaddr*)&caddr, &caddrlen);
-diff --git a/state_isotp.c b/state_isotp.c
-index 5c671f9..e1b944b 100644
---- a/state_isotp.c
-+++ b/state_isotp.c
-@@ -25,7 +25,6 @@
- #include <linux/sockios.h>
- 
- int si = -1;
--fd_set readfds;
- 
- void state_isotp() {
- 	int i, items, ret;
-@@ -39,6 +38,7 @@ void state_isotp() {
- 	char buf[MAXLEN]; /* inet commands to can */
- 	unsigned char isobuf[ISOTPLEN+1]; /* binary buffer for isotp socket */
- 	unsigned char tmp;
-+	fd_set readfds;
- 	
- 	while(previous_state != STATE_ISOTP) {
- 
-diff --git a/state_raw.c b/state_raw.c
-index e83e6ec..2c49975 100644
---- a/state_raw.c
-+++ b/state_raw.c
-@@ -25,7 +25,6 @@
- int raw_socket;
- struct ifreq ifr;
- struct sockaddr_can addr;
--fd_set readfds;
- struct msghdr msg;
- struct can_frame frame;
- struct iovec iov;
-@@ -36,6 +35,7 @@ struct cmsghdr *cmsg;
- void state_raw() {
- 	char buf[MAXLEN];
- 	int i, ret, items;
-+	fd_set readfds;
- 
- 	if(previous_state != STATE_RAW) {
- 
diff --git a/package/socketcand/socketcand.hash b/package/socketcand/socketcand.hash
index 713939897d..57192ec7dd 100644
--- a/package/socketcand/socketcand.hash
+++ b/package/socketcand/socketcand.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256  3c5cc7af4ff707ac344e62d2e37a74b59aeccd14b88e837cc142c52b69d64a39  socketcand-69e2201222f015a1abe7a58ecf61325012cd91b1.tar.gz
-sha256  18bda0db4e3c56cefdb1b9b01b7eada7764c0746f6321378c30d78f5ee81cfee  socketcand.c
+sha256  f19e600e99e13202a4039158c1d7dce55645271f14028d60e231266337627ecd  socketcand-0.6.1-103-g6dd5d33d4645ab221e8cd265c08607366e21ddf1.tar.gz
+sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
+sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 1755d3ae56..841931f874 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,16 +4,23 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = 69e2201222f015a1abe7a58ecf61325012cd91b1
+SOCKETCAND_VERSION = 0.6.1-103-g6dd5d33d4645ab221e8cd265c08607366e21ddf1
 SOCKETCAND_SITE = $(call github,linux-can,socketcand,$(SOCKETCAND_VERSION))
-SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_LICENSE = BSD-3-Clause or GPL-2.0
-SOCKETCAND_LICENSE_FILES = socketcand.c
+SOCKETCAND_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES += libconfig
+SOCKETCAND_CONF_OPTS += -Dlibconfig=true
 else
-SOCKETCAND_CONF_OPTS += --without-config
+SOCKETCAND_CONF_OPTS += -Dlibconfig=false
 endif
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_LIBSOCKETCAN),y)
+SOCKETCAND_DEPENDENCIES += libsocketcan
+SOCKETCAND_CONF_OPTS += -Dlibsocketcan=true
+else
+SOCKETCAND_CONF_OPTS += -Dlibsocketcan=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
