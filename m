Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480E3CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E0442939;
	Tue, 16 Jun 2026 16:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cK9lNw4eu5nY; Tue, 16 Jun 2026 16:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB414295E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781629175;
	bh=HN1ms1OrnV9FkOrUe6dFUtzc/ZjIEn5CrjRqCL5RNCM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ofwSDH1mZU+BlFIc9vSp2TASZPLsuOQXltmueG6V8xocWezQtS1Ff5L00Gh9vCEGT
	 6uFmtdnk3fN2ToGAb1150G8dX3SOPvdxDrpvXM7UYE7VDXj+ZDiqT+p0Ew7ATVA/LB
	 ofBnnLSJ8nNKe0xUZzBs1rlz4SKRWCFhJG4ckxTIDibncu1wGG+Xm2MDPn9wWnSAIg
	 KgD1B4HpZLg0+GItKPnJRRKkI0uVg+Uuc1RApdsyyo2T2N6CoxzayWbEKeZ9MghHtT
	 l1VhUPKK1dZIufo6KV7AyOs6Sgsfn3hF29v6IZiDnLPF6z8XOPea1YoIZb+VBJhBmA
	 7X18xDprhUT/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB414295E;
	Tue, 16 Jun 2026 16:59:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A7C169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5F8A42959
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-ofF1sDleHf for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43C942939
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E43C942939
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A759D80DA1; Tue, 16 Jun 2026 16:59:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 18:52:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 206ac6a19f09071b0bdf0f1edbf0c87e89d347de
X-Git-Newrev: 2dc34a18e74a1b12e02d0fb8b3b5433b983f5355
X-Patchwork-Hint: ignore
Message-Id: <20260616165912.A759D80DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: needs headers >= 5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2dc34a18e74a1b12e02d0fb8b3b5433b983f5355
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit aa5e3eec6384cb73d902a4de3fffc279683ea5a5 bumped the
package to version 7.0 which includes commit
https://github.com/strace/strace/commit/33b950714a966bde816a1f1e75c127c3d3ae53cd
that adds an include of linux/time_types.h.

This header file was added in linux kernel version 5.1:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ca5e9aba753ed15d173c7a7b88e4d402b7ca8121

Fixes build errors:

In file included from ../bundled/linux/include/uapi/linux/cgroupstats.h:20:0,
                 from netlink_nlctrl.c:11:
../bundled/linux/include/uapi/linux/taskstats.h:21:30: fatal error:
 linux/time_types.h: No such file or directory

detected by the Gitlab pipelines with the following defconfigs:
- br-arm-full-static
- bootlin-aarch64-glibc-old

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strace/Config.in | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index ff7d271c0c..e3e7018c65 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,11 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	# needs at least kernel headers 5.0 on xtensa
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
-	# needs at least kernel headers 5.0 on musl aarch64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || \
-		!(BR2_aarch64 || BR2_aarch64_be) || \
-		!BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 # time_types.h
 	depends on !BR2_RISCV_32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -17,11 +12,5 @@ config BR2_PACKAGE_STRACE
 
 	  https://strace.io
 
-comment "strace needs a toolchain w/ headers >= 5.0 on xtensa"
-	depends on BR2_xtensa
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
-
-comment "strace needs a musl toolchain w/ headers >= 5.0 on aarch64"
-	depends on BR2_aarch64 || BR2_aarch64_be
-	depends on BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "strace needs a toolchain w/ headers >= 5.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
