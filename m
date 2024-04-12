Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C86C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D69B641C64;
	Fri, 12 Apr 2024 15:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZV4PHNUm9aC; Fri, 12 Apr 2024 15:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D67641C56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D67641C56;
	Fri, 12 Apr 2024 15:50:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8A771BF42E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D38E841FF6
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESuVJpTRY0A7 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1102441E66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1102441E66
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CACA8609E; Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 17:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cda68a7ee95b5d298130c35339c041458c7186f
X-Git-Newrev: 3dbbc0ae9ff962c4a99aef3cca884428ef3f5fb8
X-Patchwork-Hint: ignore
Message-Id: <20240412155010.7CACA8609E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] uboot/uboot: add new dependency to yamllint
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dbbc0ae9ff962c4a99aef3cca884428ef3f5fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/uboot.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a894654698..0ee63cabdb 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -276,10 +276,12 @@ UBOOT_DEPENDENCIES += host-vim
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/binman/binman.rst?plain=1#L377
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pyyaml
+	host-python-pyyaml \
+	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
