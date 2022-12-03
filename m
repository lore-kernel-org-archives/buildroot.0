Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBE8C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 713328151E;
	Sat,  3 Dec 2022 14:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 713328151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GopxjjrQfHU3; Sat,  3 Dec 2022 14:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7073681521;
	Sat,  3 Dec 2022 14:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7073681521
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65F941BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E56A40102
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E56A40102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqDr0ki1BojV for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:42:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23618400E2
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23618400E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FCA9845A3; Sat,  3 Dec 2022 14:42:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 15:41:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43d5ff7ee4c5f012d79ba69ae6c736e3a88d20c7
X-Git-Newrev: 89815bad0a531d01ee2733dd9c17576a7647e1d9
X-Patchwork-Hint: ignore
Message-Id: <20221203144222.0FCA9845A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rabbitmq-server: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=89815bad0a531d01ee2733dd9c17576a7647e1d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The packaged version has a number of security issues, newer versions require
erlang 23+ and nobody has stepped up to maintain it since the issues were
reported:

http://lists.busybox.net/pipermail/buildroot/2022-November/656230.html

So drop the package and add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                |  7 +++
 DEVELOPERS                                      |  1 -
 package/Config.in                               |  1 -
 package/rabbitmq-server/Config.in               | 14 -----
 package/rabbitmq-server/S50rabbitmq-server      | 30 -----------
 package/rabbitmq-server/rabbitmq-server.hash    | 25 ---------
 package/rabbitmq-server/rabbitmq-server.mk      | 69 -------------------------
 package/rabbitmq-server/rabbitmq-server.service | 16 ------
 8 files changed, 7 insertions(+), 156 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b3c35d6b07..49f63fd14c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_RABBITMQ_SERVER
+	bool "rabbitmq-server removed"
+	select BR2_LEGACY
+	help
+	  Package was removed because it was unmaintained and had
+	  known security issues.
+
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
 	bool "libopenssl rc5 was never enabled"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index bfebf8163c..8bcce1fd37 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1074,7 +1074,6 @@ F:	package/libdmtx/
 F:	package/libsodium/
 F:	package/php-amqp/
 F:	package/python-cherrypy/
-F:	package/rabbitmq-server/
 F:	package/sane-backends/
 F:	package/ucl/
 F:	package/upx/
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..682faf3697 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2394,7 +2394,6 @@ endif
 	source "package/pure-ftpd/Config.in"
 	source "package/putty/Config.in"
 	source "package/quagga/Config.in"
-	source "package/rabbitmq-server/Config.in"
 	source "package/radvd/Config.in"
 	source "package/reaver/Config.in"
 	source "package/redir/Config.in"
diff --git a/package/rabbitmq-server/Config.in b/package/rabbitmq-server/Config.in
deleted file mode 100644
index b3b7639e28..0000000000
--- a/package/rabbitmq-server/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_RABBITMQ_SERVER
-	bool "rabbitmq-server"
-	depends on BR2_PACKAGE_ERLANG
-	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_OPENSSL # Required to build Erlang's crypto and ssl
-	                           # applications
-	help
-	  High-performance AMQP-compliant message broker written in
-	  Erlang.
-
-	  http://www.rabbitmq.com
-
-comment "rabbitmq-server needs erlang"
-	depends on !BR2_PACKAGE_ERLANG
diff --git a/package/rabbitmq-server/S50rabbitmq-server b/package/rabbitmq-server/S50rabbitmq-server
deleted file mode 100644
index 35f7844860..0000000000
--- a/package/rabbitmq-server/S50rabbitmq-server
+++ /dev/null
@@ -1,30 +0,0 @@
-#!/bin/sh
-#
-# Start/stop rabbitmq-server
-#
-
-INSTALLUSER=rabbitmq
-RUNDIR=/var/run/rabbitmq
-LOGDIR=/var/log/rabbitmq
-
-case "$1" in
-  start)
-	install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR" || exit 1
-	install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$LOGDIR" || exit 1
-        printf "Starting rabbitmq-server: "
-        su -c "/usr/sbin/rabbitmq-server -detached" - "$INSTALLUSER" 2>/dev/null
-        [ $? = 0 ] && echo "OK" || echo "FAIL"
-	;;
-  stop)
-        printf "Stopping rabbitmq-server: "
-        su -c "/usr/sbin/rabbitmqctl stop" - "$INSTALLUSER"
-        [ $? = 0 ] && echo "OK" || echo "FAIL"
-	;;
-  restart|reload)
-        "$0" stop || true
-        "$0" start
-	;;
-  *)
-        echo "Usage: $0 {start|stop|restart}"
-        exit 1
-esac
diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
deleted file mode 100644
index 693ab208ec..0000000000
--- a/package/rabbitmq-server/rabbitmq-server.hash
+++ /dev/null
@@ -1,25 +0,0 @@
-# Locally computed
-sha256  8c6729b985cb21bab13363b1c806cfa15845b046be9e641ab1496bd5a1eaf19d  rabbitmq-server-3.8.2.tar.xz
-sha256  a96b7ed2e7def9c86d84d9ca0e79e4a55fc8e6e202ac89caa4f9791ccb9cf2a3  LICENSE
-sha256  acd82bfce369b066e7e612197206da4fa38b8614486658775d0b6f66ac30114a  LICENSE-APACHE2
-sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE-APACHE2-excanvas
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE-APACHE2-ExplorerCanvas
-sha256  b04c8850fdf64d17233f0acbe4eb632f03bd663094233c949bdbe788858bb841  LICENSE-APL2-Stomp-Websocket
-sha256  3c69f8327beaaa45d2f3d7831edf211d0f37d1d9c7754267478320697e1882e9  LICENSE-BSD-base64js
-sha256  af7b5cdf5e16446c64d6e755b2a6386e38c56500ae27587edcd94c96d330ee35  LICENSE-BSD-recon
-sha256  7615ea96ccddc822655cb48a9d2a5cac2f176fca7fe28131af934ce21f48cbc8  LICENSE-erlcloud
-sha256  c69d6e3fc8c51730a706aba5dcd5df978cb0c7b20c7bfe788e063cbc7fc1b234  LICENSE-httpc_aws
-sha256  c0e940d13f488849c27963e7d87f3fc27a2f5843cfd49148029a558251014689  LICENSE-ISC-cowboy
-sha256  af399cded8f343407fb68eeb51755676e9700c65c380f073376afd8d20f428a1  LICENSE-MIT-EJS
-sha256  b2614726fe57ee8267324ecfdebe6e578e5aaa5a77a7f84b9d26463c058147d1  LICENSE-MIT-EJS10
-sha256  0f26e121a7a1dab675bd8474cdc517428863036a668260033467c7278f488cd4  LICENSE-MIT-Erlware-Commons
-sha256  52cb566b16d84314b92b91361ed072eaaf166e8d3dfa3d0fd3577613925f205c  LICENSE-MIT-Flot
-sha256  8cb9a8ff8cafd6a085fd4f086e797b719c334a621df19354dc286591003da3f5  LICENSE-MIT-jQuery
-sha256  44f25d51c90aa55dd4b3ba7f3d6e9a594073fcbefe651e16e74cabd48005b476  LICENSE-MIT-jQuery164
-sha256  fc93cc7361401413887f4c1349e4b0be4bcef936eaafbcc7485038abe197c692  LICENSE-MIT-Mochi
-sha256  b80081a5bb527dbe6b79f18a40f44b4ba6303e4856cadd249672c97b90e6dd7c  LICENSE-MIT-Sammy
-sha256  cfc50fa0d7ee02c2d71c8866ef211a4814e8c89c50b725d27e8bdf550291a9ed  LICENSE-MIT-Sammy060
-sha256  c008551400c9629d5f35a4f4fb6a671cf574d41cb365ae57e3d90341e51b3bdd  LICENSE-MPL
-sha256  c008551400c9629d5f35a4f4fb6a671cf574d41cb365ae57e3d90341e51b3bdd  LICENSE-MPL-RabbitMQ
-sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSE-MPL2
-sha256  c69d6e3fc8c51730a706aba5dcd5df978cb0c7b20c7bfe788e063cbc7fc1b234  LICENSE-rabbitmq_aws
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
deleted file mode 100644
index 969e61e2b5..0000000000
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ /dev/null
@@ -1,69 +0,0 @@
-################################################################################
-#
-# rabbitmq-server
-#
-################################################################################
-
-RABBITMQ_SERVER_VERSION = 3.8.2
-RABBITMQ_SERVER_SITE = https://github.com/rabbitmq/rabbitmq-server/releases/download/v$(RABBITMQ_SERVER_VERSION)
-RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
-RABBITMQ_SERVER_LICENSE = MPL-1.1, Apache-2.0, BSD-3-Clause, BSD-2-Clause, MIT, MPL-2.0, ISC
-RABBITMQ_SERVER_LICENSE_FILES = \
-	LICENSE \
-	LICENSE-APACHE2 \
-	LICENSE-APACHE2-excanvas \
-	LICENSE-APACHE2-ExplorerCanvas \
-	LICENSE-APL2-Stomp-Websocket \
-	LICENSE-BSD-base64js \
-	LICENSE-BSD-recon \
-	LICENSE-erlcloud \
-	LICENSE-httpc_aws \
-	LICENSE-ISC-cowboy \
-	LICENSE-MIT-EJS \
-	LICENSE-MIT-EJS10 \
-	LICENSE-MIT-Erlware-Commons \
-	LICENSE-MIT-Flot \
-	LICENSE-MIT-jQuery \
-	LICENSE-MIT-jQuery164 \
-	LICENSE-MIT-Mochi \
-	LICENSE-MIT-Sammy \
-	LICENSE-MIT-Sammy060 \
-	LICENSE-MPL \
-	LICENSE-MPL-RabbitMQ \
-	LICENSE-MPL2 \
-	LICENSE-rabbitmq_aws
-RABBITMQ_SERVER_CPE_ID_VENDOR = vmware
-RABBITMQ_SERVER_CPE_ID_PRODUCT = rabbitmq
-RABBITMQ_SERVER_SELINUX_MODULES = rabbitmq
-
-RABBITMQ_SERVER_DEPENDENCIES = host-elixir host-libxslt host-zip erlang libxslt
-RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
-
-define RABBITMQ_SERVER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define RABBITMQ_SERVER_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
-
-	for bin in $(RABBITMQ_SERVER_TARGET_BINS); do \
-		ln -sf ../lib/erlang/lib/rabbitmq_server-$(RABBITMQ_SERVER_VERSION)/sbin/$$bin \
-			$(TARGET_DIR)/usr/sbin/$$bin; \
-	done
-endef
-
-define RABBITMQ_SERVER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/rabbitmq-server/rabbitmq-server.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/rabbitmq-server.service
-endef
-
-define RABBITMQ_SERVER_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/rabbitmq-server/S50rabbitmq-server \
-		$(TARGET_DIR)/etc/init.d/S50rabbitmq-server
-endef
-
-define RABBITMQ_SERVER_USERS
-	rabbitmq -1 rabbitmq -1 * /var/lib/rabbitmq /bin/sh - rabbitmq-server daemon
-endef
-
-$(eval $(generic-package))
diff --git a/package/rabbitmq-server/rabbitmq-server.service b/package/rabbitmq-server/rabbitmq-server.service
deleted file mode 100644
index f69b33d455..0000000000
--- a/package/rabbitmq-server/rabbitmq-server.service
+++ /dev/null
@@ -1,16 +0,0 @@
-[Unit]
-Description=RabbitMQ Messaging Server
-After=syslog.target network.target
-
-[Service]
-Type=simple
-User=rabbitmq
-Group=rabbitmq
-Environment=HOME=/var/lib/rabbitmq
-WorkingDirectory=/var/lib/rabbitmq
-LogsDirectory=/var/log/rabbitmq
-ExecStart=/usr/sbin/rabbitmq-server
-ExecStop=/usr/sbin/rabbitmqctl stop
-
-[Install]
-WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
