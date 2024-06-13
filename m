Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D98C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 15:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA9C41426;
	Thu, 13 Jun 2024 15:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkxMC1ZjgRev; Thu, 13 Jun 2024 15:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B611A413B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B611A413B4;
	Thu, 13 Jun 2024 15:59:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB00B1BF341
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3E34413B4
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 15:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbvSO7nTSgL9 for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 15:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C9EA400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C9EA400D0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C9EA400D0
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 15:59:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.11]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1rwh4K22dB-00Vo1w; Thu, 13
 Jun 2024 17:59:41 +0200
To: buildroot@buildroot.org
Date: Thu, 13 Jun 2024 17:59:31 +0200
Message-ID: <20240613155931.3986107-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:uwHyYQwdRDbu88QV/yw6o/7IstVQDUsdC9hTyW9AtkcVu4OITUK
 MquaDa8RwD+mx9wValfpWeP+jbNOBuWpwpD2DBI14+1C70RfQbUHNWYmqGXWZfefgTtppzy
 JXbTzu4zD1GklyyVevzmNstpYeXRbvqK/IMQNDxU2naNf1K3wB4H8LLw6DslfdkM1Mu0tBG
 p0PzL/2IFCveYSqnr56wg==
UI-OutboundReport: notjunk:1;M01:P0:M8uHf1OGNd4=;RbbV3zJJRImxv9DvUeHY+4hjgRR
 dtjWKUiAaFAYJGTk4SCuF1sqpnihhflgTEMxCRpyA+7db0ZDQMeeIc9IEmQnv9oG8gm5QWJ+i
 Ir56+51emuHv1f4FaWNP8R6aiq6p+JYa/0tTflQVKv6gnBiGm9WjE0unKzLghHzFDCzxD0Jpo
 EAFq7N3WfbFkn5C5Ep8e4cJu2hX9G9AAudTpEm8rkUwqYO89/KkWypGzUty08m6r/vUYqxx9w
 r+HtrQXlNwF/ZM8gwQrwNoTSRbofrH+mBalyR0L4+hIT/ADMm26rD0Q1352ZyIfcBB4stJWwL
 +BEXCSLO04T2f14G5Ezyhyw/w474/4EA5fdX5G7nmgdV43cVPyCSFJKj/T2cAoL57xESzzNLW
 3+zgj3YcOANzWI1PlVcHSAZpZ3s6+aWzvmFx7UtaHzZI71Qaa1dyu1oRAqhjDgpxxCgfn3yuU
 yQZw9jcBXDjpZr+yVGDovbOw0dDOHYS+g44S2RdUdKHjjSlp9sUhi1yEzV2pO40fomGBVuAXG
 4oZabXQk0YqkhLu7wXfRL80LWD/Rdxl9ol5smB7rkWKvMYGk2ehdVkTrWw2dTi85RoXuu4dLO
 tfLEMe83uEGGkxTbq0ckIoXfWXilX25ljUEbeiD3xy2bWa6RQErnH57tGBgDke989WNlW1G0a
 CvJWIifgSTTFo4PmjCKnf95r3GDoZEPSLzFFabYAZSNI/R/F4//vCJeTN83jDwqrjNPgwJTPA
 iyPgwsSCP8PysHeoY0e4f+htYsIxkmxKEQEsPVJbb389N8tSn3ppvL6iYl4Zf0IzD5+Vdy8QK
 yMYizky/5+A+Bn64pbmomt5KgNJNRHpentJhYhJ/CMGUc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718294381; x=1718899181; i=fiona.klute@gmx.de;
 bh=I/Cfceg3J5j0XIyJqCG8RooZnVqGCrwS5LHdd266I2U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bdwOxptxG7cOnCrbKte47op30zawq8kZKV+LgDUDOiptJW+WPnrBGUgmm7L6jgg1
 sIwuIcdL//tdY+SpwoqDq7yVo8906vj6uoO6oOfvD3aA3UkJ8rjVAmfZtjlCNlzJe
 pI83XIm7VlURmZ4HDABjKJlkTuFUJqxN7ZCGM8PiJHLQXDF/F0gEAE7oJMshdLWhp
 64hfE1Qh53ennaSAJ0c9M6rZZYQEwGvuh12HDS+rXDfXilY93YQjw0tsj3hga/s46
 x0KPCAEZJSOKtBQ4fDwCZ4aj4P5Dnc7/rzlFPo/YQDRTkwyYJA1KhsN9bX9jsJ2gU
 h4xaicmFPV9DEeDPmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bdwOxptx
Subject: [Buildroot] [PATCH 1/1] package/nftables: add init script
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The init script handles a ruleset file with support for atomic
reloading. By default the ruleset is expected in /etc/nftables.conf,
the location can be changed in /etc/default/nftables. If the ruleset
file does not exist the script does nothing but echos a warning about
that fact.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 package/nftables/S35nftables | 53 ++++++++++++++++++++++++++++++++++++
 package/nftables/nftables.mk |  5 ++++
 2 files changed, 58 insertions(+)
 create mode 100644 package/nftables/S35nftables

diff --git a/package/nftables/S35nftables b/package/nftables/S35nftables
new file mode 100644
index 0000000000..03f7821a48
--- /dev/null
+++ b/package/nftables/S35nftables
@@ -0,0 +1,53 @@
+#!/bin/sh
+
+DAEMON="nftables"
+
+# Main ruleset file, override in /etc/default/nftables if you want a
+# different location. The file should include a "flush ruleset"
+# command to atomically replace any previous rules.
+NFTABLES_CONFIG="/etc/nftables.conf"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# Run only if the ruleset file exists.
+if [ ! -f "${NFTABLES_CONFIG}" ]; then
+	echo "No nftables config file, nothing to do."
+	exit 0
+fi
+
+start() {
+	printf "Loading nftables rules: "
+	if /usr/sbin/nft -f "${NFTABLES_CONFIG}"; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+stop() {
+	printf "Clearing nftables rules: "
+	if /usr/sbin/nft flush ruleset; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+case "$1" in
+	start|reload)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
