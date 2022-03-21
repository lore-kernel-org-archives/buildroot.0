Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D011BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 12:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E14E408DE;
	Mon, 21 Mar 2022 12:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vxUiL1WXj9F; Mon, 21 Mar 2022 12:22:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5996040447;
	Mon, 21 Mar 2022 12:22:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7398B1BF9AA
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 12:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6252381457
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 12:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfIrEPgT5Aeu for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 12:22:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA938143B
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 12:22:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 37EDC847B5; Mon, 21 Mar 2022 12:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 13:20:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 967bd6de557dfa2bf585f880493dc5b210b7f351
X-Git-Newrev: 677c47b83332134da179d548559099e63139e905
X-Patchwork-Hint: ignore
Message-Id: <20220321121344.37EDC847B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wget: add
 optional libpsl dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=677c47b83332134da179d548559099e63139e905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0554aa59d7a27193f5b39f96ae0dbe6987723c1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 58e04e3040..795c2a2ccd 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,6 +12,13 @@ WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 WGET_CPE_ID_VENDOR = gnu
 
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+WGET_CONF_OPTS += --with-libpsl
+WGET_DEPENDENCIES += libpsl
+else
+WGET_CONF_OPTS += --without-libpsl
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WGET_CONF_OPTS += --with-ssl=gnutls
 WGET_DEPENDENCIES += gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
