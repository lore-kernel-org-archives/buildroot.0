Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B330EC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E38283B3C;
	Fri, 11 Jul 2025 10:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZaaWuuatbsF; Fri, 11 Jul 2025 10:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E043F81FC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E043F81FC5;
	Fri, 11 Jul 2025 10:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D739F1344
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCB640AC8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y5Sy4eAAmZj for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C711740C9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C711740C9E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B77A286330; Fri, 11 Jul 2025 10:09:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:14:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 70350cc4efd360b2f0bc37c04d3656220590280d
X-Git-Newrev: b672f9e988c0d589d3c45816116f13edbfbcda3f
X-Patchwork-Hint: ignore
Message-Id: <20250711100951.B77A286330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/elfutils: Show a
 comment explaining that elfutils progs need glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=b672f9e988c0d589d3c45816116f13edbfbcda3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The elfutils programs require Glibc to be used as the C library. Show a
comment when this libc isn't used in the toolchain.

Suggested-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 52ba3ed65745c52ff454155db0bfe5394619ddb2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
