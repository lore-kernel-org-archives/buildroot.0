Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF77DE77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 18:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8880D41316;
	Wed,  4 Dec 2024 18:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCLUY9GyAb1I; Wed,  4 Dec 2024 18:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B7541320
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B7541320;
	Wed,  4 Dec 2024 18:29:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A5F01DD3
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27245607B2
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufTr0ShduXqD for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2CB86085B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2CB86085B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2CB86085B
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAcs-1tu9gg3aTA-00lT39; Wed, 04
 Dec 2024 19:29:22 +0100
To: buildroot@buildroot.org
Date: Wed,  4 Dec 2024 19:29:08 +0100
Message-ID: <20241204182913.4085670-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204182913.4085670-1-fiona.klute@gmx.de>
References: <20241204182913.4085670-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JhJ3PUvPnxZ3IoN+Jp4uBD1WPLDoOf3VDQh9C3y9K5LO5TSJXhe
 tXGS/y/5L0zEjJro36PmSsO7c4LIvJJOuI3iKiDFwMo307/Iktt9Q3/oUqhoaEp+3NjDOpY
 eFVaoesKiQQZgliK0sxeMd5kEGKzCLKE2QwHmU1Gv4jSJwgmQfkezp2Ivv6pzW1bmh8OsCk
 1RPXAuT55Yf/0noOLVH4Q==
UI-OutboundReport: notjunk:1;M01:P0:TangTV4tcdg=;LXsXNBZt1JJsVUWGhoqTB33kttO
 T8S2XzrIQCqPDYwc+XpSlA2CSWQ/5xQVQgnNcS6X/RMA4zUqUQA3ZlavJ2f1ilxF2ZePpfF8n
 Pa6KAu0MVC82FFnmFWbOXaGAlWXxU6kuKGejhLLnziVqGkw7Sn2/rpbUMrhC4Zh5kkZcc7NOe
 cBW8lijtVYE6hdzOBENHMhwlknodDeNM9x+UO1LgAFUUmRrX09qSxpB9AVC/VkGm3+RR9Feos
 bAthWSNRC52YTWYgaBjJJRju0L1Vq4mymvNZSuohReWM1EwA+esBfwRSord/h2AUJhlkaFMiS
 vUEvmTLswnlnSYHCW0njZqMewRHKDtP0a4wIuuhoMMlco1J2R78U69Mu16XB4wZXG0y2FDy4a
 mwYwODKg21z03E7dCYNQ5zfEKYzHm0FajQ/lljd09REOae9vLm2BlBZO62g3w8csZis3tRPvf
 4CEfOL8DEDV8vWjA464Ae+6EIPVrRaxAtFZj767jWJY/21fdHxHj4i0iVjWAgXPlStxA1Lbnx
 Fa80DxGyk0BQmrN98OtosHW73dL8PV3/TApT6sqM6wlJPjoDgr3eNw9+Mu174hR9k5nyWnAZR
 QNb3P/XCWSsjzk79wmod9QQDwqeBaZoSb/DzsXXqgCkLImRBnF5EZ1dcl+4dVALNw6VeUBpPS
 qkXyFXRv2Yl6LrUNFY3EhE5ScD06MvRWJA9nPdKmpDUWFtXfPIWTb8e1AiTM600ng0teMXGNV
 dgCv5dBSH+ge/d/k9RVca20CAAkITccLwxrQw6cqr9hOr7Fsekr/FfgskLjt/Q9g61XHmf0/e
 bpN89seopNqgIzre+3oHVTB5SjTPH+3LOAIdN17FeC1VqDsAjChp6EvKFR8d/MKcBjL94SJ/h
 Uz9pXmvtd/f5f0TtMiJp7pLIhVIF0P+U2H9dTf79Q/rgTcdxlIgPmInX+GLf2EEoJWl0NunCk
 86KhtWdokpb1XSLYybtZ284alNV1Y6bq9CsyUBZT556MixcEz1v5bs17rYnr92mw8N+XUpDxm
 TLG26mI9fD4HkRg/WN8l/e0en6ZAdg352mOuHBNrDz9yc3j2Zdhc2L2JJ5Koni4Pjo6irBJRP
 jFJDBT1TIoZbJNWegzIgNWZPsKYyMJ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733336963; x=1733941763; i=fiona.klute@gmx.de;
 bh=lWYV15bvP6gLVhcr/rgX8eB8imTJA9aVFDQy2CicTio=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MTgn/0dWrmLBvH+2+rt7wNwUJ5mSNMVnwymhOaIH+yyELrnD3ixAz4SIoS1fMolC
 lu0KM5foa/AXhTUAqyE/tD9ljGyCqkRWXqSXf1xkuzeN0XiBWD92/tHEP2pZMrdfO
 0Wi4WYm+y8+rqqsQkunpV+t8qfcaWp+FZZDuMiEQ64fPobVFPvDRqK7OKi+qU0c5r
 4Y+tXrruJ0bvUVDYx1CehTx7fTuf9aHGq3ye7RIHN82J/kyoDffvt7lHF9qIVhiBe
 a15wlV84U96J42jIIOhqYKxNgeCCkhG5onvU/7jLkVUK5HDp3h5eIK4LFZqqHx12+
 ExNlzuBktRflZcsl0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=MTgn/0dW
Subject: [Buildroot] [PATCH v5 1/6] package/nftables: add init script
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

The init script handles an nftables ruleset file with support for
atomic reloading. By default the ruleset is expected in
/etc/nftables.conf, the location can be changed in
/etc/default/nftables. If the ruleset file does not exist, the script
does nothing and shows a warning about that fact.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v4 -> v5:
* nftables init script: run any target only if rules file exists

Changes v1 -> v2:
* clarify comments & commit message
* nftables init script: Warning about missing flush in ruleset on reload
* nftables init script: check for rules file only on start
* nftables init script: return nft return code from start/stop functions

 package/nftables/S35nftables | 67 ++++++++++++++++++++++++++++++++++++
 package/nftables/nftables.mk |  5 +++
 2 files changed, 72 insertions(+)
 create mode 100644 package/nftables/S35nftables

diff --git a/package/nftables/S35nftables b/package/nftables/S35nftables
new file mode 100644
index 0000000000..33de15c561
--- /dev/null
+++ b/package/nftables/S35nftables
@@ -0,0 +1,67 @@
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
+# Run only if the ruleset file exists.
+if [ ! -f "${NFTABLES_CONFIG}" ]; then
+	echo "${NFTABLES_CONFIG} does not exist, nothing to do."
+	exit 0
+fi
+
+start() {
+	printf "Loading nftables rules: "
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
index c958f0eb26..380e553cde 100644
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
