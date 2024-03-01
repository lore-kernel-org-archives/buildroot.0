Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7449C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 19:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942C083AD2;
	Fri,  1 Mar 2024 19:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEuOCd7hEtsw; Fri,  1 Mar 2024 19:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 666DF83AA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 666DF83AA9;
	Fri,  1 Mar 2024 19:00:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7521BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C72E41E0F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbYJ_zt8yoBh for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4114F41E12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4114F41E12
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AC1D87F53; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:55:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31f4bf275da4ba349eed0fe2581ba8bdeae59daa
X-Git-Newrev: 3a8a87f107b916a65e0328ddd5d7f14386de11f9
X-Patchwork-Hint: ignore
Message-Id: <20240301190012.2AC1D87F53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: update
 NEWLIB_BARE_METAL_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a8a87f107b916a65e0328ddd5d7f14386de11f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update NEWLIB_BARE_METAL_VERSION to match version retrieved on
https://release-monitoring.org/project/13816

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newlib-bare-metal/newlib-bare-metal.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index e1b46fbc88..f27da4284b 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NEWLIB_BARE_METAL_VERSION = 4.4.0
+NEWLIB_BARE_METAL_VERSION = 4.4.0.20231231
 NEWLIB_BARE_METAL_SITE = ftp://sourceware.org/pub/newlib
-NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).20231231.tar.gz
+NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).tar.gz
 NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
 NEWLIB_BARE_METAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 NEWLIB_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
