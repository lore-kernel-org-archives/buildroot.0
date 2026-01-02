Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F7FFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24EE80F0A;
	Fri,  2 Jan 2026 21:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFUsaTAMHFTX; Fri,  2 Jan 2026 21:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCBF380E70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390387;
	bh=+NpuKDcaF+FB+0vo11RDvNMoLJaLXT44nCL5rLNmPX0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GgAiyl5UpRmq4RjauX4aQAF63ObxSyufZiuvaApyoPRC5YnbciAeFZG3TEw7nR3zs
	 xaJqTY0vefojx8b4+sTqKxBy1Ce/5gnhTwWEPpJ5VyQNCUU36ZbzdCxAr9YeEgTm9Z
	 BWBxkG4NR67ViDW+QgCkq2kvCpSgfv4xBGx48mW8NCfVFa4kuJz1Dlqv7xtVfqNcxo
	 daNTtiB0zbtzS6WryjD7zYYK3GT5BnUgkfcDUI2OfV1nz3WgrLQ3KwR9pBOwhbmVo9
	 WYMTMShBb+fqXpEZMV7+LxDWdWv1qitRi3eZjQ6idhtj/aSSa3MVFSh3tAtKQMwnZI
	 +MMyPoMtM+z5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBF380E70;
	Fri,  2 Jan 2026 21:46:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D7F440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F5F580D34
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PL9Ye4Vb9Y6h for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAC4C80CDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAC4C80CDB
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A929D880B1; Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 22:14:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec45430d19ed1ab1aa39e9bd534f3d3d992888bd
X-Git-Newrev: e09811f97184a1e1320cfb49970c12858fc8a0f1
X-Patchwork-Hint: ignore
Message-Id: <20260102214624.A929D880B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spice: add missing gcc >= 6
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e09811f97184a1e1320cfb49970c12858fc8a0f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

spice uses std::list allocator, which requires gcc >= 6. There are no
known autobuilder failures as we don't test toolchains as old as gcc
5.

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20241122213809.176709-1-ju.o@free.fr/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 468097cea1..1dc5ae3040 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,8 +1,8 @@
-comment "spice server needs a toolchain w/ wchar, threads, C++"
+comment "spice server needs a toolchain w/ wchar, threads, C++, gcc >= 6"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
@@ -11,6 +11,9 @@ config BR2_PACKAGE_SPICE
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
+	# Needs gcc >= 6 with c++11 std::list allocator
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc7f3d0eeef05fb8fc11384a9a29afae10a54cc7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
