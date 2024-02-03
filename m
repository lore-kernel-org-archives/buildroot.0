Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00567C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B521417BD;
	Sat,  3 Feb 2024 18:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B521417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCjjHOCtiC-j; Sat,  3 Feb 2024 18:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF50D414E5;
	Sat,  3 Feb 2024 18:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF50D414E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3D1C1BF86C
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED4414044F
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hb-WYOmMeSd3 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45A1040395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A1040395
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45A1040395
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:57:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29EB8867A2; Sat,  3 Feb 2024 10:57:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 11:48:17 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 56c80a2830698da2b6d80081625f39697900325f
X-Git-Newrev: 710935ea5f988ed36d0184cd0eb3fcfa695a0995
X-Patchwork-Hint: ignore
Message-Id: <20240203105723.29EB8867A2@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x] package/onevpl: fix
 libdrm dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=710935ea5f988ed36d0184cd0eb3fcfa695a0995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Buildroot commit c50e9c21f0444b064bc257fcc0d3073fee945623 initially
added the package onevpl and forgot to add all dependencies of
BR2_PACKAGE_LIBDRM_INTEL.

Fixes:
http://autobuild.buildroot.org/results/8fa/8fa0f2cd7a027d3d8fae56125621b0b814e132da/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/onevpl/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/onevpl/Config.in b/package/onevpl/Config.in
index a750e54d52..cd5b284531 100644
--- a/package/onevpl/Config.in
+++ b/package/onevpl/Config.in
@@ -12,7 +12,9 @@ config BR2_PACKAGE_ONEVPL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# libva support needs a libdrm with intel driver
-	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA && \
+		(BR2_i386 || BR2_x86_64) && \
+		BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
