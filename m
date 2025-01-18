Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A430C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 13:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E9960662;
	Sat, 18 Jan 2025 13:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmtdnn3nOM6g; Sat, 18 Jan 2025 13:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5EA560638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5EA560638;
	Sat, 18 Jan 2025 13:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F59A2F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F117A403B4
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mP0erbppdzYQ for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 13:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71FB540362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71FB540362
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71FB540362
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:37:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.213]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1truMJ0khY-00W5Fw; Sat, 18
 Jan 2025 14:37:47 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Dimitrios Siganos <dimitris@siganos.org>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sat, 18 Jan 2025 14:37:40 +0100
Message-ID: <20250118133740.4001841-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:/kd4XpP44CDJ4GLTB3hIsEzdtNbOjoOV4UVuhBUog3XFU9jmFCC
 hT0cqhy5cuvhMw5xDZ+wftCalkiu/B696YmkCkEm5tKagXU1oVzpwFjZbtV5rsyglBrWsCr
 gBCCmh9Hf/339cOL8Jw1J/THzfNrGf3thSu6pHZ/muKqxRz/W9CA2ojzfsXM/FJWpmKil+g
 oB4GzFKbX4hQgHLLkuwDw==
UI-OutboundReport: notjunk:1;M01:P0:VTFon8vtYzY=;A5/4s/XtIRmmPILp9RwABjbgfcJ
 TSFCV7HEwkeTUW4v8RhupDRLP3DyvdLq2/FeOnvZPu2230cb3HHVOYbRcQN2kOmtJoCt+B+fD
 JHcusJK9y9AAIfxSEGc1qL0KuaQDaeIIi/yw1buHXZ4Gj6XaDGL5b7FwZtYsnE24MkFX1HXqJ
 KAmof0ImTgv7xiewRzWzxd2uegKE77JMebEuR1tYa3N5KdJs2Rj2UsbU9li9uBjSdVU400e5h
 pfftkCcqWfXvam+NYhBOiuH7aafw3xekiNRvuZOOEEFaIMdliJxzK0WEYgRikoHU1l59AkNQ/
 wEQHRzQ5HPydmQ73guS4HEN1jVNhuJwfuzOkLFg58dxpBspQlSOurkUGjKqjJhPY0gw0HHmDh
 pz+VF/NnvRocMyJhksdLPDz9ly0hsf9EKSlRhfFJB3sCQnr36sojyeF1GI7MmrAZPWdJnOvYQ
 1PgB4VxCZh0e908PJUCIStuLfyzih5R7gyiurs6GR4gE5jP/j8jU2aVb88sbwK+8xj49khN4b
 8ET1ikArQDwDHzH5rupcRiwW2AtRDRBJ3PdRy6STqYOr8KAAUrr6zJqwLyNdyxkjY2hFBgPdH
 2AtJklJXIHi18H3XQjTLeuU/8l//epXlWtB3uCt1zHzl0sGFOLthHzOq7xGYN/WsIi/mm+bnk
 sP+d2v7qXaFzbUR0KJjtQC1/LfRzfYVbcBlFFX/MFQhIllVV/xmpzjHI4sFZxMaACSFsqHENP
 uNYx5Bm+yYsTalupWiTHMFBRcOX82ARXfD7X7/Dtl+yO2fn0ULOW+Tibmtevfjq21YJbQsckG
 UHEeRFNHWP1Oii63PlV71J7afOpGnn1cFQwUWPEDvTxarejDgGeRCmEx/7/m/TptHdG26WGsU
 9vpLwk94Gu4qLN+jb7qj9uQNu8bETjo2bUaZqRTD+rlm7rm4cP9YnR4tYJEmApPNEVsFtNCdw
 3e4Ylay8NwOwx+Mfyo3k5/ySbcYI+uJSFoqB9g8uTP6l9oJD18jBeEc5KJh9Ee8h7GjnzGLnJ
 DfcrRPW9xQM8mh9+JSMJsrjEK3u4bFmOvL2knJcvNVG853hRkemzNvrvnGhcw0cVHFLENwLjf
 bNWujyF9M0jB8aefQzHPHH4UFXj4YBh5bUswYvk9+PKZgRotNZDwBPyN3kuqIxSEDITHvXWUo
 CJyRPENcs4GB+vpH3xUqzfinQ6sfjx6dKdE/+qdruGQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737207467; x=1737812267; i=fiona.klute@gmx.de;
 bh=VzgHArxeS28PrtjN3s3VUbdYObgBR9LNuRDfmgc0oRw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tj4uYS1otj5PQqCuIA3e4oEO1Phk7RXKUr6rFSlJ1RnN99IPyFTIBHyMGWuBPPoR
 kcTdyHN2sUW/uXLOluI96vlp1H6R+wXMn/BAMbvQRqOp6Vowf+3oEkFnUxmnAlPYz
 uQpawCdN2NFfZHp9O0YSQaexVyR+lpQBQNZi3kC6amoo1wNWqajSRxbnZ2PWSW/7+
 y+KT6nziiD8vEV8bi+Qu8zzgTDXC2ds+Y9HtfxZJsWUZeqrWeCsyKAVPpRW8kwLcJ
 qAU2Qum9AgTmdf4VarWbGTH8p3UyKN/61culO/st5spPCvUiCwLaTPgQZaKjqLs00
 oKm9F6z0Dp0of/BOPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tj4uYS1o
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: sysv init script to
 set regdomain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This is useful when the tools used to manage the wifi interface do not
support setting the regdomain (e.g. NetworkManager). As long as the
country code is not set in configuration the init script does not
change anything.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
If this doesn't seem relevant for Buildroot please let me know, I'll
move it to a local package then. On the other hand, if it's merged I
could create a follow-up to allow setting the initial regdomain in the
config file from the Buildroot config.

 package/wireless-regdb/S35wireless-regdb | 39 ++++++++++++++++++++++++
 package/wireless-regdb/wireless-regdb.mk |  7 +++++
 2 files changed, 46 insertions(+)
 create mode 100644 package/wireless-regdb/S35wireless-regdb

diff --git a/package/wireless-regdb/S35wireless-regdb b/package/wireless-regdb/S35wireless-regdb
new file mode 100644
index 0000000000..b7bdf3b351
--- /dev/null
+++ b/package/wireless-regdb/S35wireless-regdb
@@ -0,0 +1,39 @@
+#!/bin/sh
+DAEMON="wireless-regdb"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+if [ -z "$COUNTRY" ]; then
+	echo "Wireless regulatory domain not configured, nothing to do."
+	exit 0
+fi
+
+start() {
+	printf "Setting wireless regulatory domain %s: " "$COUNTRY"
+	/usr/sbin/iw reg set "$COUNTRY"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|restart|reload)
+		start
+		;;
+	stop)
+		# set "world" regdomain
+		COUNTRY="00"
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
+esac
+
+exit $?
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 2aec19c507..930addb7c4 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -27,4 +27,11 @@ define WIRELESS_REGDB_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/lib/firmware/regulatory.db.p7s
 endef
 
+ifeq ($(BR2_PACKAGE_IW),y)
+define WIRELESS_REGDB_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/wireless-regdb/S35wireless-regdb \
+		$(TARGET_DIR)/etc/init.d/S35wireless-regdb ;
+endef
+endif
+
 $(eval $(generic-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
