Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5806AC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A4026147C;
	Wed,  7 Feb 2024 19:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjNgfoQDRza8; Wed,  7 Feb 2024 19:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 282D661480
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 282D661480;
	Wed,  7 Feb 2024 19:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD3D1BF577
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E49DF61480
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EsJzzKcMPfI for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8E66147C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C8E66147C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:14:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2325C876A6; Wed,  7 Feb 2024 19:14:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 20:13:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c12e1c7b5946aa7ddc744e17ba5d3d04d639b075
X-Git-Newrev: de86cac61bb2cbe875707990e49e80eccdba2796
X-Patchwork-Hint: ignore
Message-Id: <20240207191413.2325C876A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: minor makefile cleanup
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

commit: https://git.buildroot.net/buildroot/commit/?id=de86cac61bb2cbe875707990e49e80eccdba2796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normalize the order of arguments to $(INSTALL). Remove an unnecessary
pair of parentheses.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/petitboot/petitboot.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 2087f01b09..4c8bc35adb 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -63,15 +63,15 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
-	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
 		$(TARGET_DIR)/etc/init.d/pb-console
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
-	(for port in $(PETITBOOT_GETTY_PORT); do \
+	for port in $(PETITBOOT_GETTY_PORT); do \
 		printf 'SUBSYSTEM=="tty", KERNEL=="%s", RUN+="/etc/init.d/pb-console start $$name"\n' "$$port"; \
-	done) > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
+	done > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
 
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
