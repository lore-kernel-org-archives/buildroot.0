Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054F8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 23:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA65408EE;
	Thu, 10 Feb 2022 23:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qnrfPiq8Arx; Thu, 10 Feb 2022 23:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB5540868;
	Thu, 10 Feb 2022 23:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFA21BF20B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 23:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CE7481A3E
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 23:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DrkYVxUihKo for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 23:59:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C76B815AC
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 23:59:09 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d187so13131570pfa.10
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cihcu56BX2wFlBGpPPQklZri+3GrQX4S+xDMgPRY1HA=;
 b=5/pObcHc3tfSmXQPEU7iUsv95tTse+AAC/b3TETyy8+kyzwvCGLsBXs2/f05JO6bN+
 ea+7IOzcHf3bBGpfrDtUMj7L81jLc9L5FtQCbx26a6limwdsnH6tFNJNMAgxkm7d47ds
 TCToqa4QidDn5UHoFobZLeZjn/k4vQAWvpksMnCemuijmlOu1Ef9q+ZsGRIlKqml7E58
 pYX0aVk9UmsFXZMbqtlkdzjyP+wpTsQuBALy0WP2qw0wQUL56Y157QoNn1bMHJKH2LhX
 ZZ6jiDHvrp7uFcs3Efeh2b8oBZ6uP29IaFBVLuNPu75YNt8zH6OAcDMxEZGbjp1LKpsD
 VNEQ==
X-Gm-Message-State: AOAM531KlN/RXQSfOYPyfhQWgRv/ZHXab2EsgakdPKJW5iCG3uAn6dWH
 0P0fEFSGQcS6CnwIFIAtZWpBvCfksflMPA==
X-Google-Smtp-Source: ABdhPJypm6mo2NR2rWFwlOwTLLnlXOlDHh0BslFVuz9jM/aeTd4494Yvrkf+jPixhq8KmIDZPAGlQQ==
X-Received: by 2002:a65:52cc:: with SMTP id z12mr4533453pgp.532.1644537548459; 
 Thu, 10 Feb 2022 15:59:08 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 mv17sm3293496pjb.14.2022.02.10.15.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 15:59:08 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 15:59:06 -0800
Message-Id: <20220210235906.23355-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.7
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

go1.17.7 includes security fixes to the crypto/elliptic, math/big packages and
to the go command, as well as bug fixes to the compiler, linker, runtime, the go
command, and the debug/macho, debug/pe, and net/http/httptest packages.

https://github.com/golang/go/issues?q=milestone%3AGo1.17.7+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9111c8c9aa..fdf342e602 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8  go1.17.6.src.tar.gz
+sha256  c108cd33b73b1911a02b697741df3dea43e01a5c4e08e409e8b3a0e3745d2b4d  go1.17.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 062bec378c..56a21dfe55 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.6
+GO_VERSION = 1.17.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
