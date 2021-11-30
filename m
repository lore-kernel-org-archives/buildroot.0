Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629D4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 17:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0805082F37;
	Tue, 30 Nov 2021 17:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUzupNHB81Ue; Tue, 30 Nov 2021 17:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C62C82F6C;
	Tue, 30 Nov 2021 17:07:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05B881BF358
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9B6E40919
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjt0YMEWN4Jv for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 17:07:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56F6140926
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D58CE92129; Tue, 30 Nov 2021 17:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:39:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3376a20b2d1cd64f0d6d103bd635302749af2d62
X-Git-Newrev: e938419bd98d57428aac9fc881c7a4adf45a5316
X-Patchwork-Hint: ignore
Message-Id: <20211130170221.D58CE92129@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: define OBJCOPY and AS
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

commit: https://git.buildroot.net/buildroot/commit/?id=e938419bd98d57428aac9fc881c7a4adf45a5316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes build on an ARM64 host (and I assume also
other non-x86).

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
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
