Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDA0EEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBC2D4070C;
	Thu,  1 Jan 2026 15:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1EFsiXGhkcu; Thu,  1 Jan 2026 15:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF49407D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280074;
	bh=BkBxZ401TEtoBsvzYSdoUhn8ce/vuksNFwTW0LYdxHA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bYCAyGn2SziAAxb0/2pckrEjI+k41beIudNmFT58GcpNpzMqdT4ECnW+D0pm6vBT6
	 +FIaeUBbzfZLGNZ8h0ORWnOh7o8ae88mdfm93DtG0jqwvDRkxC6/WHJto8lmj4FxqK
	 oxV2xD4jFjJ+BNC2z0WAgxf+DpdlNi68gx/X26ETnF31lya7B7ZJN24QYFXbTsVJw5
	 4lxhFTaislS6oYVOTs5q8pPoxaS+CL1I6u5FZm1MUM5D8YLnIhSqHx3jNQAPb71cCe
	 YQtUlsBtGTJMclckguDRaCXW0JPt6rmhEO9oloxE6lwmRVglwBzKDiNYfGMMYyUYf3
	 DdRs8I55LJ75w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF49407D4;
	Thu,  1 Jan 2026 15:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66FCA351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 595064023E
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2haVkCDsjdpE for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 824CE400E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 824CE400E4
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D73587DCE; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 15:33:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dd73c30d387b235589275bad729e66619d062c3
X-Git-Newrev: 63d0611b0c4eeb7ac7c4f07defca637d566043b1
X-Patchwork-Hint: ignore
Message-Id: <20260101150751.6D73587DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-modules: bump to latest
 2.13.x to fix build with recent kernels
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

commit: https://git.buildroot.net/buildroot/commit/?id=63d0611b0c4eeb7ac7c4f07defca637d566043b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lttng-modules fails to build in master and in our LTS branch
2025.02.x. Indeed, our LTS branch uses the 6.12 kernel as the latest
LTS, and lttng-modules in version 2.13.10 don't build with the 6.12
kernel:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_PACKAGE_LTTNG_MODULES=y

fails to build with 2025.02.x.

To fix this, let's bump to the latest point release in the 2.13.x
branch, which mostly contains fixes needed for the 2.13.x releases to
work with newer kernels. This is considered a reasonable bump for our
2025.02 LTS.

The hash of the license file is updated as the list of files under
each license has changed a bit, but that doesn't change the overall
list of licenses.

Fixes:

  https://autobuild.buildroot.net/results/78d05ded97877f866d2bd7aa600a2dafa01bb364/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-modules/lttng-modules.hash | 6 +++---
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index b14b488837..ad2a641cc8 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,8 +1,8 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.10.tar.bz2.sha256
-sha256  13abfb1ac870711f0d0adfa88e53b17deb2e3052173715a260a6ef14aa45b0a7  lttng-modules-2.13.10.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.22.tar.bz2.sha256
+sha256  8741802711050b7c1e865598c4d39ed9ba72e505b7e69c7887f9751e112517ef  lttng-modules-2.13.22.tar.bz2
 
 # Hash for license files
 sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
 sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
-sha256  0133d3c505f176845d7a8b4dcfe006ac615832c43c41e76fe3b365191bafca92  LICENSE
+sha256  dc47dc17b111f67f52549d4f9649aead142f84317b269ecce80deb1b64e7d023  LICENSE
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index d6f1e4114d..23258a46df 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.13.10
+LTTNG_MODULES_VERSION = 2.13.22
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
