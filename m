Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4231CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82796157A;
	Fri, 15 May 2026 13:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaBolNQnG5Dy; Fri, 15 May 2026 13:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA36661597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851725;
	bh=DUCKW1bRIgQA4168nxEVRAwdXPmop8g9BC3MN15ICKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jshC4N87aSj+E+uNW4bxLzRndIcwrMPNuOG+19zVkRT1ytS502Y05CQ7Dim84VewE
	 DKG2WQ7ruwKeS/axXJF52xHkhIhB55Rb5yqxGUu7jeMJaX/Utv4Y3Au1U3Jna6dEXK
	 35K30EDrHLKQd91e70GTw5NA2mYIgsSMMnntD7wSkrGKBSJqUIdgW968Hi1pho/u4t
	 /t5M4Cim9wq22YdhHhiWgmrMZ+nLJNgnX4pCQLeob5QEIbcPNkR0C7rY412y0nfixR
	 90bFit1igJw/9zHH63zoOo1bfNIljEUON5aQzMwE+Od+RShnbXGLs6Bg2JkPqvxLl5
	 3cGHrdYCkPkMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA36661597;
	Fri, 15 May 2026 13:28:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1880636F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07E3261557
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwFHoLz0dBVX for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98DB861564
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98DB861564
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB6CD86354; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 15:18:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 30d1791eb26a8ef46a952d1ef66e163de1eade07
X-Git-Newrev: 0e0837f930e7eec188e33b33079ba5a964aad231
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.EB6CD86354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsodium: bump
 version to 1.0.20
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e0837f930e7eec188e33b33079ba5a964aad231
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/jedisct1/libsodium/releases/tag/1.0.19-RELEASE
https://github.com/jedisct1/libsodium/releases/tag/1.0.20-RELEASE

Updated license hash due to copyright year bumps:
https://github.com/jedisct1/libsodium/commits/1.0.20-RELEASE/LICENSE
(1.0.18 was released in 2019.)

Needed to fix build error with python-pynacl 1.6.0, currently under
review: https://patchwork.ozlabs.org/project/buildroot/patch/20251013175513.86276-17-bernd@kuhls.net/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aba023cf4f7a404c07b21a7f7c5a6ad41844caf4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libsodium/libsodium.hash | 6 +++---
 package/libsodium/libsodium.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 37c1a620b6..ae4765a2ab 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking Minisign signature
-# https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz.minisig
-sha256  6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1  libsodium-1.0.18.tar.gz
-sha256  dea1855c9809f3faf22aa4a1fba20ec8af5a5587f23115012e5b98279cedc4af  LICENSE
+# https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz.minisig
+sha256  ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19  libsodium-1.0.20.tar.gz
+sha256  43964d976a6db3fb986af689d05f8ca0e9971878bccae709750dac8fdc4a99cf  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index a8e0f79149..7dd763e145 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.18
+LIBSODIUM_VERSION = 1.0.20
 LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
