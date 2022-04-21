Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05526C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 06:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89FB4831BD;
	Thu, 21 Apr 2022 06:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gI9s7KA094b; Thu, 21 Apr 2022 06:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E37683089;
	Thu, 21 Apr 2022 06:30:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 304331BF343
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 06:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F2EB830C0
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 06:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhMHcAhinO_l for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 06:30:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44B5C83089
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 06:30:33 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id y16so2451794ilc.7
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HVGlEQgUuDYC5bx+BChdNUNA+M12SfFr+XIyl8lfDU=;
 b=CRPOl5IsrXDHTtmoe3yb/LtQNALDqsrkAa6TGeYtID5iAxfJIWASIu8FskB9lkI7oV
 QAGOKwBw3lySoGJYMRjPH11e80TeCY9KpalmX7rrHBdU856bdz1BD9FeX4T9O50lQ7g9
 HNWjsYV0Lv+UkjAyQ2wHLetxXw2TvamPK0bRvdmTbySNHeLVI7MJvukYnsc22uwZy2s/
 HwNk9oMkNta5pRauPv+z/5qKondE9UYR51LpN5nJfik4M+gV6tm20eHQTYElC6lHUI21
 EwQ/3q2dLIoXFq28nykSCKsYJgF1Dp57d+KbN1KrEqRjThLhCOJwLUdfbNUV9fu7fxy7
 QlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HVGlEQgUuDYC5bx+BChdNUNA+M12SfFr+XIyl8lfDU=;
 b=cfFu0uSB+tZZJsjHvlIUI6VWQsvO8RVfQrEsEI1VGyqQEGxvVyN2LmbFChgihC4yHg
 /A/rEQPQZlqYCvXmIzo4tiXpVxoeiTUeYeX2ZC1IwcGnBc2NqqX0wOTknjNvBELjfPnG
 L9LqzgOk1OlEmu2p2MidVwhwPW1eDelDGd/yYdlbwFd+79n7vB3WcqdqL9jKggqJx8Qs
 ycKVLS7KewRKdu7NFRXDc3EvJB2sWwGqZp3Uh7WPNurl4xnPc3uhutNjn/FQu2kCD0EY
 x/quEAj4EZ6u5ui1x7ld94ECNRrwmp4Mxt07ptHOwLkUlsXgJ+sB0ZPCY0Ov1cHVuqum
 uWZQ==
X-Gm-Message-State: AOAM533WCCFQbX3QwK4QKsSZ4WWory4kvK0NXfGUqEHFizbvueC4PNDi
 5tyUVqI2w9Rg1xM5BAlZaZOh1Dj56iDnsg==
X-Google-Smtp-Source: ABdhPJzcmAtZSv9nxq2yNgfMN91c6PXWpA42rEAS2OhFV4/1y7atE456fOo0RFEwhroDRF+krlgbzg==
X-Received: by 2002:a92:d791:0:b0:2ca:bcb8:9a5a with SMTP id
 d17-20020a92d791000000b002cabcb89a5amr10639000iln.145.1650522632074; 
 Wed, 20 Apr 2022 23:30:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 e17-20020a056602045100b006538224d4ccsm10042904iov.25.2022.04.20.23.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:30:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 00:30:28 -0600
Message-Id: <20220421063028.3647447-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstd: fix init file installation
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a bug where the init subdir was accidentially removed from meson.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-meson.build-add-missing-init-subdir.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch

diff --git a/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
new file mode 100644
index 0000000000..ed3738e3d4
--- /dev/null
+++ b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
@@ -0,0 +1,28 @@
+From 689265cd522c770ad3e0391cae80ee884a8c475c Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 21 Apr 2022 01:14:52 -0500
+Subject: [PATCH] meson.build: add missing init subdir
+
+Seems this got accidentially removed in:
+9f4490138c8892b1c86008134438b2ab405c9b0f
+
+Restore it so that init files are properly installed.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[upstreeam: https://github.com/RidgeRun/gstd-1.x/pull/291]
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index a30f776..7a8690a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -300,3 +300,4 @@ subdir('gst_client')
+ subdir('tests')
+ subdir('examples')
+ subdir('docs')
++subdir('init')
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
