Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B7EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40A6540178;
	Thu,  6 Jan 2022 21:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMxySgqSj9HT; Thu,  6 Jan 2022 21:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53A0A40131;
	Thu,  6 Jan 2022 21:44:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7A41BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A9C58333F
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysyEqPJcbVl0 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:44:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1CAF8329E
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:44:29 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 205so3639117pfu.0
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPlYoVHyTwsZzydA4b6j6rxK+j1B6pPKd+32y2cflZM=;
 b=inxwkm+4qdcDBkCy8m9E9ZHNZKBDzg4Zcsn12T/kVymkKTSzYWpeY6T3lEKOFUvxkV
 VTn6JwCB+B3/fh1kIxdYbcprGsm84zbIZbyNSEq0nA81C9TSYKlWNeXr5NonKLgQVL7W
 Ecw8ELH7vnprCm4mXGgxxeuWsOJyVGt4YxURYv5pIxKcljnaZDC0wZr5ZLApCkvPa2KI
 3KpOirwiPCbPGbL17LsBHjzcH9+rhg5o93Fxy3NoMC1R/ZohI4xYz2qxWVPnnObY0AAB
 65UZudJtG+xv1TiHOWznoqPXtAcvTk7sDovCYWWBtfXjATGzeJF4FdTxnAhkK8fRhHP/
 ex+Q==
X-Gm-Message-State: AOAM532BT5PHLPq2CWfai7eTYagnZ2yiQYIcYDrUUpr2DradiFudXZAr
 PHoIuALCxC/UMGBaolqjyYsvEFAB2shyCQ==
X-Google-Smtp-Source: ABdhPJyZTDrWZkvtDiQebq6cifjIpo4gSZB3OANlWbwkuen1/IdthgNQN0U/IqAwahApOO66wiHEjw==
X-Received: by 2002:a63:3ece:: with SMTP id
 l197mr37973099pga.371.1641505468930; 
 Thu, 06 Jan 2022 13:44:28 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 mh3sm7455121pjb.26.2022.01.06.13.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:44:28 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 13:44:26 -0800
Message-Id: <20220106214426.442534-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [2021.02 1/1] package/go: security bump to version
 1.16.13
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

go1.16.11 (released 2021-12-02) includes fixes to the compiler, runtime, and the
net/http, net/http/httptest, and time packages.

go1.16.12 (released 2021-12-09) includes security fixes to the syscall and
net/http packages.

go1.16.13 (released 2022-01-06) includes fixes to the compiler, linker, runtime,
and the net/http package.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 10bbb741e0..7071fcd99d 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5  go1.16.10.src.tar.gz
+sha256  b0926654eaeb01ef43816638f42d7b1681f2d3f41b9559f07735522b7afad41a  go1.16.13.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 8a65e20380..cac83c65ff 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.10
+GO_VERSION = 1.16.13
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
