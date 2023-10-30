Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDABC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE25085604;
	Mon, 30 Oct 2023 10:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE25085604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXpj8r-5EzqY; Mon, 30 Oct 2023 10:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10EA385554;
	Mon, 30 Oct 2023 10:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10EA385554
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 629751BF976
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B5324325B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B5324325B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEJ8Xi_kTglP for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14CF74064E
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14CF74064E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEB1B86167; Mon, 30 Oct 2023 10:19:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 11:12:43 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 0bc9bf988829d45253e80625ef0709bc22ded8bb
X-Git-Newrev: 6489cb62b217044eecb598c173d86f5d9da58313
X-Patchwork-Hint: ignore
Message-Id: <20231030101902.EEB1B86167@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 package/pkg-kernel-module: add BR2_MAKE_HOST_DEPENDENCY
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

commit: https://git.buildroot.net/buildroot/commit/?id=6489cb62b217044eecb598c173d86f5d9da58313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
$(BR2_MAKE) to avoid build issue with kernel version >= 6.2 and GNU
Make version < 3.82. However, the same issue is actual for kernel
modules as well.

Using $(BR2_MAKE) should guarantee a consistent behavior between
kernel and kernel-modules builds.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
[yann.morin.1998@free.fr: minor coding style]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 75fa573ef9336b57d1cfb86bfcaaed4872f64ac6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kernel-module.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index fcd6b8bc29..4f64a73f11 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -50,11 +50,13 @@ LINUX_NEEDS_MODULES = y
 endif
 
 # The kernel must be built first.
-$(2)_DEPENDENCIES += linux
+$(2)_DEPENDENCIES += \
+	linux \
+	$$(BR2_MAKE_HOST_DEPENDENCY)
 
 # This is only defined in some infrastructures (e.g. autotools, cmake),
 # but not in others (e.g. generic). So define it here as well.
-$(2)_MAKE ?= $$(MAKE)
+$(2)_MAKE ?= $$(BR2_MAKE)
 
 # If not specified, consider the source of the kernel module to be at
 # the root of the package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
