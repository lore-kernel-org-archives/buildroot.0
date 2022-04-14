Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755EBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD0260F99;
	Thu, 14 Apr 2022 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HT4Utu13B9Pl; Thu, 14 Apr 2022 19:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32C3460E32;
	Thu, 14 Apr 2022 19:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3331BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 282EE82AC3
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SjZgZDk6ICc for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A9BA82AB9
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:40:51 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id u2so5620612pgq.10
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyK/0QDW+gOIRJwvigGB2WV455dqHVKO55TJR2p1mXY=;
 b=z57sbW/zMyGjqlmRo9f/3labFCgKXJUS2owFw4lvD62oiG9NqIAvlZuX3RRd5zmh3a
 6rPqyFo+V/yXYSezvu8GnhNu0ligOpXKccn63kResH/7r+0XZPGDDFpp/o1gNl6Mofgs
 n0xNIzgx/SJpKLq/+Q8+gLKdOSmVAFZI3TxiVpFZKr1xv1M3BVM9gxkwPv/AUSit9yHe
 7mpNoDX862hz1SZh9dk+NAqy1/lWZnQ5+4A8Yfu9bsOVSiSrgEQJ1dNJ9etzqFOpeHO1
 zobDZiwTZqed169ATZA34ARWJiUCkZl3KdPjpdzGQmrL9ueht4Xvm+zwe+C2rTfyNcF7
 3m2g==
X-Gm-Message-State: AOAM5336oFx7Ep3ANg+bCtUCLQmzbHn/Vv+hTrJVEkg/e72y6/kGJnrv
 rN7pICmfzpFLCdLlrPbNaKLhk7P652rYBA==
X-Google-Smtp-Source: ABdhPJxWlijz4yO7klbmOoc1qQpjE8gjfoWMjkgCHb6ZYWSLQ9a9m5QPguWYf/WilOehYhG6HEyH+g==
X-Received: by 2002:aa7:8d47:0:b0:4f6:a7f9:1ead with SMTP id
 s7-20020aa78d47000000b004f6a7f91eadmr5426088pfe.42.1649965250616; 
 Thu, 14 Apr 2022 12:40:50 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090aaa8600b001cd5b85d664sm5384464pjq.1.2022.04.14.12.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 12:40:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 12:40:48 -0700
Message-Id: <20220414194048.422920-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.18.1
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

The latest Go release, version 1.18, is a significant release, including changes
to the language, implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.18

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 85e6adfb8c..37c34b8b64 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
+sha256  efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088  go1.18.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3df16c9a68..cf90ac8765 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.8
+GO_VERSION = 1.18.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
