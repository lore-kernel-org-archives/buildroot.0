Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B755AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 08:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2578240977;
	Sat, 29 Jan 2022 08:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeTWjIzuIprp; Sat, 29 Jan 2022 08:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B2754094D;
	Sat, 29 Jan 2022 08:30:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 718FF1BF831
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 08:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F94C40119
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 08:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXVuWdBhR5wt for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 08:30:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 683EB400AF
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 08:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 87A88826DA; Sat, 29 Jan 2022 08:23:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 09:30:18 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 1b6623e47899e788b7e72dda64d3c4ff479fcfe7
X-Git-Newrev: c9a07a5887b422c9459bb6e80770c8a5d6c8514c
X-Patchwork-Hint: ignore
Message-Id: <20220129082339.87A88826DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/polkit: enable
 selinux policykit module for refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9a07a5887b422c9459bb6e80770c8a5d6c8514c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

This is needed for polkit to work with SELinux.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b89163a067f6fd7d555e102ccbbe389a6dddc52d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a8b91d21bc..a7ab725c81 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -14,6 +14,8 @@ POLKIT_INSTALL_STAGING = YES
 POLKIT_DEPENDENCIES = \
 	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
+POLKIT_SELINUX_MODULES = policykit
+
 POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
 
 POLKIT_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
