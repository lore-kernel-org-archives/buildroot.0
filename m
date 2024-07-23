Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4949BC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A94C8128C;
	Tue, 23 Jul 2024 10:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGe_29LorTao; Tue, 23 Jul 2024 10:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76126812B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76126812B4;
	Tue, 23 Jul 2024 10:29:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53A2E1BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E708607E3
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVzudkauus4F for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:29:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FE3F607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE3F607E9
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FE3F607E9
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:29:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1srm9H1ZGE-00HpVo; Tue, 23
 Jul 2024 12:28:53 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:28:26 +0200
Message-ID: <20240723102832.2522307-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723102832.2522307-1-fiona.klute@gmx.de>
References: <20240723102832.2522307-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8k6QZUS6pgg0eALvS810gLIqbloZ4UKFPBB9MDQ5Oz0t79nurCd
 2vGq4yJMEL9hB8NkFQTTD+1Z8eYjhaYe+lCWvFjB11U43hzf9NhXfIKRd/ZDaRQbZJzOW4x
 cPfr4XWGZLUnI+R7CV/+83seJGSXnUYVUGvBivJO83D/LjPFMwMhnhy5ubMC5nzQq+s+bFh
 QxFhccdhYfM8/4iNrM34w==
UI-OutboundReport: notjunk:1;M01:P0:seB0TPMWZpw=;GXGcZjyJ8O4wJwaPwbQjM3+pPxO
 7Pz6WfpfYxfeTMVIU5bg+hiHM8VS0SHx/6HBxcrAgWKLCi1/XOph1g+8LkoAVxWYnqArEHUHb
 Y6rbxPoFNK7LJIbOEtCwAVljfrtgB4g5SuwI03KPJeNF/8zefsPM6N0wHIn050PEi3D5MJuGs
 3ggpAkwlr/mRz7E9U/YIFW2lfEVcgDz91X6g4BKEBPiNy5cXzhsu6ipKEI1VWOw/9jNTBOLXv
 SgWPp3XSSLgDnm9pbzGFzVzBT8GMNtY5Z+0xw5mx9g0HG8wmKL2YOwYL/ZdMXD+jckvErcEti
 TQn8Rn5YNmbHWimyyciPRETyTIFkqynuO3SXtom2THM+GMXf43k3cY0xJREZujqbA2j/k1/mq
 A2WaXPrqs2ueVm7giKve3Q8YMist5q8p/KV9rdZhgmk3jDuLtXBvv4zZkL7Vo5N9HDRL3Gr5d
 1YCtmjbGgIvNpZPNgJKXS7OvaC5u1ZmbhyfWPDA0pWm+0MAG9KFJw4iMufnMyg4HUu1As+pQ+
 uXaBGigd8hacNLU6guC0xZlkOwCQGYSN0qmGhy6f6s1QHKh57Pkqybq/9E0kCNnNsjWPCNeoc
 5srRfI3K9faQinicb/t8k36VoQVUtYW8LZeg9k5puGj6oivdlNa3jRvPOjapiwwk7OKMYyEZu
 eu/Ssc0IxI83P8JhIAHZws/TZFxO2rLJRVwT62qmMPaxEgPmTjTbydIrBLR6OAReqNmt884uO
 UZPB92KbJops45ENe//mzGmeuxNxdD5yIV7ROisv5RBohh8LxaJmo8z7Gk59sN8AAzZcSl230
 fVMLHlxPbJswsMeI3314sOmA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721730533; x=1722335333; i=fiona.klute@gmx.de;
 bh=p5LzqX0BZlGdwgFcamDhhuFE6ByJ17AQbesBUZOmIh8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Lbw+wmXXpfPSBUJlfm55InXWZSfEYwmirhRGny2TW7go7P33awGIZayWUvoSqyX3
 IfXMNxhpaKo078Kebflpf6kIwK3r3yT15uUDNbHzHnAxZfaTLka/DaZ948xKukI/S
 je1biIgpTS9CGrZrizfu+DgZPD7yxuSVUoFFi3/2LuQsZzdZcl2O0p8W+5oDUsVY9
 WJv1bIkl7rJ6wYlKSf0nwHHfdMnHpEXY8nTDIbHD4sWDnsPHjAGCScvtulAkgnbD9
 VorNq0sAPxyUviCG41xPpw55uwM011FQfqOuyUaIUHOgqJFQPx9x2qaBpUC37wHEM
 t1tFOmpychNS88Y02Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Lbw+wmXX
Subject: [Buildroot] [PATCH v2 1/6] package/nftables: add init script
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
