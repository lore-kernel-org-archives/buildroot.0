Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE61D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42AF40A51;
	Wed,  7 Jan 2026 17:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UOd6T5MOhJc; Wed,  7 Jan 2026 17:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E6C40A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808042;
	bh=+Wgg0glepaI8YWag0J5T8DHxLaA4h7037orDaIdLjMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j430HqxQptbqrqQ1G4zJ2whNwjwC9sb3PtsIEdx2qSu72GIauI/5iz22CRLqGNk8l
	 9wuXi2zGDuS8mcTQK50NaIzMJhap8VbKLmsbOkovL+TQL9X2sxj1mO84TqcTr9XWRN
	 xK8ZdfX/Ge2jjp3FhAzTZu0csPiMBQto1y9XITfbxUpI5a7XbsY4ZMq3AgRHTNkLkJ
	 I7arRM9P9PPBkCWftsY2Klo79lY7bPU4NiupOUT7yaLR063IzKB9kLCVUPX4uY2Uvw
	 wNUjWxsMfhr1XzDhl093y/rieiLnY6Vsgjhevjc0peKDg4ReJUZLcKlbs6+F8MTcZz
	 kngIsWSszaraQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14E6C40A41;
	Wed,  7 Jan 2026 17:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E99BA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67EC74089D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwnWREObaz_p for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A314087A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22A314087A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21D0388354; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:12 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 384a9c596fe72cfbfdd277051a14f495516fd456
X-Git-Newrev: f0711e5202a0eee13b3241a0e0c1c93bab2785a6
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.21D0388354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vim: use more
 conventional $(MAKE) construct
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0711e5202a0eee13b3241a0e0c1c93bab2785a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

In Buildroot, we more commonly do:

   $(MAKE) -C $(@D)/src

than:

   cd $(@D)/src; $(MAKE)

so let's adopt this more conventional style.

This coding style in vim.mk dates from when the package was introduced
by Peter Korsgaard back in 2010.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 21e613753ec2fc931c4f7a95ab5c0019bd30636c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 36015c6085..2bf01fa8bd 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -48,17 +48,15 @@ endif
 
 define VIM_INSTALL_TARGET_CMDS
 	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
-	cd $(@D)/src; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installvimbin
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installpack
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installtools
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installlinks
 endef
 
 define VIM_INSTALL_RUNTIME_CMDS
-	cd $(@D)/src; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installmacros
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installrtbase
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installmacros
 endef
 
 define VIM_REMOVE_DOCS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
