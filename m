Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D66CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D05441147;
	Fri, 12 Jun 2026 11:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxdJfqrKZnrO; Fri, 12 Jun 2026 11:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7EB41161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263456;
	bh=8OOQgeQGyfl2kI/qXk4SGkd4BxVimvLjBAFKaSpHi7Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SGHfMcAAsRHurh/UjWedX8Ax3elA3a2q88KEMNeUma4WnBO2UHpMFulaE+RBIbI23
	 uWl4TCWZd8aUbqw/K3hH3waNA0i+Z7CABxuK42eL0uTmJrQsnKdujq57RVy2ttrKzY
	 gifBoNDgQqhstji6I1hhXmFPGnyaIoUWaiSSXc6JsIgA6l9yeA8UpnGJ2CrI2BxgfD
	 cH8Lng87oG57doUQXPPz4YTUkUezutL+fV+Z9sE8voetP6MGaytddEfRMT5Vl20XG+
	 AL0GIQKuZ9v+kY8eUfyl8nVkI6vR3pY5suPNzhEV1KAgQYcM5ueS3WjHG2AmDRgpPY
	 cmviyUple3pbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E7EB41161;
	Fri, 12 Jun 2026 11:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11396321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C23660F36
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbOxBScMUcFu for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 735AA60EFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 735AA60EFD
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CF37880E8; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:16:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 57a95f34b4e3cb0365ff006acccb9d6430340cda
X-Git-Newrev: ea14a3885534e12a4ac5174026e3ac0bbff44e2a
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.4CF37880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/sane-airscan:
 needs BR2_TOOLCHAIN_HAS_SYNC_4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea14a3885534e12a4ac5174026e3ac0bbff44e2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit b71b14793ac4b45f3058528b4d8452d47e617d90)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
