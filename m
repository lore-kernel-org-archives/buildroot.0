Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB174C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B27660FAD;
	Wed,  9 Mar 2022 20:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FR0sZPBdO89t; Wed,  9 Mar 2022 20:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A31260F9E;
	Wed,  9 Mar 2022 20:48:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCAEE1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB11A60F9E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kH_nUQatnj9K for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B54060F18
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D366A839C4; Wed,  9 Mar 2022 20:39:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 21:47:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9051a6322187129ba65249b5ee2228e045a4fa8c
X-Git-Newrev: 66d348ae18c6e73d6ff9d935a241e55a65948be6
X-Patchwork-Hint: ignore
Message-Id: <20220309203930.D366A839C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: drop autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=66d348ae18c6e73d6ff9d935a241e55a65948be6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OLA_AUTORECONF has been set since re-introduction of package in commit
16ff948444c3978d63f483344a3d92d994c64312 but it is not needed as no
patches are touching Makefile.am or ola.m4 anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ola/ola.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 5090076175..1874350784 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -9,7 +9,6 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
 OLA_INSTALL_STAGING = YES
-OLA_AUTORECONF = YES
 
 # util-linux provides uuid lib
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
