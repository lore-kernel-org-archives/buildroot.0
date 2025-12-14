Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D80D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0496860DC7;
	Sun, 14 Dec 2025 17:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNOV_VztpD_Q; Sun, 14 Dec 2025 17:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB6560DC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734477;
	bh=JDJquZucr9tRVpaLPQlB+3TYKCIFi4oPAFj77DRYVlU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hEQWJKysnDCs810lZIuqt+ko+XO/cG389/VbN4OHc8x+uwazRUOLGuZwmyfiG/W3i
	 C+AEv44WbG1hyf+yljVDognFYW7e+OFpCVVXkODs6mcAmdrYF8C9xeECg0tqXPZ4Df
	 W8/J/PazcgjDQEm/8buekTOFDIFKObE6NoSyKKebUg3QU+bRzeXUVkfl68GKEiI+rz
	 +lVuRcNaBvwAVAEHWEOXUAsfxT4fnaToEX2L999mgg1tJH5WRwbYybpw1BaKTpFe+q
	 1EU4DOUTD+GH/LlC5ezsEWeYd11itCmQlmKydKKFrvV3sGZh4DDntqNHYY1cBRscQa
	 3bYO+wNtkBXwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB6560DC9;
	Sun, 14 Dec 2025 17:47:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 150A5117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25CFF40690
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTq4TMWh03Z9 for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDB7740697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDB7740697
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC2C786E93; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3da98857225b4f36db70f7cb4f745a746ed96189
X-Git-Newrev: 85c346bd747b06e2c074163ed25a75ed2d7ae519
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.CC2C786E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncclick: bump version to
 8.3.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=85c346bd747b06e2c074163ed25a75ed2d7ae519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-trio/asyncclick/blob/main/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asyncclick/python-asyncclick.hash | 4 ++--
 package/python-asyncclick/python-asyncclick.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index 1a2603d2aa..15e8b1fb02 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  3c8af1a8b6151c24a102e5ed891d19d1  asyncclick-8.2.2.2.tar.gz
-sha256  014f6b7bfb1ef34a2215bc36aebd5150d5d2e50668b12eceb749961e32c24660  asyncclick-8.2.2.2.tar.gz
+md5  9087d387a981ed313cbea4a4b54a13f3  asyncclick-8.3.0.7.tar.gz
+sha256  8a80d8ac613098ee6a9a8f0248f60c66c273e22402cf3f115ed7f071acfc71d3  asyncclick-8.3.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index d413242def..32d1eedfa2 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.2.2.2
+PYTHON_ASYNCCLICK_VERSION = 8.3.0.7
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/35/51/b01dd77c9a14fb0b312d799fd8c10b145b882535dbaa9ac055a52515b390
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/f9/ca/25e426d16bd0e91c1c9259112cecd17b2c2c239bdd8e5dba430f3bd5e3ef
 PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
 PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
