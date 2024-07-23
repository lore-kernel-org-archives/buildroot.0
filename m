Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121AFC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D547581292;
	Tue, 23 Jul 2024 10:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neNOpnN-6x2O; Tue, 23 Jul 2024 10:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FD181298
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FD181298;
	Tue, 23 Jul 2024 10:29:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1361BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1596F607F6
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgerRukOtdQ0 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4B67607E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4B67607E3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4B67607E3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:29:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJqN-1s0Uq515Ax-00ZUmv; Tue, 23
 Jul 2024 12:28:54 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:28:28 +0200
Message-ID: <20240723102832.2522307-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723102832.2522307-1-fiona.klute@gmx.de>
References: <20240723102832.2522307-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:GjIzJQQopoZqY3muTTk78FOR9oUxu/TaAKB539v0fnXno14BbR0
 eTJoih4VCli1mV6EebvjJrpoZV5IJ2G2gHEX8WgRBKdEFpPFgZ4X8sJBd+mG+S2oqWN6lKR
 qcDDeqMMRc39TEKAbT2pvAr7rrjNKAuDweKEXVb5Y4jXZZpjXkxW5P8sb1DZ/lskWc07b+e
 /msZIR7Y++crLdgokMhLQ==
UI-OutboundReport: notjunk:1;M01:P0:Ry63+31GJiY=;Q/ngkSN7AZ1obvK2hbyqp59pRbv
 7N9a+Nfpxf49FKqFQ/o4sSra/X5Ga7m6fogzjUfZWQU9iJBYU6jk5rEHk7yJ4Rk+nLKSTVAGL
 htfuiJnRApjYZXcm1Wzo3ctpQabCrVzwwydrM+PPFv3kDeEwkCCBZPF+Ztv0zPEUpSDFvHmT1
 tTvqcjwSIJWedrQ1QQ9Z1fQRWQsz93lN0LnMq2QQAf5Ekoz01onHoIsZKnJ2hosZAdbStRk62
 hT4G7vdXkdWn1GKrDSm8wm2rdgz2HLiryG9xTSCbvZu0S0avTxSzNtWMm0sk/cZQbmIjonrEb
 XX0mworr7tzjugBMrf2qt3JwLqdtm6qK4PDjvjs2ZG6KkotDXq3XB4axrOTyq77XbPi6PI9nG
 R8xAV2ndziVIv2tIOM5/QyOk0/21xOQ32UPfzlifGPv7BWzdrHRPyJtrNwwf6umnXY22aJXBX
 tvWCKitsFqAXWU/xM1lnHRK3AZvJ5tmKLqRTpexcBHFCIsPlvhZbAmxIhZJvrsLYwn5tQ+wu2
 vNjm+w16KSPu7XXg8ZKkNrG8eeG68TkG0vjg2S//9FHgRqGZEaZgyTJyOoYEErNOxx/4KwR5R
 7eh6/8rCNIsLei5EkUReE0nWVuHRWXzJm3XtHCmZP7+8DIpuu38tTX9u3nPVw3n79iSHpq6CL
 OxHZYgFUKwc6ET5UgdGXmNgxMTyitwnlY9LsK5o4HryL9m87xKAWwVYBF9SZE+jXMGwel0T67
 izOAXw9nzUtfUN+lS8tNgFdEBFF+qw/02TDOC9EzBYdEZvmPcow5kl8vvGJxixUXTPnb412AQ
 EDbFp4XzUvDJCLVfCX91wt3A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721730534; x=1722335334; i=fiona.klute@gmx.de;
 bh=pg9CFa2GVUXQZVqGGR48iPl2z/8frWfIs+LphYAzDi0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ok43p7ivKZbtAACxxioJgEOuLLTmkQ2On3Ef5GXiOuC8piEdVTQ9viQXKi8ZLFiM
 U2XIZ7XPBwgBXY7j4SMMTd+YT399ifLSYXFXlf3ye80zWMLY9y1/fsQjSoJXqrMl7
 CsoeGG2Z0Q51Oa1ZAWKTR4+MIqzOBl6M1yBLPOcqr5wYgNQfglOpPkLkY8t7MC165
 D55akiZ639pRZr5XuBkRaPq9TzNIv8NeGctz69PeOaZvJc1aMsPWeUA0f7QtuZsQD
 SR1B0C3/uu91PQe13r4lPElJU7sEwAXKya/4JLEoUv0A0z131ByfBdD+qAZYY6FwY
 GaR76FYgS8aljbf43g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Ok43p7iv
Subject: [Buildroot] [PATCH v2 3/6] package/iptables: check for rules in
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
variable, and use long form option for iptables-save.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore          |  1 -
 package/iptables/S35iptables | 12 ++++++++----
 package/iptables/iptables.mk |  1 -
 3 files changed, 8 insertions(+), 6 deletions(-)

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
index a2de29d222..a67d0886a9 100644
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
