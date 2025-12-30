Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72DBE95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C015B80990;
	Tue, 30 Dec 2025 13:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioCEYfkd61Tk; Tue, 30 Dec 2025 13:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4B98081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099650;
	bh=f3/iKTdbsmj+lfRb/dt7Mqal2/RZyTQ4QM1Z45Z6xzU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VK6+35Mez4dp2cvErzDMh9FeRQ1WkuEHZ9ZZMQjcM+WphnD33oFoUL3L45tFh2coz
	 2KDrOSwL0C93EyB69KJiNWuKjquHiaPf0nVMvsTWovjCVePOw6luzYYLAq4TiiBhXK
	 jgPiXaRv3ct2HU+5maBDnuYcQO63qjOCY1tb/8MTWnYabims68hpo+OOeKyxK9XR7N
	 ud2oZRaWiuTqOuY04yjaFdU/e8DQVzDB7pPYg+O0KbJn/bW7JZ14IFvWO9rFmDMQO4
	 1PbNXjjp4TX++1CNCzw1MGZ17Y/QqucK2JKHAzvwxuKGJ9LKyxLwr/Mc2azfW4V9SG
	 6EtDQwoVIV88g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF4B98081F;
	Tue, 30 Dec 2025 13:00:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B4F9177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3715405AA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtYdkk24sXJ7 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B846940606
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B846940606
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6A0C87A42; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:00:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 047350c58fe6bfba0dae1e6e7b22e6eea6e76c5b
X-Git-Newrev: 0aab73b085516d634032982f52a3a8c5450d526f
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.B6A0C87A42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-secretstorage: bump to
 version 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0aab73b085516d634032982f52a3a8c5450d526f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to copyright year update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-secretstorage/python-secretstorage.hash | 6 +++---
 package/python-secretstorage/python-secretstorage.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-secretstorage/python-secretstorage.hash b/package/python-secretstorage/python-secretstorage.hash
index ae0a5be347..a722571bea 100644
--- a/package/python-secretstorage/python-secretstorage.hash
+++ b/package/python-secretstorage/python-secretstorage.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/secretstorage/json
-md5  c6ff1cc866d2f1d274b75c6490726b1b  SecretStorage-3.3.3.tar.gz
-sha256  2403533ef369eca6d2ba81718576c5e0f564d5cca1b58f73a8b23e7d4eeebd77  SecretStorage-3.3.3.tar.gz
+md5  e9de49f6474fc3734fde4209e594e7d9  secretstorage-3.5.0.tar.gz
+sha256  f04b8e4689cbce351744d5537bf6b1329c6fc68f91fa666f60a380edddcd11be  secretstorage-3.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  70f6bfca77633c35efa218328eda5486d7054c2914d61820980e378797520a25  LICENSE
+sha256  e700357592bb93704cb040ce4a6663a85292716a4041b6a267f598f21658466f  LICENSE
diff --git a/package/python-secretstorage/python-secretstorage.mk b/package/python-secretstorage/python-secretstorage.mk
index 81487aa8fb..0f1c3c62f1 100644
--- a/package/python-secretstorage/python-secretstorage.mk
+++ b/package/python-secretstorage/python-secretstorage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SECRETSTORAGE_VERSION = 3.3.3
-PYTHON_SECRETSTORAGE_SOURCE = SecretStorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
-PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/53/a4/f48c9d79cb507ed1373477dbceaba7401fd8a23af63b837fa61f1dcd3691
+PYTHON_SECRETSTORAGE_VERSION = 3.5.0
+PYTHON_SECRETSTORAGE_SOURCE = secretstorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
+PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/1c/03/e834bcd866f2f8a49a85eaff47340affa3bfa391ee9912a952a1faa68c7b
 PYTHON_SECRETSTORAGE_SETUP_TYPE = setuptools
 PYTHON_SECRETSTORAGE_LICENSE = BSD-3-Clause
 PYTHON_SECRETSTORAGE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
