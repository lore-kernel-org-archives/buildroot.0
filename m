Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3D3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:37:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA906109F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DA906109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1603283E69;
	Sat, 11 Sep 2021 14:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7t18TnESVYdc; Sat, 11 Sep 2021 14:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8389180C91;
	Sat, 11 Sep 2021 14:37:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99FA81BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87121607D0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTxXDHjxD5JR for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1A63607EC
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AC3FB8902E; Sat, 11 Sep 2021 14:35:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:27:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f81aa885de833805999b168465042071ba831ad
X-Git-Newrev: 7b7be053b8b6f763b54a662020e84edc3b202d2b
X-Patchwork-Hint: ignore
Message-Id: <20210911143551.AC3FB8902E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: add sysv init script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b7be053b8b6f763b54a662020e84edc3b202d2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Same start order as mrouted, start after networking is up.

Custom command line options, like startup delay, or disable multicast
routing by default, can be added to the optional /etc/default/smcroute
env. file.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/smcroute/S41smcroute | 48 ++++++++++++++++++++++++++++++++++++++++++++
 package/smcroute/smcroute.mk |  5 +++++
 2 files changed, 53 insertions(+)

diff --git a/package/smcroute/S41smcroute b/package/smcroute/S41smcroute
new file mode 100755
index 0000000000..bdc0f87645
--- /dev/null
+++ b/package/smcroute/S41smcroute
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+NAME="smcroute"
+DAEMON="smcrouted"
+PIDFILE="/var/run/$NAME.pid"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
+
+cmd()
+{
+    start-stop-daemon -q -p "$PIDFILE" "$@"
+    status=$?
+    if [ $status -eq 0 ]; then
+	echo "OK"
+    else
+	echo "FAIL"
+    fi
+    return $status
+}
+
+case "$1" in
+    start)
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	cmd -S -x "/usr/sbin/$DAEMON" -- $SMCROUTED_ARGS
+	;;
+
+    stop)
+	printf 'Stopping %s: ' "$DAEMON"
+	cmd -K
+	;;
+
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+
+    reload)
+	printf 'Reloading %s: ' "$DAEMON"
+	cmd -K -s HUP
+	;;
+
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e4ee81db6f..9cce0acbbc 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -19,4 +19,9 @@ else
 SMCROUTE_CONF_OPTS += --without-libcap
 endif
 
+define SMCROUTE_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/smcroute/S41smcroute \
+		$(TARGET_DIR)/etc/init.d/S41smcroute
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
