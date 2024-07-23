Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F6FC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3EB86081A;
	Tue, 23 Jul 2024 13:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Pr7HXMNjQzz; Tue, 23 Jul 2024 13:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18A2B60829
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A2B60829;
	Tue, 23 Jul 2024 13:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D27C1BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96BE3401C7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a9SVrTTix12 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:40:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20E55401B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E55401B6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20E55401B6
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:40:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mplc7-1rxhjN0KA1-00eUMK; Tue, 23
 Jul 2024 15:40:12 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:39:45 +0200
Message-ID: <20240723133951.3542206-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723133951.3542206-1-fiona.klute@gmx.de>
References: <20240723133951.3542206-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NgBK+otpK554ji6T8DfqDJ/SWCydzF9M7W3pNqsmDKQfeuKdhPb
 Ov0yl7syT3tC2WZmpLmIw3yjgJD/XRIezTWDBVSuikfiDk2uF5UAsNye7pG1JI6gCDnc14i
 oAM5u+SiOqaE857K/vA+Q6/0ftdgnD0jKdkhqSJgURPcdBpBWSKnxnfjiZoMxk7PFjwysBB
 IRvioN0L/8qh2I4Azj3yg==
UI-OutboundReport: notjunk:1;M01:P0:zXQTJYmgnLM=;mN9+Mn5s+kri2MKsGiHYr32XZu7
 M4aD2WfLze84IlVoT/LDXLvVu83kfWmLMLDE1hcLO6YMpsV+og2yfZrN9MQ8Tv4el5/JMOm9b
 Snyc3+CzKggpc+KZcMO/BQxxk+/qW5kmRDfEgpbcj5DwvoOwzJnjSLZYN5+zwVlhZmcVBxnC0
 wr7Gf5xlK64qgauS6n6DMnSIqdq0u5/JbN8ckxcfMHXsdV6VhQ8xuHZtN5etqPJljsbfsv13O
 OdFj3dCkiNs9uCK0HtdNf9pDBQjT8Kver730O6WlozF2BvZPYlxUgQLV+E7eiXSk5Xee5mRUj
 pyoXEiMRho4vXDEnB+fxqLH0MMd3NG3YZ3geh4nrC5oW/bLERzS7lD6W+ryKw49y/u9ANJV2p
 5UdPCtd6mFehotSU7hiaOxJ4tfD5lkWRqhwzn6KcfT8dSofR9WWjOfJM6bOYcrad/oMeVjbe2
 hv6RcdQsXcTbc6s42LTCv8fKu+EaeIVniBn46b64zKjz37p2uUbgaKsjOs3P0GiZMY7bZ9PkM
 OnmSipNMc3uxub/V/lhn9jCY7I+eTqPxKiyN5fmZcvMcKORRhe4aTxQOmVcq4n8lmJwcNyr7w
 HF4BAePGw79Udi9SGapjgPCAgHDVwHTi4JI7JF/e4mIt7fk8QKsaTWNGY6rr96/mX/x52Kk7E
 SOYSj6iVuByxhWQ/A+wtrVWCTKMyjtsK6d0f6qS9Mhj+8PTfLHIMZJBvhXRKbhWiW27Hh3lxo
 ncnEnxMUy3MR2RjOPfY75O175jrVcEBAZeLNEDJrT97reCVpyN6c4JvYh+hBfvrdK2/CROUr2
 buYSogVNn49oVRXB1B9LJwyA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742012; x=1722346812; i=fiona.klute@gmx.de;
 bh=c2k4byA8WwM7XcuRoOtZRLRT8yNRDAFCykYvQHBvbC8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=i566Nlc70wuqvnD+ZyQjxyHPI16l5ofTlZsFG31SlHMOVGwFKL7+8t3tjt1MpGww
 2jOFYPam2XcVhRiASlTXvY3gzvpaQhyEYpxcoJmRU03xuI4vLEE0EbAZJbUltZ9r3
 hedJEvc88NMFp7YywcVho1yuFRqdRe8z1FesA6+PC8vGBTknB7DpzdIVRqNrA3yz4
 LaFMEUqJ3ZF+pgUL3qFR68gpq0QjB/EKeBj0NfhIHvnvxz2Judvahf8BUZ8cCWe9A
 fisnqfOtT6Od18YBtOzCcnPK8eyNu+eJPOO+ebZ/jZiR64tIgvgusuOXJSvAK6yDR
 chYxEqOHDFN0jRkfvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=i566Nlc7
Subject: [Buildroot] [PATCH v3 3/6] package/iptables: check for rules in
 init script
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Instead of installing an empty rules file, the init script now checks
if the rules file exists and does nothing on start if it doesn't. Stop
remains unchanged so users can still delete the rules file and then
use the stop command to flush rules from the kernel.

Also fix the shellcheck warning about the unused IPTABLES_ARGS
variable, and use long form options for iptables commands.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* replace "iptables -F" with "iptables --flush"

 .checkpackageignore          |  1 -
 package/iptables/S35iptables | 14 +++++++++-----
 package/iptables/iptables.mk |  1 -
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 760ae29cfb..4152a5c74e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -676,7 +676,6 @@ package/ipmitool/0002-Fix-enterprise-numbers-URL.patch lib_patch.Upstream
 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch lib_patch.Upstream
 package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch lib_patch.Upstream
 package/iprutils/0001-configure.ac-add-AC_USE_SYSTEM_EXTENSIONS.patch lib_patch.Upstream
-package/iptables/S35iptables Shellcheck
 package/irda-utils/0001-daemon.patch lib_patch.Sob lib_patch.Upstream
 package/irda-utils/0002-nommu.patch lib_patch.Sob lib_patch.Upstream
 package/irda-utils/0003-subdir.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/iptables/S35iptables b/package/iptables/S35iptables
index a2de29d222..d6ff4a4762 100644
--- a/package/iptables/S35iptables
+++ b/package/iptables/S35iptables
@@ -2,11 +2,16 @@

 DAEMON="iptables"

-IPTABLES_ARGS=""
+IPTABLES_CONF="/etc/iptables.conf"

 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	iptables-restore /etc/iptables.conf
+	# Run only if IPTABLES_CONF exists.
+	if [ ! -f "${IPTABLES_CONF}" ]; then
+		echo "${IPTABLES_CONF} does not exist, nothing to do."
+		return 0
+	fi
+	iptables-restore "$IPTABLES_CONF"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -18,7 +23,7 @@ start() {

 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	iptables -F
+	iptables --flush
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -30,13 +35,12 @@ stop() {

 restart() {
 	stop
-	sleep 1
 	start
 }

 save() {
 	printf 'Saving %s: ' "$DAEMON"
-	iptables-save -f /etc/iptables.conf
+	iptables-save --file "$IPTABLES_CONF"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 257834b8cd..13e80a6966 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -59,7 +59,6 @@ endef
 define IPTABLES_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/iptables/S35iptables \
 		$(TARGET_DIR)/etc/init.d/S35iptables
-	touch $(TARGET_DIR)/etc/iptables.conf
 endef

 ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
