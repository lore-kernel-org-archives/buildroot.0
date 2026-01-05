Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C7CD0400
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D902F40857;
	Mon,  5 Jan 2026 20:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hO9pypS5EGxo; Mon,  5 Jan 2026 20:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF791407AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646236;
	bh=S61uJyT+OPPaSsD+B2s2uVh1p7whAK0O2wj6JtWymCU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GKt5mtk0fH0IxyOHd2BSqrIEqv73YEAeV37RSVDrXs5vFgZVcBb3JDBAIAKpjm5RF
	 BAdKCSmguXINA8zEcb7kJczKBmvF+6BPpHYHiSabP+3E6XIrLPwkiFBAh7Lr9OntRM
	 nx/hRx/sBw1wxjtw7wXsfM6NNHikeeqYa+OHm3w/KIiKovtu7MeogWRw//U7nARsIv
	 TTcl0MEVnTauuOs/ymiTq9ZBF7631Gzumryg1KAWrJUJ8NoLPL0p1QRxoJzChO4R/r
	 hfg53gxlwCjkU/BI8pBbti2MvaCnyzmQ8c1nS0u7BmMRN3rIfDfzZ3gfc7LDM1TtuV
	 qgSpjOV1ESwtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF791407AF;
	Mon,  5 Jan 2026 20:50:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE899249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A05D060708
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4Eohn0rPaj4 for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE3C607CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCE3C607CD
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7705882A6; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:37:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1498900a086bd674ba3336a36005ce4793ef6ec1
X-Git-Newrev: 0e6111b48c1e8b13169ff13877ac79c50ac85d0b
X-Patchwork-Hint: ignore
Message-Id: <20260105205030.C7705882A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-memray: require toolchain
 with C++ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e6111b48c1e8b13169ff13877ac79c50ac85d0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the build Cython creates C++ source that needs to be
compiled. The missing dependency did not show in the existing runtime
test because the Bootlin stable toolchains include C++ support.

Package was added in c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-memray/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
index 831dfe2957..1c5b286a8d 100644
--- a/package/python-memray/Config.in
+++ b/package/python-memray/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
 	select BR2_PACKAGE_LIBUNWIND
@@ -18,7 +19,8 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 
 	  https://github.com/bloomberg/memray
 
-comment "python-memray needs a toolchain w/ dynamic library, threads, wchar"
+comment "python-memray needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
