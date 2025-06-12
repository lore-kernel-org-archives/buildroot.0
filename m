Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF85C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43F140976;
	Thu, 12 Jun 2025 20:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXYhvQ2YCs53; Thu, 12 Jun 2025 20:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0405640A57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0405640A57;
	Thu, 12 Jun 2025 20:12:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F011BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CF1A40974
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXhufBiWgFTa for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5779740944
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5779740944
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55BBE83554; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 11ca118cc4f69dc0b11cd84fff6aecda262f87fe
X-Git-Newrev: ac9e479c0723e4a658ad56cbeb95e764e48d779b
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.55BBE83554@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/systemd: fix
 systemd-boot installation
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ac9e479c0723e4a658ad56cbeb95e764e48d779b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When the meson build directory was changed to buildroot-build in
4e95062f820a64ecd2402115ee552dbcf2874f02 we forgot to update the
install path for the systemd-boot efi binary.

Fixes:
/usr/bin/install: cannot stat '/home/buildroot/buildroot/output/build/systemd-256.7/build/src/boot/efi/systemd-bootx64.efi': No such file or directory

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b6b96b7bdca6f989f26b4c3aea0c15d064bd3120)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 337d52b1f2..71fe0de550 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -646,7 +646,7 @@ SYSTEMD_CONF_OPTS += -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
-	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
+	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
 	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
 		$(BINARIES_DIR)/efi-part/loader/loader.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
