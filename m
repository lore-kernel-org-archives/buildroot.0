Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 02:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3F6460681;
	Mon, 22 Nov 2021 02:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPRda5FSztCE; Mon, 22 Nov 2021 02:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1317E605A1;
	Mon, 22 Nov 2021 02:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31D0B1BF83E
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20C944037A
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJZ_6X0QT2Ez for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 02:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01645400C1
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 02:08:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f18so73539764lfv.6
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 18:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bmDBMXFbSCc6p07aW0KuchAh5hWInSSWQiwBT5rZdCs=;
 b=OJKDU6Q0Bsnd8nseIRSG/ScvOgOeXZhVfcmdUqvdi7hHioDLkb6CjAAm2naxGHlafV
 bhz/ZI7J8jJho4AZwQYQbl0d5C1mSOoiQTkhekWO83bp44ltf4BPaG8M3eP2MzCG3HRI
 7/7BlSYVI9fO0w2pnMH48/MNA6hb65TeBV2H0/smxn5msdkfX6KxiDWcuBaOh0f80oFx
 zjpkmPcttWydWCyt9ZJor3kKW/1MK6d6Y03juPRbTU91RZXgCfu8BKzgNcygy6gV/9hG
 bNi7FfDFcqDLDmp6qx+TFEJOHd1G37GpTqZ9jx3wzlxAjiNQEXxRGOkWC9fOPFfXVkTP
 tfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmDBMXFbSCc6p07aW0KuchAh5hWInSSWQiwBT5rZdCs=;
 b=g9cKuQ4uRyqZkwTvNz2J4AWpQjshdGOG8NYZD5ObyFb8YseGyG3Yq/03Cevjr8GlYF
 0h1OqAgl4BwDzo3piRyjKjeVN8KJEmDnhwURMeiJTuY7B5OXKu+KPFlzwkNe/4bYXmBL
 LVrmxLw3ZInEtQe948tJwcpiidhtGr6d1vtTmqcGyLezpTxIhEXg+RFIWXF/1jsnkcFg
 1bC4GoJ5+EgLuSqZHtrqhn8Dj4a/ffRLOQvRCRepN3XC59UFXckHC9IXK6NIrRznrtri
 BDBe11y6lraAA56jBkLUL4/cHRk0GNxBDWKbtIcF3mmj+JEVJNezvd1AsQxJdpivFDpz
 +liQ==
X-Gm-Message-State: AOAM532umY0h6vh2np2P4cP0DTI0r6H1e5pQpOvSIvMO2vqkdq+mp+de
 7KGX4Jfu9duA0IFR5rmFdRUrwfRqDJI=
X-Google-Smtp-Source: ABdhPJwwRlNOOyOVwD2QbuHvZdRV7DOFs1Z9wXXZ6KDAzm7DPih/teIPQIWq3/vNgyjW58Fnz78rLg==
X-Received: by 2002:a2e:a596:: with SMTP id m22mr49697118ljp.342.1637546896921; 
 Sun, 21 Nov 2021 18:08:16 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id h19sm788120lja.71.2021.11.21.18.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 18:08:16 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 03:08:03 +0100
Message-Id: <20211122020804.535891-5-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122020804.535891-1-troglobit@gmail.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/inadyn: refactor start script
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is a complete rewrite of the start script, reducing code
duplication by using a helper cmd() function and adding support for:

 - INADYN_ARGS that can be overridden from /etc/default/inadyn
 - reload command that sends SIGHUP

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/S70inadyn | 85 +++++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 36 deletions(-)
 mode change 100644 => 100755 package/inadyn/S70inadyn

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
old mode 100644
new mode 100755
index ca7b414678..1eab33b5fc
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -1,44 +1,57 @@
 #!/bin/sh
 #
-# Start & stop the inadyn client
-#
+# Note: must be explicitly enabled by adding ENABLED="yes"
+#       to /etc/default/inadyn, which also can be used to
+#       override the default INADYN_ARGS
 
-CONFIG=/etc/inadyn.conf
+NAME="inadyn"
+INADYN_ARGS="-s"
+PIDFILE="/var/run/$NAME.pid"
 
-# check if CONFIG exists, print message & exit if it doesn't
-[ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )
+# shellcheck source=/dev/null
+[ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
 
-# Allow a few customizations from a config file. Especially inadyn
-# must be explicitly enabled by adding ENABLED="yes" in this file.
-test -r /etc/default/inadyn && . /etc/default/inadyn
+cmd()
+{
+    if [ "$ENABLED" != "yes" ]; then
+	echo "SKIPPED"
+	exit 0
+    fi
+    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$NAME" "$@"
+    status=$?
+    if [ $status -eq 0 ]; then
+	echo "OK"
+    else
+	echo "FAIL"
+    fi
+    return $status
+}
 
 case "$1" in
-	start)
-		printf "Starting inadyn: "
-		if test "${ENABLED}" != "yes" ; then
-		    echo "SKIPPED"
-		    exit 0
-		fi
-		start-stop-daemon -b -q -S -p /var/run/inadyn.pid -x /usr/sbin/inadyn
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping inadyn: "
-		if test "${ENABLED}" != "yes" ; then
-		    echo "SKIPPED"
-		    exit 0
-		fi
-		start-stop-daemon -q -K -p /var/run/inadyn.pid -x /usr/sbin/inadyn
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		rm -f /var/run/inadyn.pid
-		;;
-	restart)
-		"$0" stop
-		"$0" start
-		;;
-		*)
-		echo "Usage: $0 {start|stop|restart}"
-		exit 1
-esac
+    start)
+	printf 'Starting %s: ' "$NAME"
+	# shellcheck disable=SC2086 # we need the word splitting
+	cmd -S -- $INADYN_ARGS
+	;;
+
+    stop)
+	printf 'Stopping %s: ' "$NAME"
+	cmd -K
+	rm -f "$PIDFILE"
+	;;
 
-exit $?
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+
+    reload)
+	printf 'Reloading %s: ' "$NAME"
+	cmd -K -s HUP
+	;;
+
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
