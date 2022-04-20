Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89532C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B9C4410E8;
	Wed, 20 Apr 2022 18:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvP_EE7dSwMv; Wed, 20 Apr 2022 18:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26020404F9;
	Wed, 20 Apr 2022 18:42:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B030C1BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D76A404F9
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1x9co-_IN3R for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:42:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4B7F40119
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:42:19 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q129so3071599oif.4
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GFLRWsgdCJalzD1g3t4xNkaxn2T5v8Njfvd7kouDm6Y=;
 b=I63luBpdrv3//q9wrtQJvrkeMnJU3ajJJ8yBKi6mEMPwg/vBALbRNLk2rY7Kkgqzhw
 skO1mh1b/YHSZ+ebsR/1fAYWjouDqEruUmKaHti1ZjIArJU7HwnSEY/1qWD23gObd3SI
 U5Zgfl+RYE1uJDhQUMwsll5pFe+xeylqzMnSZsXT0vfdIn5S9j7M7Z38bRaUYdYpddkY
 Z/INLRYMoBEwtYIXNmJ9nvq7O5ezgVmG3YdMFZhtR23Hua4iWC0j4Qc7J2GeWRViz+/6
 4CNc8yhYBMAmtefiNLwwHAHs5jF+TIuqTSrDx/9jKWZnTfa28lDT7x9FB7tqNUZRGapb
 s6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GFLRWsgdCJalzD1g3t4xNkaxn2T5v8Njfvd7kouDm6Y=;
 b=RD4btEjrkVcSfOiML5HMZsiq45Ru+ubcFQLY9gC3WqC4xcmPgqhv6U3Hp0F70o2Eed
 AKEY/TEbr7/w2coYsHCLppIctk95JiLHhnVUUWSLIUSeOWoW00F+NGUfyOjMlzHsYvJW
 +XN7ImD+dJfSYcsiFYcR6/IWM+8JwFQYCKeP6HkqqsSP3Bo34+VhZMQDviDafuom92O4
 c6kLEEoDXs47UHiMQRKtJWJ6ZIlI0xcnv4PbBfuZpQqjVsbBhRht9r6IZRSAhPgU2PBi
 NhMQp5q+hw1NgpKVRbP1sVeMo1aQVUMpXklIy6dPreYUisd+8+Vrqo07Bt7kz614h3ao
 DlSA==
X-Gm-Message-State: AOAM53056jL+cU1DfNNE67/py+H/EWh23vu4ldYnisyzyHjw0A3+c4WJ
 RJSCIHcHZYtQwXs9RXIRsHw2inHuS8lxvA==
X-Google-Smtp-Source: ABdhPJxVPK3/bsPT1Y6lK3l1skoThWH8ryUJs8zYoLef0x0Hb9nucoETKyYQ9AMpYQI6XijABsrZFg==
X-Received: by 2002:a05:6808:309a:b0:2f9:eced:3857 with SMTP id
 bl26-20020a056808309a00b002f9eced3857mr2341783oib.176.1650480138596; 
 Wed, 20 Apr 2022 11:42:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 z5-20020a0568301da500b006054fd8c847sm3022132oti.11.2022.04.20.11.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:42:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:42:16 -0600
Message-Id: <20220420184216.777380-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-zopfli: bump to version 0.2.1
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
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 92b51bdf18..969ed97992 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  f66b6f4132533b9b0ab8b0af757237bf  zopfli-0.1.9.zip
-sha256  78de3cc08a8efaa8013d61528907d91ac4d6cc014ffd8a41cc10ee75e9e60d7b  zopfli-0.1.9.zip
+md5  505ea595d86b8a7fec55620c839a4859  zopfli-0.2.1.zip
+sha256  e5263d2806e2c1ccb23f52b2972a235d31d42f22f3fa3032cc9aded51e9bf2c6  zopfli-0.2.1.zip
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index 95a0067b05..689634fefa 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.1.9
+PYTHON_ZOPFLI_VERSION = 0.2.1
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/10/7d/278fd896401b0ef76e06cd42c3ce1541572d83b1c713b6786795c60a1bbe
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/91/25/ba6f370e18359292f05ca4df93642eb7d1c424721ef61f61b8610a63d0c5
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
