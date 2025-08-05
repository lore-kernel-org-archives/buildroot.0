Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7A1C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 06:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37DFF615F5;
	Tue,  5 Aug 2025 06:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnXarAxxIGSh; Tue,  5 Aug 2025 06:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66F1B615F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F1B615F7;
	Tue,  5 Aug 2025 06:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C777233
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE753615F4
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpBw1hk7_uJF for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 06:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA495615F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA495615F7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA495615F7
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 06:32:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7KU-1uuhnX3ET4-00FOOR; Tue, 05
 Aug 2025 08:32:01 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Aug 2025 08:31:58 +0200
Message-ID: <20250805063158.94884-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805063158.94884-1-ps.report@gmx.net>
References: <20250805063158.94884-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8Rj5zJ0zDNsw30BbjAgbFRfCU4lbBMfs/S5uWIatqSNVa0p6cDV
 zdBpVmEVCyj9N7EVVpcPIo5J+k0TjtLjbyLsGCXk50bGCB3svTWsROdu5Tgv02njYD3V1OT
 H3vqJy1PVc8Z5nVsLmcYoYqZpFUoXRy4ELabcNrXtFRtZxCWk/hTonyInE2v6wcpM+JCypL
 GiN/pKdwmsHGGBaigj98A==
UI-OutboundReport: notjunk:1;M01:P0:yay88DDe4uI=;5+I+jdbyPX3YuRDO6vR2V5P4BQM
 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
 15zeywCC2fYH+TVR8PEcfsw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754375522; x=1754980322; i=ps.report@gmx.net;
 bh=cdtUZTuXcSznI07t2V8sHpBdW79z+YWCpGUTPda9DE8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pqhddDD8jbpWDekADilU3zDPgjUiu/DWSET8iEDQm08/HRlHsG4MOShIyj0wDedG
 72OHzalclVqYdsTMb0+SlWRhn2UzsoXcI7h5LeDbbagBOcXFcShpMn01YNFJ91Ldi
 +l+agsPwqTKEHWlLmEjbFv13mWmcNPHW3Z8pUg3Y+clPCncgFUX27LsqEN+F4WnYO
 Vpq5UcAtz3F00vUBm/iptulY0uZXWzjO3x5hCIPu8TfTQsZ0STgVntzBzhV3RgdlJ
 nyW7NF/t7jhWlc9DXawPUKH2RCgUd6YkB0mD0sua+9JL5EBi7Mu3urAcI3+55lo+0
 S984jxmcmyrrbJcyGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=pqhddDD8
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: suppress S40iwd shellcheck
 warnings
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- suppress S40iwd shellcheck warnings:

  In package/iwd/S40iwd line 8:
  [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
                                     ^--------------------^ SC1090 (warning): ShellCheck can't follow non-constant source. Use a directive to specify location.

  In package/iwd/S40iwd line 15:
  		-- $IWD_ARGS
                     ^-------^ SC2086 (info): Double quote to prevent globbing and word splitting.

- remove package/iwd/S40iwd from .checkpackageignore

Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Fix .checkpackageignore
---
 .checkpackageignore | 1 -
 package/iwd/S40iwd  | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7697fd2ea1..7a5260b1b1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -584,7 +584,6 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch lib_patch.Upstream
 package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch lib_patch.Upstream
 package/iucode-tool/S00iucode-tool lib_sysv.Variables
-package/iwd/S40iwd Shellcheck
 package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
 package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index de5a1efb6f..33e7fb7f4e 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -5,8 +5,10 @@ PIDFILE="/var/run/$DAEMON.pid"
 
 IWD_ARGS=""
 
+# shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
+# shellcheck disable=SC2086
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	mkdir -p /tmp/iwd/hotspot
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
