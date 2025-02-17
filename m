Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B55C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB0F60EA5;
	Mon, 17 Feb 2025 15:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Upb_xzfQ53Va; Mon, 17 Feb 2025 15:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F4060EA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F4060EA7;
	Mon, 17 Feb 2025 15:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CECCCC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B36ED82158
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pr4M5VuIxocz for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A05582156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A05582156
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A05582156
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWAOQ-1tq3MB1fFy-00PPQJ; Mon, 17
 Feb 2025 16:31:45 +0100
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 16:31:22 +0100
Message-ID: <20250217153127.1363472-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217153127.1363472-1-fiona.klute@gmx.de>
References: <20250217153127.1363472-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YxxBRyrzmCmWWO/EFy0mCTDgd8ShHHo1dX7pgZhWgF5G8ZS9jAG
 GT1uK3SGGM+Gh/GvX4oPXyP6QP6EXwc0Lewh8s/Mv+b/uqgX5EdQ+WYy5cSI0KP7prnGxfK
 udp/EU8W5VEqMA+jnDA+P8OsShalBhIGRMEYWscBVY44z9W/0hG4TgYt8qgs3jm53gQQ/O0
 ifBoRiY3ZFVQTwFK8EiiA==
UI-OutboundReport: notjunk:1;M01:P0:ZBHj8mgBz0k=;qTm7YjBQjnr2MGqSwvJYpeY+ZLU
 e/7L/isdWyzSqxagFLrAXzbau7fKfc6JtMC9VwbLr4WCnxmlBluLoBWdcO1qFw8LrxwiY/Zfa
 EBseaFYZT4tunhfBMvpFTIgL58JOAGRGFQ9YUUDaZyNZXHXv7SiBm7Dg4fbBpqHh1yQrdAVkp
 uBgAiZLEl7lerIUKI9zh7/aCKG4Lk9AkBwxvW2joK5w7wFvu901vU52eu4tHzO5KPpfiTsLMq
 99tzLg2Pfq2lxGhMnq3nCf0oy62StoWLr6SlKrvWcgVNRbwbC+aHu7qxv4k40bPHmJJbYDsUY
 Ns+kn/1dcws3agcCMsj1X85otmk9/5QdtX698US1Lz67wZBI1gR2CXcIAozpfI9z+khLCryCK
 6c31nmq5DHA8YH+xtaI8Vh6/XoG4XGAWmEHS/KWXlMhneh023HkHJJcfTxv/Tw/Q5bIYnHboY
 yedwLXGb2BCF+VGzO2ekt/Hrl96Uv4yZE1+YYUJ2YFnia9JWImmsEDUNElUQqF2uM4hOT5Hmz
 sNLO16aeoZKStlasUH4DYzCkIhRv3/nZstGnYLRAhveGJyldRBRTcMn7ecW28q985hoo4odFh
 /onWVx7tNhsG5XV8JZ1t2HErTrLDN3OS7IlJpQO1lC+ohhm6L9FXTwfuj0DYinzE9DCT13tQa
 SRgun8OVcMghRghQf6kM28a8NFVhnfsFCPgolsrQij2YmMoJiBNKannvRmfQQWb3nA5V0n19o
 9i3VZyv6xQQDHuSulzbAtSeT6frst8nd5K1oTxfLkapDb3OKHwr7A6ywNRMhaPYM/nZ5IRMRP
 bSQu73jm9J66ycemC5hnSQfH3CR5bG3xNn6g34y1cZsFjFUyPW1ag11xVnKZjNz4tn19RGqKB
 0w+cIib0ViAyQ4BmPuxXqqyEtjciBJ4B2AendZKQP9x3SjObFVTPJmNq13kjm+oFjQ44GbJUS
 f1xvCpYh4nxfskgLPnk6wlXjHlqPECs9isR0NpZkqCoR7rv1StkBut8tKtbNHEOZPvJrkkyQ8
 RCOmOmQPSSFoKij7LsIY+LnuRztHnzrXkBd0mf9yZhATOoOaXrbqnIe6am3kG0rmnOxdHmb/v
 7wLi8pOwq6mlsA5yuR0NXG4rTibfglrtZFbnfwoxtikzok4RVQu3VdhhGeb85ePBoWBWHeaHt
 dBWFuHhVYD8a/y555FzgLUQv/BaZ2p+KI7ZaGcWsa/5f+tkqBK9AY6JHKT2p2bQlbqvS1wYVo
 nSlOshG8D8NyLV8XGqx9BnGDf3fIEa6QOSKyCrnjH5RmQ+YRt13wNBHWden6peHjeaUaWdHTw
 145YiaaOc/ip3Et2SGQwwsflUr53TcD73++04Oc2+znPxNY0Sbv0qTvThbTztgAxtJume2tMs
 mVIxbh35lE9DkX3Oq2dsRTNMni4z+h98mYcqsbxRz9Iy1z3BUP3dXqeQLJCGiF42QDQl1Xus0
 KkTS2dQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739806305; x=1740411105; i=fiona.klute@gmx.de;
 bh=cgFTLwD2xsspGyWaP2XLBE5m+XgSBz5XrOIIhdLQ1j4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YL49v04fBThzG0D5J//GqvrenyL1MPoRsV0EeQNIyVRzWukHQ9IZrJWCdHWulf2v
 82AuEDjvtQLzxEe724zT3RwZ+21/dSH6WPIk9XEzynu7zYjeK/JZhBhC1wVaoD7a3
 /IjTqUO54OhrIyNhnpc4btPVKQH82t+2CK94Dk7oKGR6YjYys+PQsKIGKqUjf3U4F
 cmZr3wZwsVRJ/Y5wnXYTJEbD6skP1isZb387RzByJy5N43i7jFVyufDGBHIFrCz5A
 R9KPCEa+EgWGiYPWUejrJoUIJ0p9eWJ34owWZHn5gLHfBu036utLQJAXGCU4CLuBR
 gD8tNJVAp/Y+hs3sbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YL49v04f
Subject: [Buildroot] [PATCH v6 1/6] package/nftables: add init script
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

 package/nftables/S35nftables | 76 ++++++++++++++++++++++++++++++++++++
 package/nftables/nftables.mk |  5 +++
 2 files changed, 81 insertions(+)
 create mode 100644 package/nftables/S35nftables

diff --git a/package/nftables/S35nftables b/package/nftables/S35nftables
new file mode 100644
index 0000000000..35b089e154
--- /dev/null
+++ b/package/nftables/S35nftables
@@ -0,0 +1,76 @@
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
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		restart
+		;;
+	reload)
+		reload
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
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
