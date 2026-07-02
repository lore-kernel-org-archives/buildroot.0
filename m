Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07117C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1E59411C4;
	Fri,  3 Jul 2026 14:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1bh7V2lA9or; Fri,  3 Jul 2026 14:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C17411DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088920;
	bh=YxAq2WsYCABKt6WgB2333jvKPpYPDg0NtPfkBW9Pi0o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qjgFwZneEJ+aJNlXU/vz/tSlkk71HpP4Taqw5CEiAYCFUbGnoZtAbj1tPxZhQ+RIy
	 FZ5/A/E23XLXplEgeH9e1cbVcnJlhnnB9WCMuc0OwrLGDaCR+EAGU0Q5SokcnXWPec
	 NpeZH2DP8U/RqdVm5WjABsSM2AZvhlUSossx8WpCYVZgi9Dvl1GjCdN3UM+YeFaVOK
	 //RR1z8qDnKQobgGoxx6XDYnvFMzRsRJ23lddpYo1cdKpYMqKQSNFnzKz27DHIffKt
	 EnLgDZi5BNb9FXd9SNw9DYvGw2varKd8i3yVdOHVJV8m3Ep/tUifHZOK0CGdtQ2/x5
	 p8ziJ/PN62hEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C17411DC;
	Fri,  3 Jul 2026 14:28:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80A93363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72DC640EF6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id radiboUhURom for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 872D441165
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 872D441165
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2736B883A2; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:32:13 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c56adede270aaccffae53ab8cfe00d5a4891261d
X-Git-Newrev: e4079113a671cd63e159ef605759c9442f74f30d
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.2736B883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/util-linux: lsfd
 needs headers >= 4.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4079113a671cd63e159ef605759c9442f74f30d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
package to 2.41.1 which includes upstream commit
https://github.com/util-linux/util-linux/commit/036d72749ca274294051b43fd66727061a772b9c
adding a dependency to BPF_OBJ_NAME_LEN for lsfd.

BPF_OBJ_NAME_LEN was added to the kernel headers in version 4.15:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cb4d2b3f03d8eed90be3a194e5b54b734ec4bbe9

so we need to raise the header version dependency for lsfd.

The build error was found by the Gitlab pipelines for the defconfig
bootlin-aarch64-glibc-old.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 1db28a86877f6c2ec0797802ec667374aee59546)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index c63cec2a9c..3df149b3de 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -233,15 +233,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 config BR2_PACKAGE_UTIL_LINUX_LSFD
 	bool "lsfd"
 	depends on BR2_USE_MMU # libsmartcols
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # process_vm_readv
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  List file descriptors (modern replacement for lsof)
 
-comment "lsfd needs a musl or glibc toolchain w/ headers >= 3.19"
+comment "lsfd needs a musl or glibc toolchain w/ headers >= 4.15"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19 \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 \
 		|| BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
