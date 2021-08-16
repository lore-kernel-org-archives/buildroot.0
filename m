Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3820CC432BE
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 23:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D8060E78
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 23:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99D8060E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DD024013A;
	Mon, 16 Aug 2021 23:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaKKIn98e5EY; Mon, 16 Aug 2021 23:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C4440142;
	Mon, 16 Aug 2021 23:31:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45E011BF34E
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 23:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 402EC40142
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 23:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hENAZoovBLCW for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 23:31:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF4014013A
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 23:31:13 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so2913748pjb.2
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 16:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sajlgFMdPl95/nxwjReczfJvwZJrB8nj3kWMbGwlsO4=;
 b=AOY6U7yFck74Z/QNhwgJk2d3NeF1x5+Vxarn0AwlvFYqTmxPJWvJUSWLF5z1e5KiKV
 7WcZ2hxFpKa16CHjy4Ty+QG+ubr78Er3jc1oRXTp2AaEyTzWCub8hVlBVAdWEr3btXMF
 kJ78SJRtgJDQKlZtxmEEYN8qGaiJeDiIZEdvJo0ttUONAD36TRAzTLD8vrAZkJpb/vEB
 dsy3pwjVyEM3We4SStyX7f92rJm2o0vJdvyYbo4uhJ9ou5bnagpP7WDb/0Czvj5dcFvz
 en6z09z8OniZrtiJMx3jEuXZD9vgTxAlfnxX440QNxkNZj0jGMOL5fMT8mUz11SxMAIW
 KBbw==
X-Gm-Message-State: AOAM532jzlcflOsX0StpPlIxkK42KNXk0bo5o0NEzOAoJ97VzDRo9nIw
 it3EQjkVr82wDUlilj8v8lT77dffzTMfvw==
X-Google-Smtp-Source: ABdhPJyBaZziJBpitZlbZ8z0+bOhJI/Bpg1dRYeJ1HjbNa4H0e2DrMUXULEq8gBhM0Yt5Jkx0L/Zyw==
X-Received: by 2002:a17:90b:1a85:: with SMTP id
 ng5mr378296pjb.62.1629156673012; 
 Mon, 16 Aug 2021 16:31:13 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-212.sb.sd.cox.net.
 [68.6.75.212])
 by smtp.gmail.com with ESMTPSA id a4sm257228pfk.0.2021.08.16.16.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 16:31:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 16 Aug 2021 16:31:08 -0700
Message-Id: <20210816233108.1003377-1-christian@paral.in>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v1 1/1] package/go: bump to version 1.17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@busybox.net>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The latest Go release, version 1.17, arrives six months after Go 1.16.
Most of its changes are in the implementation of the toolchain,
runtime, and libraries.

https://golang.org/doc/go1.17

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index cd7f2b3813..d35d6ed572 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  a3a5d4bc401b51db065e4f93b523347a4d343ae0c0b08a65c3423b05a138037d  go1.16.6.src.tar.gz
+sha256  3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d  go1.17.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 7d6355df92..09d9f60cd4 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.6
+GO_VERSION = 1.17
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
