Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA00C369D3
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37AE41D7E;
	Fri, 25 Apr 2025 16:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XU6OytACVrPi; Fri, 25 Apr 2025 16:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35CB241DBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35CB241DBA;
	Fri, 25 Apr 2025 16:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 262AAC1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D12B83D67
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Som-NqxjeFH6 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E79ED83D69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E79ED83D69
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6CD486358; Fri, 25 Apr 2025 16:13:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:12:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b20c8aa1f1feb614f2bc321a236183c42e50596d
X-Git-Newrev: 0e0b65781b28b168c000ce0df200cbe980433559
X-Patchwork-Hint: ignore
Message-Id: <20250425161308.D6CD486358@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: fixup Config.in comment
 about dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e0b65781b28b168c000ce0df200cbe980433559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Config.in comment in the dpdk package was wrong for a number of
reasons:

- It didn't mention the glibc dependency

- It didn't mention the gcc >= 4.9 dependency

- It mentioned a wchar dependency that isn't listed in the dpdk
  dependencies

- It mentioned a dynamic library dependency that isn't listed in the
  dpdk dependencies

- It used "kernel headers >= 4.19", while for brievity we use "headers
  >= 4.19" everywhere in Buildroot

- Minor nit: DPDK was written allcaps, while we write package names
  lower-case in Buildroot

Fixes: d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179 ("package/dpdk: add 24.07")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 328129ea65..7d4a002002 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_DPDK_TESTS
 
 endif
 
-comment "DPDK needs a toolchain w/ dynamic library, threads, wchar, kernel headers >= 4.19"
+comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
 	depends on BR2_USE_MMU # pthread() memory mappings
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
