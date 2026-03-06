Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E53FCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0574613ED;
	Fri,  6 Mar 2026 19:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlXYbaUtxgAh; Fri,  6 Mar 2026 19:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01620613F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826682;
	bh=UcUZFejIvvEprT6Log3ilnf7Xk4WLUGtVaBBNVtHlGY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XAwtcQTTlnodAjrNcgekFsmo9Nsi/HiKEPunh13iUtTFtrF+Cu4Bui+M+4/8MoCLp
	 NBorGgJBVFxwNd8VZ+IcirgH9HYm6ShafoBBC7jL3dyFBJynwuC3LUAmpQWwglM9Ym
	 yleCvrq8qt6FZ1d2vdRWx2Kk2zMJap7GFzYCYjgmd2l94QdbKFDEjs9QgXc72681kG
	 wcSzkCEqY+8J9uJPPtBA+8Pf/ISdw2skgDZsI0tFkgwwpgUxfttznIcxn457JA45Lk
	 Lz3WA7xOXqRBaioFOd29yu+taIaM3aPrehsCjM8ws3wGcKeBN3hKdOiNmqxEbf+Nwf
	 Osieap+U//xmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01620613F4;
	Fri,  6 Mar 2026 19:51:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E10525B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54050613CB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2oq0SMCsV9q for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C938F613E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C938F613E3
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF276841E4; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:08:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 424114859c9346160d8ed62075c04500be3bc23a
X-Git-Newrev: f746e8a93418a7b54c1f517dffe85f470040b864
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.DF276841E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-multipart:
 bump version to 0.0.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f746e8a93418a7b54c1f517dffe85f470040b864
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

https://github.com/Kludex/python-multipart/blob/0.0.21/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fa2bb2199d64b7c7e019b23ec13ae51994899dd9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-multipart/python-multipart.hash | 6 +++---
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 594c7cd497..ed01763cd7 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  fa3ee0a8ee83e24b66ab40a841922244  python_multipart-0.0.20.tar.gz
-sha256  8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13  python_multipart-0.0.20.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python_multipart/json
+md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
+sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 8e11f5f6cd..6921d935eb 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.20
+PYTHON_MULTIPART_VERSION = 0.0.21
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
