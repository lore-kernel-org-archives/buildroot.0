Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED067C3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8491082024;
	Thu,  8 Dec 2022 10:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8491082024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1MVp0SoQVK2; Thu,  8 Dec 2022 10:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF3682021;
	Thu,  8 Dec 2022 10:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF3682021
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAF031BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B42A040629
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B42A040629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjCn56RVJixg for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDC92401CC
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDC92401CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB00E85E68; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Dec 2022 10:53:19 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 4dda5e28809beb62745715b5c0d5ac57e55c1db6
X-Git-Newrev: 15637d4830e3cd02c3d56cef8ef3c6a3d634c1f6
X-Patchwork-Hint: ignore
Message-Id: <20221208100118.AB00E85E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package: optee-client:
 fix indentation issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=15637d4830e3cd02c3d56cef8ef3c6a3d634c1f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
