Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21406C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 16:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C54E34060F;
	Tue, 22 Feb 2022 16:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4KEuOX4O0_8; Tue, 22 Feb 2022 16:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C80740600;
	Tue, 22 Feb 2022 16:49:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF051BF97D
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CF1360EF6
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmRfVJIdFYz8 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 16:48:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB7860EC4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 16:48:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8C3D57FCA2; Tue, 22 Feb 2022 16:40:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 17:42:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 64f79776487a8573192e7477b96ff95655e1a097
X-Git-Newrev: 5ea5466832baee7444e36f4defc2444cadf97af3
X-Patchwork-Hint: ignore
Message-Id: <20220222164020.8C3D57FCA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/jack1: drop celt
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ea5466832baee7444e36f4defc2444cadf97af3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Drop celt comment which is not needed since removal of celt051 in commit
b32efbdb0354557db48852478b99080705ba315b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c6e200383cdf738f58fe1c6e42d3d5a10f7c1a62)
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
