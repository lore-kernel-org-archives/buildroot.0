Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4677C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB6D40277;
	Mon, 29 Nov 2021 21:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I16CNmnsUafk; Mon, 29 Nov 2021 21:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCB340245;
	Mon, 29 Nov 2021 21:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A60AA1BF38C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60EF780F9F
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZscOVJqJqQou for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE3F6818AC
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3CEF9912AB; Mon, 29 Nov 2021 21:31:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 22:32:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0233cd2cd83dca283e851f2dd51a6b19f4d4625
X-Git-Newrev: 49d4e26358fb785b6db2bac59bce6242aec1fe56
X-Patchwork-Hint: ignore
Message-Id: <20211129213102.3CEF9912AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl_ttf: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=49d4e26358fb785b6db2bac59bce6242aec1fe56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by
fcb48a9a6568f09d2c246470de156299d9c5e846

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_ttf/sdl_ttf.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 254000443c..c396830d0e 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -18,5 +18,8 @@ SDL_TTF_CONF_OPTS = \
 	--with-freetype-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-prefix=$(STAGING_DIR)/usr
 
-SDL_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
+SDL_TTF_MAKE_OPTS = \
+	INCLUDES="-I$(STAGING_DIR)/usr/include/SDL" \
+	LDFLAGS="-L$(STAGING_DIR)/usr/lib"
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
