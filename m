Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54B1F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE5126127B;
	Sun, 15 Mar 2026 22:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBDnF2XNiQwr; Sun, 15 Mar 2026 22:19:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47C8613E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613173;
	bh=U+BkA7XMsmco95RpgoCY1A7vPz5PhTqj+U/vDQSkwCY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hZ+vnqbnzS7hKnarLyVJlSCrjXq/9aNsGLlysG8fawua8fK8/lO2trbshKuAk7+xu
	 EwNhYNNt2fSSEh7qqDPkJpA1WO5glASDwkapjwXUmPEsQtXZI829SmPhWQb7A2e7j0
	 wgGKAT10VNvLOzpYtcDMuWxKTLG/nWBsyd3h6NPPb819kWzFo5DPzaAK/CY0SXUG2W
	 SzxsXhhY2mKIx6uaS3Lnpuu/uNoXUlMlhELYdMgrr4ChBaaq3Rek3viYFV9tTY+AOF
	 a4u19kFva/BTyf0cQ3MlgUAMb2XyteKlJElBqud57Y+sxUpL5lN+NDzlrwWqszL4Nw
	 VIwDTNB3Zd+UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E47C8613E5;
	Sun, 15 Mar 2026 22:19:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBC4357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5119E61087
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDZFKpaHf1TQ for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6368B610A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6368B610A1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A58A485C3A; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d0fdd3358c1ddcc73bab5f8de08ab0d5dfa112f
X-Git-Newrev: 881805a63a3147b636680e6d5cafa7bfb7fd70c0
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.A58A485C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyspnego: bump version to
 0.12.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/881805a63a3147b636680e6d5cafa7bfb7fd70c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jborean93/pyspnego/blob/v0.12.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 1feca5d305..f74e9c2aa5 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  f1e4eb073641fc00dfd0ce053963c73b  pyspnego-0.12.0.tar.gz
-sha256  e1d9cd3520a87a1d6db8d68783b17edc4e1464eae3d51ead411a51c82dbaae67  pyspnego-0.12.0.tar.gz
+md5  bdbd0013e9f7bd8d076c339af9c9a73b  pyspnego-0.12.1.tar.gz
+sha256  ff4fb6df38202a012ea2a0f43091ae9680878443f0ea61c9ea0e2e8152a4b810  pyspnego-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 5e982ac7cf..ebe74bd879 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.0
+PYTHON_PYSPNEGO_VERSION = 0.12.1
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/f9/e4/8b32a91aeba6fbc6943a630c44b2fe038615e5c7dec8814316fafdcf4bf4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/7d/84/58577bd1b14293650879de0579ec263a1d8350f1d6d227226cf776b5a6a6
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
