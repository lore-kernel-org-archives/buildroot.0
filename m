Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A8D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8371D81EBB;
	Wed,  7 Jan 2026 17:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4ZNIj1OGEO6; Wed,  7 Jan 2026 17:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC4381EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808071;
	bh=r1LEMuhc/FCXY22fZwPcMtklrOMP89cGnHEVZIwzcEo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CwEIoZEFoMHQEt8gqdptemZ7XUABCyy1vG/zpKxRg7k6xx+hS135erJylJHYRJpaZ
	 KBAdMzb2yQul5h6hGrvhTiORT22tC/mJvy+xspdm+aoxVZc73g4F8vrt22KK1qT0xo
	 3MvpDexb8K4DSfGj9UI83ZJ6Db+ssv78pgvC8/4wggQ9UgileMMVF82Q2I71ScnV0W
	 6J7UTWiz3DtHBqjT5HTGqXeNN5ftx9KR6Od07W/NyAdoHadeJkbxdB8ZOSNMDiwDYY
	 /3seu8lPsUrn80XxQT6mJqXHWsz+k6bkNau3OWrEuzv9cD3gRPxTLC5Z/S1Kd+FRbj
	 RTcuN7h41USew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC4381EB9;
	Wed,  7 Jan 2026 17:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13ABD25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D451280B9B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGk2KpmUk3N2 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09BBB80A6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09BBB80A6D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0859181917; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 204ab7869f396137c68e25fdf5cd9626a4b981bb
X-Git-Newrev: c8f90ae3935f51d73a0582ad8ffe29b519a3a617
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.0859181917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-colorzero:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8f90ae3935f51d73a0582ad8ffe29b519a3a617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
