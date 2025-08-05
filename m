Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B4CC87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 17:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D491617BC;
	Tue,  5 Aug 2025 17:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lth4x64X5dhs; Tue,  5 Aug 2025 17:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B5E60F06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B5E60F06;
	Tue,  5 Aug 2025 17:16:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67835233
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5897783FEB
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQSX0vUlHWHA for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 17:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4629D828DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4629D828DE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4629D828DE
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 17:16:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1uXfZt0nHJ-00yLJK; Tue, 05
 Aug 2025 19:16:08 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Aug 2025 19:16:02 +0200
Message-ID: <20250805171603.1296472-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805171603.1296472-1-ps.report@gmx.net>
References: <20250805171603.1296472-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:QwG5q3/8dCNaW/fqeMCSp04qPUPijXh2nB5GfBPBevJQxi/Y0Mm
 VfpcuNC1u0BTZSxo5TPnSJfbJnVJpMUMmGhDOiW59hhax1I1ZVpuIOW1Ok7bjBci5A8qtwO
 bPKHDoxHWrDW0AGRrqU72Fq/dRM5YTySF51e8AsIQLmfUMuDARdhZ1rBcNUV2A40Lv4ismh
 ja+6X6BOQnzhMJJFAWSKA==
UI-OutboundReport: notjunk:1;M01:P0:jH7EgeQpZ8k=;I+L6QMQfBIUYDLa9aITOHPGKzUY
 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
 cg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754414168; x=1755018968; i=ps.report@gmx.net;
 bh=tv1NA6NHc4inny0DyBa3WiIRI8X9zgRbPXyGlZ5PW8k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aDhOFAJnxVORWHUKwa/TILqAyWc+3I+vyU69tO/I4cIK/TFygigX71/bNuE5efnI
 MhjmqQwhaU4DEXTXCHbQdDSGo2WZp0HB/sghfN1fmH4eKuF7Y60dd1ikG4aTCGdeo
 Xi01bImV2aKINi7kxnsaQ3vNacmZzG3lgMM/D0RM+64RXano3AvI0KUk6fCT0gp2x
 q9dEEpB5K4qiMZr3AiDQME1mmKzUnSqeEzJqfA6Z/FqNovzhWUIixkrC+kRAA1Tzz
 VaVeW5WlYUPExBRlEO6lU16YlgWbxFxzS2Vuo1NCe45t1OHJlrt8ta8mtfoIoQKQD
 zyWj7XnIfPqYD3hkbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=aDhOFAJn
Subject: [Buildroot] [PATCH v3 2/3] package/iwd: suppress S40iwd shellcheck
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
---
Changes v1 -> v2:
  - remove 'git squash' leftover line from commit message

Changes v2 -> v3:
  - move 'shellcheck disable=SC2086' line to where needed
    (suggested by Fiona Klute)
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
index de5a1efb6f..1a2d0e9780 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -5,11 +5,13 @@ PIDFILE="/var/run/$DAEMON.pid"
 
 IWD_ARGS=""
 
+# shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	mkdir -p /tmp/iwd/hotspot
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon --start --background --make-pidfile \
 		--pidfile "$PIDFILE" --exec "/usr/libexec/$DAEMON" \
 		-- $IWD_ARGS
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
