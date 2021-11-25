Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0EBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D943660737;
	Thu, 25 Nov 2021 19:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tFUU0sWcbHB; Thu, 25 Nov 2021 19:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27EB26072E;
	Thu, 25 Nov 2021 19:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06A0C1BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA8CE40305
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgAgU8SD1FD5 for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08085403CB
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D29A98F53B; Thu, 25 Nov 2021 19:49:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 20:52:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d2ea316516fc8b4435a13070f93d1ada87264e0
X-Git-Newrev: 00b28cac7ad7c9011cc17aae06aebd67a0993c03
X-Patchwork-Hint: ignore
Message-Id: <20211125194954.D29A98F53B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/automake: rename GTK_DOC_M4_INSTALL
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

commit: https://git.buildroot.net/buildroot/commit/?id=00b28cac7ad7c9011cc17aae06aebd67a0993c03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/automake/automake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 5270e7864d..fd7933dd74 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -15,7 +15,7 @@ HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
 ACLOCAL_HOST_DIR = $(HOST_DIR)/share/aclocal
 
-define GTK_DOC_M4_INSTALL
+define HOST_AUTOMAKE_GTK_DOC_M4_INSTALL
 	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
 		$(ACLOCAL_HOST_DIR)/gtk-doc.m4
 endef
@@ -25,7 +25,7 @@ define HOST_AUTOMAKE_MAKE_ACLOCAL
 	mkdir -p $(ACLOCAL_DIR)
 endef
 
-HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
+HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_GTK_DOC_M4_INSTALL
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
