Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A440C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 04:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A809060B79;
	Wed,  2 Feb 2022 04:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBTPMJwVO8LQ; Wed,  2 Feb 2022 04:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B108D60AD5;
	Wed,  2 Feb 2022 04:38:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21B261BF380
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F99C40899
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-m-siimBNuK for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 04:38:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C91324088C
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 04:38:33 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id n17so23967567iod.4
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 20:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27LjD5RjKSphl0w/kw7sxEC+A6Kp78Q/40y1ba/jyCk=;
 b=RBYsTTGJ68l0nYoOJBB9b5ibWCLoYzQLAkmj7GHYzZRVLVonIfrdZWL88HXnv8iCtY
 INxSH6fMrv3XgPNV2gSFNT7rQXAhZVx+eS7dS2r81DlJ6F7FW02AC414B4b8xRHeetIz
 jwlMprwSZC8F8PHHTD2qJ7mpjGU8viGJdSGhkrZg+s95jdP9upg7rjeD5gTsJjytG7Tu
 qGCDdofQKXUtxO4gvlNou3loV0fDGKAoCOh7LAOklSSoudTnYxXKuTst6X7bpiRJHR+2
 s2v68eUVoXruz5rRQzVDqhH//L/Kem21ov8SQM3MXtjVuCWZF6IinFT8rMZQYg4pToDV
 1aIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27LjD5RjKSphl0w/kw7sxEC+A6Kp78Q/40y1ba/jyCk=;
 b=pJI64gkZCV8AHLH7TtZhPz0jFNv0ISMFxkku8/SKVq1cUc6JQIvoAotU6RuE+Uk/KI
 TKkoY5C5ldwjL0u8zpcugDHdFpaqov4gud6DNDtUx/+zfPxkJ1khSf6M0hY5KZnFpW8e
 XoIvjh6N+N1Dbm+feUbh+4w+2B79xiraJnF77T1epinXebvEXZhQxph32OXHIBfUX3lt
 PUO5LkiwLxg1nqWQjXj7t+jxm1zfZE+VdMmLkeFF+V8ma2oLZhLbEfm442t8npYc+RN5
 d+nuLCX+oJ0rVaO6ZG2U5b8lnW529MjVHmDZrR9MuLG4yq5s8GcETxdJmktPQHAqzY4c
 uSKA==
X-Gm-Message-State: AOAM533PwC3c2FhHJQXK6iTeQhVN2SZGgCFbimHi3tpI9tQUT9KDxrc3
 YXst8qy9PSROwLhCEWglPG4JZ63ZUIE=
X-Google-Smtp-Source: ABdhPJwCqCdvgolaFvCbau685wfRBs/WVQDZVvBDza/kOxBTlV/X4F7B0OycAskaVjq8C3kxFjYF1Q==
X-Received: by 2002:a05:6602:1512:: with SMTP id
 g18mr8522362iow.121.1643776712780; 
 Tue, 01 Feb 2022 20:38:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id n9sm22148682ilk.27.2022.02.01.20.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 20:38:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 21:38:30 -0700
Message-Id: <20220202043830.2211307-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3-setuptools: bump to version
 60.6.0
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
 package/python-setuptools/59.8.0/python-setuptools.hash       | 4 ----
 .../{59.8.0 => 60.6.0}/0001-add-executable.patch              | 0
 package/python-setuptools/60.6.0/python-setuptools.hash       | 4 ++++
 package/python-setuptools/python-setuptools.mk                | 4 ++--
 package/python3-setuptools/0001-add-executable.patch          | 2 +-
 package/python3-setuptools/python3-setuptools.hash            | 2 +-
 package/python3-setuptools/python3-setuptools.mk              | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 package/python-setuptools/59.8.0/python-setuptools.hash
 rename package/python-setuptools/{59.8.0 => 60.6.0}/0001-add-executable.patch (100%)
 create mode 100644 package/python-setuptools/60.6.0/python-setuptools.hash

diff --git a/package/python-setuptools/59.8.0/python-setuptools.hash b/package/python-setuptools/59.8.0/python-setuptools.hash
deleted file mode 100644
index 285919639d..0000000000
--- a/package/python-setuptools/59.8.0/python-setuptools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://pypi.org/pypi/setuptools/json
-md5  675f2089d970bf0bbfc3f49c80e4c7c3  setuptools-59.8.0.tar.gz
-sha256  09980778aa734c3037a47997f28d6db5ab18bdf2af0e49f719bfc53967fd2e82  setuptools-59.8.0.tar.gz
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/59.8.0/0001-add-executable.patch b/package/python-setuptools/60.6.0/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/59.8.0/0001-add-executable.patch
rename to package/python-setuptools/60.6.0/0001-add-executable.patch
diff --git a/package/python-setuptools/60.6.0/python-setuptools.hash b/package/python-setuptools/60.6.0/python-setuptools.hash
new file mode 100644
index 0000000000..734cb4d580
--- /dev/null
+++ b/package/python-setuptools/60.6.0/python-setuptools.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/setuptools/json
+md5  392e91d7e244998c586c88da2cf881d3  setuptools-60.6.0.tar.gz
+sha256  eb83b1012ae6bf436901c2a2cee35d45b7260f31fd4b65fd1e50a9f99c11d7f8  setuptools-60.6.0.tar.gz
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index d83336b909..15912d96f5 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -9,9 +9,9 @@
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
-PYTHON_SETUPTOOLS_VERSION = 59.8.0
+PYTHON_SETUPTOOLS_VERSION = 60.6.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/8f/89/9fec81ec84737c925a1ee992af2c6c7153aec4051c26afeadd6b822354d2
 else # Python
 PYTHON_SETUPTOOLS_VERSION = 44.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
index 6fc7595a8d..9d608239bc 120000
--- a/package/python3-setuptools/0001-add-executable.patch
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -1 +1 @@
-../python-setuptools/59.8.0/0001-add-executable.patch
\ No newline at end of file
+../python-setuptools/60.6.0/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
index 91d8bc0887..9fb96015aa 120000
--- a/package/python3-setuptools/python3-setuptools.hash
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -1 +1 @@
-../python-setuptools/59.8.0/python-setuptools.hash
\ No newline at end of file
+../python-setuptools/60.6.0/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index f4dae2d15d..55a01dba01 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 59.8.0
+PYTHON3_SETUPTOOLS_VERSION = 60.6.0
 PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/8f/89/9fec81ec84737c925a1ee992af2c6c7153aec4051c26afeadd6b822354d2
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
