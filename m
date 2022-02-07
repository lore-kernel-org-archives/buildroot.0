Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD70C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89400401AF;
	Mon,  7 Feb 2022 07:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJuGHfceWoGH; Mon,  7 Feb 2022 07:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8801540207;
	Mon,  7 Feb 2022 07:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 332421BF309
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22310402D2
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94BOdum1BsFj for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D6044025A
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5897882BB8; Mon,  7 Feb 2022 07:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 08:31:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 521afeab9b7c0b07a849355e8b1c1fde0965c84f
X-Git-Newrev: c6e200383cdf738f58fe1c6e42d3d5a10f7c1a62
X-Patchwork-Hint: ignore
Message-Id: <20220207072828.5897882BB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack1: drop celt comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6e200383cdf738f58fe1c6e42d3d5a10f7c1a62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop celt comment which is not needed since removal of celt051 in commit
b32efbdb0354557db48852478b99080705ba315b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack1/jack1.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 2f97434ebe..311f7c9ba0 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -11,8 +11,6 @@ JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
 
-# Dependency to celt can't be met: jack1 requires celt >= 0.8.0 but we
-# only have 0.5.1.3 and we cannot upgrade.
 JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsamplerate libsndfile
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
