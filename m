Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4BBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95CEC60B25;
	Mon, 24 Jan 2022 21:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZD54-N05i8-T; Mon, 24 Jan 2022 21:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6DB460F29;
	Mon, 24 Jan 2022 21:59:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 065951BF215
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9ABD408E3
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lm66A7bENCmK for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:59:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBA34402DC
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:59:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v13so16163208wrv.10
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 13:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kaMOJ5sW6kXmi9K+OHV8Nk/HT4q29d9f6CdLhG1OZo=;
 b=lVuNt7BMeuaPn2v6vu6cNexSTNvuuwA+EkZaSNXr/MOdV2sk2Ue7PsFSgw4gciyA0D
 iSDhAUbeaKXatkUaWoyqN9H430WDwymHyN5X8PTDvIUzGz6j5iTXhF/51l1VT30fZsRF
 /2ToiLliYDTRTpNbhpkzZx8ZZD/U/sngSxJlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kaMOJ5sW6kXmi9K+OHV8Nk/HT4q29d9f6CdLhG1OZo=;
 b=6DWciZeTlc2xGZu0IgRO5cM26Dgo19uyFBpTql59drjosdAPqQfO1MxA6l60ccU3hr
 PxJu1M3uNgbQEKTbEkbefgP4BuFO58wkpSWOvxI1eHwTfk8gWExUBy6pRaxk3XXigO/c
 lZqNy4/kBT49lvK/cBG/WS1QRmLhdpMjYUYRGI3ShN21yGpkH53Ce6tign18Fb0fcXYN
 2NlUP5K4yYGt5Lu4brLBdtBEo8JzD6tLnCY5VM85x4qvpA74QB4GL7oQxfs4FXdAwYmg
 jsJOmeZEjhqae5VcVYEmivcCWRe6/XAuQOJDl/kb9UI5Q/nBgV5QZ9VdUoqy3jmCDOkx
 p7AQ==
X-Gm-Message-State: AOAM533w2V0a3KOiQ8x+I/lDNCneGi+Mnx9xr6QoMx02byfaH7YvBgpB
 B0y5i3vuJDOuCLBmZuTbVBTF0hmmq75XCQ==
X-Google-Smtp-Source: ABdhPJzWP7ipZGrwtR+9RFTfNGIkUXaA41JFTlTFYdjW7esbbI+dES0hkGp0b4Vt04/yQXXXT5rHkw==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr15563960wrb.474.1643061548113; 
 Mon, 24 Jan 2022 13:59:08 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id i6sm10853036wrw.8.2022.01.24.13.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 13:59:07 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:59:04 +0100
Message-Id: <20220124215904.1200436-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/htpdate: bump to version 1.3.3
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump and update project to its new location.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1->v2:
* Rebased on master
* Keeping buildroot package init scripts

v2->v3:
* Updating LICENSE hash

 package/htpdate/S43htpdate      | 2 +-
 package/htpdate/htpdate.hash    | 4 ++--
 package/htpdate/htpdate.mk      | 6 +++---
 package/htpdate/htpdate.service | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
index 75f9a995ff..5971d70639 100644
--- a/package/htpdate/S43htpdate
+++ b/package/htpdate/S43htpdate
@@ -9,7 +9,7 @@ test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
+	start-stop-daemon -S -q -x "/usr/sbin/$DAEMON" \
 		-- -D -i "$PIDFILE" $HTPDATE_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index 824266c1bc..6876f2da51 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 d2cff522b8f53b00769dcca77d8025b19238ed35d702a4739dc05e387f718909  htpdate-1.2.6.tar.gz
-sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
+sha256 74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7  htpdate-1.3.3.tar.gz
+sha256 7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 52022346a9..200c3207a2 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.2.6
-HTPDATE_SITE = $(call github,angeloc,htpdate,v$(HTPDATE_VERSION))
+HTPDATE_VERSION = 1.3.3
+HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HTPDATE_BUILD_OPTS = ENABLE_HTTPS=1
+HTPDATE_BUILD_OPTS = https
 HTPDATE_DEPENDENCIES += openssl host-pkgconf
 endif
 
diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
index b7f1371b08..95220581d4 100644
--- a/package/htpdate/htpdate.service
+++ b/package/htpdate/htpdate.service
@@ -7,7 +7,7 @@ Type=forking
 PIDFile=/run/htpdate.pid
 Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
 EnvironmentFile=-/etc/default/htpdate
-ExecStart=/usr/bin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
+ExecStart=/usr/sbin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
 
 [Install]
 WantedBy=multi-user.target
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
