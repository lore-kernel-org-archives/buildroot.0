Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0FCE8FDB8
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F3860AAE;
	Fri, 26 Dec 2025 20:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1hCNqnIAYJp; Fri, 26 Dec 2025 20:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 387F660AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766782074;
	bh=NbJe7E5QdmIV1wjvD6YXmzbif3W2oqKQbZ4eEKnLqWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IL7b6B7vpVbZiXRF/M6fZnVBZuy9YF8818VJ/wH/I+I1saLfSEJaxySol1M0wU0/C
	 jj6upCorwPv2lDxsqMZEqLJLBy9yQa++uDd9mwQ2Uuc2z1G10LfE/5yiB7ptullSQl
	 dSanBU4MbDCsvTAt/kAxwrtVBMalCyVs2y9qCww/0YGa3osY6KcyzJoRxhQHXo5W2j
	 CpcPC4WQf5JFoX5QAougfV5hDW6+2L7QvfVHIKmhySchuf4Dy6PmevR3YFBI/UrREo
	 RTODOVdRvDSIriCsxzbusSNVjbIKq2eUdpcCkIcXAhy//nT4mMGrU2UmfBiXdhWrZr
	 YPzP8ffqs718g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 387F660AF2;
	Fri, 26 Dec 2025 20:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E23EB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E0E5812C3
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFimM52HH051 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E87812C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E87812C4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C22F087714; Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 21:31:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db6f933571be09b0da3c73e01231d114a4e78a9f
X-Git-Newrev: bde2b2adafd94b9ac213ac2080615332118ad688
X-Patchwork-Hint: ignore
Message-Id: <20251226204748.C22F087714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus: bump to 0.14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bde2b2adafd94b9ac213ac2080615332118ad688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sdbus/python-sdbus.hash | 4 ++--
 package/python-sdbus/python-sdbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
index bb3834dfb4..680f501137 100644
--- a/package/python-sdbus/python-sdbus.hash
+++ b/package/python-sdbus/python-sdbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus/json
-md5  48ba3d23852b3d3f4f0623194f637872  sdbus-0.14.1.post0.tar.gz
-sha256  ae3915ab3e3f0a116632e1e5876df992b9529e82b0b492006eb22f8791ed6deb  sdbus-0.14.1.post0.tar.gz
+md5  b7b98bfd8934b676a48a9e4c6c180f8e  sdbus-0.14.2.tar.gz
+sha256  4f5d13b196e1e1de35311ebb2563a32de791451a30f5b9a4894528ba98766412  sdbus-0.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 9a72b23776..685626ffb4 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_VERSION = 0.14.1.post0
+PYTHON_SDBUS_VERSION = 0.14.2
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/b9/4f/549089131ba4ba5379517655cdcbfe3925fd1cc0eafd93aac5f73c2a6d40
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/7c/0f/0cf6b2fb0338fb3ab564cb8a8d68aa1c6de767851f5f9de9a3c83dbabeab
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
