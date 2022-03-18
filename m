Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D94C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D04D860D69;
	Fri, 18 Mar 2022 21:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3UA30PgjRHj; Fri, 18 Mar 2022 21:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098D760BD7;
	Fri, 18 Mar 2022 21:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95ABC1C1148
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E4C34012E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zuiQqzmfHlKn for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:31:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B275D40131
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:31:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 08CCC844BE; Fri, 18 Mar 2022 21:22:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 22:30:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0554aa59d7a27193f5b39f96ae0dbe6987723c1d
X-Git-Newrev: 0f2eb453321d227a9965a459c33a8fcbca4b2b4f
X-Patchwork-Hint: ignore
Message-Id: <20220318212253.08CCC844BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget: add optional c-ares
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f2eb453321d227a9965a459c33a8fcbca4b2b4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
