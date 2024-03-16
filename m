Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EFBC54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B762341753;
	Sat, 16 Mar 2024 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Uu9ksbZW_qN; Sat, 16 Mar 2024 22:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC684172F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC684172F;
	Sat, 16 Mar 2024 22:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE2D51BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9A8C6079F
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1Ymi0ENk4ZJ for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F85D60790
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F85D60790
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BE96883CC; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:00:07 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 49174847a7f60d4f36cf721afce8012b65d1dcb6
X-Git-Newrev: 247f4f218edc38ca81301a4c4967ea56392758e6
X-Patchwork-Hint: ignore
Message-Id: <20240316220050.8BE96883CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/ltris: drop
 unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=247f4f218edc38ca81301a4c4967ea56392758e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

--enable-sound has been dropped since version 1.2.4 and
https://sourceforge.net/p/lgames/code/432:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-static, --disable-shared, --enable-sound

Fixes: 61848605cd26d29f54c16de862aedba7cf334be4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9af20d6e1e1139e59ed3dd9aaf015e72f1e2db8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltris/ltris.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index 98902de44c..b34ac142ce 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -18,12 +18,9 @@ LTRIS_CONF_ENV = \
 
 ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
 LTRIS_DEPENDENCIES += sdl_mixer host-pkgconf
-LTRIS_CONF_OPTS += --enable-sound
 # configure script does NOT use pkg-config to figure out how to link
 # with sdl_mixer, breaking static linking as sdl_mixer can use libmad
 LTRIS_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs SDL_mixer`
-else
-LTRIS_CONF_OPTS += --disable-sound
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
