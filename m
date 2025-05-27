Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90719C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D5D640E92;
	Wed,  4 Jun 2025 18:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UM6syUotLrw2; Wed,  4 Jun 2025 18:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80F984134F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F984134F;
	Wed,  4 Jun 2025 18:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86D1DDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD2E140268
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiBBpzdCoDFI for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B7BC4022B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B7BC4022B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89B35876DC; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:33:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bf96128043ec63bc04851a61c4fb64240fc3e79f
X-Git-Newrev: 2ceb26cd1356dfb1a74929334989112231c3a48c
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.89B35876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openvmtools:
 needs libxcrypt with glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ceb26cd1356dfb1a74929334989112231c3a48c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
http://autobuild.buildroot.net/results/b3b66d7dff38ca6fb0be9a98d98db721ee98ef1b

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

checking for crypt in -lcrypt... no
configure: error: libcrypt not found. Please install the libc/libcrypt devel package(s).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3615c268997e7c86e7f3499c66949ffe4d61db17)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openvmtools/Config.in      | 1 +
 package/openvmtools/openvmtools.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index b62e5d0361..e6a2cd4a54 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Open Virtual Machine Tools for VMware guest OS
 
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 3106b9ecd6..a4ff1fd71a 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -35,6 +35,10 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 OPENVMTOOLS_DEPENDENCIES += libtirpc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+OPENVMTOOLS_DEPENDENCIES += libxcrypt
+endif
+
 # When libfuse is available, openvmtools can build vmblock-fuse, so
 # make sure that libfuse gets built first
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
