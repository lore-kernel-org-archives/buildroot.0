Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEEBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CCFF405B3;
	Wed,  9 Feb 2022 21:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IqOSIteqjDn; Wed,  9 Feb 2022 21:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CDC940567;
	Wed,  9 Feb 2022 21:38:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5DB1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0AA38318C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vry5Xfl72ZpG for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 269DB83123
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2D0378323C; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae86cd8dba6579443559a03058bf02e08a8fae38
X-Git-Newrev: a642bb925de97fb0afcbba0bee31bcb73d997c20
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.2D0378323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoc: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=a642bb925de97fb0afcbba0bee31bcb73d997c20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsoc/libsoc.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index bbc33143cc..95753b8b68 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -12,12 +12,8 @@ LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
 LIBSOC_DEPENDENCIES = host-pkgconf
 
-# Install Python 2 bindings
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-LIBSOC_DEPENDENCIES += python
-LIBSOC_CONF_OPTS += --enable-python=2
 # Install Python 3 bindings
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBSOC_DEPENDENCIES += python3
 LIBSOC_CONF_OPTS += --enable-python=3
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
