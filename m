Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F6BC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4CF4241F;
	Thu, 11 Jan 2024 06:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A4CF4241F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C17va9nAPueV; Thu, 11 Jan 2024 06:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89F7423E0;
	Thu, 11 Jan 2024 06:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89F7423E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C78791BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB11343805
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB11343805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3hr9XzDrjUv for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:27:15 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79DC840133
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DC840133
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-36074b286d8so26177895ab.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704954434; x=1705559234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJL5P7zjv7ohLFC9N9/62k76dz4m8J4QWKEUl+I9X0k=;
 b=xNk6cDh7oHnKkt4nXbhrLQHkdz+XjrtfENPTf5JpkDXfucIAhXK7cz8y4fgUojb/9X
 hnAln8IXWpN0LmhEkNNKnsMjgqpXoJtt9mRjg5PRxq3OZnnhtoPhgIXW1e3WmWdvWihX
 pOWbWw1ohnEMl/+R26v0CGaYrLljg13QkcVOhZzjl0Ipru00zODR+llQf4n0/KO7gzD9
 F54+qTPE9M/zMCHLhoHRtJz81/qOKu0udvLDR38AkrJHR+JIu7KonfSdAneTvh5SCcYi
 bxDES8p9qlakNv1SOpHdxRVLu+DTu9tYf6SscSg+RxzC2dKCBZ9HO5ztkjq2sUwBP/BL
 H3+g==
X-Gm-Message-State: AOJu0YzqFvXW2betVNjNOUouJc6vHvF03Rp++5JnOnD1PSogpcPD27k/
 DkG1PGzyrYFp5ZYt9I20twxDaLIMpCoNfA==
X-Google-Smtp-Source: AGHT+IHDELTbxIRDBiDYo8CEKfOJqxWhnYusEeglTaIJZa+CEj6KRA15+Bkz1b4OsP9vvo8v09JiXg==
X-Received: by 2002:a05:6e02:1be1:b0:35f:ca9d:6c42 with SMTP id
 y1-20020a056e021be100b0035fca9d6c42mr963836ilv.4.1704954433946; 
 Wed, 10 Jan 2024 22:27:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 k21-20020a02a715000000b0046e25bf354asm137148jam.72.2024.01.10.22.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:27:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:27:11 -0700
Message-Id: <20240111062711.3041375-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704954434; x=1705559234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DJL5P7zjv7ohLFC9N9/62k76dz4m8J4QWKEUl+I9X0k=;
 b=CKLGqDZhM+Z4vv7aRYferumEN5s5SsSYJhtY4zc8WLIk9YwXicbCT8RYapd7KgdFK4
 bj6kGv3//N1A4NXxg+Z+fGyVQQvEWl5hMad4cLLiIGwMji48RZJ2Ffu69V7dqfuKMdba
 J5BIOW9pgqkAEYCxCXjhL5jHLSvTSYLg9gN8I9V4ngolD1Q0v6ibLTNr3g92C2Dj2rtv
 bTSktyID1w3cjnCgrmuKdSGcDe+Eo1mEheBRCo7BXL0cq4X00YuG9M7dYWkRHVHIkYvD
 vWHwGEKYdt+yGDkjg2x48OvORuke8xdzGjdVEY5mzjScFyxYOnB224H0Li1atJMTLJ0V
 Z4ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CKLGqDZh
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm-git-archive:
 bump to version 1.4.1
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
 .../python-setuptools-scm-git-archive.hash                    | 4 ++--
 .../python-setuptools-scm-git-archive.mk                      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
index 40b4b0e7f7..ce790a3d59 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
-md5  df3933d33c49c5d9aca06715b4c65370  setuptools_scm_git_archive-1.4.tar.gz
-sha256  b048b27b32e1e76ec865b0caa4bb85df6ddbf4697d6909f567ac36709f6ef2f0  setuptools_scm_git_archive-1.4.tar.gz
+md5  cfcdab6edbe6b710ab24ad355e7cf7a3  setuptools_scm_git_archive-1.4.1.tar.gz
+sha256  c418bc77b3974d3ac65f268f058f23e01dc5f991f2233128b0e16a69de227b09  setuptools_scm_git_archive-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 278fc972e5..153343788b 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4.1
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/69/5f/7135eec07395c51d3dd6899251b277405ecc2f8f7a80ef80a483e3c5a2bd
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/47/d6/c9a8d1ea95613f79b9b914cf9a5e8e420b7625fc54137c1d7c9cbbda5adf
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
