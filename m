Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6581C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE9283323;
	Thu,  6 Jan 2022 21:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPoyqnM67rt6; Thu,  6 Jan 2022 21:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEA0A832D8;
	Thu,  6 Jan 2022 21:30:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 521C91BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F9D760BCA
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxjqDy2ypcwJ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BA7560B62
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:30:18 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so4515418pji.3
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ok6jRJKlqcJZBRIRT9hbe87eOrGKkJbondVy/HRZ+fQ=;
 b=Al/JaVtBXeSuqbqwqxqR65zhxX9HqIZXP4Yypi1A55cMYJh1qgfFtdVY3FTfEi/Vml
 JsVYA5WBtvqm+wNNoZVqKTHTTx4NdaYkuaTjYlJW2WhgD/6q+bMDw5YuMzbTK32d0wX2
 gNN0j3u7NqEfHSqqLVMFXu/Kv5r1xu7OZ3YJI52LSy6ehzcGmSi4J1Hdp2o4oFMs4ZfH
 9uChShriGzylg3+c0MOyfjikRq5xcwPUVCrob/QRZNG6NtnogXoulXLqUi+MT1EXxRrK
 33dGIDi8bRvNxBQVOEiwN2px85dmlR7/REykLZd0OEezW2ysqo35zaFoBwPGc8/rwkuo
 WUug==
X-Gm-Message-State: AOAM531mNTx8Xu35dCaCNhvC8r1N1E113smsuaDxwANfYMQxmmKphn01
 atZ8HUMlvFKQJRTRfLFxgehzbIF8McsM5A==
X-Google-Smtp-Source: ABdhPJznKXmxCQoIu/dCidMDc/QVbIYxqYH90V5+q1uXdMjN+9oT+F/DpaOr5sjbnaWp2XjfMW0LKA==
X-Received: by 2002:a17:902:9a08:b0:149:7da0:b7ad with SMTP id
 v8-20020a1709029a0800b001497da0b7admr48544379plp.84.1641504617708; 
 Thu, 06 Jan 2022 13:30:17 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 22sm3477491pfv.173.2022.01.06.13.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:30:17 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 13:30:14 -0800
Message-Id: <20220106213014.433782-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.17.6
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

View the release notes for more information:

https://go.dev/doc/devel/release.html#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 39f8226aae..9111c8c9aa 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
+sha256  4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8  go1.17.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 0d9ceab2bb..062bec378c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.5
+GO_VERSION = 1.17.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
