Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1082C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 20:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2B140300;
	Sun, 26 Dec 2021 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xr3IagqghnHP; Sun, 26 Dec 2021 20:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5B24030F;
	Sun, 26 Dec 2021 20:22:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 732871BF335
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FB4D8131C
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 20:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggYBAUJUp2eJ for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 20:22:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5CF781310
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 20:22:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w20so19697344wra.9
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 12:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKS4GcbcM6rjY7UYR48WuqD6ZjtY0eM6sqA5hJHWOUk=;
 b=eq7uppNp8HIqGKs+EgomzcbNUGzaYi2Q9wP4rivEccON/sPn/kKvsYnUmB7+cg3+5N
 jLsRGOXWPZTv48t+vstisQzB6JDMO298YjusisPWNhD1SzghFCAPvKP5QsOOx/tG37AH
 QvH8Qc7UfmvGQKS1f1gmagSJHq55fjyfDhrJ3DlaEcHMHS1xT5F1XXxPCdSHsqsuidfZ
 x2Y4UL+lAZeo0YObN26WUy63fN0qx5+7Sd2PD6zIAPprMRG7G38MywZOaK6do6kqxPFi
 HUT4yiBastVq+NMaBfA8bWJI6gTfX/LMKG6syEG4q1HBVeKAKcuSAK7/MCywVDIyfxR5
 /Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKS4GcbcM6rjY7UYR48WuqD6ZjtY0eM6sqA5hJHWOUk=;
 b=TJx0ccx7oNmVJzvEf7WCRb57HKzqVCW7To62fotEJfv3OE6pbrp35BZAGfMcaiNgc7
 Fen6u7oq3a9lbvnsdj6t8/UFrOKelFAOXr4xBAWdSWfG7cjKFmrAF/lQXjUTLIcdnm4R
 RsIYByqdx4lRIhLTrq1eS6diGaAeR7PFAlAjfofmFzsuWX/uzyud+Mp6FnRMfZb0zuZ0
 4Zg3ZR/OQuD9kNH6ZqK+I9gGcdFuWpsk6wNyXOWllpvbTlj96EfVX5W7yyJLDhbs8YsM
 PjyBoBJu0C65FEGsQOD7m7CYck5C7dLHHuI7SvVijTneKLFQrG/poBK5fIbvwcFtywHn
 JivQ==
X-Gm-Message-State: AOAM531H+URxiOMrOg2Qb0BM7syfrHdvCL3guzuR3TkR9572U7yGG26W
 v187nWi646qJpxd8vh3mHdugvud2JNS+NA==
X-Google-Smtp-Source: ABdhPJwhvzl0gD15B9NLQAf1NHPff/WOmRLo0mIDgtc1IRYy1Lagos1XkAEPJALWKgbANJ2BWOsOdg==
X-Received: by 2002:adf:fdc3:: with SMTP id i3mr10433103wrs.125.1640550173936; 
 Sun, 26 Dec 2021 12:22:53 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id z17sm16868998wmi.22.2021.12.26.12.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 12:22:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 21:22:14 +0100
Message-Id: <20211226202214.1388641-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: bump to version 11.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/hsleisink/hiawatha/-/blob/v11.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 2fba5600a2..b06dc2e661 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79d85d165d68dd7043bbd337f5bc7dd10d8632d68ba61d0e557f84bd687c9727  hiawatha-10.11.tar.gz
+sha256  d21722986f64163e30a560283123cdf4d6cb5ff8188ab754387b26724565268d  hiawatha-11.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index a917adc9a4..5618e6900d 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.11
+HIAWATHA_VERSION = 11.1
 HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
