Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDEECAC5B3
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 00:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6654741DD5;
	Wed, 18 Sep 2024 00:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKbqZ8axYtZ7; Wed, 18 Sep 2024 00:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C39841BF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C39841BF5;
	Wed, 18 Sep 2024 00:44:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 717411BF977
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FB1841A76
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dn89REFOhU7y for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 00:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B1AE41A3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1AE41A3C
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B1AE41A3C
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 00:44:04 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso354146739f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726620244; x=1727225044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9q7DqSRt1Vzd+BCJ7aMEEarCof06ygzJEf2LiVIelw=;
 b=ud5MJ9SVzQZV7OIABvinajkEPnTOld78fnHrLcskbvTY8vd7wiBfRD2GaOLVWE8AxC
 o147ZcK6lyzQwGLofKc8Gu80iHwFhst9SDU26LSMVN5Cd2qFlrhjHGG3TmzAlSglsARN
 BM0xdeFGQIq+EHcfifbyGVXW32akKaZ2o2idYEDaE3FyA/sGHzM5DrpoWmkjSD8r+FvI
 dBfsLWRONAGezVmC6oStR7m5c5Q5OSjq9+t31eSVh8olR5n8NMeY0j3VaCjYPuV3hoas
 PplpZ+Va858y6J+lM7a7unhHhTF72c54Ypr5QWO+cg9wVY5v57GxN4rzHLS4PyeewqON
 VdsA==
X-Gm-Message-State: AOJu0YxcpdxF+2l75ND8ShxYpi5ZM0jM3axKF7YhNXs17tpWXMboKN8e
 NcLHACwLcCq0ykZosZZaGGV8jZ64Irmd1pltSbDDmy7GTRjAwZThSg/9otQT
X-Google-Smtp-Source: AGHT+IGHdUaStVPEqIB1a9KTyjShR2uFrshrWPlBB6tf5AXT6QOmBOGn4wm33MfxFFPpt4OR8VNsMw==
X-Received: by 2002:a05:6e02:2167:b0:3a0:b471:9651 with SMTP id
 e9e14a558f8ab-3a0b4719727mr28044425ab.24.1726620243752; 
 Tue, 17 Sep 2024 17:44:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d027sm2246193173.80.2024.09.17.17.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 17:44:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 18:43:59 -0600
Message-Id: <20240918004359.422768-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918004359.422768-1-james.hilliard1@gmail.com>
References: <20240918004359.422768-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726620244; x=1727225044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9q7DqSRt1Vzd+BCJ7aMEEarCof06ygzJEf2LiVIelw=;
 b=mMaNG41lj2nZDNazR1Z0jFwTQZ14Fgs8lHW1RjZAgRnT7tcfMBzGCH5Lv9WurOQOuE
 TvYI2T6Cns3KygKVhlfNQg7TkeTpoPG8ralyxlQCCzcs0us3QnLUJkyltABfsQ6aW4P3
 dC5ZS6E+jv+d+GcpKuEs95jNMgt/rhTEeBCUIAtmTqbfMMBCu6WvF7ijLYJSM8qMBq3g
 mTSYRu9OpZ/ziTAvrlKje3gnkiKkY6AfLMCVBfwsjrw7i2sBsXbO24eVek0IfpzeCV5k
 uykWgTnvGTwRYLNunIr+x9YvXHC+Br7zV6a0aC2O/SCLoHDSaZRZE7J9I9p+2XSqlJgV
 xNJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mMaNG41l
Subject: [Buildroot] [PATCH 2/2] package/python-pytablereader: bump to
 version 0.31.4
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-six and python-pathpy runtime
dependencies.

Add new python-path runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytablereader/Config.in                 | 3 +--
 package/python-pytablereader/python-pytablereader.hash | 4 ++--
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index 00be18510f..308e06236a 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -5,9 +5,8 @@ config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_PATHPY # runtime
+	select BR2_PACKAGE_PYTHON_PATH # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index 2034cfd61e..18a26847c8 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablereader/json
-md5  8d732b706186666a4c28d14927c26754  pytablereader-0.31.3.tar.gz
-sha256  e292b81ecd96546fe0f53d9c83e716a4682d07d7ead6d9be8beb14ab0591df11  pytablereader-0.31.3.tar.gz
+md5  d92cbcb2716ecea0eee58649a591edc0  pytablereader-0.31.4.tar.gz
+sha256  ad97308308525cafe0eaa4b6a80a02499e0b4c6c979efb17452d302ad78bd5b1  pytablereader-0.31.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index daa484d393..40614472a6 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.31.3
+PYTHON_PYTABLEREADER_VERSION = 0.31.4
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/b5/c8/67590578e27cb1716c7b71291946d685b5bf63fbfe7a254a7cb3f6f8aeab
+PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/0a/44/e42c24df7b6f1c880b5bf614112e2009ac088fee79b6bc4d1fa43789c460
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
