Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8132C433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16689402EC;
	Thu, 25 Nov 2021 19:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id de5FVEV5ilLY; Thu, 25 Nov 2021 19:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30D62401D4;
	Thu, 25 Nov 2021 19:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D36C1BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7266072E
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wAVmEWGnlRgO for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3589605E7
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:54:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C7E5D8F537; Thu, 25 Nov 2021 19:49:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 20:51:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45846d200ecc8cac057ac58a707e65c6975eef84
X-Git-Newrev: 3d2ea316516fc8b4435a13070f93d1ada87264e0
X-Patchwork-Hint: ignore
Message-Id: <20211125194954.C7E5D8F537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcursor-transparent-theme:
 rename ICONS_DEFAULT_CONFIG_INSTALL
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d2ea316516fc8b4435a13070f93d1ada87264e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index ddcc6ac9cb..4706a522ef 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -10,11 +10,12 @@ XCURSOR_TRANSPARENT_THEME_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 XCURSOR_TRANSPARENT_THEME_LICENSE = GPL-2.0
 XCURSOR_TRANSPARENT_THEME_LICENSE_FILES = COPYING
 
-define ICONS_DEFAULT_CONFIG_INSTALL
+define XCURSOR_TRANSPARENT_THEME_ICONS_DEFAULT_CONFIG_INSTALL
 	$(INSTALL) -m 0755 -D package/x11r7/xcursor-transparent-theme/index.theme \
 		$(TARGET_DIR)/usr/share/icons/default/index.theme
 endef
 
-XCURSOR_TRANSPARENT_THEME_POST_INSTALL_TARGET_HOOKS += ICONS_DEFAULT_CONFIG_INSTALL
+XCURSOR_TRANSPARENT_THEME_POST_INSTALL_TARGET_HOOKS += \
+	XCURSOR_TRANSPARENT_THEME_ICONS_DEFAULT_CONFIG_INSTALL
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
