Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1424BD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E190983566;
	Wed,  7 Jan 2026 18:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWaYZfY0oJku; Wed,  7 Jan 2026 18:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3187834F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808993;
	bh=zx70wTDaaWG4tiufAuKgIDLMoYeDLY0GqVbaonvGqF8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sBNtcxw/fZjM8BI4cR7KJilQcuIa8oYHN084NlDG4RPCAQsbcff3dlpgNzTyWHiT6
	 d4OmuPGojWOjx/fGsae4ij3VNZRraVzKDVSkYwj1MED3PO9UEzqY7cHa5KKCmWuo4Z
	 7MTSW+QzsGuTR4/y3aNCrBLJvpgg+spvdyhWYcyxQCb+7rxkjaGcgo+O//h3eHnw17
	 Jv6tDb6RQ96zJtmNPxySP08s4W99PbHrTVY0WFznAW9hOlImUhNmCEmY0QBYn8gJHn
	 sUnNHLdA2fF9qYg2ep3MRo0V1s+rJx88S++ubjyKAv8zpGLyWOMbruiN+v5q19ElGr
	 tuWakUQIp50yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3187834F2;
	Wed,  7 Jan 2026 18:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 019D39ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15E3C812E8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZV75YvLgmsa for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 347F78113A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 347F78113A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3361F875A1; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:58:17 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 20b7af0d01cd0258cf3e91538e9f319ea6836438
X-Git-Newrev: b495fc06c1dbbe273e0336c93e5606fa0e5657da
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.3361F875A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-colorzero:
 switch SITE to pypi.org
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

commit: https://git.buildroot.net/buildroot/commit/?id=b495fc06c1dbbe273e0336c93e5606fa0e5657da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6ac7c62cce1679a648502dfcab4ac52e4c0b0b41)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
