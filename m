Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79857CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5339D613FE;
	Sun,  3 May 2026 14:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsorUtUKAhrk; Sun,  3 May 2026 14:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CD761366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819864;
	bh=fRI3KD1JDj6lIqG+sFYmgTL4qtRNtUvG0Hv/DcvHLhA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hkRKCGsGxzUlgbN6jXI2sqIywiS6WagB7D9wjDMDuyr58mWaH4LZrVpLfXBHRpj35
	 HY1OXD+317VZUs3TTtrZMdtQ2wYEChHYiUqYecYrkT/Aquj2G3y+uWexonJbu1TjIA
	 ZVQW6X4wyTcD7+JznaWuJ0+XeKNEBXaS3Pjp5ipAlPOMb3uwjlZDn11jA6ZT8gXuxM
	 zshpTeR8XEK0Fzb2AmszZGorPnJH96xCbAcsk8BABPvx9TMwhUaKFDgrH649orURiR
	 HWgqL+LyJccU/vETCHzWYsfurJkFAeaUAK0/SG+bxg4IFHfGyJOiwb9kjgQ64wYDdN
	 6kc6RLf2z8i0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CD761366;
	Sun,  3 May 2026 14:51:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B11B8127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89F54148E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YS7bZqj_-Hdj for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F58840BFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F58840BFA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE68B83E54; Sun,  3 May 2026 14:50:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6045bd27c528a96cc68cb7d6aebb249610665ac
X-Git-Newrev: f8000bbbfb527a06892402956853fdb7114b8c14
X-Patchwork-Hint: ignore
Message-Id: <20260503145029.DE68B83E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: bump version to 26.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8000bbbfb527a06892402956853fdb7114b8c14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pypa/pip/blob/26.1/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 39a15696c3..3ce6073701 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  566bd094e3a0c382ba2705349c83d55e  pip-26.0.1.tar.gz
-sha256  c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8  pip-26.0.1.tar.gz
+md5  c05fe5cfafe4cc2ce7a44318d8eed4e7  pip-26.1.tar.gz
+sha256  81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3  pip-26.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index aa02a216d6..d12bea3225 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.0.1
+PYTHON_PIP_VERSION = 26.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/48/83/0d7d4e9efe3344b8e2fe25d93be44f64b65364d3c8d7bc6dc90198d5422e
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
