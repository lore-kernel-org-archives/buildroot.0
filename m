Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F800E6FE30
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 20:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC6360EA5;
	Tue, 23 Dec 2025 20:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jblZQKr_LJXX; Tue, 23 Dec 2025 20:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F03F60E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766522488;
	bh=RijvQ41ubmXDfdt+FYpfT3kAXNzk0Ip4n52pf9UWhCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vdn7251pXNw7wmxGy7NYie1MO270IjXImy5u5VyfuCxolYGp21j4ygiS9DeRgyyqf
	 JYBjw7BzfThV9gJlFpPWFNDyMeYx02V/JgqNJBcqsPCsSmcd5YCXIGjYx0Bq4q9jPB
	 PPvTWpw9MF2Vba+J2FvpmaRcw+0iJXuem9/DWLpF3eO2g/mEbhjX/WH23wxDOW6699
	 Rz7ECVUAKQjgODK3teXn1T3OIRdsne48u91bEr5cROeAiLYJPyPSP4OEpUl+CRQIXN
	 wH2vWKPs7LAdo+tI3o/K9hqFUHlowPzkLmto428BoH8aFoagum8N5rvhJ+9Z71nhXh
	 x8iZh+K+KcCwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F03F60E97;
	Tue, 23 Dec 2025 20:41:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A145119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C650402F0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5y5RXH8Dk1HZ for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E54240787
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E54240787
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BB728760F; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Dec 2025 21:38:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 525a234303bf19a99940954abdfa7aa51add2b94
X-Git-Newrev: 7bcc99b57b2b021daf72cfc4604708e3138736f6
X-Patchwork-Hint: ignore
Message-Id: <20251223204121.5BB728760F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: inline the VIM_REMOVE_DOCS
 variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bcc99b57b2b021daf72cfc4604708e3138736f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VIM_REMOVE_DOCS variable is currently a post install target hook,
but it can just as well be done inside VIM_INSTALL_TARGET_CMDS
directly.

The hook was registered conditionally based on BR2_PACKAGE_VIM_RUNTIME
because prior to commit f7a07f42f70a73806fd2f6bf3662fc6907845fe9, the
hook's logic was:

    find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete

which was failing if BR2_PACKAGE_VIM_RUNTIME was not enabled, as
$(TARGET_DIR)/usr/share/vim would not exist.

But since this commit, the hook logic is:

    $(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/

which obviously won't fail if $(TARGET_DIR)/usr/share/vim doesn't
exist.

So let's simplify the whole logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vim/vim.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index a1a484c673..4fe8800bea 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -58,9 +58,6 @@ define VIM_INSTALL_TARGET_CMDS
 	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
 		$(VIM_INSTALL_TARGETS)
-endef
-
-define VIM_REMOVE_DOCS
 	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
 endef
 
@@ -77,10 +74,6 @@ endef
 endif
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VI_SYMLINK
 
-ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
-VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
-endif
-
 HOST_VIM_DEPENDENCIES = host-ncurses
 HOST_VIM_CONF_OPTS = \
 	--with-tlib=ncurses \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
