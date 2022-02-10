Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077BBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 06:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB6040921;
	Thu, 10 Feb 2022 06:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1bCxcGzE8Xt; Thu, 10 Feb 2022 06:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D908408C8;
	Thu, 10 Feb 2022 06:11:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 812731BF409
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 06:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE9160B1E
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 06:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_bhcxsbQ67a for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 06:11:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4577860B02
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 06:11:03 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id m185so6036095iof.10
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 22:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2uEO3vVpEhinCIGlEF0c0CCk29c66S45agaXucDBgyo=;
 b=lA88QfBl+ty13kfceihsiz57sWiwJIW7X4Nz17Mr6p/hnlKrN1Q6JyvZptyp/pk0OD
 v65D6cNnmoQ23uuKPhfoLV0ZOv6mlhtyfugXZyT1bvtYtIdJh70BdfFQ37ZeEP+wcQGK
 qegHqPr2FkY7yZixF6RB+OESHTxT0N6h1P2xEvbbln9cfdmkM91ivk8veHVf3vz26MT2
 N7Tz3J2Rz+bddPSfE8Thj9jq3bZNNDpuEAazdjDpxZt95fyzBsozzWzqepUG+HqCAegt
 9wgOcIz0HgpCAkE/cFnGdafGYjL7u2UAzcTX86oZq7FNNsasAi+Z5zfIFm4gFgyddH8d
 R0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2uEO3vVpEhinCIGlEF0c0CCk29c66S45agaXucDBgyo=;
 b=r8Yb8SQqFxuvY3TWSInJgAM1hO/iE3cFxwgCQGZxBsKRAKX17A/cBjQrMsnoQNPmNU
 Z+wdiT+pwDrSjSjumY/Nl7uXYip6YlvVe/NnQHMlKRWp2mQtK/IHRpxIJLjtlcMyKe6x
 pg4Pyn9ggIBpaPs07n+KvUNaxJFJof4xw9dhlL+gRLdXZv3pgLSnwzrXYVqmU08I5nOq
 uZb5kBW8f8BK39UE/01SUL/hn7Q9Fr+ya1Mvb7MTbQTqUCsLaQQHZI25E96lHjd+lYXw
 er+tAYedfohnG83wBYKeUxUhYB3nPD5yrCjX/Dq28BYP6hnT4MgQOtJnqOMDIO/CHIs5
 Zewg==
X-Gm-Message-State: AOAM530s3CLAeneHur7/eOQhu602B9zI9XJvejNSGYMykv7CA1t6ESbI
 HPqVd+oQflyQFAFYqLZgHOoSPtZakcU=
X-Google-Smtp-Source: ABdhPJwZgYqMRTfvlQFjdu1KTpuGDWuhNzeB9qfAAM1IHTGvxlPS/7++q7AhGWp+gWjxxXvx5Nnr2g==
X-Received: by 2002:a05:6602:3155:: with SMTP id
 m21mr3024076ioy.60.1644473462116; 
 Wed, 09 Feb 2022 22:11:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id l12sm10959389iow.48.2022.02.09.22.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:11:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 23:11:00 -0700
Message-Id: <20220210061100.810772-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/gst1-devtools: drop python2
 build dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Looks like this was missed in c4bbd6da50488944debba29e195557e5b345f2b1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - move python3 deps to unconditional deps list
---
 package/gstreamer1/gst1-devtools/gst1-devtools.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 66b509ae2c..9089b12188 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -12,17 +12,13 @@ GST1_DEVTOOLS_LICENSE_FILES = validate/COPYING
 GST1_DEVTOOLS_INSTALL_STAGING = YES
 
 GST1_DEVTOOLS_DEPENDENCIES = \
+	host-python3 \
+	python3 \
 	gstreamer1 \
 	gst1-plugins-base \
 	json-glib \
 	$(if $(BR2_PACKAGE_CAIRO),cairo)
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-GST1_DEVTOOLS_DEPENDENCIES += host-python3 python3
-else
-GST1_DEVTOOLS_DEPENDENCIES += host-python python
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_RTSP_SERVER),y)
 GST1_DEVTOOLS_DEPENDENCIES += gst1-rtsp-server
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
