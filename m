Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DB3E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A1360701;
	Tue, 30 Dec 2025 13:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAIJv-WRlBGE; Tue, 30 Dec 2025 13:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C08F4607C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767100184;
	bh=qoOdgOeZLO5ylc8+geXvpGjYj96aeMFM3Zg1fN6F8l0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qRonTkujZojqL2hsE6SfTa0ptD+IwxEWEqotzn6ASA8jDEcWDYGafODfqJjvBEXxT
	 s9+dyAfsfeJUOqsVNdaTvXd6VCOKv1/6UOydTkFwNhF8y9I8CF02J8tkH6gb+L/JqE
	 F+j8UJ382cm5KOU0fSpsBCT3B2EJsOu+XMRXZdrcls/qpktEBB80K2ZZDM47CB+4xR
	 K1xaNPTkz7ck1DGcBR3aTqt37kBHXLZlupZczOQZTUayJADXe+5BptkpFjKjpVsGrO
	 Q0OHBp3AYCgZ+7coODji45E0L2br1hRT7hvnxoQ0u0GvPMYuj0/xvNy7l8LRXu78VL
	 j2zlqp+501tPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08F4607C3;
	Tue, 30 Dec 2025 13:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD5AD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D95A3407D6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7H6pYemXDzv for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC4D40332
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EC4D40332
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:09:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DC8687A70; Tue, 30 Dec 2025 13:09:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:01:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35233037dee26668f074232d6c0dccb1569c7264
X-Git-Newrev: fe06ad0d9dfb98d06af3a25cccb0e926d5b65ab0
X-Patchwork-Hint: ignore
Message-Id: <20251230130942.1DC8687A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/python-cython: bump to
 version 3.2.3"
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe06ad0d9dfb98d06af3a25cccb0e926d5b65ab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 35233037dee26668f074232d6c0dccb1569c7264. Indeed,
according to Bernd, it breaks python-propcache:

  https://github.com/aio-libs/propcache/issues/174

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 3c33ad0536..08972cd035 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  7cfc3278f4eb7a072446f08dbd4647ba  cython-3.2.3.tar.gz
-sha256  f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6  cython-3.2.3.tar.gz
+md5  f508595cc0951a77b70c07100df1b4ff  cython-3.1.3.tar.gz
+sha256  10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089  cython-3.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index f99dddc310..50e2e6e1cc 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.2.3
+PYTHON_CYTHON_VERSION = 3.1.3
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/39/e1/c0d92b1258722e1bc62a12e630c33f1f842fdab53fd8cd5de2f75c6449a9
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/ab/915337fb39ab4f4539a313df38fc69938df3bf14141b90d61dfd5c2919de
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
