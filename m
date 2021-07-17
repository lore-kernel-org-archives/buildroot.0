Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D067BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E5E60EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83E5E60EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60A0E41634;
	Tue,  3 Aug 2021 23:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLO4XX7KLfMQ; Tue,  3 Aug 2021 23:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A40241617;
	Tue,  3 Aug 2021 23:35:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2EF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F312040EFB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAic-7KOU47D for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E42240E85
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 627D887F55; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:01:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bdad2d09e33b06cc8a895c3be5f3a2760b2d4bd9
X-Git-Newrev: d2ef0058c94f8eab59ed799aaea8e9ce83e91069
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.627D887F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/systemd: bump to
 version 249
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7788657814101408456=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7788657814101408456==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d2ef0058c94f8eab59ed799aaea8e9ce83e91069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add config option for systemd-sysext.

Add config option for systemd-oomd.

Add new host-python3-jinja2 dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in    | 26 ++++++++++++++++++++++++++
 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 22 ++++++++++++++++++++--
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d658308213..b9b1b3b9b4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -318,6 +318,15 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+config BR2_PACKAGE_SYSTEMD_OOMD
+	bool "enable out-of-memory killer"
+	help
+	  systemd-oomd is a system service that uses cgroups-v2 and
+	  pressure stall information (PSI) to monitor and take action
+	  on processes before an OOM occurs in kernel space.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-oomd.html
+
 config BR2_PACKAGE_SYSTEMD_POLKIT
 	bool "enable polkit support"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # polkit
@@ -424,6 +433,23 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and
 	  manages security labels for sockets.
 
+config BR2_PACKAGE_SYSTEMD_SYSEXT
+	bool "enable sysext support"
+	help
+	  systemd-sysext activates/deactivates system extension
+	  images.
+
+	  System extension images may – dynamically at runtime —
+	  extend the /usr/ and /opt/ directory hierarchies with
+	  additional files.
+
+	  This is particularly useful on immutable system images where
+	  a /usr/ and/or /opt/ hierarchy residing on a read-only file
+	  system shall be extended temporarily at runtime without
+	  making any persistent modifications.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 20cd922259..82741d1996 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,6 @@
 # sha256 locally computed
-sha256  2869986e219a8dfc96cc0dffac66e0c13bb70a89e16b85a3948876c146cfa3e0  systemd-247.3.tar.gz
+sha256  0d9d45140e95f2d0ee79005ccf867f2706976c30391b932a8c3b9b198a801fad  systemd-249.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
-sha256  6f22d19d35b00f35e0444e0bc9139e6d3bdf7277978f89c4e175e37b18c43f3d  README
+sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 74c561e67e..5562703a89 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 247.3
+SYSTEMD_VERSION = 249
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
@@ -14,6 +14,7 @@ SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
+	host-python3-jinja2 \
 	kmod \
 	libcap \
 	util-linux-libs \
@@ -411,6 +412,12 @@ else
 SYSTEMD_CONF_OPTS += -Dpstore=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_OOMD),y)
+SYSTEMD_CONF_OPTS += -Doomd=true
+else
+SYSTEMD_CONF_OPTS += -Doomd=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=true
 SYSTEMD_DEPENDENCIES += polkit
@@ -424,6 +431,12 @@ else
 SYSTEMD_CONF_OPTS += -Dportabled=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSEXT),y)
+SYSTEMD_CONF_OPTS += -Dsysext=true
+else
+SYSTEMD_CONF_OPTS += -Dsysext=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
@@ -543,6 +556,8 @@ endef
 define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 	$(SED) '/^passwd:/ {/systemd/! s/$$/ systemd/}' \
 		-e '/^group:/ {/systemd/! s/$$/ [SUCCESS=merge] systemd/}' \
+		-e '/^shadow:/ {/systemd/! s/$$/ systemd/}' \
+		-e '/^gshadow:/ {/systemd/! s/$$/ systemd/}' \
 		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
 			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
 			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
@@ -663,11 +678,13 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Drepart=false \
 	-Dcoredump=false \
 	-Dpstore=false \
+	-Doomd=false \
 	-Dlogind=false \
 	-Dhostnamed=false \
 	-Dlocaled=false \
 	-Dmachined=false \
 	-Dportabled=false \
+	-Dsysext=false \
 	-Duserdb=false \
 	-Dhomed=false \
 	-Dnetworkd=false \
@@ -717,7 +734,8 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-util-linux \
 	host-patchelf \
 	host-libcap \
-	host-gperf
+	host-gperf \
+	host-python3-jinja2
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 

--===============7788657814101408456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7788657814101408456==--
