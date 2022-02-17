Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B75C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 694576F734;
	Thu, 17 Feb 2022 20:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiIFKMo__wm3; Thu, 17 Feb 2022 20:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92196F66E;
	Thu, 17 Feb 2022 20:30:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF0F1C1162
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EA5040391
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiPk9M6jBG93 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEDAC400D8
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BD9CE8379D; Thu, 17 Feb 2022 20:21:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:29:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e389bf186f732729f9e5b3ec84aedd1f925b4fe9
X-Git-Newrev: 293d8f727a0858b647479013be72be2da565667f
X-Patchwork-Hint: ignore
Message-Id: <20220217202156.BD9CE8379D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/urg: don't override URG_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=293d8f727a0858b647479013be72be2da565667f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

URG_CONF_OPTS is wrongly overridden in a conditional since commit
d0433603e3c7de5a0d7d6a434b4cb45ef5e5b533

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/urg/urg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 86b7ec2c17..476f36299f 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -18,7 +18,7 @@ URG_CONF_OPTS += \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 else
-URG_CONF_OPTS = --without-sdl
+URG_CONF_OPTS += --without-sdl
 URG_CONF_ENV += ac_cv_path_SDL_CONFIG=""
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
