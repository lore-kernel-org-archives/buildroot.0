Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464A4E9272A
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C5D4406A4;
	Sun, 28 Dec 2025 22:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0452hS0TTHa; Sun, 28 Dec 2025 22:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B16406F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959615;
	bh=Qbh7cgDWr4UiG2S9Nn58xi7vJLj33EWM/iLIulFolyc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dx9INjdoFeGDj9v4iGhSvmbIGV/MFcgI36LqQ8+iEttuAB3pzApEHjCosbkUyoi4o
	 HFpNXN6rxc92oA9rFd3N64zOsUjqF8/Ln4hPjhy0Zv2r1h3BN4zsCfW/ZfEHI0aPog
	 lohChNRbH5JOQGi57EfFMUFjVjrXEqU+uBdT2lAnYOKhHqNc6Tl5MdngFkhNx9dyEB
	 rBLHuxy1lKsXo/bgaiuSJIoc7JvIXF2mojjQlYjWz/fDC5xOWE4UKHmqtDEZw78+T3
	 HFNoArC/QUbI8kcw4js95oaK+Ve0kNPLswnW3cX5rNS15OuF0kp8VYH6PTMlQpjeI4
	 X8+0fsT0bImKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B16406F0;
	Sun, 28 Dec 2025 22:06:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C8B2D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA9860A59
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8UIgXdCA995 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A1160A5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36A1160A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15DD385C36; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:01:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39a123b9ec3392a16304f270210714841c91cd0b
X-Git-Newrev: 6ac7c62cce1679a648502dfcab4ac52e4c0b0b41
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.15DD385C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-colorzero: switch SITE to
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ac7c62cce1679a648502dfcab4ac52e4c0b0b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorzero/python-colorzero.hash | 7 ++++---
 package/python-colorzero/python-colorzero.mk   | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
index fc2455c836..4a1b900453 100644
--- a/package/python-colorzero/python-colorzero.hash
+++ b/package/python-colorzero/python-colorzero.hash
@@ -1,4 +1,5 @@
-# Locally computed
-sha256  86c9933b004aec8ce1c476d1d1129e00325c7724df3c09aa353d5f8e883ed08d  python-colorzero-2.0.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/colorzero/json
+md5  e7f71e181b94754bcc5ca7c92c52c0d7  colorzero-2.0.tar.gz
+sha256  e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191e12d85f8f9d5eb58  colorzero-2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  ee1c76f465410c34802ddf81d70e1ea7a4542cf58459425038498d8f4e36bb45  LICENSE.txt
diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
index f38c98a093..0ed6a90c61 100644
--- a/package/python-colorzero/python-colorzero.mk
+++ b/package/python-colorzero/python-colorzero.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_COLORZERO_VERSION = 2.0
-PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,release-$(PYTHON_COLORZERO_VERSION))
+PYTHON_COLORZERO_SOURCE = colorzero-$(PYTHON_COLORZERO_VERSION).tar.gz
+PYTHON_COLORZERO_SITE = https://files.pythonhosted.org/packages/b3/ca/688824a06e8c4d04c7d2fd2af2d8da27bed51af20ee5f094154e1d680334
 PYTHON_COLORZERO_LICENSE = BSD-3-Clause
 PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
 PYTHON_COLORZERO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
