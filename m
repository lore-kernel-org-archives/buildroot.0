Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD9CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443B96060C;
	Sun,  4 Oct 2026 15:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_hzGPRZ8-Ey; Sun,  4 Oct 2026 15:55:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4728960612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129308;
	b=ODMQHXPl2LGLPC46dJTojbnOpBv7Gl2KMrIPS6nMaFxLD2AySjnCCsd+5jPz31y/C5A3
	 T8pIEIDXkvt5uf/05dMIU7b+/Z9qz/vr8tpyIcXyT5NcYLNHBPWt5TlHlQrdmdI5SQf3Z
	 jmfK+LIEpGKIOWjhy2oUQiAfC+mgy1OXb7iu/uQil0+VsVHLTdj/OB0fx263FI4+Q9Mzx
	 QlxvGpUAZTCNSdR6mCn7mk6B2mRpD63+tvwvHe2mkQj9ANVe0PTqefvKK1JgnU7vFy7TU
	 HEUeAlWkajmNnP2A7/8XSCq2FjpUonwfVprtyOTOPPiYB8wQJsXXjJURhIF1G/EAkBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CM0BJJeBrNZtrwor646lKAD4vOyJV7VxBUsnvd5zAbo=;
	b=n+x/el3DjV0OotM1Ydvo2UIxeSXZo6YAWNXp8CzUjmaiYhW024m+ZLMhWyWGwwFejad9
	 /GfoINWufb1nUf+1k1Nx215a7F2wmu+CySpMw2B/rOLMCNUnIdpYN/Z0ggj5KmTTTunq1
	 ZavSqzsNYUBGp8tonSfAdg6sJhLvD1cjsjbQvvMJ1cVdjKdZtz+pmY3FHIPOX5XQnYTJl
	 /pTnE9Xnmo3CEdFepiGc5JgF9zuJhRbPlIqJy7hxDopvSC8EMeeI0Num5zDEIOPAM2k59
	 G5OgB9/ggX0jDvGsqJ8J6Qq6MBaIaklsBEwfrdyu5BfJeLrr8WHU9pyfXVeIbJMsOPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129308;
	bh=CM0BJJeBrNZtrwor646lKAD4vOyJV7VxBUsnvd5zAbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=btIynnF6T5jWlKdZDaB/YfkKIiA0oaX/kLDT6m1RxJflTk7p6MLbbFe3iyZCWh2Rt
	 i9U10HEWoVFux0kUu2ukisW0WVEkXNDW4FV0UtbD+y+PZ759CKztT8xRqNwk4viOzr
	 AsgQ8it4fOaG92WgLKj8iKjk8Zchf1tAaP9lXIhh84fJDQoXfhk+jRpYBeGcSPdbUq
	 jGLjf3tmuD+/Y/sgn2FqB2ZBihNdsJYaJwtgHZAw9uU9uri/HLZceFNUF05mr9iEA5
	 8hSJJQ+BXCp31fePPKwO9nZXdx9JyL9JTK8xZkU8PWbNas0enicHSVvt4qzcGFRSUv
	 8d5UNlK7pSiYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4728960612;
	Sun,  4 Oct 2026 15:55:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC3B2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A606060D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhD6QFfq0-Cq for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:55:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F3C6760602
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129305;
 b=MtstktQhmmppJWo3iQ0FbEi/qqYR9YWhlH99Zb2WyJzdb+xBD6hcRmTf/VFiHIBFu6o7
 kLuvdURryT69LbR2WueLNYlY7XqQiKnpS/L+Bpoixl882yPVCQsiPfOOcVqFpFxsvhMKg
 74GbbfFHt5N3xl09zBBj95DD8JI6p7XtGqYbPcEKkFL1c8stAkFUAmSWuACNLD5x1rXCz
 hadnMd6IO58Ljzuvg2jIE/V3Kur6c/muh1a6UU6Dh3gnYpDjwvm4wpRXfiBUAfpqiLM8L
 FyHdxaVhvOJKA0UOBgrG0ER0jHcBnl6qnnA0EYD7yoOid848yCB2rusmPIf2cE/4Ugw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129305;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=19wgpYgqNkte/E0h9dLCrgMtJcEj/yzZcUx4ze3XJc0=;
 b=raiq1YdBCkKlYtiPmk0mYUwZYA1+UEB+95EveKDYasnJ2rffXn9IeabBeRRZVj7W6KPM
 oUXYwcQfjtGkCcp+IOaq+ovxSpiWqbE6EgluoRTMVEbA6lWuCC5TtvNj9y1FXTuv/9DlJ
 mS9lNX3BrcnRy9SEwe6sYiU01x3BStbhZutsARrDBFFIPR2RtxSCOy5a6mXI9eMRYE/Oc
 DdNzYOrcUZBYGiwgS8fvfQ75cxlRwy91DXnpqakLwFHeAm30g+uoXt44Q8QU80aw3wBWy
 o2OBn539y3eOrwC7Yw7kA/qoMBSk3CVr3rAJ6JAtu5DMr4VwycmoEybw+Yg8ucJYxqQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3C6760602
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA7418B6C0; Sun,  4 Oct 2026 15:53:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:54:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab2c02907005727b935cd40cb3c6a4c4f83d3adf
X-Git-Newrev: 42c3ecb29356fef0df652f8e4b231d225a3e5162
X-Patchwork-Hint: ignore
Message-Id: <20261004155349.BA7418B6C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: fix check-package warnings
 in S41dhcpcd
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42c3ecb29356fef0df652f8e4b231d225a3e5162
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update S41dhcpcd:

- use plain "dhcpcd" for DAEMON (instead of "/sbin/dhcpcd"), adjust
  PIDFILE accordingly and while at it use quotation marks for variable
  definitions
- fix indent (tabs vs. spaces)

Fixes:

  $ ./utils/check-package package/dhcpcd/*
  package/dhcpcd/S41dhcpcd:6: Do not include path in DAEMON (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:8: Incorrect PIDFILE value  (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:13: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:17: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:21: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:25: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:30: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore      |  1 -
 package/dhcpcd/S41dhcpcd | 46 +++++++++++++++++++++++-----------------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 95cb5eccc5..a23cb51c77 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -274,7 +274,6 @@ package/dcron/S90dcron lib_sysv.Variables
 package/dhcp/S80dhcp-relay Shellcheck lib_sysv.Variables
 package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
 package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
-package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
 package/dmalloc/0001-configure-fix-build-on-mips.patch lib_patch.Upstream
 package/dmalloc/0003-configure-allow-overriding-some-tests.patch lib_patch.Upstream
 package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch lib_patch.Upstream
diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
index 55794f4075..e52e935da2 100644
--- a/package/dhcpcd/S41dhcpcd
+++ b/package/dhcpcd/S41dhcpcd
@@ -3,31 +3,31 @@
 # Start/stop dhcpcd
 #
 
-DAEMON=/sbin/dhcpcd
-CONFIG=/etc/dhcpcd.conf
-PIDFILE=/var/run/dhcpcd/pid
+DAEMON="dhcpcd"
+CONFIG="/etc/dhcpcd.conf"
+PIDFILE="/var/run/$DAEMON/pid"
 
 [ -f $CONFIG ] || exit 0
 
 case "$1" in
-  start)
-	echo "Starting dhcpcd..."
-	start-stop-daemon -S -x "$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
-	;;
-  stop)
-	echo "Stopping dhcpcd..."
-	start-stop-daemon -K -x "$DAEMON" -p "$PIDFILE" -o
-	;;
-  reload|force-reload)
-	echo "Reloading dhcpcd configuration..."
-	"$DAEMON" -s reload
-	;;
-  restart)
-	"$0" stop
-	sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
-	"$0" start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload|force-reload}"
-	exit 1
+	start)
+		echo "Starting dhcpcd..."
+		start-stop-daemon -S -x "/sbin/$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
+		;;
+	stop)
+		echo "Stopping dhcpcd..."
+		start-stop-daemon -K -x "/sbin/$DAEMON" -p "$PIDFILE" -o
+		;;
+	reload|force-reload)
+		echo "Reloading dhcpcd configuration..."
+		"$DAEMON" -s reload
+		;;
+	restart)
+		"$0" stop
+		sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload|force-reload}"
+		exit 1
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
