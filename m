Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A25DC83038
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 19:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23D958084E;
	Mon, 30 Jun 2025 19:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a3XpOF6M4e6; Mon, 30 Jun 2025 19:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DFB3809D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DFB3809D0;
	Mon, 30 Jun 2025 19:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F898223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30C4241C8A
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMRBRgIjzRpT for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 19:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E6B141AE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E6B141AE0
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BFF784D85; Mon, 30 Jun 2025 19:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jun 2025 21:38:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc1387b4a5c4eb88dccac4a3b639462366f2b65f
X-Git-Newrev: 52ba3ed65745c52ff454155db0bfe5394619ddb2
X-Patchwork-Hint: ignore
Message-Id: <20250630194233.7BFF784D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: Show a comment
 explaining that elfutils progs need glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=52ba3ed65745c52ff454155db0bfe5394619ddb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The elfutils programs require Glibc to be used as the C library. Show a
comment when this libc isn't used in the toolchain.

Suggested-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/elfutils/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index c355048c6d..9608ef4905 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -28,4 +28,7 @@ config BR2_PACKAGE_ELFUTILS_PROGS
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
 
+comment "elfutils programs needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
