Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DCBCAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08CD60B5A;
	Tue, 17 Sep 2024 18:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9ATEDaJpnrj; Tue, 17 Sep 2024 18:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF8C360DE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF8C360DE5;
	Tue, 17 Sep 2024 18:18:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70B091BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F5DD60737
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ri5Mn7nFp0wb for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66D2C6062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D2C6062E
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66D2C6062E
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:18:01 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82a151a65b8so326591139f.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726597080; x=1727201880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mtIJGAHLSqf1DeD3GOA8jaUOlFmY6SNo1d2n64mJe9Q=;
 b=OdkOYmlvL+ut1wzZL9/yDhFpuSTrxo5MU6e/yHzjXumShI7s+/8qTBK4wukChetOUc
 Mmt5rQWPpg3AhO4nPi4E/hY/w0YYDvDNOSQK56LftilETVjItOih1w3wKX4SwMXv4Z9u
 omE49FqvhZIggEL5u2hl44N4R553+63rpric/M5EEuHY8NUBGkPKZFK0bXNX3kDJgIhV
 IG+uko5zW8DaM39GdrvLf4SAsa+dXVXoN5i33qX2d1CcBIR+hSPjHhsSePyp4MG/ZsDG
 BWBxzUwh1XNTPnkf0AF2PFv/wuu9uCJ6hKarC7FBhAlZTF92SI3cPmSoWRqzE+Xz9eBQ
 lSCA==
X-Gm-Message-State: AOJu0YwyVGitc7V3katoUVhQIPyJXaytLd+JTwK820cq8yM44FOslV1D
 mhRhUHanGQgxpns4jYznqqtWFfIrnj9x6ZsVbNuauLQ8RkwkQ1/0v8guNQ==
X-Google-Smtp-Source: AGHT+IFSxZWIriz28bZmRRqGQJ6md+EXU7oUCsf0zB7wosek/GxWA8gb2530EF52H3sa9jA0SnMLtQ==
X-Received: by 2002:a05:6e02:b22:b0:3a0:b5b0:96e9 with SMTP id
 e9e14a558f8ab-3a0b5b098efmr16439975ab.13.1726597080154; 
 Tue, 17 Sep 2024 11:18:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d31sm2071646173.98.2024.09.17.11.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:17:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:17:57 -0600
Message-Id: <20240917181757.3868111-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726597080; x=1727201880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mtIJGAHLSqf1DeD3GOA8jaUOlFmY6SNo1d2n64mJe9Q=;
 b=PL/YTHVMtYtmw42THrthyLBjQeX61Nf//38AszrU3TH8Q1BgACCBMz3rUO3OaHQsWQ
 q91F2obmuXfgVOtuT7cUi07ECvGwJrZ2/f6MNgDe3J5LAxfFntCPrhA8MGKpcNnG4Y8R
 PxdbEyIFB/0HFF9NkHumnZE7wjPSO7eJdNti/Fp2Wo6dzJlozWZPvDmhxXa1EeIm3FpI
 u4hmvUY7KsZUFkJ/486WLmMtPTrr4pfUg2MCcCy+eQKYe/C1CCPC7Nr1zeyO84L061Lo
 OyluHWjkWdgCpOxpFET0rNxr8onFCOqq6W76BYE265pSL4s1LrmjTO7VCD0NKAcG9Cfp
 8GGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PL/YTHVM
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 3.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 893aac074e..918dda17e1 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  be485ba66b576d8bc7e1c0ad96e87108  paramiko-3.4.0.tar.gz
-sha256  aac08f26a31dc4dffd92821527d1682d99d52f9ef6851968114a8728f3c274d3  paramiko-3.4.0.tar.gz
+md5  2ea59e8a3423fe050398071b209b9b69  paramiko-3.5.0.tar.gz
+sha256  ad11e540da4f55cedda52931f1a3f812a8238a7af7f62a60de538cd80bb28124  paramiko-3.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 8d921486c7..e79860c442 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 3.4.0
+PYTHON_PARAMIKO_VERSION = 3.5.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/cc/af/11996c4df4f9caff87997ad2d3fd8825078c277d6a928446d2b6cf249889
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1b/0f/c00296e36ff7485935b83d466c4f2cf5934b84b0ad14e81796e1d9d3609b
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
