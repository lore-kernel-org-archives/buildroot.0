Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4444ACCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 141DD401B4;
	Thu, 16 Oct 2025 20:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahW0bq_Qd32b; Thu, 16 Oct 2025 20:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 053C0401A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053C0401A6;
	Thu, 16 Oct 2025 20:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B181968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CBF080DC2
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8usxhVX61-7r for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C713B80DAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C713B80DAD
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5F6F87320; Thu, 16 Oct 2025 20:02:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 21:53:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2661d9b34f73e94abe5fb55b4842bf5944ee131f
X-Git-Newrev: aba023cf4f7a404c07b21a7f7c5a6ad41844caf4
X-Patchwork-Hint: ignore
Message-Id: <20251016200233.B5F6F87320@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsodium: bump version to 1.0.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=aba023cf4f7a404c07b21a7f7c5a6ad41844caf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
