Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A951BC5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1F183264;
	Fri,  8 Mar 2024 11:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2UmRbY7Mq69; Fri,  8 Mar 2024 11:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648DE8322A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648DE8322A;
	Fri,  8 Mar 2024 11:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB661BF317
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 296054148B
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWgyVbjvS7E1 for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D64C41CA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D64C41CA2
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3472688038; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 12:26:32 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f05246df4f864489451576a194e38a8679c7f5da
X-Git-Newrev: 5f1bccce4706c910f844c751b451476746c772c0
X-Patchwork-Hint: ignore
Message-Id: <20240308113207.3472688038@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/petitboot: minor
 makefile cleanup
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f1bccce4706c910f844c751b451476746c772c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Normalize the order of arguments to $(INSTALL). Remove an unnecessary
pair of parentheses.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit de86cac61bb2cbe875707990e49e80eccdba2796)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
