Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA2BC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4675141963;
	Sun, 11 Sep 2022 08:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4675141963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o07lTkOVFdXa; Sun, 11 Sep 2022 08:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B33417A0;
	Sun, 11 Sep 2022 08:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B33417A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 013721BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64D1083EAF
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D1083EAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXM99jveEMnD for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 875EF83EB2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875EF83EB2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 781E183620; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 21:44:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12d16f037b5e30ce2420df54245d9a47b90aabd1
X-Git-Newrev: 169943e8d9170917e0f9f65177e1d9a497d691ee
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.781E183620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lshw: add zlib optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=169943e8d9170917e0f9f65177e1d9a497d691ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lshw/lshw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index bde23d1499..86c8f356cc 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -29,6 +29,13 @@ else
 LSHW_MAKE_OPTS += SQLITE=0
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LSHW_DEPENDENCIES += host-pkgconf zlib
+LSHW_MAKE_OPTS += ZLIB=1
+else
+LSHW_MAKE_OPTS += ZLIB=0
+endif
+
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
 		$(LSHW_MAKE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
