Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873D24017B;
	Sun,  9 Jan 2022 22:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8ZaxlzGsy3x; Sun,  9 Jan 2022 22:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B94401CF;
	Sun,  9 Jan 2022 22:17:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3680D1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B46860B12
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 268TsLJ_S6_Z for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:17:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BFA160ACB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:17:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso4188181wmf.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HvwF1JEsBvgYWEJ/xJhdRblmLRA2MI0pkga7sh7uSck=;
 b=WHTI7PXeqw1ln62L0RpaEltlrw14Kep/t1sH1DVQAt3514ozjKzlE9PDfHA56Rz/AB
 zvnuqb91zrMDrM958Ff76GCN8aPq2UBtZazavYz9VQs3N/bkWmPACZJ+MwzFibAj7XDW
 P8UT6h/WCdWHmVG+yRu3O99UdNzNcRbzqbsN2yfMIos8TxW0X7YVXfylcTCs7ZT4/yq3
 Bq8fuIp1JQj65uRSvyY7c3dJD65m+jmMilTml2JBaPG7ECWN7kgBVtLT6V48LR4bHc/8
 22TbhhmWdWjNf/5kab+Ufltqd7uAYSuhaSryMAWUb/dtHqNqt8Ek3ee3EHYz+i4u76+U
 dbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HvwF1JEsBvgYWEJ/xJhdRblmLRA2MI0pkga7sh7uSck=;
 b=wFVqVKZ5yOev3SCSssrrtuEPr2XfBnQOqwKFv6tgD8zWzZm7pFScgIH62d0w5oSHXp
 X7dn6fY3k1puh5ePRGZzJzU8M4CbKxmsudJ5yDUtFgeNSlTym/RVLCfNNZFgU9yLKf6V
 IJ2y0UfqUVfo8HeQzHheyQr+qLpTQCPY10svKwM+keTJPKOc1lptIOa+KSZS3WgFMCJZ
 Jmw84p42Z7n32PqhZg5eZ9SnAx3Z2TbU/FIMiBVCoUidvNfOG2oR7vqUhFrLEEbto0Xa
 5N0hUz/9mAAeus3bUHJ1Te0Zb8hWb3B7F8psaS9pirA7BO/lGVo/lqh+vJ522klAo7F7
 5cUQ==
X-Gm-Message-State: AOAM533KT+D6ObK710CszuUTB54XetMTP6xMOnoHLqn6X2tifLbhE7x1
 mad0IhvJre2qkD+AYti/YLxnxPqRw1g=
X-Google-Smtp-Source: ABdhPJz+1fu4zFphNRSmFdK8pJtcro6ILZndNTx1EO7IROH068Bse+kQJxpbLtq97i7mnTlPNHDz1Q==
X-Received: by 2002:a05:600c:1c18:: with SMTP id
 j24mr19818269wms.189.1641766618325; 
 Sun, 09 Jan 2022 14:16:58 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id 1sm5395468wrb.13.2022.01.09.14.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:16:57 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:16:47 +0100
Message-Id: <20220109221650.777610-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/4] package/dbus-broker: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dbus-broker is an alternate implementation of a dbus dameon. It can be
used as a drop-in replacement for the system bus daemon, as well as the
session bus daemon.

dbus-broker is (basically, and as far as we're concerned in Buildroot)
split in two components:

  - the actual message bus daemon, that relays messages across clients

  - a launcher, which is responsible for setting various aspects of the
    bus, like setting the policy et al. and opening the socket(s) the
    message bus daemon will have to listen on...

The launcher can only be used in a systemd setup (it makes heavy use of
systemd facilities), while the message bus is generic. However, the
message bus daemon is useless without a launcher. There does not exist a
non-systemd launcher, which makes dbus-broker actually a systemd-only
package; this can be revisited when/if a non-systemd launcher appears.

Note, however, that libdbus is not provided by dbus-borker. People who
want to use dbus-broker as the bus daemon, and need libdbus, will have
to enable both, see below.

There are two cases:

 1. original dbus disabled

    Here, we install the config files and systemd socket activation
    units; dbus-broker provides the system and sessions bus daemons.

    In this case, libdbus is not available.

 2. original dbus enabled

    In this case, we do not install the config files and systemd socket
    activation units, or define a user: they all are provided by the
    original dbus, and we piggy-back on those.

    In this situation, the default system and sessions message bus are
    the original dbus, and libdbus is available; dbus-broker is not
    enabled.

    So far, we believe it would be over-engineered to provide a way
    to allow choosing the bus daemon in the configuraiton. However,
    users may opt-in to use dbus-broker in a few ways:
      - at build-time: by calling systemctl enable/disable from a
        post-build script (preferred), or by providing drop-in units
        or presets in an overlay (less preferred) or custom skeleton
        (as a last resort),
      - at runtime (on a RW filesystem): by calling systemctl
        enable/disable

Note about the user: the path to the system bus socket is a so-called
"well-known location": it is expected to be there, by spec. Moving it
elsewhere is going to break existing programs. So, the user running the
system bus daemon must be able to create that socket.

As we may have two packages providing a system bus daemon, they have to
be both able to create the socket, and thus must both be able to write
in the directory containing the socket. And since they can be switched
at runtime, they must be running as the same user.

We can't just reference the original dbus user, so we duplicate the
entry. What is important, is that the user be named 'dbus', as that's
what we use in both cases.

Finally, the licensing terms are pretty trivial for dbus-broker itself,
but it makes use of third-party code that it inherits as git submodules
(that are bundled in the release archive). Thus the licensing is a bit
convoluted... The third-party codes claim to be licensed as "Apache-2.0
and LGP-2.1+" in their AUTHORS files, but at the same time claim
"**Apache-2.0** OR **LGPL-2.1-or-later**" in their README files. The
individual source files (that are used) do not seem to have any
licensing header to clarify the situation. So we represent the situation
with "Apache-2.0 and/or LGPL-2.1+".

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998@free.fr:
  - don't select systemd; depend on it instead
  - only install config files and systemd units without original dbus
  - install a user to run the message bus as
  - fix licensing info
  - entirely reword and extend the commit log
  - add myself to DEVELOPERS as well
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v5 -> v6  (Norbert, respinning after Yann):
  - bump version to v29
  - Linux 4.17 is now a hard requirement, drop passing option
  - sync dbus_broker user to dbus package ( home = /run/dbus )

Changes v4 -> v5  (Yann, after review by Norbert):
  - define the user to run as directly in system.conf
  - as a consequence, drop the unit drop-in
  - add myself to DEVELOPERS as well

Changes v3 -> v4  (Yann, respining after review by Norbert):
  - drop the non-systemd case
  - drop the launcher option
  - reinstate BR2_COREUTILS_HOST_DEPENDENCY and ln --relative
  - reinstate the user, explain it

Changes v2 -> v3  (Norbert, respinning after Yann):
  - add an own config entry for dbus-broker-launch
    enabled by default if systemd init is used
  - undo BR2_COREUTILS_HOST_DEPENDENCY
  - undo adding dbus user - never used by this package
  - add condtional audit dependency
  - cleanup conditional logic a bit

Changes v1 -> v2 (Yann):
  - make launcher conditional
  - don't select systemd; don't depend on it either
  - don't install systemd units without systemd
  - only install config files and systemd units wihtout original dbus
  - rename hooks with meaningful names
  - fix licensing info
  - entirely reword and extend the commit log
---
 DEVELOPERS                           |   2 +
 package/Config.in                    |   1 +
 package/dbus-broker/Config.in        |  23 +++++
 package/dbus-broker/dbus-broker.hash |   3 +
 package/dbus-broker/dbus-broker.mk   |  71 ++++++++++++++++
 package/dbus-broker/dbus.socket      |   5 ++
 package/dbus-broker/session.conf     |  65 ++++++++++++++
 package/dbus-broker/system.conf      | 123 +++++++++++++++++++++++++++
 8 files changed, 293 insertions(+)
 create mode 100644 package/dbus-broker/Config.in
 create mode 100644 package/dbus-broker/dbus-broker.hash
 create mode 100644 package/dbus-broker/dbus-broker.mk
 create mode 100644 package/dbus-broker/dbus.socket
 create mode 100644 package/dbus-broker/session.conf
 create mode 100644 package/dbus-broker/system.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index ed65c74319..02ba98e410 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2111,6 +2111,7 @@ F:	package/tpm-tools/
 F:	package/trousers/
 
 N:	Norbert Lange <nolange79@gmail.com>
+F:	package/dbus-broker/
 F:	package/systemd/
 F:	package/tcf-agent/
 
@@ -2914,6 +2915,7 @@ F:	package/asterisk/
 F:	package/cegui/
 F:	package/dahdi-linux/
 F:	package/dahdi-tools/
+F:	package/dbus-broker/
 F:	package/dtc/
 F:	package/dtv-scan-tables/
 F:	package/dvb-apps/
diff --git a/package/Config.in b/package/Config.in
index 5e01187b83..ebc64a25f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -459,6 +459,7 @@ endmenu
 	source "package/dahdi-tools/Config.in"
 	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
+	source "package/dbus-broker/Config.in"
 	source "package/dbus-cpp/Config.in"
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
new file mode 100644
index 0000000000..c7206232da
--- /dev/null
+++ b/package/dbus-broker/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_DBUS_BROKER
+	bool "dbus-broker"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_EXPAT
+	help
+	  Linux D-Bus Message Broker.
+
+	  The dbus-broker project is an implementation of a message bus
+	  as defined by the D-Bus specification. Its aim is to provide
+	  high performance and reliability, while keeping compatibility
+	  to the D-Bus reference implementation.
+
+	  It is exclusively written for Linux systems, and makes use of
+	  many modern features provided by recent linux kernel releases.
+
+	  https://github.com/bus1/dbus-broker/wiki
+
+comment "dbusbroker needs systemd and a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_SYSTEMD
diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
new file mode 100644
index 0000000000..26ebab7ac1
--- /dev/null
+++ b/package/dbus-broker/dbus-broker.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a  dbus-broker-29.tar.xz
+sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
new file mode 100644
index 0000000000..547b79eb84
--- /dev/null
+++ b/package/dbus-broker/dbus-broker.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# dbus-broker
+#
+################################################################################
+
+DBUS_BROKER_VERSION = 29
+DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
+DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
+
+# For the third-party code, the licensing legla-info is inconsistent between
+# the AUTHORS and README, so keep both
+DBUS_BROKER_LICENSE = \
+	Apache-2.0, \
+	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
+DBUS_BROKER_LICENSE_FILES = \
+	LICENSE \
+	subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
+	subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
+	subprojects/c-list/AUTHORS subprojects/c-list/README.md \
+	subprojects/c-rbtree/AUTHORS subprojects/c-rbtree/README.md \
+	subprojects/c-shquote/AUTHORS subprojects/c-shquote/README.md \
+	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
+	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
+
+DBUS_BROKER_DEPENDENCIES = expat systemd
+DBUS_BROKER_CONF_OPTS = -Dlauncher=true
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+DBUS_BROKER_DEPENDENCIES += audit
+DBUS_BROKER_CONF_OPTS += -Daudit=true
+else
+DBUS_BROKER_CONF_OPTS += -Daudit=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+DBUS_BROKER_DEPENDENCIES += libselinux
+DBUS_BROKER_CONF_OPTS += -Dselinux=true
+else
+DBUS_BROKER_CONF_OPTS += -Dselinux=false
+endif
+
+# We must be using the same user as the original dbus, so we can share
+# the home directory and create a socket there. As a consequence, the
+# username and groupname must be dbus:dbus, and they both need to have
+# the same home.
+define DBUS_BROKER_USERS
+	dbus -1 dbus -1 * /run/dbus - dbus DBus messagebus user
+endef
+
+# Only install units for system bus daemon socket if original dbus is not present
+# Only install config and service files if original dbus is not present
+#
+# Note: BR2_COREUTILS_HOST_DEPENDENCY to be able to use ln --relative
+ifeq ($(BR2_PACKAGE_DBUS),)
+DBUS_BROKER_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)
+
+define DBUS_BROKER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/session.conf \
+		$(TARGET_DIR)/usr/share/dbus-1/session.conf
+	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/system.conf \
+		$(TARGET_DIR)/usr/share/dbus-1/system.conf
+	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
+	$(HOST_MAKE_ENV) ln -sf --relative \
+		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
+endef
+endif # !BR2_PACKAGE_DBUS
+
+$(eval $(meson-package))
diff --git a/package/dbus-broker/dbus.socket b/package/dbus-broker/dbus.socket
new file mode 100644
index 0000000000..5c373cf450
--- /dev/null
+++ b/package/dbus-broker/dbus.socket
@@ -0,0 +1,5 @@
+[Unit]
+Description=D-Bus System Message Bus Socket
+
+[Socket]
+ListenStream=/run/dbus/system_bus_socket
diff --git a/package/dbus-broker/session.conf b/package/dbus-broker/session.conf
new file mode 100644
index 0000000000..e4758fa218
--- /dev/null
+++ b/package/dbus-broker/session.conf
@@ -0,0 +1,65 @@
+<!-- This configuration file controls the per-user-login-session message bus.
+     Add a session-local.conf and edit that rather than changing this
+     file directly. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+  <!-- Our well-known bus type, don't change this -->
+  <type>session</type>
+
+  <!-- If we fork, keep the user's original umask to avoid affecting
+       the behavior of child processes. -->
+  <keep_umask/>
+
+  <standard_session_servicedirs />
+
+  <policy context="default">
+    <!-- Allow everything to be sent -->
+    <allow send_destination="*" eavesdrop="true"/>
+    <!-- Allow everything to be received -->
+    <allow eavesdrop="true"/>
+    <!-- Allow anyone to own anything -->
+    <allow own="*"/>
+  </policy>
+
+  <!-- Config files are placed here that among other things,
+       further restrict the above policy for specific services. -->
+  <includedir>session.d</includedir>
+
+  <includedir>/etc/dbus-1/session.d</includedir>
+
+  <!-- This is included last so local configuration can override what's
+       in this standard file -->
+  <include ignore_missing="yes">/etc/dbus-1/session-local.conf</include>
+
+  <include if_selinux_enabled="yes" selinux_root_relative="yes">contexts/dbus_contexts</include>
+
+  <!-- For the session bus, override the default relatively-low limits
+       with essentially infinite limits, since the bus is just running
+       as the user anyway, using up bus resources is not something we need
+       to worry about. In some cases, we do set the limits lower than
+       "all available memory" if exceeding the limit is almost certainly a bug,
+       having the bus enforce a limit is nicer than a huge memory leak. But the
+       intent is that these limits should never be hit. -->
+
+  <!-- the memory limits are 1G instead of say 4G because they can't exceed 32-bit signed int max -->
+  <limit name="max_incoming_bytes">1000000000</limit>
+  <limit name="max_incoming_unix_fds">250000000</limit>
+  <limit name="max_outgoing_bytes">1000000000</limit>
+  <limit name="max_outgoing_unix_fds">250000000</limit>
+  <limit name="max_message_size">1000000000</limit>
+  <!-- We do not override max_message_unix_fds here since the in-kernel
+       limit is also relatively low -->
+  <limit name="service_start_timeout">120000</limit>
+  <limit name="auth_timeout">240000</limit>
+  <limit name="pending_fd_timeout">150000</limit>
+  <limit name="max_completed_connections">100000</limit>
+  <limit name="max_incomplete_connections">10000</limit>
+  <limit name="max_connections_per_user">100000</limit>
+  <limit name="max_pending_service_starts">10000</limit>
+  <limit name="max_names_per_connection">50000</limit>
+  <limit name="max_match_rules_per_connection">50000</limit>
+  <limit name="max_replies_per_connection">50000</limit>
+
+</busconfig>
diff --git a/package/dbus-broker/system.conf b/package/dbus-broker/system.conf
new file mode 100644
index 0000000000..4b17fbd90e
--- /dev/null
+++ b/package/dbus-broker/system.conf
@@ -0,0 +1,123 @@
+<!-- This configuration file controls the systemwide message bus.
+     Add a system-local.conf and edit that rather than changing this
+     file directly. -->
+
+<!-- Note that there are any number of ways you can hose yourself
+     security-wise by screwing up this file; in particular, you
+     probably don't want to listen on any more addresses, add any more
+     auth mechanisms, run as a different user, etc. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- Our well-known bus type, do not change this -->
+  <type>system</type>
+
+  <!-- Fork into daemon mode -->
+  <fork/>
+
+  <!-- Run as special user -->
+  <user>dbus</user>
+
+  <!-- We use system service launching using a helper -->
+  <standard_system_servicedirs/>
+
+  <!-- Enable logging to syslog -->
+  <syslog/>
+
+  <policy context="default">
+    <!-- All users can connect to system bus -->
+    <allow user="*"/>
+
+    <!-- Holes must be punched in service configuration files for
+         name ownership and sending method calls -->
+    <deny own="*"/>
+    <deny send_type="method_call"/>
+
+    <!-- Signals and reply messages (method returns, errors) are allowed
+         by default -->
+    <allow send_type="signal"/>
+    <allow send_requested_reply="true" send_type="method_return"/>
+    <allow send_requested_reply="true" send_type="error"/>
+
+    <!-- All messages may be received by default -->
+    <allow receive_type="method_call"/>
+    <allow receive_type="method_return"/>
+    <allow receive_type="error"/>
+    <allow receive_type="signal"/>
+
+    <!-- Allow anyone to talk to the message bus -->
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus" />
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Introspectable"/>
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Properties"/>
+    <!-- But disallow some specific bus services -->
+    <deny send_destination="org.freedesktop.DBus"
+          send_interface="org.freedesktop.DBus"
+          send_member="UpdateActivationEnvironment"/>
+    <deny send_destination="org.freedesktop.DBus"
+          send_interface="org.freedesktop.DBus.Debug.Stats"/>
+    <deny send_destination="org.freedesktop.DBus"
+          send_interface="org.freedesktop.systemd1.Activator"/>
+  </policy>
+
+  <!-- Only systemd, which runs as root, may report activation failures. -->
+  <policy user="root">
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.systemd1.Activator"/>
+  </policy>
+
+  <!-- root may monitor the system bus. -->
+  <policy user="root">
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Monitoring"/>
+  </policy>
+
+  <!-- If the Stats interface was enabled at compile-time, root may use it.
+       Copy this into system.local.conf or system.d/*.conf if you want to
+       enable other privileged users to view statistics and debug info -->
+  <policy user="root">
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Debug.Stats"/>
+  </policy>
+
+
+  <!-- The defaults for these limits are hard-coded in dbus-daemon.
+       Some clarifications:
+       Times are in milliseconds (ms); 1000ms = 1 second
+       133169152 bytes = 127 MiB
+       33554432 bytes = 32 MiB
+       150000ms = 2.5 minutes -->
+  <!-- <limit name="max_incoming_bytes">133169152</limit> -->
+  <!-- <limit name="max_incoming_unix_fds">64</limit> -->
+  <!-- <limit name="max_outgoing_bytes">133169152</limit> -->
+  <!-- <limit name="max_outgoing_unix_fds">64</limit> -->
+  <!-- <limit name="max_message_size">33554432</limit> -->
+  <!-- <limit name="max_message_unix_fds">16</limit> -->
+  <!-- <limit name="service_start_timeout">25000</limit> -->
+  <!-- <limit name="auth_timeout">5000</limit> -->
+  <!-- <limit name="pending_fd_timeout">150000</limit> -->
+  <!-- <limit name="max_completed_connections">2048</limit> -->
+  <!-- <limit name="max_incomplete_connections">64</limit> -->
+  <!-- <limit name="max_connections_per_user">256</limit> -->
+  <!-- <limit name="max_pending_service_starts">512</limit> -->
+  <!-- <limit name="max_names_per_connection">512</limit> -->
+  <!-- <limit name="max_match_rules_per_connection">512</limit> -->
+  <!-- <limit name="max_replies_per_connection">128</limit> -->
+
+  <!-- Config files are placed here that among other things, punch
+       holes in the above policy for specific services. -->
+  <includedir>system.d</includedir>
+
+  <includedir>/etc/dbus-1/system.d</includedir>
+
+  <!-- This is included last so local configuration can override what's
+       in this standard file -->
+  <include ignore_missing="yes">/etc/dbus-1/system-local.conf</include>
+
+  <include if_selinux_enabled="yes" selinux_root_relative="yes">contexts/dbus_contexts</include>
+
+</busconfig>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
