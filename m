Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834D3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 18:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC75C8138A;
	Fri, 21 Jan 2022 18:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOzdMAr2urm4; Fri, 21 Jan 2022 18:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F8B83EDB;
	Fri, 21 Jan 2022 18:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5552E1BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4426D8133F
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 052kgVf870w9 for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F35F8125E
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so23325072wms.3
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHrJ0dsi496G9/13+kdjVlxYjoSW9LWFzO6MNFUYVCs=;
 b=e7Jdnu70bNANDvCwTG9DAWgDiZOPu+zIpZDfMX6ODLBBoG/UNGi7f/NGJhcJ1CFAoB
 EAzItko+r1u7OF2MqkESYawkZJiH5clUexwr0q5x2mmS2H60Jpe19q2L8gAwswLIgtfq
 28+tHoETt5WrTMSgWAlu//etWZrbj5BPToKw7jMXi+kIYFzD98IZW+Y0jAp3aMqeDkIK
 nzxIWkPzq54BCFtLoHwYazVYED0DMyzX1+Ykf39yDlGX0j7nm237K+u+l9bGJnToUMrB
 8OYrVMIH+05vCWKQoBPqUgFq3Gn1OMkI+37L9MybkCDq0mLwzzTmW+SrRsAB/r/X2rVQ
 YtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHrJ0dsi496G9/13+kdjVlxYjoSW9LWFzO6MNFUYVCs=;
 b=72TPGJDydpni+sYe23j6lFdDnZf8noGOKEa+WR7FjImYyELdl4yZyt7X0Kp77YUMoo
 Am57rdKQ/y6Q+mW+VIKfQ3PexEbn26FP6ijbqO90DchpzDQgrmKNuSDSGXm5jTV4EcD5
 AgUS/B045DhuVU4vR/tcX8/He1ltBI6AshXdRnVvCBDtpHQ8xAo0jMJi7UdUypR4xPT0
 clIENlBoDIIgt+eb9aYtREEX4DP3lTBWjTiQeZYNi8DqlF4Icb7gOyD1o96zQiLB6xYW
 epYVSJGx4MUhd8Fh3ZYkYqn3GH837kfpog7TEyfgYbpZ4sy54LbOVJaHnDw1eeFXdcUU
 luDg==
X-Gm-Message-State: AOAM533wMFXrkEMa1F6pqcapDTdkf6bZIj6o8y6dfP76U+8nsQAYUjqN
 sDVRmgmZgcnJpYtpL5KUbRG+kVtAA9w=
X-Google-Smtp-Source: ABdhPJzenJqCiIqrr1qBHBe0VINk8Mk2nuHmSDu4rujMWwRFI8hA6TxoXDgGXSvBXt2wsx4Xjk+Qxg==
X-Received: by 2002:a1c:a786:: with SMTP id q128mr1872010wme.176.1642791530400; 
 Fri, 21 Jan 2022 10:58:50 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:50 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:53 +0100
Message-Id: <20220121123859.754653-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/8] package/perl-http-message: bump to version
 6.36
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 6 +++---
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 62cf0588a..1a5d9ad0d 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  e291f19e9532ffb7d1c80eab786bf0f2  HTTP-Message-6.33.tar.gz
-sha256  23b967f71b852cb209ec92a1af6bac89a141dff1650d69824d29a345c1eceef7  HTTP-Message-6.33.tar.gz
+md5  e847fb3e297e740080ab6fd1ac127f7f  HTTP-Message-6.36.tar.gz
+sha256  576a53b486af87db56261a36099776370c06f0087d179fc8c7bb803b48cddd76  HTTP-Message-6.36.tar.gz
 
 # computed by scancpan
-sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
+sha256  f2f428b5f8a3bf4e6a71cd5ea92558a3d123d3d7c5075d34923e71e46dea94df  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 18e673ae1..3b5d6e7b5 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.33
+PERL_HTTP_MESSAGE_VERSION = 6.36
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
