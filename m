Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76CECD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977F86152F;
	Sun,  3 May 2026 14:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEsjZbIOYjQT; Sun,  3 May 2026 14:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B3CE61569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819889;
	bh=jRUdd5hvoBskxjFintL7hxMgtnelTUX+T6mhbmVUyk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mhqGR/85oB2UkiI6Sfx/qmqHkaRRj6TIPvWlL2572hr0qT6x1Pak5JRnV9A1Ctta2
	 nYDgH4P8agrhDNTL7XcgawLTWJwVWFG0bnYLQb6At1Fky6MQUQCfIqZ/bGRGea/joX
	 g4YtbOh51PE703S2dMr/UjCIq7w/m0beyWAvlodYWvxz/EsGTyZo/jLm2JpMFiRFqE
	 CWHzfBTkdm2U64P3v/JIUInc5EDAblfjhYek7wAjsswu2rn0BTDeYZo+hKpgj8CN9S
	 Z2RUphSpSQ0Mw2CAvaHUljNPjX8Spig7zE7Lehdfc9hFD5qbffZt9UtHVRksMYl8RK
	 NqMa9/6+cESRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B3CE61569;
	Sun,  3 May 2026 14:51:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69846190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E9FA61314
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6i-S4ZSLNbf for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 582786124B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 582786124B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D7A83FC0; Sun,  3 May 2026 14:50:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a02827055c924586729e6c2c92234f95551a95b
X-Git-Newrev: eaddc7dae675dd2b1e87372b7e3ec0dff649660a
X-Patchwork-Hint: ignore
Message-Id: <20260503145048.20D7A83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbprotocol: bump version
 to 1.16.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eaddc7dae675dd2b1e87372b7e3ec0dff649660a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jborean93/smbprotocol/blob/v1.16.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index ca8889029a..3a73e17723 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  cf9607c3d117e2c53b907f78702808b9  smbprotocol-1.16.0.tar.gz
-sha256  babeb6fa825ba57939f9637c49a34548ddca348386d34de0796d1f87882c0bda  smbprotocol-1.16.0.tar.gz
+md5  fc4879f8472ffd714d6aaa986ad2dce2  smbprotocol-1.16.1.tar.gz
+sha256  ad7a31662792817c6da3629a3cfb96a51d8213e993ebd0c0a7ee750d2b1f8ec8  smbprotocol-1.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 5978b3847e..3efe8818f9 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.16.0
+PYTHON_SMBPROTOCOL_VERSION = 1.16.1
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/c0/5e/1eb2adb1e4739e8a1571f4a641850569ed65d72f72e3d3fd4b121e424795
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/33/76/c32681e925fc859578d4e41e4bd3ef7e2b9e7d06141f703eec032875b28a
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
