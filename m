Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB28C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3EF981254;
	Sun,  9 Jan 2022 20:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfkXBEmSmffX; Sun,  9 Jan 2022 20:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED9FD81266;
	Sun,  9 Jan 2022 20:17:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E29691BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D15CE81266
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3I4gZupVJil for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41C2781254
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:16:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0BAD382D9F; Sun,  9 Jan 2022 20:10:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:15:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5cdb54ed78b136c83dd44aebfa27f715cda5ea3
X-Git-Newrev: c077b4a919d697c0b4f5c0c30d945418691e2e23
X-Patchwork-Hint: ignore
Message-Id: <20220109201037.0BAD382D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: fix ssh2 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=c077b4a919d697c0b4f5c0c30d945418691e2e23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
fbf25acfbfd5a73b3560918bea081768abbe5723:

output/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "ssh2"

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/libvirt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 41218c0e53..0c1ee82f43 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -220,10 +220,10 @@ LIBVIRT_CONF_OPTS += -Dsasl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
-LIBVIRT_CONF_OPTS += -Dssh2=enabled
+LIBVIRT_CONF_OPTS += -Dlibssh2=enabled
 LIBVIRT_DEPENDENCIES += libssh2
 else
-LIBVIRT_CONF_OPTS += -Dssh2=disabled
+LIBVIRT_CONF_OPTS += -Dlibssh2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
