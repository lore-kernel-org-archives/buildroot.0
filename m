Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B011C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 414EF40278;
	Mon, 29 Nov 2021 21:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCfVmXSoykzn; Mon, 29 Nov 2021 21:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BEA8402E1;
	Mon, 29 Nov 2021 21:37:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A32641BF38C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1501381A29
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjVxIh7JG3As for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F10B481C44
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6F9C290881; Mon, 29 Nov 2021 21:31:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 22:34:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3365a5680d22e0e9df92548c0c93c952a2e0ac40
X-Git-Newrev: 225a43f01da927c15a4f45a1ba7c62ad17724cbe
X-Patchwork-Hint: ignore
Message-Id: <20211129213102.6F9C290881@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wqy-zenhei: drop spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=225a43f01da927c15a4f45a1ba7c62ad17724cbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious spaces added by commit
a2387015fe3730291df1381a59acb13af356c543

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wqy-zenhei/wqy-zenhei.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wqy-zenhei/wqy-zenhei.mk b/package/wqy-zenhei/wqy-zenhei.mk
index 88e60f3e56..375b0dd303 100644
--- a/package/wqy-zenhei/wqy-zenhei.mk
+++ b/package/wqy-zenhei/wqy-zenhei.mk
@@ -6,15 +6,15 @@
 
 WQY_ZENHEI_VERSION = 0.9.45
 WQY_ZENHEI_SITE = https://downloads.sourceforge.net/project/wqy/wqy-zenhei/$(WQY_ZENHEI_VERSION)%20%28Fighting-state%20RC1%29
-WQY_ZENHEI_LICENSE =  GPL-2.0-with-font-exception
+WQY_ZENHEI_LICENSE = GPL-2.0-with-font-exception
 WQY_ZENHEI_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 define WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/43-wqy-zenhei-sharp.conf \
-	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/43-wqy-zenhei-sharp.conf
+		$(TARGET_DIR)/usr/share/fontconfig/conf.avail/43-wqy-zenhei-sharp.conf
 	$(INSTALL) -D -m 0644 $(@D)/44-wqy-zenhei.conf \
-	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/44-wqy-zenhei.conf
+		$(TARGET_DIR)/usr/share/fontconfig/conf.avail/44-wqy-zenhei.conf
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
