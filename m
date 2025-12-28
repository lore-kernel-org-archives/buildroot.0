Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04844D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1893740669;
	Sun, 28 Dec 2025 22:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1mo92lb_3ah; Sun, 28 Dec 2025 22:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A30C8404D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959608;
	bh=l7biNzVztqSrSd+IbTLzkHrWO2nmB3QkoDOiuOuhP+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PgdiuULfj1h0fGYWoMzMEsDbSxDofm2Y4J7GkogTI+Vwe7YNVQvA7lEmQksYOmyTb
	 my7um9oz02ZvfCk7den5mMWaZ0Q7Qr7NXLpkWeSFff2K/Wk1/qF+ZBSpWztfx9c6s/
	 aSlF7zZL2hTLfItEGjbdgWGzK+JfMkAz4lJ241KQpXmtiDVczWgjbGdpFsjqFZjAox
	 R5TABu8/GIgfBD9bbDSsB2f89hIbERrWvKnQguYoYGTWCgUj9VqCVVrV/qH/GYWRkd
	 COef1Mdaln5dOosXHC0b1Ryi00lY5tG2hvZGrk+Bardpd6J70bSh40QfYXyRkEqSyr
	 PYJCqVE1j366Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A30C8404D7;
	Sun, 28 Dec 2025 22:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3FE830D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDEBC60A71
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ailmRbv6x4GY for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F4160A59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F4160A59
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E6428616D; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:01:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ac7c62cce1679a648502dfcab4ac52e4c0b0b41
X-Git-Newrev: 4adcc7cac31c71f44d50c3db39db8b19c2b41f0d
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.1E6428616D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crc16: switch SITE to
 pypi.org
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4adcc7cac31c71f44d50c3db39db8b19c2b41f0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crc16/python-crc16.hash | 6 ++++--
 package/python-crc16/python-crc16.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-crc16/python-crc16.hash b/package/python-crc16/python-crc16.hash
index 4576a907ec..5244e400fa 100644
--- a/package/python-crc16/python-crc16.hash
+++ b/package/python-crc16/python-crc16.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  10aeda70fbe8b284874b3b1b8f74b9c1f6d5e8dee20ac8f9d5bc49f45f12a42a  python-crc16-0.1.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/crc16/json
+md5  3cb6a4f5fd10a58c09792e321cc467e5  crc16-0.1.1.tar.gz
+sha256  c1f86aa0390f4baf07d2631b16b979580eae1d9a973a826ce45353a22ee8d396  crc16-0.1.1.tar.gz
+# Locally computed sha256 checksums
 sha256  ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9  COPYING.txt
diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index 86e6f2ecf2..7a773eaf8e 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_CRC16_VERSION = 0.1.1
-PYTHON_CRC16_SITE = $(call github,gennady,pycrc16,v$(PYTHON_CRC16_VERSION))
+PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
+PYTHON_CRC16_SITE = https://files.pythonhosted.org/packages/a6/e0/70a44c4385f2b33df82e518005aae16b5c1feaf082c73c0acebe3426fc0a
 PYTHON_CRC16_LICENSE = LGPL-3.0+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 PYTHON_CRC16_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
