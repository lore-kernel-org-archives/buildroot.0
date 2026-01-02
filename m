Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AF2FC6165
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53177408AC;
	Fri,  2 Jan 2026 22:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glsrBpH2hDhn; Fri,  2 Jan 2026 22:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B4F7408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393788;
	bh=HeH4gS2mXVH2kqzEuS9cN+N6mLSHwfrawi0nu0hCQv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hrlJ11jZQk3GNUJ+1KeQUXTW0q83sXZbujkWeAjhQNopTJvcrJo1bZDuP1JWQke2N
	 muqq4MUPKw1gvr1oXz4VSdpJqkqX6P381b8Io57wX1pUmadmBIdFlnIrPzPSUJ3lSf
	 aN/MpfvNRoAjowJ0vjQmSlts5Q+pYN1B9oL22FU7nmY9lX5xnyjPdHTxWa8Pdg2TVW
	 NGe4hyhbtrJYiDVLRvvCbT9t8ZeOu7lEF4jDp/DQ3bb9FvUBoOb49hNagaTcXXPEsJ
	 Wlay9qxi1WJKh6tycuzUJvbXjTH57WKI8OSjuZWqqsXie+pAAeXHc+Aq7B58lqjvMq
	 kA4hg4GPg/j8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B4F7408B3;
	Fri,  2 Jan 2026 22:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D9A249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8EC608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIbWTIthcDlA for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834F8608F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 834F8608F2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F250880A7; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:40:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 353012770406783a3ee7cf8d139f463d4f0e17b6
X-Git-Newrev: 16edb2ad254ca5386a7de470248c70edbcfe40af
X-Patchwork-Hint: ignore
Message-Id: <20260102224304.7F250880A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-keyring: bump to version
 25.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=16edb2ad254ca5386a7de470248c70edbcfe40af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/keyring/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/keyring/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-keyring/python-keyring.hash | 6 +++---
 package/python-keyring/python-keyring.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index dd0714d55e..0f8ad595f4 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  afe7f534c80dc29927f5211fcb925ed4  keyring-25.6.0.tar.gz
-sha256  0b39998aa941431eb3d9b0d4b2460bc773b9df6fed7621c2dfb291a7e0187a66  keyring-25.6.0.tar.gz
+md5  57c23d340e4d08ac4896f142ee423eca  keyring-25.7.0.tar.gz
+sha256  fe01bd85eb3f8fb3dd0405defdeac9a5b4f6f0439edbb3149577f244a2e8245b  keyring-25.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index eb2b62d96c..df397bea57 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 25.6.0
+PYTHON_KEYRING_VERSION = 25.7.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/70/09/d904a6e96f76ff214be59e7aa6ef7190008f52a0ab6689760a98de0bf37d
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/43/4b/674af6ef2f97d56f0ab5153bf0bfa28ccb6c3ed4d1babf4305449668807b
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
 PYTHON_KEYRING_CPE_ID_VENDOR = python
 PYTHON_KEYRING_CPE_ID_PRODUCT = keyring
-PYTHON_KEYRING_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_KEYRING_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
