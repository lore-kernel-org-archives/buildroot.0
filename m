Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77ECC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F9EB429AA;
	Sun, 12 Dec 2021 12:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fopxKsBT5RGE; Sun, 12 Dec 2021 12:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD15642368;
	Sun, 12 Dec 2021 12:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA7691BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A10654299F
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z49hXHjPdxLy for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A97CC429A0
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0FDF482B71; Sun, 12 Dec 2021 12:17:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4464fabb6323dba4974096886166b9c4631fd38
X-Git-Newrev: b89163a067f6fd7d555e102ccbbe389a6dddc52d
X-Patchwork-Hint: ignore
Message-Id: <20211212121715.0FDF482B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: enable selinux policykit
 module for refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=b89163a067f6fd7d555e102ccbbe389a6dddc52d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for polkit to work with SELinux.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
