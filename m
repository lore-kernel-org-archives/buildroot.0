Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F17C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5E874DFB0;
	Mon, 20 Feb 2023 21:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E874DFB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gUfiQw6O747; Mon, 20 Feb 2023 21:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0924E2AC;
	Mon, 20 Feb 2023 21:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A0924E2AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67D031BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D854261101
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D854261101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7lGlBdbT-x0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D87610C8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3D87610C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EED0D828C8; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 22:11:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1978e9b0219712b2b839d9f44a0b98b2e8280f75
X-Git-Newrev: b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff
X-Patchwork-Hint: ignore
Message-Id: <20230220205154.EED0D828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package: optee-client: fix
 identation issues
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix issues reported by utils/check-package:
    package/optee-client/S30optee:40: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/optee-client/S30optee:46: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/optee-client/S30optee:47: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/optee-client/S30optee:48: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/optee-client/S30optee:0: filename should be S<number><number><daemon name> (http://nightly.buildroot.org/#adding-packages-start-script)
    package/optee-client/S30tee-supplicant:0: run 'shellcheck' and fix the warnings

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[yann.morin.1998@free.fr:
  - fix shellcheck SC2086
  - rename the file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-client/{S30optee => S30tee-supplicant} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/optee-client/S30optee b/package/optee-client/S30tee-supplicant
similarity index 83%
rename from package/optee-client/S30optee
rename to package/optee-client/S30tee-supplicant
index 17e6d6d2b8..8a605dbe5f 100644
--- a/package/optee-client/S30optee
+++ b/package/optee-client/S30tee-supplicant
@@ -7,6 +7,7 @@ DAEMON_ARGS="-d /dev/teepriv0"
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $DAEMON_ARGS
 	status=$?
@@ -37,13 +38,13 @@ restart() {
 }
 
 case "$1" in
-        start|stop|restart)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature (does not
 		# reconfigure/restart on SIGHUP, just closes all open files).
 		restart;;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
