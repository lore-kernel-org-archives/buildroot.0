Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20A8A402C5;
	Sat, 11 Dec 2021 23:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jW4gL2yGeJV0; Sat, 11 Dec 2021 23:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 336FB40236;
	Sat, 11 Dec 2021 23:09:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11B2E1BF297
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90F7640236
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZde6UHrFaWM for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC774404C2
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 73B8882ABB; Sat, 11 Dec 2021 23:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 00:05:49 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 8d83d809d0778aad6a5b57f3c71ab1f0f7de835e
X-Git-Newrev: b3f998b38ac37f393c24f1beee14e224bbfc7fb4
X-Patchwork-Hint: ignore
Message-Id: <20211211230119.73B8882ABB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] boot/syslinux: define
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3f998b38ac37f393c24f1beee14e224bbfc7fb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
