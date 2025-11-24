Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5492CFD356
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98BBD818C0;
	Mon, 24 Nov 2025 20:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMS2nXv62IG0; Mon, 24 Nov 2025 20:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 782F981755
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782F981755;
	Mon, 24 Nov 2025 20:55:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 094B4359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3BA6403C3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxxeRlRR2Qed for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 20:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2912540165
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2912540165
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:55:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23AD285DEC; Mon, 24 Nov 2025 20:55:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 21:31:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35d8a3a0ca6bbaef1c9e2ee9f7f16f1a5b056b17
X-Git-Newrev: 531a39d21e62e543e474ef0981b1c37b81c8e9be
X-Patchwork-Hint: ignore
Message-Id: <20251124205552.23AD285DEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: add -std=gnu17 only for gcc
 >= 8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=531a39d21e62e543e474ef0981b1c37b81c8e9be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit f5101638b9f917dc4c569828ff3fee0c486ba8f8 unconditionally
added -std=gnu17 breaking the build with older gcc versions:
https://lore.kernel.org/buildroot/20250815121815.436050ec@windsurf/

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update message url to use lore]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/syslinux/syslinux.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index b8f022b189..f938634c35 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -56,6 +56,9 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # syslinux build system has no convenient way to pass CFLAGS,
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
 # Install in a temporary location that eases final install into
 # images/ (see corresponding command, below).
 # Repeat the target, otherwise syslinux will try to build everything
@@ -65,7 +68,7 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		ASCIIDOC_OK=-1 \
 		A2X_XML_OK=-1 \
-		CC="$(TARGET_CC) -std=gnu17" \
+		CC="$(TARGET_CC) $(if $(BR2_TOOLCHAIN_GCC_AT_LEAST_8),-std=gnu17)" \
 		LD="$(TARGET_LD)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
 		AS="$(TARGET_AS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
