Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B38C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 515B041C8B;
	Fri,  1 Mar 2024 18:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5vfu0qhewaEY; Fri,  1 Mar 2024 18:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 178E241CB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 178E241CB3;
	Fri,  1 Mar 2024 18:09:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E658F1BF990
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E076183B55
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edWCK8BB18zN for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399F383B53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 399F383B53
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2376B87F1B; Fri,  1 Mar 2024 18:09:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:08:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e576592607705d397220b9a5907265f052dcb95
X-Git-Newrev: 7fcb4469dbd2392c3210293d04d9776190280373
X-Patchwork-Hint: ignore
Message-Id: <20240301180911.2376B87F1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: fix build
 without makeinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fcb4469dbd2392c3210293d04d9776190280373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without makeinfo raised since the
addition of the package in commit
3b95ff658bf4859eb5cffd28cbbedd1826fad9a6:

make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/newlib-bare-metal-4.4.0/microblazeel-xilinx-elf/libgloss'
  MAKEINFO ../.././libgloss/doc/porting.info
/home/buildroot/autobuild/instance-2/output-1/build/newlib-bare-metal-4.4.0/missing: line 81: makeinfo: command not found

Fixes: 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6
 - http://autobuild.buildroot.org/results/23e6641cbce62258310c300f8aed5d6a76973d72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newlib-bare-metal/newlib-bare-metal.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index 452bc4da25..e1b46fbc88 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -18,6 +18,7 @@ NEWLIB_BARE_METAL_LICENSE_FILES = \
 
 NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
+NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 	(cd $(@D) && \
@@ -34,11 +35,12 @@ define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 endef
 
 define NEWLIB_BARE_METAL_BUILD_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D)
+	PATH=$(BR_PATH) $(MAKE1) $(NEWLIB_BARE_METAL_MAKE_OPTS) -C $(@D)
 endef
 
 define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D) DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
+	PATH=$(BR_PATH) $(MAKE1) -C $(@D) $(NEWLIB_BARE_METAL_MAKE_OPTS) \
+		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
 endef
 
 define NEWLIB_BARE_METAL_FIXUP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
