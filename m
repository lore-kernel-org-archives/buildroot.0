Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75848E7DF19
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E1B98331B;
	Mon,  2 Feb 2026 18:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7q6qC5I2fcx; Mon,  2 Feb 2026 18:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C8138343E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056808;
	bh=Gcf/EY041dIjYYA1nK8ub0CtRgJI3L34/fvBbrqNaIA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=glbQC2/bwK2DwZ9gRdfzT5NDHnwmG4Z4CnyGDK1AsHCa5kotQrPGLnFYDsczg2Ed+
	 1cFqd7Q2df4YOdyteVG5r1yhwqhz0rCXFstM1RGDQw5BzMigvAA7DPqiEF6zFknXLd
	 AdQs6DQeE3TCdyAIvAnIFs/CLs6NV9KFmOdxX203J2QR44tCWsHQEyMvNC71VVMPSN
	 wLovx6NZgPUdBBVzStCRsPc8JMW2z+s2gtuQr8BfjEKJ8XXxyDMOPv1tR67uj/4caF
	 m5xxbYJJLAaiHEEERCx/++gXo7Ui/8exIQj5QtP93Kl/Pjk4uvJOXNu5+jdsr56g+A
	 F/27YQUuFk9JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8138343E;
	Mon,  2 Feb 2026 18:26:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E64D8F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E000B400C5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68wYH989iy2B for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3276A40450
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3276A40450
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18E0B8649E; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 19:26:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a22fca0055e09b05c3ec402d1d69b5463253a5d7
X-Git-Newrev: 4df3fa1ab50fb280f011550edc5b178e7a4a0482
X-Patchwork-Hint: ignore
Message-Id: <20260202182643.18E0B8649E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dc3dd: needs MMU
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4df3fa1ab50fb280f011550edc5b178e7a4a0482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

savewd.c:75:27: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
   75 |           wd->val.child = fork ();

Fixes:
https://autobuild.buildroot.net/results/40a/40a90638f90260ca2cb51bac03b0f8fb23a6ccc4/

The build error occurred already in January 2025:
https://autobuild.buildroot.net/results/9f3/9f3fefe5578dc41272e460146b566ac20f6cde75/
so a backport to the LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index bd181b7065..b4b7dfd691 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_RISCV_32
 	depends on !BR2_arc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -13,6 +14,7 @@ config BR2_PACKAGE_DC3DD
 	  https://sourceforge.net/projects/dc3dd/
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_RISCV_32
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
