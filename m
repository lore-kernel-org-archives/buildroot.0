Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54AFC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 648F1607FD;
	Tue, 23 Jul 2024 13:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CH9v8teYU8_2; Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C04606D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C04606D3;
	Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7601BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C460401C7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGKweOEg6ttT for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B51B401B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B51B401B5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B51B401B5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:40:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnaoZ-1s4JRe1gX7-00cGNM; Tue, 23
 Jul 2024 15:40:11 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:39:43 +0200
Message-ID: <20240723133951.3542206-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723133951.3542206-1-fiona.klute@gmx.de>
References: <20240723133951.3542206-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hb+dJ/5FIjIlvnciu332ufpjN6TVg1sWdMPklgLuVmUMSt9p86t
 nWZBUDK2XYvCDOWSlL2rBQEKs1s5tU/8lPSbnJAJokyc0mI0KnJYQXzGnJ8LCW8Tr4p8o0p
 bndi/uDFdNOM7kWiRhLlWeCWCguWabdd2K54wamj6KBxStRue8lwiSofoTl9bJQW3s/DiNl
 8lr3bABj6sLHRKdm6mung==
UI-OutboundReport: notjunk:1;M01:P0:m9PHaubSNAo=;tGBSH75MLFUWx8cp4CReHEbQrpt
 cEuPO1yhzvcBsPT5SSPXADfppXWlUD+aMeGkbidgiLnY3ce+Ou/YcfLl4vmC3dDIDx5I4MMdU
 Jb8zw7S4UbPAEWAkn0JNEXWitZvOXQSst+LB67pM7zYtYVw8Cklo9fyjPmr+m+XcKVWjYET0T
 dHcVOP+xkkyV0u6JRh6Sr/7ctFF/kglMUO6ZB7sua00WG9JjU3L+Nc7Avy9Bdepz925zwzq+n
 kkJZG7gKwXgZ1OLlpw1JDeiXDlJsOGZhUphSVxvwX4BOj+kVzL1ePHXyGF/BAOnQ70k6RW+nW
 KNetCPYqtc1xbaDfPirlDB0n7YsOsgktjM6OmEYfbatbefp9C1uwfoE3V1DPI41Dx5OKtjrS8
 AC0DwJe60s/DdNHRYH7oPRyxcckKh6Ss9zS+vyFkOoAU6RHhXgpMzlXISvlJzX9FHw+KjsJ+v
 JznjkOm8yf8v0BvmKy9nq0HpRTi3rrnBEn9oJiYdr5SdjGXU/e/7xu1Tq404dE188bTKLrlLd
 8jG0Q2xWDW2Rg8daqUIMxixlROTrsiE8XsQa5pT2OQo8qcCTrIFzd2GrKY9Nffr1FmehPV+ZZ
 w+RjwHjKmPrFn78p2XrR++N2rq30VaaWa4svHthWgM3S+2HsZLf+9qrDWmS/P7/jwcypKLbmo
 1/Qc+4+19EXHqoE0TU0ybg2KaM1gpTL7O3YSQbgGyTk9wIBUDRtjvvOCTUrKWQPCs/PF7ncwI
 tiyIBiyyHLkcoQr5ZACMIgVJp6RJOeZdcvYHIEK1hFh/YahplGUmR9jQ1kSHpY4mAzUa9ffbY
 EcR0ggBY/TspvH3MbJhKtuuw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742011; x=1722346811; i=fiona.klute@gmx.de;
 bh=p5LzqX0BZlGdwgFcamDhhuFE6ByJ17AQbesBUZOmIh8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TZJ/oFBe8THR5Z30joznmEWXQFdd9ETVkMI9z4m6MtvhYCL+GwawYSLKWSG0muv4
 0Qqd8p3AHBJLcn+8ZpdaOF/V0m9MjU0HOHUZyuNQlMK/a/mxoXI/BCn2NMeyIoVIB
 RLQwc0XG6Z8jt2Bcg1lrVugAA54UOyRRPELKYvqEzAtChiMrUT1Legeg0gsf1ine5
 tRFxmM3tp8PB1fxv1y9bwji56Mvtb0EYvB7rifsJYrCLsvofKtU0LeJJ76P9+MF0s
 +0KG5VcnG+bjyQFyelQHV5/ojY3sbQcyW1VXUvoB4QCfJGiqTtekPigRX00Obqerh
 Ns14Sly5lA2Ydm5d8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=TZJ/oFBe
Subject: [Buildroot] [PATCH v3 1/6] package/nftables: add init script
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

The init script handles an nftables ruleset file with support for
atomic reloading. By default the ruleset is expected in
/etc/nftables.conf, the location can be changed in
/etc/default/nftables. If the ruleset file does not exist on start,
the script does nothing and shows a warning about that fact.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* clarify comments & commit message
* nftables init script: Warning about missing flush in ruleset on reload
* nftables init script: check for rules file only on start
* nftables init script: return nft return code from start/stop functions

 package/nftables/S35nftables | 66 ++++++++++++++++++++++++++++++++++++
 package/nftables/nftables.mk |  5 +++
 2 files changed, 71 insertions(+)
 create mode 100644 package/nftables/S35nftables

diff --git a/package/nftables/S35nftables b/package/nftables/S35nftables
new file mode 100644
index 0000000000..8605ff7e76
--- /dev/null
+++ b/package/nftables/S35nftables
@@ -0,0 +1,66 @@
+#!/bin/sh
+
+DAEMON="nftables"
+
+# Main ruleset file, override in /etc/default/nftables if you want a
+# different location. The file should include a "flush ruleset"
+# command to atomically replace any previous rules on reload (instead
+# of adding to them).
+NFTABLES_CONFIG="/etc/nftables.conf"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf "Loading nftables rules: "
+	# Run only if the ruleset file exists.
+	if [ ! -f "${NFTABLES_CONFIG}" ]; then
+		echo "${NFTABLES_CONFIG} does not exist, nothing to do."
+		return 0
+	fi
+	/usr/sbin/nft --file "${NFTABLES_CONFIG}"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf "Clearing nftables rules: "
+	/usr/sbin/nft flush ruleset
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+	FLUSH='flush ruleset'
+	if ! grep -q -x "$FLUSH" "${NFTABLES_CONFIG}"; then
+		printf 'WARNING: no "%s" in %s, duplicated rules likely\n' \
+			"$FLUSH" "${NFTABLES_CONFIG}"
+	fi
+	start
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1"
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9cba243372..d74ca2da64 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -57,6 +57,11 @@ define NFTABLES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
 endef

+define NFTABLES_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/nftables/S35nftables \
+		$(TARGET_DIR)/etc/init.d/S35nftables
+endef
+
 $(eval $(autotools-package))

 # Legacy: we used to handle it in this .mk
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
