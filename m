Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF314C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 12:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95EE060EC5;
	Mon, 21 Mar 2022 12:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WD2y5BqBGka6; Mon, 21 Mar 2022 12:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D5D60EC2;
	Mon, 21 Mar 2022 12:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DDE41BF3BB
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 12:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C2D160EC1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 12:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbKCMjEf0fO1 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 12:22:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C745B60EB6
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 12:22:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45E33847B4; Mon, 21 Mar 2022 12:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 13:20:41 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 677c47b83332134da179d548559099e63139e905
X-Git-Newrev: 58c0ead1723686a911d4718ebbe0d983ccd69173
X-Patchwork-Hint: ignore
Message-Id: <20220321121344.45E33847B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wget: add
 optional c-ares dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=58c0ead1723686a911d4718ebbe0d983ccd69173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0f2eb453321d227a9965a459c33a8fcbca4b2b4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 795c2a2ccd..8a73c33699 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -54,6 +54,13 @@ else
 WGET_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+WGET_CONF_OPTS += --with-cares
+WGET_DEPENDENCIES += c-ares
+else
+WGET_CONF_OPTS += --without-cares
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 WGET_CONF_OPTS += --disable-pcre --enable-pcre2
 WGET_DEPENDENCIES += pcre2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
