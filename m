Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDA2D66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B3840F61;
	Wed, 17 Dec 2025 21:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5E5KLwKId5j; Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B19B40F6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007889;
	bh=QQVAuFK8dYZ4OBWP4z2CZC9an53tGdXiJQxNt2L1XYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qS08GM/OYJU7UMtjlPgL5zoDG4ZBQpiA+tOxdLPnMeuAqlUpJ78Fn4gs7S7C/YD5w
	 ke6rssCgu8ciCFESUlSaVYgMVG5a//OL9vKvxXhY6JjlevJBmw9OuXv+Qa9C5P04BT
	 2n9WZ8pWF6RcMdm4v/q9rvVME1bph4DwesiAmKMUKobJr6SpXjvgSh69dkJGmu/k8y
	 6MYS7IBUNJJqLmT9pVOjlZddOpGOJcCEJZeaqZy9BFYCnIq0K87uCsnaZuahoTpmDi
	 meDXSbij7W74uiCJrL2C9Xr5r7021MYTiosb5XxIiEb8gD5vWp0dLWl0Ntxtz0ok75
	 S/uoc6SFkRT/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B19B40F6C;
	Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ACAA361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51E0B40F61
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edsdcrUcKE3C for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76116401A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76116401A0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55F4984679; Wed, 17 Dec 2025 21:44:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffd323dffc696f2d3eb09915a3d0a09b9035becc
X-Git-Newrev: f6298cd050478b42a968d9d505eede3da768391e
X-Patchwork-Hint: ignore
Message-Id: <20251217214446.55F4984679@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sh: bump version to 2.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6298cd050478b42a968d9d505eede3da768391e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/amoffat/sh/blob/2.2.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 4ed2464260..43da0bc0ee 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  d1bc1f56e6a99109fb0f589aba574cf2  sh-2.2.1.tar.gz
-sha256  287021ae84183dea49787985e33797dda7fe769e4f95f2c94dff8e245ab4cb00  sh-2.2.1.tar.gz
+md5  961d38de16f88556bd70381eddd7f415  sh-2.2.2.tar.gz
+sha256  653227a7c41a284ec5302173fbc044ee817c7bad5e6e4d8d55741b9aeb9eb65b  sh-2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 84ad1aec63..6bbd621af1 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.2.1
+PYTHON_SH_VERSION = 2.2.2
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/bd/30/abf254f7b56ba7bcae938767e3ee0f54d220d931a35a8721de350b76dec5
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/59/52/f43920223c93e31874677c681b8603d36a40d3d8502d3a37f80d3995d43e
 PYTHON_SH_SETUP_TYPE = poetry
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
