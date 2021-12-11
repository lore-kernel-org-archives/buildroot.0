Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBB8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00CF484C9F;
	Sat, 11 Dec 2021 23:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3K_Z650L4jq; Sat, 11 Dec 2021 23:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 489ED84C9A;
	Sat, 11 Dec 2021 23:08:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB4691BF297
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E73D340188
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5TasIMsFNjB for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 484B8424E7
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D5FAE82A50; Sat, 11 Dec 2021 23:01:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 00:05:55 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3bf9cd4d4ee2bb3569737c01c6455072ec5c6a73
X-Git-Newrev: 010868e1ca8bed16a3c3180922f2324c9477bdba
X-Patchwork-Hint: ignore
Message-Id: <20211211230107.D5FAE82A50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] boot/syslinux: define
 OBJCOPY and AS
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

commit: https://git.buildroot.net/buildroot/commit/?id=010868e1ca8bed16a3c3180922f2324c9477bdba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This fixes build on an ARM64 host (and I assume also
other non-x86).

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e938419bd98d57428aac9fc881c7a4adf45a5316)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 0643f85a99..2df415fcfd 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -60,6 +60,8 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		CC="$(TARGET_CC)" \
 		LD="$(TARGET_LD)" \
+		OBJCOPY="$(TARGET_OBJCOPY)" \
+		AS="$(TARGET_AS)" \
 		NASM="$(HOST_DIR)/bin/nasm" \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
