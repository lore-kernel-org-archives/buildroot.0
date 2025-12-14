Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F3ED5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF5E8162F;
	Sun, 14 Dec 2025 17:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPjKAga735Op; Sun, 14 Dec 2025 17:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96B481649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734487;
	bh=mdNOYS9LQIpOqKuHRF5KdKfQQojt0D4+MZYTtIcq+IA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nxWkLVL0ZiE1eyMsqYcEUxZJ+FTpK0iuCI8c5gW6Ao8Ox8Typ2XIbMfTGFU3/Ictx
	 K6MS09W1l8gJrYyhG8QlEotvoJRlRsHXVGTKOVpqMbHDmBF+jG3RbGzECtnwZXEVsB
	 GvzdYlLB6bXHdvGAddsNVqFt520lDfxot6SnONc/pDP9nhOwxa6aCzJYYQ8SBM2hI5
	 Kk8vx1TRhveZiqtwGKwLUgVxQ6FL6AE+6YK7cI4+cGMkLlJKzBBUvzX0q6DWcLtXMg
	 Ynx2rXDsCkkYWY4ftGsYNKkBPYVoiqdhrtRJnO4lzjElcznMGw4jxNK40fMPUucdGD
	 YF+kbchsTeErA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96B481649;
	Sun, 14 Dec 2025 17:48:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2A17117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91695406A0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IooOTgTYZ-tg for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E66406BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18E66406BC
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17E9186E93; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99acea3d8789977b38e5daad1777dbd5fa843239
X-Git-Newrev: da1b964828b69faba732b3e02747efa74088057f
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.17E9186E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: bump version to 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=da1b964828b69faba732b3e02747efa74088057f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/hbldh/bleak/blob/v2.0.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 2213ec2f70..b3388d1917 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  261eb442ba16707ed00a21265cd337fc  bleak-0.22.3.tar.gz
-sha256  3149c3c19657e457727aa53d9d6aeb89658495822cd240afd8aeca4dd09c045c  bleak-0.22.3.tar.gz
+md5  e2a443b2d5f9671ff33ef632051b8c8a  bleak-2.0.0.tar.gz
+sha256  a8043fc0f3af1a00a84963824195463ca39789ae4f6804d3d7b1423e6083254a  bleak-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index f47440388e..4aee0e95f4 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.22.3
+PYTHON_BLEAK_VERSION = 2.0.0
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/fb/96/15750b50c0018338e2cce30de939130971ebfdf4f9d6d56c960f5657daad
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/ce/cb/20f3dd0498a820278c7078dce786676d18342721a3723591d5853323b363
 PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
