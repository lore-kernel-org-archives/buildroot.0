Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875F8C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 12:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3573B40574;
	Mon, 29 Jul 2024 12:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gc0apr8HcCz1; Mon, 29 Jul 2024 12:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE78E40581
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE78E40581;
	Mon, 29 Jul 2024 12:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E87341BF473
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 12:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5ED5404B6
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTTa5CEmC5Rs for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 12:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 076A4404AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076A4404AA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 076A4404AA
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 12:20:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.168]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwYu-1sHpwt2wGK-013nGc; Mon, 29
 Jul 2024 14:20:27 +0200
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 14:20:11 +0200
Message-ID: <20240729122011.1112914-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729122011.1112914-1-fiona.klute@gmx.de>
References: <20240729122011.1112914-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2BLgOrmSho09ts7kJR8WoNuH91p6QxIEyLQSP3hPlDSEQo/tboe
 DFLaBfpz3/3qw/3Ct6Uip18LYaUk6QfoMUSlfYraWbOYnGQcw1YHp1z/oMupemxUbsOUKcM
 aElXyCThVNm3iLQS5iNUAROPeeEVIFNfXScW+jvfhdTsI+5IJI6iWpTaiRUgaoxyaG3RXOR
 aqQ9OIpKtQ4l8FAlJ4ZPw==
UI-OutboundReport: notjunk:1;M01:P0:XmfCyp+lB8A=;J1tuxwPB/W/8Y7/rox9Z9fw9FQI
 w6U38iAdRCqSTbNJm5WunVGENHWOYELdZgXESTpbOE7vSWgJAf/zucaWwl1iCJ+ZklHlustr3
 m+3/syavBzr/bhQtkbA10AmlA2HJTJvSlvXEP8JXAtjzZaTo/jJnwh00JLsa3vBLtWcW/xOe+
 PUBLFo6NtlHZvgxtc+IV6+5PozXPX5xMIQvObYlxoMQHV4lEwXDdXeaA7PjbmQ2a+IkbYyKyi
 uc7MU396NWsvPUISN5H7yp8n1l5Ak1nKS9c/eKN9fvQB7dIlhxYb9OEzJeNc/SSwpzdn+v4Q8
 lSwzr+WG8/NHd4sPY69w6uTN6K4CS/jM0Gz+VEuyGK7dCMzhAnCStcbYb1K2gTATQ8VZWoCms
 GTNvy2nB3b+Mm66A5DacCpInjOQpixsAENqUYZFwAKIa8LWFDRooX/CJaMjjvIdEAfaNM1dQb
 Uvv63XasymLw3bPldN93EfiT9nwzhGRuT5CVwxfkoHmBhePpxcJdQmx5pHMjhwb/scJBQ5lIo
 UQxGaVcZq4L4IYHOhQJUvU5G+gaauZcQN3yULcZ18jP1f5arNivjeZ5CMLhu5g5bciJ1/+QTg
 BKOBZIYvWCipuWQm3XRYfK9bcxYyA5M4nrJLW7M5l54ypyYKlvpguox6YUguS7DHoASk95Ldt
 4DXTOcvRxD1F05YnxFHroV7HWIazw96getxOUmPmyo9NI0cVL5at1reVe060hYxWR7ksux67r
 PpRyB7rFxw7JauTEGUExUcq/80nSyPcRVYPOMk66ar1S7qwqwnbYM+n+rDqriUhr2PghpaK4n
 o3zGzc1AneGBYQOYiBfwUtl7f0kFcKGRkW8vXo9QyXC6k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722255628; x=1722860428; i=fiona.klute@gmx.de;
 bh=m1p0pXj7+o08BLucIUqjVDMEVbwJ5hN8FI0mofmVt2E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KW1gsMzdrRRuHU2tTYz66EwjpdUVlok141sFszyyoK1Kb12DWzAqvofu5ZBx+mjr
 aENAgy6ub/SEBgboIcBkPT1ik4qFFdFlB9aGSch0swaZH+gayqGO8VzvmD1CWF0uI
 HFH/asGNHdEu9RQosZ3CERFwympFqmfJFcNWyI+W3Fb9xNl1kSPRqeQxEuG+JR4i2
 eBiGLabfg38O4SRzD5ug8HIiQHxE7B1JkoOAfdbXuA6AXzQVNzD7iP853Npz1sbXF
 p/36TFJojKR0lkFnGEJp6i5KP08v9cvNsQRILM1QO3C1zrk9HSm3JEMFjesbb8KqO
 TXS8YlUwDxphqMfEoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KW1gsMzd
Subject: [Buildroot] [RFC PATCH 2/2] package/docker-engine: add wrapper
 script for logging to syslog
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Dockerd logs only to stdout/stderr [1], which is lost with
--background. The upstream SysV init script [2] logs to a file by
passing --no-close to start-stop-daemon and redirecting the output,
but that option is not supported by Busybox' start-stop-daemon.

The wrapper script added with this commit captures the output of
dockerd (or whatever other command it is given) and forwards each line
to syslog.

[1] https://github.com/moby/moby/discussions/48260
[2] https://github.com/moby/moby/blob/50c3d19179e69f9e7ff01f688c4dbf32c5129ced/contrib/init/sysvinit-debian/docker

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I'm not sure if this is the best solution, but I'm confident it's
better than simply losing all the dockerd logs. The dockerd init
script in Alpine uses a separate log_proxy tool, which is not packaged
in Buildroot (and also focused on logging to files).

If the wrapper script is acceptable, it might make sense to package it
in a more generic way, so it can be used for other services that might
have the same issue.

Are there better options? Or could this approach be merged?

 package/docker-engine/S60dockerd                | 7 +++++--
 package/docker-engine/docker-engine.mk          | 2 ++
 package/docker-engine/dockerd-syslog-wrapper.sh | 4 ++++
 3 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 package/docker-engine/dockerd-syslog-wrapper.sh

diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
index 6850092eb2..5814c14676 100644
--- a/package/docker-engine/S60dockerd
+++ b/package/docker-engine/S60dockerd
@@ -19,10 +19,13 @@ dockerd_running() {

 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# Dockerd logs only to stdout/stderr, which is lost with
+	# --background. The wrapper script runs the given command
+	# (after "--") and forwards stdout/stderr to syslog.
 	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
 	start-stop-daemon --start --background --pidfile "$PIDFILE" \
-		--exec "/usr/bin/$DAEMON" \
-		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
+		--exec /usr/libexec/dockerd-syslog-wrapper.sh \
+		-- "/usr/bin/$DAEMON" --pidfile "$PIDFILE" $DOCKERD_ARGS
 	# We have to use --background because dockerd doesn't
 	# daemonize on its own. Unfortunately that means
 	# start-stop-daemon cannot check the return status, so at
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c7c51c5ef5..268b851520 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -72,6 +72,8 @@ endef
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
 		$(TARGET_DIR)/etc/init.d/S60dockerd
+	$(INSTALL) -D -m 755 package/docker-engine/dockerd-syslog-wrapper.sh \
+		$(TARGET_DIR)/usr/libexec/dockerd-syslog-wrapper.sh
 endef

 define DOCKER_ENGINE_USERS
diff --git a/package/docker-engine/dockerd-syslog-wrapper.sh b/package/docker-engine/dockerd-syslog-wrapper.sh
new file mode 100644
index 0000000000..3d6a80a739
--- /dev/null
+++ b/package/docker-engine/dockerd-syslog-wrapper.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+"${@}" 2>&1 | while read -r LINE; do
+	logger -t "$(basename "${1}")" "$LINE";
+done
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
