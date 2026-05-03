Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D032CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955EC61292;
	Sun,  3 May 2026 14:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHCq4Bm5aPLL; Sun,  3 May 2026 14:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0B6461613
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819910;
	bh=RoOoOCADejFfuMnn6HoJCiCKSZEx65we0K2R0E5/D8Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K801KoDfJ5WCsZ4a/XASE3/TPTq8G3hfMr7jJ+vPRxtQmPjbpWFezvbqoC56ejRjW
	 AQzMNGrXu4AkgcyL33iRyDP00JcZC65gA60PMZ1h09J2kWEeVpHPo64p8IvZd0Qv22
	 7MiTsHPNw3V2CM5EId8xZwSGuEH19swP7bXfPjxqi5XJ1LRyOStglma50iTgfEK0Jv
	 GNJiAcsdPVUk+d1H89iRc/zlOWBY91a2HClME2yEyPaR/jZD7PaTlx1gRPvHbnzOWn
	 nMXudknD5nA9oahpeFNGUUNh/ToNYt+vCUecdVZT1i+maWpJ3sCBTNIlEOt6o+8vKY
	 uev2vwL0Q2JFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0B6461613;
	Sun,  3 May 2026 14:51:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAE99127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F7DB4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mssuPSpqVbk8 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EA54074D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75EA54074D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F89183FC0; Sun,  3 May 2026 14:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9803d9bf75a2153232acaae96719c5572cbcba5e
X-Git-Newrev: 35473bc31e5276004c340087846e6c1bd9e7bf89
X-Patchwork-Hint: ignore
Message-Id: <20260503145053.3F89183FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylru: bump version to 1.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35473bc31e5276004c340087846e6c1bd9e7bf89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jlhutch/pylru/compare/v1.2.1...v1.3.1

Updated license hash due to upstream commit
https://github.com/jlhutch/pylru/commit/05ff7f16db42d98aa9eb3f8fd9e47d2e07a7e47a
which switched the license to MIT.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pylru/python-pylru.hash | 6 +++---
 package/python-pylru/python-pylru.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index 83217a3417..46cd6b7710 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylru/json
-md5  101486c319fa219f147b8811975780d9  pylru-1.2.1.tar.gz
-sha256  47ad140a63ab9389648dadfbb4330700e0ffeeb28ec04664ee47d37ed133b0f4  pylru-1.2.1.tar.gz
+md5  1276fb7ba07e27c2f79462826788905d  pylru-1.3.1.tar.gz
+sha256  1ad89d14cdccefd81265bb619f9f9c351556e2e38fafc7a57b1319ded086f8e9  pylru-1.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
+sha256  b376065aeb8d20c17795697af05c8426ae02f736dd06224ded1b35aad8bac818  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 8658f75ba9..39c7c620d4 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.2.1
+PYTHON_PYLRU_VERSION = 1.3.1
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/95/8e/2a0d3426738db0b41d69d36243bdd00420ad231e802d09dad8db02005d13
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/76/5f/1c22971415233fa6132453fa8b5a7464b7b7af004a2f236717de403a42c6
 PYTHON_PYLRU_SETUP_TYPE = setuptools
-PYTHON_PYLRU_LICENSE = GPL-2.0
+PYTHON_PYLRU_LICENSE = MIT
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
