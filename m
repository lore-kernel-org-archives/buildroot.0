Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E045C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:43:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D1E61041
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1D1E61041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC5B460755;
	Thu, 14 Oct 2021 21:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2TxEtWwaHjY; Thu, 14 Oct 2021 21:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03E3D606FF;
	Thu, 14 Oct 2021 21:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 221191BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E497B83260
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUhKRib-Hw47 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0149F80EA0
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BE6549529D; Thu, 14 Oct 2021 21:39:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:12:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eb61e6ee3f37dd727d91590e16da2ab4308fc5f
X-Git-Newrev: 33ece2446e25e20929d1c7eefa9f3244a3b79a92
X-Patchwork-Hint: ignore
Message-Id: <20211014213946.BE6549529D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crossbar: bump to version
 21.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33ece2446e25e20929d1c7eefa9f3244a3b79a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-crossbar/0002-Remove-idna-requirement.patch | 10 +++++-----
 package/python-crossbar/python-crossbar.hash               |  4 ++--
 package/python-crossbar/python-crossbar.mk                 |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/python-crossbar/0002-Remove-idna-requirement.patch b/package/python-crossbar/0002-Remove-idna-requirement.patch
index 4948b91b05..5e19a467c2 100644
--- a/package/python-crossbar/0002-Remove-idna-requirement.patch
+++ b/package/python-crossbar/0002-Remove-idna-requirement.patch
@@ -16,14 +16,14 @@ diff --git a/requirements-min.txt b/requirements-min.txt
 index 92fb0f8f..13cdac87 100644
 --- a/requirements-min.txt
 +++ b/requirements-min.txt
-@@ -6,7 +6,6 @@ click>=6.7
+@@ -8,7 +8,6 @@ click>=6.7
  constantly>=15.1.0
- cryptography>=1.9
- h2>=3.0,<4.0
+ cryptography>=2.6.1
+ h2>=3.2.0
 -idna<2.6,>=2.5
+ importlib-resources>=4.1.1
  incremental>=17.5.0
- jinja2>=2.9.6
- lmdb>=0.92
+ jinja2>=2.10.1
 -- 
 2.17.1
 
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 486b4d5695..4441578a29 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5  f1756c5a7eac95aa0ff3e307cdd960df  crossbar-20.4.2.tar.gz
-sha256  67a14864850b562c2b5586eca37f39b2eff3d650ba955bace894e6b5d0633dbb  crossbar-20.4.2.tar.gz
+md5  df576100bcf6e423cdc1e2e96b602140  crossbar-21.3.1.tar.gz
+sha256  ac71959f0c57ab08d43f7830b85c6312e000b25543a179cd751ac357944dd7ef  crossbar-21.3.1.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  crossbar/LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 99ddc67df7..aae61cd2e8 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 20.4.2
+PYTHON_CROSSBAR_VERSION = 21.3.1
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/3f/a2/d8aff4b366b565669236e6bbb09d9f1bbe9162eb542822e89210141dd738
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/17/37/aafc4ec30068fd7ebb97f1a00d4ddf8de482dfa4c1d2a1fc6bb814d91400
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = crossbar/LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
