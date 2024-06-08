Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96856C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3054E84737;
	Sat,  8 Jun 2024 19:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AIqZfApxNAN; Sat,  8 Jun 2024 19:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970D584D0C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 970D584D0C;
	Sat,  8 Jun 2024 19:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC3171BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1DC440412
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUMJ2sPPlu41 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89AB40439
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C89AB40439
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C408A87C6F; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 21:05:16 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 01e7df5745be39aae839ccfeb6c34b382c9e8afd
X-Git-Newrev: 73075706e9769e8db238258c8a1b756e179930d3
X-Patchwork-Hint: ignore
Message-Id: <20240608191502.C408A87C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/octave: add
 optional {Graphics, Image}Magick++ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=73075706e9769e8db238258c8a1b756e179930d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9f39676bdbd4936669a128c544ade514b3afef6a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/octave/octave.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 9d6e4719c3..f3c4294f2d 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -26,6 +26,16 @@ else
 OCTAVE_CONF_OPTS += --without-bz2
 endif
 
+ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
+OCTAVE_CONF_OPTS += --with-magick=GraphicsMagick++
+OCTAVE_DEPENDENCIES += graphicsmagick
+else ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+OCTAVE_CONF_OPTS += --with-magick=ImageMagick++
+OCTAVE_DEPENDENCIES += imagemagick
+else
+OCTAVE_CONF_OPTS += --without-magick
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += \
 	--enable-readline \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
