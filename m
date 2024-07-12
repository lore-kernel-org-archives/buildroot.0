Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A979C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0912B419A8;
	Fri, 12 Jul 2024 14:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWR_XxhG46HV; Fri, 12 Jul 2024 14:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5786A4198E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5786A4198E;
	Fri, 12 Jul 2024 14:02:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 333771BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D55261106
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDYdAuY1CIk6 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31CEF61103
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31CEF61103
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1626585EB8; Fri, 12 Jul 2024 14:02:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:01:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd358b97c053af9e45fcb94e59ade63b4d895f10
X-Git-Newrev: 76051e653199f8f6c20afa0c28496c7d8cfcb527
X-Patchwork-Hint: ignore
Message-Id: <20240712140235.1626585EB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcc: add missing dependencies to
 comment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76051e653199f8f6c20afa0c28496c7d8cfcb527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its inception in 146498d13c48 (package/bcc: new package), not all
the dependencies of bcc are mirrored in the comment to be displayed when
those dependencies are not met.

Fix that by adding the missing pieces:
  - wchar,
  - threads
  - dynamic libs,

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bcc/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/bcc/Config.in b/package/bcc/Config.in
index b91e0e5ee3..bf46f07d93 100644
--- a/package/bcc/Config.in
+++ b/package/bcc/Config.in
@@ -38,8 +38,13 @@ config BR2_PACKAGE_BCC
 	  https://github.com/iovisor/bcc
 	  http://www.ebpf.io
 
-comment "bcc needs a glibc toolchain, C++, gcc >= 7, host gcc >= 7"
+comment "bcc needs a glibc toolchain, C++, wchar, threads, dynamic libs, gcc >= 7, host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_HOST_GCC_AT_LEAST_7 \
+		|| !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
