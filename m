Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025BBC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 16:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C56F60AAA;
	Sat,  2 Mar 2024 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfrFkMWr_1Ge; Sat,  2 Mar 2024 16:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34DB60AAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F34DB60AAC;
	Sat,  2 Mar 2024 16:31:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF2B1BF2F1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 16:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48431418A8
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 16:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14w-8pke_1Dq for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 16:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B1B141899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1B141899
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B1B141899
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 16:31:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412d67e4ec1so3633645e9.1
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 08:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709397106; x=1710001906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYrRPOweSCp4GeRxw1K5K2LDbrdV7xbMLGQe6we9XPk=;
 b=Ol37+CeP6e4gIPlR21Y+25CbvpdRqoF90ArhB3OLQb1YMhTzJqKUDGyQmS5FJBetcL
 8N+Jzhp/X+v+K/wV7q2DFmbNoFZo5TsI2+J/caMaHr9Bp+0vFTLSI3msGl0LjdhpGNWh
 HyNmUlTIj2o0SzNC3zFovTAnXiyBcB8YdXFKYkihyLv5o9XqTS7wkXP/TAgPEHc+mlJw
 PSuc1XsI9diVH/CHmCeudfjX4RwQDthL7NqLsnHmzourVfltGocND2m+XlzAe97Hwddk
 Q8550LMFqOSS5LHN0jc3Zoec2VZMuydBJPR8cpqvHf69nNAMOa9KZbIBgp4k5/eysVf+
 n5RA==
X-Gm-Message-State: AOJu0Yw7E8vgEuWyp+WQpX/SD2nXxwxrkClgqUHP8AfI0OYA1xPf0sHZ
 AgPu4G674SNXfdLRryP452jRcNJtxtNmeirYwWYLWPFZ0qRXFf7uyo0jqDum
X-Google-Smtp-Source: AGHT+IHZjS6x63/dD6yrcoRrH+Qv9a5DUombx8N+7gWBkHUC7K1QqhcVqdOYi4uYpWkLbwsGhf420Q==
X-Received: by 2002:adf:e843:0:b0:33d:c5c6:5e1c with SMTP id
 d3-20020adfe843000000b0033dc5c65e1cmr2982477wrn.58.1709397105819; 
 Sat, 02 Mar 2024 08:31:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c1d8a00b00412da96613fsm1429978wms.47.2024.03.02.08.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 08:31:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 17:31:38 +0100
Message-ID: <20240302163138.152368-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240302163138.152368-1-fontaine.fabrice@gmail.com>
References: <20240302163138.152368-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709397106; x=1710001906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYrRPOweSCp4GeRxw1K5K2LDbrdV7xbMLGQe6we9XPk=;
 b=DB1ze+yfh1m7oYUrdxhz/mMRxF0IZFp77X2bSV+HB5hK9p/08pnyDZFlEV7UhWLMqt
 z9Krw5EuqRxk57k396YDoA+cOYscl23ZVnC9WfpRNezuaaJaBHEiu8MSYOEC/zhqu/JI
 girXkEs0BKSxmjx9B/zo8MIZ3miXb7p3wvKg2fIHHTA/4xpOnNThpqKY622FiRNYEwMN
 d8pRqFI0f7tlpAmhCLHMO8VyjvUV6cvFt7P6V2jatLbPOXMr+n3RL1x/IhTN3aheH9s3
 lnm7mRUn7YZVKO2BLmNT7k8+/kuvGZ2+XMvbauRLe7Aw2SNiVmb4NEv7/0r2cyFX34YH
 cGHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DB1ze+yf
Subject: [Buildroot] [PATCH 2/2] package/python-setuptools-scm-git-archive:
 drop package
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-setuptools-scm-git-archive is obsolete as
python-setuptools-scm >= 7.0.0 supports Git archives by itself.

Moreover, it raises the following build failure without pip since its
addition in commit 9359325c6081df89ff57667cb49e0d12cd553b97:

/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/bin/python: No module named pip
Traceback (most recent call last):
  File "/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/lib/python3.10/site-packages/setuptools/installer.py", line 82, in fetch_build_egg
    subprocess.check_call(cmd)
  File "/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/lib/python3.10/subprocess.py", line 369, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/bin/python', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpaxobatcs', '--quiet', 'typing-extensions']' returned non-zero exit status 1.

Fixes:
 - http://autobuild.buildroot.org/results/d05e412170c427e4f210da164c783b3527f15892
 - http://autobuild.buildroot.org/results/50f80cfabccbe5c75cd889ce6af2b418e376d4e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../python-setuptools-scm-git-archive.hash        |  5 -----
 .../python-setuptools-scm-git-archive.mk          | 15 ---------------
 2 files changed, 20 deletions(-)
 delete mode 100644 package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
 delete mode 100644 package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk

diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
deleted file mode 100644
index ce790a3d59..0000000000
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
-md5  cfcdab6edbe6b710ab24ad355e7cf7a3  setuptools_scm_git_archive-1.4.1.tar.gz
-sha256  c418bc77b3974d3ac65f268f058f23e01dc5f991f2233128b0e16a69de227b09  setuptools_scm_git_archive-1.4.1.tar.gz
-# Locally computed sha256 checksums
-sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
deleted file mode 100644
index 153343788b..0000000000
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-setuptools-scm-git-archive
-#
-################################################################################
-
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4.1
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/47/d6/c9a8d1ea95613f79b9b914cf9a5e8e420b7625fc54137c1d7c9cbbda5adf
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
-
-$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
