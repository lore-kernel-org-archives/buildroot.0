Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4286AD5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F29D4039E;
	Mon, 15 Dec 2025 21:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fnsl5quitIUF; Mon, 15 Dec 2025 21:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB8C403CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834730;
	bh=KX3hbvKcRc0ogwmyJYq7IhD95lg2SZ4DHYavaF0b62Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qEIYa1GQ10PxyghBtd50RPHeDDEJNI70/S6KF32MAHypXelp3AAjP9gCySFcH7ApA
	 Zn+6jnAu63cMrvGgMEfH1dT3KYRveQwF7kVdxOMTJ+E7C2xDE3Jpyv1qLmO1hWJFMd
	 c2RE11msi8oCvzvukh3NTzCK9Neno95SCRlY0cYHbsuMcnDX/Zx/L3361+Ic3uWwCI
	 uFLKiS3N4Tx/qrvBBetJq53XyQk1BytEjv5IhfjH7y//i7PSrtsPMPDvvm6S3nPQlf
	 kOTkkLFPrG1uFxPJIl1l0jmO1oJ4utMzo5RF5ZRTRtDkAoi3RX9qZBo6mkbkMJlY9a
	 qYdswmuAANXBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FB8C403CA;
	Mon, 15 Dec 2025 21:38:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 304B425A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14F9A606C0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gW5SEZTB58_M for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36661606FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36661606FD
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F3E986FC1; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a037d0913a571f390021cc8cbdce9e9a1800ee3
X-Git-Newrev: 8da8d036beef9312adf55e28238164c3d9c16705
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.2F3E986FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-posix-ipc: bump version to
 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8da8d036beef9312adf55e28238164c3d9c16705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/osvenskan/posix_ipc/blob/rel1.3.2/history.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-posix-ipc/python-posix-ipc.hash | 4 ++--
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 1f1d98bcb4..d70fd516d4 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5  2488e63c881311f2bb697a0344ba9070  posix_ipc-1.3.0.tar.gz
-sha256  6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d20876910896f47d353448  posix_ipc-1.3.0.tar.gz
+md5  fbfbd3526830f1ca3cd87003be0b490a  posix_ipc-1.3.2.tar.gz
+sha256  6923232111329954a8349f7d99f212b6e96b5206e77fbd39aaf1b3cb4a5e9260  posix_ipc-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3f65e6e3d932adabcc6176dad775c6e538711483ef8de45a3ec47a12525f56b3  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 48d6588310..46bbc7754a 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.3.0
+PYTHON_POSIX_IPC_VERSION = 1.3.2
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/2b/a1/16d4b5a7dfc3dbb5965debe0415b6dc4866d4c94a1229f5b12cde7b78de8
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/40/59/56be08bcd98bcb8bd2ec3de7dea4a8da3bde63b17974896ed2b91c9a4fb7
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
