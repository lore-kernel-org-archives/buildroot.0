Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D5FE6FE2F
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 20:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98508607F8;
	Tue, 23 Dec 2025 20:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnZs42QSNtt8; Tue, 23 Dec 2025 20:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAC4460710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766522485;
	bh=TbQ37aCL8/tDsi0IuNnTI9YOIkrmES6HG3nVaq1aKEI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hi3ZKC9taJQ1QJadsIC7L9Z2owW+o0MfKdHP4t5eyjQvsVXuEwx41JmxA7+YAmLVE
	 MkuWNI8KXsIK+/JXSSlGwRj6/5kDh3+sz5DGam0qkYbzHSAPbRI7wxE5xjRzTcMdlH
	 Hy51reP0MvqpGS2q/G6/AJlf7C2j5lXPgx/FmiulDQQHQoXsxRlXNEq3wD/1oJ21YK
	 wZJmm/+l4KyalTBkpzhbxawqUtI2yz63rzQ6WfhDMQu9iqckkiK2EgMEjxish9Qnsr
	 dQ+ZymmL0/KcnodBs6ZUV9LBRZlkENmNXiDKleXBRQ6m3ARGVEM889UOyk+F49OrDb
	 HTdoUA0yejmTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAC4460710;
	Tue, 23 Dec 2025 20:41:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 208F5BE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1295B40024
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FF-SDlfQqgkx for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56CD8402F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56CD8402F0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44BAC875E2; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Dec 2025 21:37:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67e84345c156170fa01103289f1d255a74ad830d
X-Git-Newrev: 21e613753ec2fc931c4f7a95ab5c0019bd30636c
X-Patchwork-Hint: ignore
Message-Id: <20251223204121.44BAC875E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: use more conventional $(MAKE)
 construct
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

commit: https://git.buildroot.net/buildroot/commit/?id=21e613753ec2fc931c4f7a95ab5c0019bd30636c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Buildroot, we more commonly do:

   $(MAKE) -C $(@D)/src

than:

   cd $(@D)/src; $(MAKE)

so let's adopt this more conventional style.

This coding style in vim.mk dates from when the package was introduced
by Peter Korsgaard back in 2010.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vim/vim.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 43c9bfc0f1..10ff3a109b 100644
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
