Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EE3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5155B40930;
	Mon, 24 Jan 2022 21:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3o8tIToPO_T; Mon, 24 Jan 2022 21:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 375644063A;
	Mon, 24 Jan 2022 21:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81A611BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C6704063A
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyEHDs3Wbs2L for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:34:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D458F4061C
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:34:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i2so16092195wrb.12
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 13:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=si6lrxgHidh2SXX+uxD/I+1NV9fEsgpqQsMYZ2Pck84=;
 b=EkjtH0qG6Pn6Gn8i9B6IyNzA+o28K06OQWUODFtPypGI6nmqwy0ZRhEkf2eVYL84U6
 Wkpp9uUYlHoXdkMmU3Kwz33nwjdCqURMcvaVBIYZE2XPrcDM9B6qPlJBmcJ13wvsA3Kp
 xJ2qmEHu8aW8uLcb5Mr1FQ03oRBMsMYjceaEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=si6lrxgHidh2SXX+uxD/I+1NV9fEsgpqQsMYZ2Pck84=;
 b=f7nADcPN9iaQzZaSNJn9MMjJAK6QWzMt9vSoCHgyLvSx3MF6t0UrQ9EKyvXeCU8MHK
 Q2C0qlA0WDPbfwVhXsF29Kkxe1MYPzedm3zXDhXr9wHSTbMWmHvWQZ1giQFwcoxdpQJj
 GdKAX/QnM5++6RiBtvip3G5Q0m8EQIS1uybbUhimJdQDnHwOuP994kX0ia72BwVSGZAB
 CjO0cp9ailBwOnPQOzuqfCvKPknnk9xwU3PlnToJA95Lxu64gW8kCCVHrWW77WD8kP9D
 3AGgFM7VucifL/3gmXAuDCiLMgJpYemR+0YAauknFwcbvGhFgmtaIxSmdf4R5dnu2doM
 B6Fg==
X-Gm-Message-State: AOAM533LtUNd7rwal4tlF1FVy4Fc1autcQtmV5IkAUiIUy0vnu8r5xq5
 Uxbn+rBs6bC0nDF/UdaaTRmVyQ9Ka9fX9g==
X-Google-Smtp-Source: ABdhPJwQJttyF/wsaAIaLZKJt4P4HhXAfBY69NNv8EIhw6ipKOoxRaAmVug9zc/6kN7+CCB9BLDnOw==
X-Received: by 2002:a5d:6d8b:: with SMTP id l11mr15909285wrs.234.1643060065926; 
 Mon, 24 Jan 2022 13:34:25 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id t14sm500190wmq.21.2022.01.24.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 13:34:25 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:34:20 +0100
Message-Id: <20220124213420.1171861-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/htpdate: bump to version 1.3.3
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
* Rebased on master
* Keeping buildroot package init scripts

 package/htpdate/S43htpdate      | 2 +-
 package/htpdate/htpdate.hash    | 2 +-
 package/htpdate/htpdate.mk      | 6 +++---
 package/htpdate/htpdate.service | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

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
index 824266c1bc..ef27f8f94c 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 d2cff522b8f53b00769dcca77d8025b19238ed35d702a4739dc05e387f718909  htpdate-1.2.6.tar.gz
+sha256 74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7  htpdate-1.3.3.tar.gz
 sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
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
