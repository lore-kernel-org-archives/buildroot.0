Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DB1C87FD2
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A143283F21;
	Tue,  5 Aug 2025 15:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4k7Mh7sp2-WB; Tue,  5 Aug 2025 15:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A919783F1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A919783F1F;
	Tue,  5 Aug 2025 15:39:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B411A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25FB041B91
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owYdY2UPRpnW for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A8AA410EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A8AA410EE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A8AA410EE
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:39:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9UE-1uT1Jw3gkG-017KNA; Tue, 05
 Aug 2025 17:39:00 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Aug 2025 17:38:57 +0200
Message-ID: <20250805153857.150708-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805153857.150708-1-ps.report@gmx.net>
References: <20250805153857.150708-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Hm0p/u1LuOFBwvKOnj9umID2mtCB7FWPmneI+cY6c28nRSu+m9p
 tcp5ejOliFGApH1LX3kRXXlg/cen4VvQT9BKVlSfHcEkQ+hSQ+fjLukmMq9SNQ9ztrI6njc
 CohHw+UXu8KG/8D0tIWP6cQOszGgNJgaWXrIcgPDrrHNZltVbXsubClyQ9UjDY/XWAzsvYu
 seAr2XWtZFN1PTDztc4ew==
UI-OutboundReport: notjunk:1;M01:P0:148MLtfcs04=;2cWfKBP8S/SbSb+Wx3jLW7m0k41
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754408341; x=1755013141; i=ps.report@gmx.net;
 bh=GMGSKQ/Qj5zeEcw31IqP3ffV1VIHYhWkge8cRrxk0uw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XuceE5K9Iq6zT7pqN8r6Wgr8Ze/lGw2VTZwyD3EEjd9fSKh/eMypKg2s3FKpZnq3
 lS25nZj3cXG8KkwxsbJRSn9eKM4JrKminIIShHyGD/urILz8zcJkLfyxGCHzOaw7P
 xHuc2vs7hpX5df++JlYzXEQytGdVyj3blt7RN3rD8Hl7p2oUCdcTCXcqsfz/a1q1E
 L6ZbU+RFh9E/iApimiYN1dy/R2nOqJDolgPxV45OZh10tKvFWmUfYCC2XK2O8OifJ
 LLS+xwunevgZVpZ3clwn92795HfaLk2xQUA80AIoY43OUwaNMnfIDvWKg7BmqmbHT
 6+H8+H7/0jvy64hoWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=XuceE5K9
Subject: [Buildroot] [PATCH v2 2/2] package/iwd: suppress S40iwd shellcheck
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
