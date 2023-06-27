Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC102EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 07:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09D6982095;
	Tue, 27 Jun 2023 07:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D6982095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6xfXfrKDNKi; Tue, 27 Jun 2023 07:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2642082073;
	Tue, 27 Jun 2023 07:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2642082073
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41CAC1BF2B8
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 07:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28458401E1
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 07:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28458401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ec15AxR5jkFu for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 07:26:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 325E3400EF
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 325E3400EF
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 07:26:47 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-77e3267477cso212647139f.2
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 00:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687850806; x=1690442806;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kxOwXokpn2F5KokoJgJ1Ri/pWZ9BzOn1hp+7bk/vtBc=;
 b=HOz8HeLuJR3yISTeMdSQ20XhnaFzKL1CwmQzniNmNT2LvRg1WTWu8icAsn+gVG0tWh
 Xn1/sA2x6Lz+Ef8oWtLvtFc2QPTXWfo/0WTUIjy2tPrD6J+bLS+z6hdvZw+4MAt9qMJK
 fUObEKhV7n2lek8zzTBk/5qfvfyBvmHYkeku4k2KTx2gwfm1w73Q26kxJCvFxFqsdheZ
 /goAgp17W2C/sGJ0MFyTXlh1ZaU2I2ZR9+7xxnUIm0lVt76v2AHqDWiFXV36glXXvUIf
 mv8vnOMWf7aQ56mK6xLhWxIUVMn3HZ0MmZv0JldmCeW0OrDNTFy689V+N19jT40a0ACT
 UrmQ==
X-Gm-Message-State: AC+VfDwrokZyVN04Rh1VJwj7shswzM8gTYtvgMZ43YjFzmCpoCtsdf4H
 upRBPjr1RS7u2d1rUzpbN5buWuvUVU0=
X-Google-Smtp-Source: ACHHUZ6qJk7foiXU/KYrqY99ExJAHKLqlkHl6z27q8NP4coKOL3mtDXzdqUW3yfq1XIpTQrxDmAQKQ==
X-Received: by 2002:a05:6602:2497:b0:776:fa15:2898 with SMTP id
 g23-20020a056602249700b00776fa152898mr24190143ioe.5.1687850805677; 
 Tue, 27 Jun 2023 00:26:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 h2-20020a0566380f8200b0042907798fbcsm1484699jal.161.2023.06.27.00.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 00:26:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 01:26:39 -0600
Message-Id: <20230627072640.2437216-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687850806; x=1690442806;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kxOwXokpn2F5KokoJgJ1Ri/pWZ9BzOn1hp+7bk/vtBc=;
 b=Mvwuc5o/Z8z5Z+Xg2ccFZwX6X0VC4HAbVeNod+OzdLW8h+ddVrNeBRF7nZkwfHlkcT
 /cqFnlVQWZGBG7v8R/QROTCInqvH75HeK5ept2/0N6Z7YDnzneag3fI6rs0qdWiUBxr5
 JHRvCPX49utLDzKovB7zFKEvKrhA2eA19BfNDUGbR0gd6WHuu/ZOMNYf/v0Gp+0gMSkE
 MD72E/p6pw6UZEcS3B5Ht9HPmufzcDrx1AINkXlRfLJzr8HR/g6nHYGkF3sSWWNJOqc2
 HpcaXR5NwNU8zj51oZNKJPMCdsAz71qD/P0wpBTpCy/rgcjRgmzQ3L3B+Ul+VcsrKGTH
 aq8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Mvwuc5o/
Subject: [Buildroot] [PATCH 1/2] package/python-poetry-core: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to add a patch to prevent poetry core from matching a bogus
git directory when determining which files should be ignored.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...atching-bogus-parent-git-directories.patch | 49 +++++++++++++++++++
 .../python-poetry-core.hash                   |  5 ++
 .../python-poetry-core/python-poetry-core.mk  | 14 ++++++
 3 files changed, 68 insertions(+)
 create mode 100644 package/python-poetry-core/0001-Prevent-matching-bogus-parent-git-directories.patch
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/0001-Prevent-matching-bogus-parent-git-directories.patch b/package/python-poetry-core/0001-Prevent-matching-bogus-parent-git-directories.patch
new file mode 100644
index 0000000000..6b52ff9612
--- /dev/null
+++ b/package/python-poetry-core/0001-Prevent-matching-bogus-parent-git-directories.patch
@@ -0,0 +1,49 @@
+From 77924f1347d773bb3d60f5351045527377489984 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 26 Jun 2023 23:45:45 -0600
+Subject: [PATCH] Prevent matching bogus parent git directories
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/python-poetry/poetry-core/pull/611]
+---
+ src/poetry/core/vcs/__init__.py | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/src/poetry/core/vcs/__init__.py b/src/poetry/core/vcs/__init__.py
+index f4096ec..b4899b3 100644
+--- a/src/poetry/core/vcs/__init__.py
++++ b/src/poetry/core/vcs/__init__.py
+@@ -17,15 +17,22 @@ def get_vcs(directory: Path) -> Git | None:
+     try:
+         from poetry.core.vcs.git import executable
+ 
+-        git_dir = (
+-            subprocess.check_output(
+-                [executable(), "rev-parse", "--show-toplevel"], stderr=subprocess.STDOUT
++        check_ignore = subprocess.run(
++            [executable(), "check-ignore", "."],
++        ).returncode
++
++        if check_ignore == 0:
++            vcs = None
++        else:
++            git_dir = (
++                subprocess.check_output(
++                    [executable(), "rev-parse", "--show-toplevel"], stderr=subprocess.STDOUT
++                )
++                .decode()
++                .strip()
+             )
+-            .decode()
+-            .strip()
+-        )
+ 
+-        vcs = Git(Path(git_dir))
++            vcs = Git(Path(git_dir))
+ 
+     except (subprocess.CalledProcessError, OSError, RuntimeError):
+         vcs = None
+-- 
+2.41.0
+
diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..5e62cb1aaf
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  37e1a9d3d3c97c9670aed62108f2d5cb  poetry_core-1.6.1.tar.gz
+sha256  0f9b0de39665f36d6594657e7d57b6f463cc10f30c28e6d1c3b9ff54c26c9ac3  poetry_core-1.6.1.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..05d321a54d
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.6.1
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/20/e8/e0a80cc355bc207fb1760160344e978f39d683c35e1230f71b8916bf3a50
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = MIT
+PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
