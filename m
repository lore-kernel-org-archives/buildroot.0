Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D695C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E121C41E17;
	Thu, 17 Feb 2022 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYzLub4L37IH; Thu, 17 Feb 2022 21:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8DA24026A;
	Thu, 17 Feb 2022 21:52:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 732041BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C167400C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5X_sWWSnCo1 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8289E400D8
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 709A3837B9; Thu, 17 Feb 2022 21:44:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:47:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f96c4be57d1edb2c89d542e9d1d894c5a20b7c2
X-Git-Newrev: becc4814601336f1df72e0e0306b11529bb91246
X-Patchwork-Hint: ignore
Message-Id: <20220217214408.709A3837B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socketcand: don't override
 SOCKETCAND_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=becc4814601336f1df72e0e0306b11529bb91246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SOCKETCAND_CONF_OPTS is wrongly overridden in a conditional since commit
53e498da2f2ebfc87c3de0fe18bc9132e94b4fcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/socketcand/socketcand.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index dbf859d3f9..1755d3ae56 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -13,7 +13,7 @@ SOCKETCAND_LICENSE_FILES = socketcand.c
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES += libconfig
 else
-SOCKETCAND_CONF_OPTS = --without-config
+SOCKETCAND_CONF_OPTS += --without-config
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
