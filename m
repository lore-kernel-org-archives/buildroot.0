Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CD2C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F4560B6F;
	Fri, 26 Jul 2024 16:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4oL8O3fyum0; Fri, 26 Jul 2024 16:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B47560E7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B47560E7B;
	Fri, 26 Jul 2024 16:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 815921BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4047D60B5F
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBU-ZFwkuxLN for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCF9960B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCF9960B60
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCF9960B60
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:20:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mq2nA-1rt9Jn4Bm6-00low2; Fri, 26
 Jul 2024 18:20:38 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:20:08 +0200
Message-ID: <20240726162013.2183792-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726162013.2183792-1-fiona.klute@gmx.de>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AcAWgCK1dTOf5ox7g0Kl9Ticd0rsPoaBNPskv9aoYpTc05BLbix
 F7yrSUJd4o1Ig/6GBaGNSiKlgwP4InDQv8Bz4ST86UovAAUpadw5y/Pp7ZtfCfkmKev2U38
 ft6itwe0lmjrTZUSpoTcrcTFJD0q5LdVwDF4kirTD2W0/sFIrVZVy/qg8UEcu+ECCxeeT+M
 cQlN+I69guDG2eSbxM5LA==
UI-OutboundReport: notjunk:1;M01:P0:rjUDArbAqIk=;dxkgN7rIYl4oNKhMcUsf24Y7Rdo
 tKhybljoJi7msuDM0zbMN4Qh1UIe1PMQnpwTyHo7McUlxzGe6q/dhA7okGLaF42MBQ3FZz9cK
 rTmfVMtRYHqxsGdm9RYSgu/20wVXlRZO6+UTr5QhcxifmERrvNM4KKy8/xpfbl+snHGhgxvB0
 ew9eZnlN6LcOKNnByeBDKcpsO84yCcowf/IGH4F4UWD+7n6rtJWNjrfY6rUi75PuqdJ58y8rV
 G8Twmu+OUhG1H29TWPEUNcCXAnCni/ojRQ8iezQesNurgMx3zaS1bD/3z2ifk8UzkQ87mA6Ik
 UN8oVhFfiy6WJ8jKA4BDNMnHa/O09DR+r/DDmneI2QbINuqFUPr1DQUOXxZj48+hw7XPYhie0
 ixbwseDVFZdcP1qSX0q8IdJnM79aJf5jg3pwwR9UVp1BhUwykRQ0cBV/TPfN23ZKE2XYss/LF
 QxhhjAE7a6P2JBWgQ1GvdmQsEOliJpiNMVSii/NxnHodt49OIdULUJNlOotqVEkpCNtlt4N/c
 Pl7OxxBxA2qJFlA5x5ncg7kdghBAOf7wHa4zdSkUWuqLLV4AUyK8V7H/bh/kIY8R2KiDrGZ4P
 Toc6+k1TAzA3bCfxeGHtTnB4DkNHU8kSYwRjbSb/Ua8PXyAl8Q+a7TDDTLHxwsZ+EpP8jVxRs
 tB8bFlOQqn5gbdDCrdmfhKcP7meazEkRY8jBfPIorUnA4FAhEoBvkddbbp4yEGUD+dwc4QTXj
 gYI3OzDHBDNWsaNhUibMw0W7yfvRpQXPmzOUc+8KepCCeW1ZCq5euSUV12pimOa9cF1lBWMii
 0L5di/DP7P2UucshFu/Y4N+A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722010838; x=1722615638; i=fiona.klute@gmx.de;
 bh=LYL6W0SuPyiiKknGKZmGP43s5L/ouS96jkn1qJdYMAk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nwDNEfn2n8w8WE97W2MOzCIBcz2hynNKvBdSj0s/5EHgYxefOvlLCT2E9+GN0HLX
 B9PJtZaVN0KK4EMSwHKBKGYXN+LXltbKrEeLHEys/Dh1G7Rzu7OZokCCBdm31fWVz
 88jGlQyUAT3VwXBYwFu8uVZcxtBsK/e4rVXlRGRBPRlmWrcMM2vi0ossbjVz/WlMy
 zIpNA84/vYlooMunJwpgOkU+9HBaJkvrHZWKnUQPCiWGBo09XMODGtJB7szZII2mD
 VkyM77n5wbQR8bEwdPAC2xl59Z+de8so/aKquQwJovYAzvw+bhCZm7VxH6yU8IrGV
 6uzpYwsBUoDhxQRNDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nwDNEfn2
Subject: [Buildroot] [PATCH v4 3/6] package/iptables: check for rules in
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
index 5e45edf765..fd08e0f5f8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -667,7 +667,6 @@ package/ipmitool/0002-Fix-enterprise-numbers-URL.patch lib_patch.Upstream
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
index dbf7fbf5e1..e7495c1085 100644
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
