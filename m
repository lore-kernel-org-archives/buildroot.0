Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766C2C52D1D
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1EED8059F;
	Wed, 31 Jul 2024 16:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id douBYtg0YJb7; Wed, 31 Jul 2024 16:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51598136B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51598136B;
	Wed, 31 Jul 2024 16:55:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCD4E1BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BEE540E1F
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qp9N7BdzLbmd for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 814CE40E2E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 814CE40E2E
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79EAA8376F; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 18:53:46 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 47c331f0da56580912c6187b69f989fb65bdc88d
X-Git-Newrev: 0cab1602a01d5a60f0450776eb75d10fdff0520a
X-Patchwork-Hint: ignore
Message-Id: <20240731165429.79EAA8376F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/bcc: add missing
 dependencies to comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0cab1602a01d5a60f0450776eb75d10fdff0520a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
(cherry picked from commit 76051e653199f8f6c20afa0c28496c7d8cfcb527)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
