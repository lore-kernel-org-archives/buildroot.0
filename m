Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BD1C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 03:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DFAC40127;
	Sun, 24 Mar 2024 03:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScDqCHisoFDR; Sun, 24 Mar 2024 03:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2910F40201
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2910F40201;
	Sun, 24 Mar 2024 03:29:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79D431BF3AF
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 03:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D2340201
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 03:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLElOzoraN9q for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 03:29:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1DEE40127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DEE40127
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1DEE40127
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 03:29:05 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3c37d50adecso2323809b6e.0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711250944; x=1711855744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=440+Acupjx1O+f0LSklbH4LfvVnGL3pwd3ZjbYKgy10=;
 b=F2ENOS2KBK8Ov3mmQJSp9/XZHNsHYUy+gpdEd7r3DAvwLZJko/WUj3RjvfkRX17K8p
 fuXZmFgeR6lTCedYnQtpw4RoPoESYgI2aHKNRxuguGBtsgUQ7hbsTOFSruYcHWvUm0oB
 IbCEV+yTN6E94Bk8/G2u2cTX/hj3IWSu+gXSAVZPSIxbzWx15qQqIv+aKjojAIAmvq1P
 i1RTTT8c4LI4Yw/9C0ec60/xe4A0MDI6CUCSCP+9x7aE7C+9vykb6AJxtvyH9ko0ptum
 w7+/tqKH1QibRLX0ezcijXTJdllXbEomMOBloVfVec2/QB9/xKN6ZHOCAfLjNXSHKWgB
 jLcA==
X-Gm-Message-State: AOJu0Yw5pSrp9QuBY2LUlM3HEm5bBv7KSXDfj6uz7dBz2FZQ2fYpE8eM
 EEIMg5ttTvkJQZwFZKEPR7uLgD2Q2HYQDNvkuwsCYH4uL8PqPQEzhN6+gs/O
X-Google-Smtp-Source: AGHT+IFDo/IixmjIDe33UnKGMNpJ/KtfnsuPzZCi8tsFtKE6nlKC331JLMge0mGwwhqhfy311t8lpg==
X-Received: by 2002:a05:6808:2107:b0:3c3:86a7:75a5 with SMTP id
 r7-20020a056808210700b003c386a775a5mr4924841oiw.7.1711250943741; 
 Sat, 23 Mar 2024 20:29:03 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:5be:8083:7ea:b94e])
 by smtp.gmail.com with ESMTPSA id
 kt1-20020a056a004ba100b006ea98271e43sm1853456pfb.144.2024.03.23.20.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 20:29:03 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 20:28:57 -0700
Message-Id: <20240324032857.1286232-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711250944; x=1711855744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=440+Acupjx1O+f0LSklbH4LfvVnGL3pwd3ZjbYKgy10=;
 b=Xy3g6QurmV1/YuzQjMhbTrUDzpMDJiHeRJdpTIZMWY7z+tGfa6yq8nEm6yMzbH23dK
 lMfscuMLXY/RpOctTlM2CvzaGOUiEUeD+59JNvBUqBacSfysLwNMrtTHlNSqEno/QKY8
 jN8ZFrcgsRhirc5C2HBZGvLu4X6hkE9Mi1SlFmBlHU/lknFOBXy/1JIuAQJ5lVkoFcZ7
 vmX/67qD03hBnc4eNrLUOfFWR5CwH+JhAD0qnhI6PP538heH8PXTozXzhZXuMJcTAGzf
 HCVqzwyb2wzSO9Ak+iqoAX/PS4uEKqfO1U2U3Nt/tfp1bBv5H98S4s2baP0PVQmkyGXN
 cczQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Xy3g6Qur
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 6.7
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?id=0aadd41eab7ea76501e557ccba705a08c07ce088

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---

ethtool.config
BR2_PACKAGE_ETHTOOL=y
BR2_PACKAGE_ETHTOOL_PRETTY_PRINT=y

$ ./utils/test-pkg -k -c ethtool.config  -p ethtool
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

$ utils/docker-run make check-package
398423 lines processed
0 warnings generated

$ ethtool --version
ethtool version 6.7

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index a37c800015..b9bc768e8f 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  833a8493cb9cd5809ab59743092d9a38742c282290800e9626407511bbcebf9e  ethtool-6.6.tar.xz
+sha256  c3ae526b01ce4d8df6c794ab170de4a4104d111ea8d8db3f1fd7c25fcb905619  ethtool-6.7.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index c9c2856612..77a7e16937 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.6
+ETHTOOL_VERSION = 6.7
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
