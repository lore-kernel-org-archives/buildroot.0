Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F477C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 12:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 330EC8349A;
	Mon, 21 Mar 2022 12:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kid4c5keUm06; Mon, 21 Mar 2022 12:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B20E781457;
	Mon, 21 Mar 2022 12:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF971BF3BB
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 12:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 482EB40228
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 12:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9OoXXmBL5Qr for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 12:22:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF19F40226
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 12:22:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 297FD847B4; Mon, 21 Mar 2022 12:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 13:20:19 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2fb15224712d881c952e6d485c706acb5c00f93b
X-Git-Newrev: 967bd6de557dfa2bf585f880493dc5b210b7f351
X-Patchwork-Hint: ignore
Message-Id: <20220321121344.297FD847B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wget: use
 explicit --with/without-libuuid option
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

commit: https://git.buildroot.net/buildroot/commit/?id=967bd6de557dfa2bf585f880493dc5b210b7f351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This has been like tht for ages (probably an implicit dependency check
in older versions), but now wget has explicit flags, so let's use them.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: expand commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b0fc0a811ba198288a3aef8413466d9a61d1dfd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index f30fa39917..58e04e3040 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -34,7 +34,10 @@ WGET_CONF_OPTS += --without-libidn
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+WGET_CONF_OPTS += --with-libuuid
 WGET_DEPENDENCIES += util-linux
+else
+WGET_CONF_OPTS += --without-libuuid
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
