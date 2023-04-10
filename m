Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C44C77B6F
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D32B6FEFE;
	Mon, 10 Apr 2023 19:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D32B6FEFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkTugbm0vRLy; Mon, 10 Apr 2023 19:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54CC26FEFB;
	Mon, 10 Apr 2023 19:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54CC26FEFB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11E991C3BA6
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49719613FC
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49719613FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChG72B2vZe6K for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2893561400
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2893561400
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26D9983DBC; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:23:28 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 61acdc604784cabc32130f8a48edb2aa187b9c6e
X-Git-Newrev: 5380a3f3ae8dc6f48c9a0bf4a58729377f0bb8c2
X-Patchwork-Hint: ignore
Message-Id: <20230410193723.26D9983DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] docs/manual: ditch
 redundant -f 'rm' flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=5380a3f3ae8dc6f48c9a0bf4a58729377f0bb8c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The value of the RM variable in make is 'rm -f' [0], thus the additional
-f is redundant. Avoid it on the docs to avoid developers taking it as a
good example to follow.

[0] https://www.gnu.org/software/make/manual/make.html#index-RM

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a3d4e38183e7c7ade63588519796005f43efe78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/writing-rules.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 758965d80a..13b7fd5bea 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -78,7 +78,7 @@ Do not align the +=+ signs.
 +
 ---------------------
 define LIBFOO_REMOVE_DOC
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/doc \
 		$(TARGET_DIR)/usr/share/man/man3/libfoo*
 endef
 ---------------------
@@ -118,7 +118,7 @@ YES:
 ---------------------
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
 define LIBFOO_REMOVE_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
 endef
 LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
 endif
@@ -128,7 +128,7 @@ NO:
 +
 ---------------------
 define LIBFOO_REMOVE_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
 endef
 
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
