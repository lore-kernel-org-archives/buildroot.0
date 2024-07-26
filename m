Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08F6C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D10C60B9A;
	Fri, 26 Jul 2024 16:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs48e9MogdUu; Fri, 26 Jul 2024 16:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9047760BA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9047760BA0;
	Fri, 26 Jul 2024 16:20:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B94881BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A725680B4C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-nVu026UdVA for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D09C380B3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D09C380B3A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D09C380B3A
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:20:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0Ne-1rrTIZ3cHA-00oa5E; Fri, 26
 Jul 2024 18:20:35 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:20:06 +0200
Message-ID: <20240726162013.2183792-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726162013.2183792-1-fiona.klute@gmx.de>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:G3Dv3ruiLOOriXjRRty9R3aSLr4QHMyXoJCkIKsbFW/fLBBOJXZ
 pkVUJV/AlzsK95Bw+Y9zO1DkmVmjTaTHqWV8gBHV+7tJaOKq9r86Ecb2frkwVIOBJyOfgor
 24DbiQDObrGK9YflOyxdszb39NUs0svLUH29jhOZsZ9r8fZycvWjI829RFYAv4Wsyvfr2uc
 jo4soewrrG24eW9fp5POA==
UI-OutboundReport: notjunk:1;M01:P0:5TjFFCbirlQ=;5r6L1Vr+FK/FM2/kdRVnWIj0Lo2
 /mfM+4ZmGL3toN8TMzrSfFtcy2Rjzf5462c7UCgrSfO1iFx+iWRTVYCPJxOczuAUDsVSlBr4l
 +2M7XQ7fITusQhwsT4aKFfDM1L5e4WKDT2Qs66EYATSwTrTQ6QI+v+XG8F2IQkKxCn4SbGrpV
 ln5EbwKBVl5poxLslmkihDd73ZYM7UR2utLoVyCTNmdAMLu/3pw1S4jegg/MMlpQ5zkMHjf6f
 O9+mye3HneYF95DjNW6ZUZ4dffyPZ/45hwPC/VM3AmXYXm9mw/3yc+7pFpzoUHPzwnRWNOshj
 mjpMWo88m8K4iNmE0QNEngC6vSt9UzsjTZ1pGPsc8sY9A5qQQRzC3Jf22j0nlvh6xTuMWiS/C
 zdxtflSlfri9xbuUUWldUxNf55iT3Je9VMRPwhMdrl36Wl2cmLJomVGLQJ7jb3BpIR6MPOHLJ
 qC/KKp9FK0Zzg+HhQIk+3nx1iK+Eyt9TmaDAhw7cOqaDZ3B/RxXGPGgndpqJNspJR1ht1tyIu
 MfUeMPD6QFPXBtVR+8owQHBHEenrBlGC1WgbpMo4u7P/LTA5lvYYvi+vWiyWe5fPQNN5Cg04D
 b55IRYbDV+Gz83oWJl7+VE4wIF5D6fr5sL6xPT+nCyHJSArTuh15bXUfCRqAposgd2eDzOHr1
 O1RJ0ONilkIwDzhNjmXro+QNyvr4BOYXE448aibXeWDt969SYuEbuc3WDkglTsK3frGui6jsh
 cfJ+UJD89nixjWi3non08A6BpUMJU5CxaBi+qA9wwodmQIGDRdAywgVf7a9s1f7OigtVUERNj
 a9o1EVOWJuFjS/0K9L3zLMIA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722010836; x=1722615636; i=fiona.klute@gmx.de;
 bh=p5LzqX0BZlGdwgFcamDhhuFE6ByJ17AQbesBUZOmIh8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BVKuth3DN/rE9cP5HXTQ9ch7qpwr9qDauBOZHwVvRi13z+IzBoGTO0R/M4Vd4TLA
 i4JEjZlToVcUfsDsw6bGpSma5z+WOu8sum8TawLGJwFp7fBxUCJ81MwC6G9pUZC78
 sZA6AFRWW5mbDxVJ4pzbj9nbZap3lP2D+e5ZxcTT5TGpBHrU/k3cT1q5o0kj59FCQ
 aDAJRGx/KiwLeGI9vxKiD12XzrSNbDFGMIpn4dA+dPff5YaZIrYdTxXtqC1oTz7Vf
 wMCJanTmwHSc6a8/usaVLCFB9dyhsMVlsEP+dnUl0ti0f5r1usw33WHTNnwEtvxou
 sIo3QjCORwc/d6Qxdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=BVKuth3D
Subject: [Buildroot] [PATCH v4 1/6] package/nftables: add init script
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
