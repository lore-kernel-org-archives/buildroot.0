Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F80FC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E3C580EBF;
	Sun, 26 Jan 2025 11:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMcsh1163tIJ; Sun, 26 Jan 2025 11:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95460819F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95460819F5;
	Sun, 26 Jan 2025 11:15:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29261941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16A3C6070F
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uY2d04O8x9xg for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D84E6080A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D84E6080A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:15:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47E70864CB; Sun, 26 Jan 2025 11:15:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 12:05:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 175bb0df12363c84aa4c96974314831321890c48
X-Git-Newrev: a528ac581fac9dd47e99fcabfbd0a3beed2a9367
X-Patchwork-Hint: ignore
Message-Id: <20250126111529.47E70864CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: replace fixup
 with tooldir config
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

commit: https://git.buildroot.net/buildroot/commit/?id=a528ac581fac9dd47e99fcabfbd0a3beed2a9367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch removes the post install fixup now that newlib 4.5.0 supports a
configurable tooldir path using --with-tooldir config option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/newlib-bare-metal/newlib-bare-metal.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index a3532f0b22..e28e7a717c 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -33,6 +33,7 @@ define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 			--enable-newlib-io-float \
 			--enable-newlib-io-long-double \
 			--disable-multilib \
+			--with-tooldir=/usr \
 	)
 endef
 
@@ -45,12 +46,4 @@ define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
 		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
 endef
 
-define NEWLIB_BARE_METAL_FIXUP
-	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/include \
-		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/include
-	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/lib \
-		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/lib
-endef
-NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP
-
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
