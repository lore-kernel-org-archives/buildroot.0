Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA98FC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 568C282163;
	Mon, 17 Feb 2025 15:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g6uQQ1MQ65u; Mon, 17 Feb 2025 15:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2940D8215D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2940D8215D;
	Mon, 17 Feb 2025 15:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC5071C0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB3DC60EA7
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUY8mGXZ8bMV for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96E4E60EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E4E60EA5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96E4E60EA5
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1t9sPG0fb2-00pHh7; Mon, 17
 Feb 2025 16:31:46 +0100
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 16:31:24 +0100
Message-ID: <20250217153127.1363472-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217153127.1363472-1-fiona.klute@gmx.de>
References: <20250217153127.1363472-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WI5KlQYF7fMBCpz8BhuWNz0atpRF88qBuwW6xZdKiuN2up8f3Bd
 nZ3k0+kdNPdQBWYxuU5fkOBbW85LXamxCcV7Np253iKDcT8+5iZ9WwOps9r7PyrtIu7ZcU2
 KydP9fP7sNBxTT7cBqt2ksWePXLB3vvQjcei0pub50E4ouwphhvzvDChKrL5R42blxU2ZfV
 9t9jGVQnO7l3C9P6pUv6g==
UI-OutboundReport: notjunk:1;M01:P0:c/05aeHsdfM=;mN2dzmj4ZCX47ZiHctp9pFllq+a
 eJyVZI4IXKM5ZYeDv+UJo0P/xU4ucqjz6LuV+DahOwfVdHtZM9/BA1kBn7weaqIUu5OVG6l7Y
 qkr35tZqTrEMEzEIfr+LV6QxiwPmWVLlx+fVhftJ5D001A9Z8N0Xpg59vSMT486SjyY+3oGhV
 VjmjoN1HXsOITQge9WqqG5N982hWcDgx+QWEDTmJx4/TMAaRByGRYhXGf1Ba6cn0iKgWOv5ZW
 Hlsct9h42kbDIrWKhWXaG7UDb6y/8cJVZMX7r2xbGwnNdKYrIptTsXP+cxmDdkhMUr5L02qko
 1eVemLUx4OfFlnontGa8RkOlu4ay+SBDxkzzZTLuNm70hHs8DGonodBGaSWU3NDrHTXT1yJzo
 xKHVInAIRXFCnkWD+2pIwkmZAbCXUKxi4futEqDizN0BWMBmS85r0g3XbRYPJ8LyIjwChfTqf
 zuabHHGrRWIGtZYiQ2XUdZgdQAHycud60RdEskAtD51jMKmCjHH6BRXnsSvwbArNJGKtVWOKy
 8/aV4wdbjSCYqYDUI9qH0+HQCVZwx7EubBste+qNqPa9YJ+zUN9FPNANUGzf+7BgymlevhWVR
 yEB16e5fsWW6iItWYbVBOERm3jyv10/fA5EM4gFh1/ZLebmOTrJCP1VhXnp4b5/QoES1csP9h
 KdQ+PVkVwOminxHn28XwyUUm3EKcXUjtR0bUovGWfIDf3+ZptEVsriskNnpu2oowV8+cN4AFx
 OnHSs4rRZrJjwmby2mor+fVce7LcQa5ls3+3wxmGTpjP2No3Rh+5WF/znClEL94/ZDgyKydfO
 mkPuvBtt3A9SO7piqoeu+B9BvKpMJYmyEsIWE3Br4tr+bjAyVhGetZioq2/+GItGNBVZwqTyb
 XAyq0U0NBz4IyrLUmcw80237q/HlGEiy34WEi7IVpwMuxZXXuloMpztqt21wDTcGuEQtC2K6J
 i2uewQRDFECw/AHfU/zsdE6mOw+w2TCsQghRfcjtZigp3zc82xNbS59m7fzJQnH5qABl2W6PT
 HwMq3gh3mYxqy5nwHJ4e8BRHPfaw/dDx2L4lpzCj7EFNiza2IWjw+NwRRpye3dvVdqUt1At/t
 I1K4HMHJRIwGvLXsoLnsF1w5nQWtLVoGWPHWGhONGHX4fX5llEz3l5so+d4rMXVreqYJeJlS+
 35rivXexmp0SYkXitykX+9QKOC978GaVYp/uojb/2XmJEP80IEFflov+27sXdYdEvflOS+nim
 UFrQeGEWj7k8DfQ4ZdOrxCXFD1RxSaG8aOrEzyGUKelFPKqXpqo56sdpRKRR3qkM1do9vbKU3
 hW6v382ztCvDeiFApwd7Pt7XGgNsd8ExLtNDIzuBiMtX/L1J18aQXjy0Gr04cGhRSeY2ZMA+8
 28hx5nxWnwCDC14wuy52D1sD30ezFOifbrIQhA/fz+qn+qRwz9Jm+ssigEJzEimq+gVbiMM9Q
 P4GobLg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739806306; x=1740411106; i=fiona.klute@gmx.de;
 bh=Gp9p+6sBVAQGOWBg4dKkUtamdyFJZXcv9joayL6qdOE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TZz4/I/nVj0t2PXQlG0BAKVak6w9XRhFwKDRglcQVHG/tkVYf5P7crjGdO5WC32z
 zmhJzXJA2dNdWr7pMY8Zbk7dQcrLqTgotvjaQppOKH/dT8RTNCMgXPuDGtvWwxh+O
 U8Dd90hsUWmSjNbW6tRqdhD7WhTG65PJyQoz3WIR2xNJjj/WCmTetbIhwhA5RqGB5
 cfYlZQW5wFbavEFRB45rpjFLiWAfYHeixHVTOLZ4xeQ5CU1g5ak1/B1Ry3Xj1c3MB
 v05qQW+Hd2/Xd4inyOCLqtqWxm+gDdcaUBVfXer9oU7hB38gZLu0f6s22JVD6G45O
 39vUaZ0uIdLCb2GLXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=TZz4/I/n
Subject: [Buildroot] [PATCH v6 3/6] package/iptables: check for rules in
 init script
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
if the rules file exists and does nothing if it doesn't. The "save"
action is exempt from that limit because it may be used to create the
rules file.

Also fix the shellcheck warning about the unused IPTABLES_ARGS
variable, and use long form options for iptables commands.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v4 -> v5:
* iptables init script: run any target only if rules file exists,
  except for "save" (which may be used to create it)

Changes v2 -> v3:
* replace "iptables -F" with "iptables --flush"

 .checkpackageignore          |  1 -
 package/iptables/S35iptables | 16 +++++++++++-----
 package/iptables/iptables.mk |  1 -
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d54bd353b2..6e46b44b09 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -587,7 +587,6 @@ package/ipmitool/0002-Fix-enterprise-numbers-URL.patch lib_patch.Upstream
 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch lib_patch.Upstream
 package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch lib_patch.Upstream
 package/iprutils/0001-configure.ac-add-AC_USE_SYSTEM_EXTENSIONS.patch lib_patch.Upstream
-package/iptables/S35iptables Shellcheck
 package/irda-utils/0001-daemon.patch lib_patch.Sob lib_patch.Upstream
 package/irda-utils/0002-nommu.patch lib_patch.Sob lib_patch.Upstream
 package/irda-utils/0003-subdir.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/iptables/S35iptables b/package/iptables/S35iptables
index a2de29d222..fc42fc9a8c 100644
--- a/package/iptables/S35iptables
+++ b/package/iptables/S35iptables
@@ -2,11 +2,18 @@
 
 DAEMON="iptables"
 
-IPTABLES_ARGS=""
+IPTABLES_CONF="/etc/iptables.conf"
+
+# Run only if IPTABLES_CONF exists, except when the action is "save"
+# (which creates it).
+if [ ! -f "${IPTABLES_CONF}" ] && [ "$1" != "save" ]; then
+	echo "${IPTABLES_CONF} does not exist, nothing to do."
+	exit 0
+fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	iptables-restore /etc/iptables.conf
+	iptables-restore "$IPTABLES_CONF"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -18,7 +25,7 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	iptables -F
+	iptables --flush
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -30,13 +37,12 @@ stop() {
 
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
index 8d23dca249..a9d912f6cc 100644
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
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
