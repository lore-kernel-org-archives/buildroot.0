Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03347C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0E060C07;
	Mon, 10 Jan 2022 07:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjEdqcDTDX9Z; Mon, 10 Jan 2022 07:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD65B60C06;
	Mon, 10 Jan 2022 07:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3E7E1BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C205860C06
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkB82KkS6ofg for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:39:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C505F60C01
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:39:05 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso4726825otr.6
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IoWyDim10MQXhdq7CaLpapsypee1MCgEA3Tz16OamTE=;
 b=U2cTeJ+qwKTrS8VN20dwa8wLHfgj/PElxHndbiWut7HG4o+QjEfn7LTlyu1mThBmXx
 4JAaLDWRMdoqKx5m0jRRoSR+J12VLoCy4HQqEVweoZeoWYbg5HZksyI8LExmLc6DDST4
 a+CCrdPum1E783XKvKcQtUvvW9Z0vGQERrQjyry3YzMA0FKidXQCv/OoMY0NFTcDq1Qy
 GelOwAUOQ4NkMNaiwKF/utEBLkFe4TW8KtZAutzaZ5r+oDBqfd0aMlrYH3X/oETEaxWh
 Sn4Ih0ak7r5oLyz8Ykdr7EBbfbcyqR5q44bX8/eFMGAEeEL8BSJnMZHpV5198zUIsPjo
 Zl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IoWyDim10MQXhdq7CaLpapsypee1MCgEA3Tz16OamTE=;
 b=jD0MeFi16xsyj2an/pCt6j7BVXjQdF0UjqideuJb33j8r8I6Mo0LauMn7T+mK97A69
 rCgfg4PhaAlVWTNNYTo3zhCthC62O2wL6xCmYmvW3LUtIgPV5mcxOBQajqsMRALacH/D
 feX12PgS7NhC5rBfsJ4jxksl57QNKhqDywEbHBtEF+9qE3ckdbw8WKrSmkeWsKhK8Y6X
 ZMX7yVMrcUk/kKnQQS+6FO4O0EZ6AnCIomjQvjC2LYdWsojL135Hw3i1230hk/MzesUO
 5aVYUZTG+B7hD92VfHpYIiBnNg71P1Pi2ju92M6wSqqaOurKopq1kgndZ0ehw3bFRDOr
 iF6g==
X-Gm-Message-State: AOAM531Oyzx2LioZwKAEqVfbJOfOyfawWL4FptRJBcBrL9/FJEohLad7
 BQKdBck72HpGN1dPn/f/rlSwFxW88so=
X-Google-Smtp-Source: ABdhPJw+zkYDng1EbWT1BJ2ibcJ86rpfIH2UQD19dtwgooQSywXKrHpI5q1zWDXIwcGb8kP3DgKXJQ==
X-Received: by 2002:a05:6830:791:: with SMTP id
 w17mr8713786ots.72.1641800344603; 
 Sun, 09 Jan 2022 23:39:04 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id 2sm1348881otm.41.2022.01.09.23.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:39:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 00:38:50 -0700
Message-Id: <20220110073850.1603711-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110073850.1603711-1-james.hilliard1@gmail.com>
References: <20220110073850.1603711-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-tinycss2: bump to version
 1.1.1
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

This update drops distutils support and requires flit package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tinycss2/Config.in            | 2 ++
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-tinycss2/Config.in b/package/python-tinycss2/Config.in
index e6c992b8c5..e7a5bb3659 100644
--- a/package/python-tinycss2/Config.in
+++ b/package/python-tinycss2/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_PYTHON_TINYCSS2
 	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
 	help
 	  A tiny CSS parser.
+
+	  https://www.courtbouillon.org/tinycss2
diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index eeb3754752..e8e1d93f83 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  7caf513c4e87fc2449dcfbf407a8416f  tinycss2-1.1.0.tar.gz
-sha256  fbdcac3044d60eb85fdb2aa840ece43cf7dbe798e373e6ee0be545d4d134e18a  tinycss2-1.1.0.tar.gz
+md5  60272f58f8d5834b2e09ffbc9bd5de53  tinycss2-1.1.1.tar.gz
+sha256  b2e44dd8883c360c35dd0d1b5aad0b610e5156c2cb3b33434634e539ead9d8bf  tinycss2-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index 4bf5b97766..e4fc5dc9c5 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.1.0
+PYTHON_TINYCSS2_VERSION = 1.1.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/ce/d3/ece7a98d5826bd134e269a3a3030153d30482194fca71d95a3041812aab8
-PYTHON_TINYCSS2_SETUP_TYPE = distutils
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/1e/5a/576828164b5486f319c4323915b915a8af3fa4a654bbb6f8fc8e87b5cb17
+PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
