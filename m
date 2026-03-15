Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA37F3028D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C066147B;
	Sun, 15 Mar 2026 22:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHi8s0XjysC8; Sun, 15 Mar 2026 22:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF7CE6148B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613195;
	bh=C0hrsCErVWNOkuypbTwQIS8lovP81QWV83gjJkUGcmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aWQavuT+3KxsrkKusE/6ziOnD/8iPGh+NA72O10cx4NmE0/23jrkwfgMltXxPKgjb
	 wW9sk1R3rK/wTzCzdXXioQYlVElMctgkhPPpWTKFWE6a8K+fe6dzch8phvfeuJIAAN
	 FROcRADQJQwcR4qwNx8vAOGfLUvjkHBRYInwYjmTvTtRtM7q0PktAK3CgF0QOKCuj6
	 GJUFaZQ5MXdzEhGQVOEKBvcsyuTVWCUL5fxYTV5hVWULbk7m7V/oUrd4s4eicjIT/c
	 wzxa4A9ZpJDuGHNnvsBSGTAsrbH/sH1zze1u/1qyiVd7t9Dcj3bhFrnBflMbSakUvm
	 8HMtnz854USqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF7CE6148B;
	Sun, 15 Mar 2026 22:19:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 018D11B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83C4C410A6
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TXrApqCJuQ6 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F7A40952
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21F7A40952
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6447385BFF; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9733007b726bdd36eea14dfe338a3663cf4d0fe1
X-Git-Newrev: a4e8a593456aca733674d1433bde4c693705ecd7
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.6447385BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pathspec: bump version to
 1.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4e8a593456aca733674d1433bde4c693705ecd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/cpburnz/python-pathspec/blob/v1.0.4/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pathspec/python-pathspec.hash | 4 ++--
 package/python-pathspec/python-pathspec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
index 15283e3ac2..429fa05c3a 100644
--- a/package/python-pathspec/python-pathspec.hash
+++ b/package/python-pathspec/python-pathspec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathspec/json
-md5  2b26ad1981bfa23748e115f00085624c  pathspec-0.12.1.tar.gz
-sha256  a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712  pathspec-0.12.1.tar.gz
+md5  18d9e6adb72e544b56a88c3e53094b4e  pathspec-1.0.4.tar.gz
+sha256  0210e2ae8a21a9137c0d470578cb0e595af87edaa6ebf12ff176f14a02e0e645  pathspec-1.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index b46dbef7ea..9c5279e012 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHSPEC_VERSION = 0.12.1
+PYTHON_PATHSPEC_VERSION = 1.0.4
 PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
-PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/ca/bc/f35b8446f4531a7cb215605d100cd88b7ac6f44ab3fc94870c120ab3adbf
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/fa/36/e27608899f9b8d4dff0617b2d9ab17ca5608956ca44461ac14ac48b44015
 PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
