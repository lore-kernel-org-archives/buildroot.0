Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4012CC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 122D542D13;
	Fri,  2 May 2025 11:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruS1Sk-zGbB3; Fri,  2 May 2025 11:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4AA42D1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4AA42D1B;
	Fri,  2 May 2025 11:14:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 145D8229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E3041DE6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbqMew6jY3A2 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 123EA41DE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 123EA41DE7
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EA2F7FCBB; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2715339ec69ffd43ab26ef377fe2cdce2d3d5b20
X-Git-Newrev: 21be6420f1d9dba6355e2afdb7f4417d47004513
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.0EA2F7FCBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pixman: only
 compile with riscv vector support when selected
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21be6420f1d9dba6355e2afdb7f4417d47004513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Pixman defaults to building with the riscv vector extension. Instead,
only build with vector if the buildroot user has selected
BR2_RISCV_ISA_RVV.

This option exists since pixman 0.44.0, to which the Buildroot package
was updated as part of Buildroot commit
ba2fb599cd002b57fa70e978d91884c98d8aad05.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 386e6bb4799471acc61c085fdc6472b2e43b0554)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 391950cbfc..76e72d6d96 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -74,6 +74,12 @@ else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled
 endif
 
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+PIXMAN_CONF_OPTS += -Drvv=enabled
+else
+PIXMAN_CONF_OPTS += -Drvv=disabled
+endif
+
 PIXMAN_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
