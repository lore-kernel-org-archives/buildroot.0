Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA99C0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 638AD60BF0;
	Sat, 27 Aug 2022 07:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 638AD60BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abqfZMMsmxpW; Sat, 27 Aug 2022 07:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04BEF60BB8;
	Sat, 27 Aug 2022 07:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04BEF60BB8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0318A1BF962
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD86960BF0
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD86960BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id El9mGakGpALe for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5955C60BB8
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5955C60BB8
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 34343879AC; Sat, 27 Aug 2022 07:36:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:50:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f5b43ba02db6d7c8feffc7ef7cebaa1fc9542c8
X-Git-Newrev: e47c4fbcde541e50f79b572170ee4870058d76c4
X-Patchwork-Hint: ignore
Message-Id: <20220827073608.34343879AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zerofree: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=e47c4fbcde541e50f79b572170ee4870058d76c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo: ZEROFREE_LICENSE_FILE -> ZEROFREE_LICENSE_FILES
added by commit 98ecdd1d1125f2529a8d61c01a2bec6d8dbc48d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zerofree/zerofree.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zerofree/zerofree.mk b/package/zerofree/zerofree.mk
index f26280cc2a..3a9c16ee78 100644
--- a/package/zerofree/zerofree.mk
+++ b/package/zerofree/zerofree.mk
@@ -8,7 +8,7 @@ ZEROFREE_VERSION = 1.1.1
 ZEROFREE_SOURCE = zerofree-$(ZEROFREE_VERSION).tgz
 ZEROFREE_SITE = https://frippery.org/uml
 ZEROFREE_LICENSE = GPL-2.0
-ZEROFREE_LICENSE_FILE = COPYING
+ZEROFREE_LICENSE_FILES = COPYING
 ZEROFREE_DEPENDENCIES = e2fsprogs
 
 # We use the same workaround as in https://bugs.gentoo.org/716136
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
