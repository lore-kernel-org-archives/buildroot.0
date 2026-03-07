Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E08FC9EE4
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E4B181DE9;
	Sat,  7 Mar 2026 10:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEO2RWlIEmih; Sat,  7 Mar 2026 10:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 946F7818E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878054;
	bh=1T6hyke7ztGjiMOOf7w9bO3Qrtha8HuwG5Y6FDBGh9Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jAZHwnFe4gPoPQ6ozcD4fhN6HBRLOERZ0vwkCpR6HeAGc4a+IVuM8uyoEmM4kdR1M
	 1RyRQtAN90WPA54UqnAsDD8rwqQcQ/pxtRUfwTyGQCmP/5axeSqWsHP8n6vdGMI6A7
	 6kvTny/nvPYBN5rWWloeNjjsVjpmYg4/J9P3Ibn1ax8BPxtSmXLxXHvTnFOnc96+wx
	 Dbx+WKOAoe6LFDD4BlorRIkjOLoPxhlWe/KLWVMxUOEYPNWd4y2IgCSCCf41TUOHsl
	 834x7KMesXYxfD9Ejs2IFPRhl0MT59QeIqz2coa/sUmAB25y3v2f/44q9NwwcrvIGl
	 Da1jhAggrZKAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 946F7818E8;
	Sat,  7 Mar 2026 10:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC89641B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0764818C9
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3x3VleymiDi for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C885F817A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C885F817A9
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEF378620F; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:00:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9c60c567587dc7a9957e5ec29fe2558b76e75e7
X-Git-Newrev: 51365ff06379aaf6fcc9a751e8ff32ac694f3e92
X-Patchwork-Hint: ignore
Message-Id: <20260307100729.CEF378620F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 82.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51365ff06379aaf6fcc9a751e8ff32ac694f3e92
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d0ed270e9c..0236a13999 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
-sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
+md5  6e65b88d2466b35e86e5187b99502b1c  setuptools-82.0.0.tar.gz
+sha256  22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb  setuptools-82.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..3c94931fbe 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 80.9.0
+PYTHON_SETUPTOOLS_VERSION = 82.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/82/f3/748f4d6f65d1756b9ae577f329c951cda23fb900e4de9f70900ced962085
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
