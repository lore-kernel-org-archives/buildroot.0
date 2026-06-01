Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814E6CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 494E9606D0;
	Mon,  1 Jun 2026 19:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JaVXxeb5F1x; Mon,  1 Jun 2026 19:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD8B606D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780343192;
	bh=SLNs3Il13M+QICpHPeohoRzEdujNLORydNEhCzYi0+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KLTOcgmHQOtiFvDVznMNsRUPF8MG14gcqZ9yDFBfCqucwSU/ylCVgoteZc37LIT3U
	 p4r0+6nDpkICn8ngIPmfdksdSNtez3Aw7kgW+rrQDWGZggfk31Ib+Qw/LUHWTuRs0h
	 5g6wm8qt1xdvN/qRjMbgPABAcK2+YpBAyc6OHyNDIaIiCzGn93u/kLIBLeza52r6fB
	 czdXu8DMocu8sVK9DH1Y1RhdUgT6gHa3mJRIjsF4n1BJWD9odpCgZ+LF6XF8Fu29JE
	 HLrR8SFtqITJ0YSbTAxmicsfLbbrDLZEd02dv9Vy62NretThpkUtEGeLmznxJX7+K5
	 K9ctA+oyvuzzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD8B606D3;
	Mon,  1 Jun 2026 19:46:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03514F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3969810E1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnaqYavrfoH5 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19A22810DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19A22810DE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CB3186F12; Mon,  1 Jun 2026 19:46:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 21:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66544e0e48a24e59522d99cf3dac7c1e497c5e35
X-Git-Newrev: b71b14793ac4b45f3058528b4d8452d47e617d90
X-Patchwork-Hint: ignore
Message-Id: <20260601194616.0CB3186F12@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-airscan: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b71b14793ac4b45f3058528b4d8452d47e617d90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a build error

output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_ref':
airscan-http.c:(.text+0x1c88): undefined reference to `__sync_fetch_and_add_4'
output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_unref':
airscan-http.c:(.text+0x1cd0): undefined reference to `__sync_sub_and_fetch_4'
output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_ref':
airscan-trace.c:(.text+0x32c): undefined reference to `__sync_fetch_and_add_4'
output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_unref':
airscan-trace.c:(.text+0x358): undefined reference to `__sync_sub_and_fetch_4'

with this defconfig

BR2_sparc=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE=y
BR2_PACKAGE_SANE_AIRSCAN=y

detected by the Gitlab pipelines while testing to bump of sane-backends
to 1.4.0 in this series.

The build error is caused by an upstream commit added in 2020 to version
0.99.14:
https://github.com/alexpevzner/sane-airscan/commit/fccd8402a6bc5fce22805edf4e0fb6b0f24479e7
so a backport to LTS branches should be considered because the initial
version of the buildroot package was 0.99.33, added with commit
f78280bf262ceb1c1abbdade9de77fcc4add74ae.

An autobuilder error was not recorded yet because it is masked by various
build errors of the sane-backends package which are resolved by its bump
to 1.4.0 in this series.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/sane-airscan/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
index 2324a3f661..63ef06b582 100644
--- a/package/sane-airscan/Config.in
+++ b/package/sane-airscan/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SANE_AIRSCAN
 	bool "sane-airscan"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
 	depends on BR2_USE_WCHAR # avahi, gnutls
 	depends on BR2_USE_MMU # dbus, sane-backends
@@ -26,5 +27,6 @@ config BR2_PACKAGE_SANE_AIRSCAN
 
 comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
