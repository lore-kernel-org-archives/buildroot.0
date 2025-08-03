Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A8C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 15:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FF66100B;
	Sun,  3 Aug 2025 15:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtF0IZcGJXQp; Sun,  3 Aug 2025 15:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3A26101F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3A26101F;
	Sun,  3 Aug 2025 15:48:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A53FF1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85A0240430
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBKgBO3dqIYK for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 15:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B817840967
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B817840967
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A587E86E1F; Sun,  3 Aug 2025 15:48:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Aug 2025 17:44:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3569f03fc13763247d4a4c2c44fee26ad9b2be9
X-Git-Newrev: 0343f03ce496b16b775859c78664425be6278aa9
X-Patchwork-Hint: ignore
Message-Id: <20250803154839.A587E86E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: fix S40iwd check-package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0343f03ce496b16b775859c78664425be6278aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix fix S40iwd check-package warnings:

- package/iwd/S40iwd:3: Do not include path in DAEMON
  (https://nightly.buildroot.org/#adding-packages-start-script)

- package/iwd/S40iwd:4: Incorrect PIDFILE value
  (https://nightly.buildroot.org/#adding-packages-start-script)

Since this commit fixes lib_sysv.Variables check-package warnings
in S40iwd, this commit also removes the .checkpackageignore entry.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Julien: remove lib_sysv.Variables in .checkpackageignore]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore |  2 +-
 package/iwd/S40iwd  | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4591ff173a..7697fd2ea1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -584,7 +584,7 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch lib_patch.Upstream
 package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch lib_patch.Upstream
 package/iucode-tool/S00iucode-tool lib_sysv.Variables
-package/iwd/S40iwd Shellcheck lib_sysv.Variables
+package/iwd/S40iwd Shellcheck
 package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
 package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 6714ca9956..7858ff3e42 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -1,16 +1,16 @@
 #!/bin/sh
 
-DAEMON="/usr/libexec/iwd"
-PIDFILE="/var/run/iwd.pid"
+DAEMON="iwd"
+PIDFILE="/var/run/$DAEMON.pid"
 
 IWD_ARGS=""
 
-[ -r "/etc/default/iwd" ] && . "/etc/default/iwd"
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 start() {
-	printf "Starting iwd:"
+	printf 'Starting %s: ' "$DAEMON"
 	mkdir -p /tmp/iwd/hotspot
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "$DAEMON" \
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/libexec/$DAEMON" \
 		-- $IWD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -22,7 +22,7 @@ start() {
 }
 
 stop() {
-	printf "Stopping iwd:"
+	printf 'Stopping %s: ' "$DAEMON"
 	start-stop-daemon -K -q -p "$PIDFILE"
 	status=$?
 	if [ "$status" -eq 0 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
