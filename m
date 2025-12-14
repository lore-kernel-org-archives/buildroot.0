Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B4DD5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F8960E39;
	Sun, 14 Dec 2025 21:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXFuFBVUIbep; Sun, 14 Dec 2025 21:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C125A60E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747321;
	bh=VllywQzkyMCpXbgVrzsJt41xUgKvkaqHHLXyJwW5BpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rPQXVPNPD90lmAMWInOhge7uJdlDOYMFx2Gf/VYGQJPjmjUg63w9XqfSbf5LxBC7b
	 wvFX1k42Jjak407l0K1yYLoJzEKwhKkoDtxIAyWS7wWAtgcQlbmF2AZ1Ln/Ot1JKP+
	 pL8ugYiQKCdPYSc3GcAnB2OnKbaThoUJPE7ZWZBwGQXqh4fJt/7ydANhxayFSbdW+v
	 gaJ8GmLM64ijPnccpcIgLvnCqQRg20qaZ58b6qdoTVxeIAVVELQQwjqBexA65AXh1Y
	 R2HcjuEBeU9tLENkZrD6j6d6kLiAizm912UWk03fDDGMa97pA+wmYSEeBiDhjMkUM+
	 FygBqVWZp76YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C125A60E26;
	Sun, 14 Dec 2025 21:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4B72ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F47240637
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iojnXADBt5P for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B89440657
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B89440657
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1876684524; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e45bd67745a0ec114e564d11b8e15984464b831
X-Git-Newrev: dc7b83aac5b75986d0b3ed14df04160876945a8f
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.1876684524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump version to
 3.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc7b83aac5b75986d0b3ed14df04160876945a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/tox-dev/filelock/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index a266762eea..f47e8fdb5a 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  32624573c1dcea186f907c78e4fb80a2  filelock-3.17.0.tar.gz
-sha256  ee4e77401ef576ebb38cd7f13b9b28893194acc20a8e68e18730ba9c0e54660e  filelock-3.17.0.tar.gz
+md5  0b9c4280769cd87d874711c13adf50bc  filelock-3.20.0.tar.gz
+sha256  711e943b4ec6be42e1d4e6690b48dc175c822967466bb31c0c293f34334c13f4  filelock-3.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 44599ee865..8201fb1e66 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.17.0
+PYTHON_FILELOCK_VERSION = 3.20.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/dc/9c/0b15fb47b464e1b663b1acd1253a062aa5feecb07d4e597daea542ebd2b5
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/58/46/0028a82567109b5ef6e4d2a1f04a583fb513e6cf9527fcdd09afd817deeb
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
