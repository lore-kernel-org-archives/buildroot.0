Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C75EED609
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 13:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66EF407D3;
	Thu,  1 Jan 2026 13:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3yJfFBrB5cS; Thu,  1 Jan 2026 13:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A48240765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767273883;
	bh=fLywrNWxLr4ovLv2sGHRjhlOmrb2Gbcn46JOecaYX+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LNYbVMKvRNzSFboFD6+phUscXlHsM91Mqr5L03rFvV0gJAJo2CAJhFlnFfON5xoUi
	 JPYEfWNC5+viCRsEgFOJCmGupWHxxTz0+u6vFMjkBhc+duYeg59P/WSUdwtLvvZUvE
	 jDfcu80QulO1FSTOqGnMXTAWrpYxpb2NVONIZ46UIgTaV2PCPPNgjSko7BIWOdd04W
	 /7jEVCqCESc/9RdPz05k5OlceSSuJPtqHLJtBDvsONipRNKo8nY5qHet/zitSxmJNT
	 7NbBOKqhSMpZAi69nsJ73WyRnk35nBTYrqumgCN3oTRgFtp6UkrxDAZK6dc8inRvvg
	 FkUAuEysDEm8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A48240765;
	Thu,  1 Jan 2026 13:24:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E82351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D72A96074D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibeFZYwKrO-t for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 284BA60725
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 284BA60725
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01D7F87D90; Thu,  1 Jan 2026 13:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 14:24:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f51a4752801860fff5749b03d145b6d41e3283b6
X-Git-Newrev: 3e007e27d0da4ea1ba3e8d90779fc5f239ee3e06
X-Patchwork-Hint: ignore
Message-Id: <20260101132441.01D7F87D90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: move PID file to
 /run/dbus-daemon.pid
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e007e27d0da4ea1ba3e8d90779fc5f239ee3e06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes it more obvious which service the PID file belongs to, and
thanks to the /var/run -> /run symlink fixes the check-package
warning.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus/S30dbus-daemon | 3 +--
 package/dbus/dbus.mk        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/dbus/S30dbus-daemon b/package/dbus/S30dbus-daemon
index 3331b11ced..d41aa3b1a5 100644
--- a/package/dbus/S30dbus-daemon
+++ b/package/dbus/S30dbus-daemon
@@ -1,8 +1,7 @@
 #!/bin/sh
 
 DAEMON="dbus-daemon"
-# check-package lib_sysv.Variables
-PIDFILE="/run/messagebus.pid"
+PIDFILE="/var/run/$DAEMON.pid"
 
 start() {
 	printf 'Starting system %s: ' "$DAEMON"
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 061a341363..7b97c7604d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -33,7 +33,7 @@ DBUS_CONF_OPTS = \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
 	--with-system-socket=/run/dbus/system_bus_socket \
-	--with-system-pid-file=/run/messagebus.pid \
+	--with-system-pid-file=/run/dbus-daemon.pid \
 	--with-session-socket-dir=/tmp \
 	--runstatedir=/run
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
