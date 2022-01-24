Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51407C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0387783DF3;
	Mon, 24 Jan 2022 10:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYYgJZzOrl6M; Mon, 24 Jan 2022 10:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2422E8333E;
	Mon, 24 Jan 2022 10:55:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC4C31BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A86B360E16
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nP-aPnINuyAs for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:55:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 744C360D79
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:55:30 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id r15so13459787ilj.7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ABCE3me5NFiQKSM7ZIh5oTn/W3fRvYnVDkhBIBm/Tjk=;
 b=TN5Adxm/5IhTMBxkL5YgFiE2b6ltNKjLOcYTx/q+nxumaP8YmNrtoMcRLCWr4+j172
 cMcOsz0I+cA7d2OFvcOY024jsvcreFTJmX79Jx9aUMWS9aWludyJUq+iIZFzEdsg9efQ
 bEUnVsawY2ol33g0++DkqXZfwtqV94Ah+WVt8MdUrDZsHdet7tOvN5i6ZYibj6YbUsKi
 j+lzr9tLQLpKr7fQf+KSnPill38Y0i8wYMd0K8kwNsV1ReOlfbQ7CK/3NmRbjf0ZhC2n
 ovCnxg/FP5Owi0SAZnbyhrnzWUNlhZzVAhJtyCXeADGv57upK7LxXo0HzTj6N5QIWKY/
 gNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ABCE3me5NFiQKSM7ZIh5oTn/W3fRvYnVDkhBIBm/Tjk=;
 b=2URrcU7kLGmjP/VSFBswGhLYVHR7IsN6dE81FetafzUiZ7f7M10BPbIVRWDQ919sBj
 /CUoB77Ikzdc7oUp10aoRjBkv/2wm+sFQmWtXItlYutz/r+kWkWgrNOm5/RSBUxjhkpa
 bOEegrqqgMuzZZfZCWFJGc25MCAhHcShDbVZ/4naidf55h+aqKL+vkYaq1ovF1aOErpT
 mgqApVPX5xCQeorzlNzfSHuXklm2azS4nEMiUYWiSIkU6Ku+j0N176g1vojQclWhhI+M
 DXEAHRqBjCUfGxQbSkONxQMiVgHWxltncDv+BwFTCPFeQb4MkTDHVr5xTEHDUMeQnlzz
 1a/g==
X-Gm-Message-State: AOAM5318e5pClzDshRIjs4AnZ+wiHtq7dqwNeZYgYV7yEhFsKrVnOmQ2
 274/pqhLnsDFXyn3I7n8hteAgY77mM8=
X-Google-Smtp-Source: ABdhPJzAgWJl9efCNGAaE+A9bZMu2WyWgwtzKeYOuuTV19AQfjnHcrXPcaxyx2rVu15FQMuM1yO3Dw==
X-Received: by 2002:a05:6e02:1689:: with SMTP id
 f9mr6425896ila.137.1643021729457; 
 Mon, 24 Jan 2022 02:55:29 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id w19sm6355394iov.16.2022.01.24.02.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:55:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:55:27 -0700
Message-Id: <20220124105527.536514-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 2.0.10
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
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index f506fa85ed..eb3b67598b 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  b28e4463613ff3911d5a2dc62b96233f  charset-normalizer-2.0.7.tar.gz
-sha256  e019de665e2bcf9c2b64e2e5aa025fa991da8720daa3c1138cadd2fd1856aed0  charset-normalizer-2.0.7.tar.gz
+md5  eaed8aaf95d7e3bc2daefcd8d0f03458  charset-normalizer-2.0.10.tar.gz
+sha256  876d180e9d7432c5d1dfd4c5d26b72f099d503e8fcc0feb7532c9289be60fcbd  charset-normalizer-2.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 7fe9f96996..33f2e132de 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.7
+PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.10
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/334c019f92c26e59637bb42bd14a190428874b2b2de75a355da394cf16c1
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/48/44/76b179e0d1afe6e6a91fd5661c284f60238987f3b42b676d141d01cd5b97
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
