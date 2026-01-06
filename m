Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D720D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02CBC416C4;
	Wed,  7 Jan 2026 18:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-Q9fSGxQpjo; Wed,  7 Jan 2026 18:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06470416CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809014;
	bh=OysknNaGqnuLjGVZf6RPGYm7GBqibH+C22z4MX9Pddg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jrei72aPh0zbtntKe0GiKrRz57Ig+pZpuLM0+QeqFoYPl/aDtJiloZE26MMSb5Nyo
	 QR+JTRjfIM5+ofaPkAcFrtbFV2+00Mm16zDCnKegZ1NiXD1mA5f8wdUlLjbgBqHyZv
	 Tw+lF/Zx+LKE+I7PNUdHK2knUKbuIZGR/qmtFie4bTmFqf1c3zL0y3m8vIlKfyGBD3
	 0L/LkiswpsUtrOtwRwLX/vomI5rNMcAGHjxwiaNhzX9JHo1SWFX8u3MG9M91oeTrIQ
	 atXSCWW5nRTptei7MSIcbIerlqMzEwJ5KHZbKOSwTd9noJLXJNY5amPltR0wpehUcR
	 OahsKnbCtaoVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06470416CD;
	Wed,  7 Jan 2026 18:03:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE51A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8C0040A3F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id el4dnl96aBUS for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038B34090F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 038B34090F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02A58811C5; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:01:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a00713b7736dfebe38da83e86b21afade89c684f
X-Git-Newrev: acc6b5d3d0a884a0400d1cba094f87c08bb90ca3
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.02A58811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-pyqrcode:
 update tarball URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=acc6b5d3d0a884a0400d1cba094f87c08bb90ca3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 46f8497e1c92c29a2f1d9889b897d948b496ef92)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyqrcode/python-pyqrcode.hash | 4 ++--
 package/python-pyqrcode/python-pyqrcode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyqrcode/python-pyqrcode.hash b/package/python-pyqrcode/python-pyqrcode.hash
index c946ba9d9b..9c1dfce294 100644
--- a/package/python-pyqrcode/python-pyqrcode.hash
+++ b/package/python-pyqrcode/python-pyqrcode.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyqrcode/json
+# md5, sha256 from https://pypi.org/pypi/pyqrcode/json
 md5  371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
-# Locally computed
 sha256  fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
+# Locally computed
 sha256  bef0c3595451da5132dea99e288fb5dafcbc469e0643f993a4ba0a69980f5ec9  setup.py
diff --git a/package/python-pyqrcode/python-pyqrcode.mk b/package/python-pyqrcode/python-pyqrcode.mk
index f3eac5a3c0..6dfe1afa6d 100644
--- a/package/python-pyqrcode/python-pyqrcode.mk
+++ b/package/python-pyqrcode/python-pyqrcode.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYQRCODE_VERSION = 1.2.1
 PYTHON_PYQRCODE_SOURCE = PyQRCode-$(PYTHON_PYQRCODE_VERSION).tar.gz
-PYTHON_PYQRCODE_SITE = https://pypi.python.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
+PYTHON_PYQRCODE_SITE = https://files.pythonhosted.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
 PYTHON_PYQRCODE_SETUP_TYPE = setuptools
 PYTHON_PYQRCODE_LICENSE = BSD-3-Clause
 PYTHON_PYQRCODE_LICENSE_FILES = setup.py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
