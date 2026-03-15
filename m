Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E4DF3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87E261260;
	Sun, 15 Mar 2026 22:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NQ1SG4jMWr7; Sun, 15 Mar 2026 22:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1E561128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613109;
	bh=FI6k9m+4PyCzkTqssM20EDpoHqNgt2DSOh2fnkWQBAU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C1wMeCVzktRogER4eH+O2JOUd2Q+rshKVXk8LgwallW9iDKY9GEv7hvEUpQQX2hGl
	 tvmKe+Z0YsXPvSFNLoYIFowS77bR8NeP9F3tb2grHyQXmei/G0i1O9Cn4y2WjUfvPO
	 1+lHYFqayn9fvbl+cQuJSer4Wxv0EAwdCsxWz8BcFsoJOv5tf0QFgz5rAi2L1hceyN
	 oPWqSW+guOL6YPr1qlaG0Pkx9l44glzlWEK8cJhl9GCCDm1j5ZujXmrNCQJ5RTHh3L
	 BoHqTGCP62xtJ4KaGz9bdBwFfWa9nfM4nMXLZVWMfSZ73xvtZCMQIDEar0n1B1Va8C
	 XyAsB7JNHnEfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1E561128;
	Sun, 15 Mar 2026 22:18:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 126011B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 379A2610C2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7Nip1zjwQYU for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 306656108F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 306656108F
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 732CE83F4D; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d92aa484d75a3b28b9e97f54e4c54d0e58866146
X-Git-Newrev: eafd8fb98d74d7d5663adb2e1446a31bc5acd4d2
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.732CE83F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump version to
 3.25.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eafd8fb98d74d7d5663adb2e1446a31bc5acd4d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tox-dev/filelock/blob/3.25.2/docs/changelog.rst

Upstream switched license to MIT:
https://github.com/tox-dev/filelock/commit/4aac7862f5d8f9a92d947991b523bc03803e7213

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-filelock/python-filelock.hash | 6 +++---
 package/python-filelock/python-filelock.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 64930ad418..d38518efc6 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  c422db4828e34fcadac68449fafd5cb2  filelock-3.20.2.tar.gz
-sha256  a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64  filelock-3.20.2.tar.gz
+md5  c0e50eab0beb1642dca5bae6246a2b54  filelock-3.25.2.tar.gz
+sha256  b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694  filelock-3.25.2.tar.gz
 # Locally computed sha256 checksums
-sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
+sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 83699377e1..21848d542c 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.20.2
+PYTHON_FILELOCK_VERSION = 3.25.2
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c1/e0/a75dbe4bca1e7d41307323dad5ea2efdd95408f74ab2de8bd7dba9b51a1a
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/94/b8/00651a0f559862f3bb7d6f7477b192afe3f583cc5e26403b44e59a55ab34
 PYTHON_FILELOCK_SETUP_TYPE = hatch
-PYTHON_FILELOCK_LICENSE = Public Domain
+PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
 PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
