Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CF4D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE3440FB5;
	Wed,  7 Jan 2026 18:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV6UioPx9SqN; Wed,  7 Jan 2026 18:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E2640F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808888;
	bh=lGyL9Qi+IhLA0G2F1zmGx/oQlleVFr6YW1BdUPh4iH4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kt8dwM9FXTH3bNriFJDQuLt27M1sMyNsagvZ5k5bh3DSR7KsFUKOFTcpk7CmEgt2x
	 5QnIsS8jzGv+lvio1EfnZCxSoDqFR4yGbCmPWGZ/hMHkbsiXEzaUCQ1lHtMUbrlLiI
	 g/1DUxbY3ypOMPz2czZ5kvoc3mTq4SRWcnLdMGmn7KCNqnXD2KHOGu6pE5eCqgUKQt
	 TqDe7h2U5oDBERCjrvoZEoOU56vq/1TBRTGDD5+Cby1u0UVY5aPsnTgDHDTnQyQuRb
	 ukTquzdULvtsPu86xz4zFLEjw+vMId9F/XCIe1eJe5czkdcZAmOzJtUdfA+OfaBxVt
	 XhVgvY+w3xR0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E2640F6A;
	Wed,  7 Jan 2026 18:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0750825B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A85AC60859
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJ7OEcIJHgAF for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8B63607FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8B63607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7541867BC; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:36:37 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6578fa8677f8faffec0a1fd635bc82f6defdcef3
X-Git-Newrev: d6bba36979dcbd62e95521993e69a879e20eef38
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.C7541867BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/vim: inline the
 VIM_REMOVE_DOCS variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6bba36979dcbd62e95521993e69a879e20eef38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
(cherry picked from commit 7bcc99b57b2b021daf72cfc4604708e3138736f6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index d250ac6b59..77d3ac35ad 100644
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
