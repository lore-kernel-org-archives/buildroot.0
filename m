Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6EDC43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 03:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3618C40AC5;
	Fri,  3 Jun 2022 03:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Ih3KdpG45CY; Fri,  3 Jun 2022 03:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F01E40A95;
	Fri,  3 Jun 2022 03:40:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A80C1BF282
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 03:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39B92417A2
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 03:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_CK3WljOToR for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 03:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45D64409EC
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 03:40:16 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 129so6310066pgc.2
 for <buildroot@buildroot.org>; Thu, 02 Jun 2022 20:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+biHfhcRBUfqN0pkuOQsKC5fkqlcc3+cslLbXvCB4eY=;
 b=R7woRFAkQp4P0NBhri6YLQ0plqBkh9QAAyqLARWUkLnJbojEWPSCzkZOqLR8CvJJLl
 pzLG1hUIcXwpSzmv2FOWmg9vbvrvcb08Rs36QbTPwhM5Sz3T5PdmE2nTWWyY/MIk+048
 mqFDIrT9PjFdgkTHrxFzUhZBTVQVHrPtmNSS2i0Yb7JtC424mPydvadHdkJ+znPHKE2B
 0U4pSrrYOXIkbJmjbK/mC5OpTW6N6b0A/9KwD0+MxX8nTwRhy6jz/ZLfzqNe6zYi4GQW
 ezZj9kEWJZ+cn/fi8MFrsd35pp2IyHOtQ4blUKjBqjXik66B1dF2FdTAXIr1zme/xCan
 ntvA==
X-Gm-Message-State: AOAM530b/ry9Z1XbIbSl5E12HinOaIizlJvbFuFhsm0zUx01fJ6Bj0fa
 QdwxOPr3Rh4AwLbcLtGizVuh4Vc6kDhUrg==
X-Google-Smtp-Source: ABdhPJwVY/6tGIvEJQ/3HtHfLFrxNOe2kEEwuBlKr0wvQxT//eBj02SbTzs971nSdMrdHGLxYQE6OQ==
X-Received: by 2002:a05:6a00:1a44:b0:510:a043:3b09 with SMTP id
 h4-20020a056a001a4400b00510a0433b09mr74904397pfv.62.1654227614845; 
 Thu, 02 Jun 2022 20:40:14 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n19-20020aa78a53000000b0051bb0be7109sm4307687pfa.78.2022.06.02.20.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 20:40:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 20:40:12 -0700
Message-Id: <20220603034012.563727-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.18.3
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

go1.18.3 includes security fixes to the crypto/rand, crypto/tls, os/exec, and
path/filepath packages, as well as bug fixes to the compiler, and the crypto/tls
and text/template/parse packages.

https://go.dev/doc/devel/release#go1.18

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6a9480ff99..45af1fc06f 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2  go1.18.2.src.tar.gz
+sha256  0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d  go1.18.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 305a4926ee..ea4cdb3ae5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.2
+GO_VERSION = 1.18.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
