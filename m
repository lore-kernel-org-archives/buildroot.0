Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23F606BA26
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bhPj6AKD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31BF8408A8;
	Wed,  4 Nov 2026 20:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIrKzEAjRlm4; Wed,  4 Nov 2026 20:52:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0E595408A9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793825561;
	b=ffc9JV2ohsr3cZsk0mHCljz35FLQYgORycKK66oBr+BmkPl+0gHJ78TjEAYhGLEaYFVR
	 hHqmbmS/5QBaX3c1MqaVtHqwbu9LdMLlIZUjDeJGFKR+5LM5n13Y8Pqj6isfCWPGqU7SI
	 m7GLYoLooAbnj9dsNOTqXrWsqFCa0+P3ailoyS9J+He8Uxe1tLj8c5PcMliMhWugm2l3L
	 KYIw5uaF8/E7H3og+gsRYduD80b41m2O3zNVgeOycqO+I5j+LknoGOJqw2QD9tSnFjio3
	 74IiZrdpT287bdHjbY6vFvOKzkBJ0/FOLVcMiQ4PgBQRRKP0WWZYHEqj6+tlNR7D66Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=esLG+Q6YUiZLgo9I/RoiA+ht6Z/F8mXskXRC+5GkF5Q=;
	b=CybDR0b6Ml0Cmt2FqYDll+P7qV7dq00riI5hnh7NOxBpWUl4vgHjAu1MIDoeETxymn6q
	 MfNzOqmOgiTfjRo1H6a3Uu0OOXn2Io2A3R0/2OOaGQ5uMGoXGndqh+C2kcP17zPKItHf3
	 nZJD2W2+rxzxDlDCGiLs0hoGogBJ8p/AVz9iQHz2QXJSliB/X8TLTbZdGFnh1Pj4CxZ2F
	 CWBX8ujIM2aIKTZ7Jo8fOiHrlc1AxsxVwOiDk5/YN2Vrr7JALlgXMB4Od9qelPkoj/U/s
	 0esHjS8VA7+WwYPOr791KmM8YRBTrXNc6oMT2BWy9hj8B1JAu5kNe7JsxsWfUDhOd4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793825561;
	bh=esLG+Q6YUiZLgo9I/RoiA+ht6Z/F8mXskXRC+5GkF5Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bhPj6AKDOcok9OQxmgLv+JWW/rSl0VOqPZvWGhTWE79+sxg58fb9W9KLKNQiKCVxV
	 b2HECbMvmaR42BjvDV5sf5ppNfQPrFZUbpeotoG1Z6ufB426pLQZa+rBwHXFO5TnHh
	 3U0GHNcKox9xPdHiZFoWxwETJGRZ6HK/FwgclFdty1chiITBmJaKa8YUait8HqZWXC
	 439kgzC98QTd8Cw6BtHtjOEhg9HymFaq4GhIopg6a/OQibP/AzhKT5CcRXaqVQAF7q
	 3GER7HTAKtKyCccil54pCA+xNd5k96u3wYq0j+BAoML9eBeLtkmeh1NIIFSQyIgtux
	 Zezq071GrisAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E595408A9;
	Wed,  4 Nov 2026 20:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA9601789
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F11360728
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cg3oaEJyLrIi for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9746C607FA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9746C607FA
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDE3F9DC0C; Wed,  4 Nov 2026 20:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 21:52:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44b6ba3af318f26b29ab80b8414cb9a553d5d619
X-Git-Newrev: 56052e5877d5cc1316bbc5def6fcc4263f8fa7a7
X-Patchwork-Hint: ignore
Message-Id: <20261104205103.BDE3F9DC0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56052e5877d5cc1316bbc5def6fcc4263f8fa7a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

htpdate is in maintenance mode upstream: 2.1.x is its final release
line, which only gets critical bug fixes, and its users and package
maintainers are advised to migrate to its successor, httpdate, that
delegates the network transport to libcurl.

Remove htpdate in favor of httpdate: its legacy option selects httpdate
instead.

https://github.com/twekkel/htpdate

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                |  9 +++++++
 DEVELOPERS                      |  1 -
 package/Config.in               |  1 -
 package/htpdate/Config.in       |  8 -------
 package/htpdate/S43htpdate      | 53 -----------------------------------------
 package/htpdate/htpdate.hash    |  3 ---
 package/htpdate/htpdate.mk      | 38 -----------------------------
 package/htpdate/htpdate.service | 13 ----------
 8 files changed, 9 insertions(+), 117 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..a238369785 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_HTPDATE
+	bool "htpdate has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_HTTPDATE
+	help
+	  htpdate is in maintenance mode upstream, and its users are
+	  advised to migrate to its successor, httpdate, which is
+	  selected instead.
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 00035d933f..8f7552407e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -233,7 +233,6 @@ F:	package/cutekeyboard/
 F:	package/fail2ban/
 F:	package/grep/
 F:	package/gtkiostream/
-F:	package/htpdate/
 F:	package/httpdate/
 F:	package/i2c-tools/
 F:	package/jq/
diff --git a/package/Config.in b/package/Config.in
index 089860e7ec..b79f4dcca1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2508,7 +2508,6 @@ endif
 	source "package/haproxy/Config.in"
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
-	source "package/htpdate/Config.in"
 	source "package/httpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
diff --git a/package/htpdate/Config.in b/package/htpdate/Config.in
deleted file mode 100644
index d2a71fb696..0000000000
--- a/package/htpdate/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_HTPDATE
-	bool "htpdate"
-	depends on BR2_USE_MMU # fork()
-	help
-	  The HTTP Time Protocol (HTP) is used to synchronize a
-	  computer's time with web servers as reference time source.
-
-	  https://github.com/twekkel/htpdate
diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
deleted file mode 100644
index 22e5e6c803..0000000000
--- a/package/htpdate/S43htpdate
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/sh
-
-DAEMON="htpdate"
-PIDFILE="/var/run/$DAEMON.pid"
-
-HTPDATE_ARGS="-a -s -t https://google.com"
-
-# shellcheck source=/dev/null
-test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -x "/usr/sbin/$DAEMON" \
-		-- -D -i "$PIDFILE" $HTPDATE_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
deleted file mode 100644
index 44d73fbe2f..0000000000
--- a/package/htpdate/htpdate.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated:
-sha256  4c771fe3fc5c4ab5f9393dd501bdc51e4c067297cf304ad1e74e1965ac1c066f  htpdate-2.0.1.tar.gz
-sha256  74096c67e102bb6545b84487b5e7f18edd038fd5fc0199c8a0b25efb3c522f06  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
deleted file mode 100644
index 8d4b1e073c..0000000000
--- a/package/htpdate/htpdate.mk
+++ /dev/null
@@ -1,38 +0,0 @@
-################################################################################
-#
-# htpdate
-#
-################################################################################
-
-HTPDATE_VERSION = 2.0.1
-HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
-HTPDATE_LICENSE = GPL-2.0+
-HTPDATE_LICENSE_FILES = LICENSE
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HTPDATE_BUILD_OPTS = \
-	https \
-	SSL_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
-HTPDATE_DEPENDENCIES += openssl host-pkgconf
-endif
-
-define HTPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HTPDATE_BUILD_OPTS)
-endef
-
-define HTPDATE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
-endef
-
-define HTPDATE_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/htpdate/S43htpdate \
-		$(TARGET_DIR)/etc/init.d/S43htpdate
-endef
-
-define HTPDATE_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/htpdate/htpdate.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/htpdate.service
-endef
-
-$(eval $(generic-package))
diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
deleted file mode 100644
index 95220581d4..0000000000
--- a/package/htpdate/htpdate.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=htpdate daemon
-After=network.target
-
-[Service]
-Type=forking
-PIDFile=/run/htpdate.pid
-Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
-EnvironmentFile=-/etc/default/htpdate
-ExecStart=/usr/sbin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
-
-[Install]
-WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
