Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB919C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 912B240A01;
	Thu, 17 Feb 2022 21:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7BESRs57rj6; Thu, 17 Feb 2022 21:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A270400D8;
	Thu, 17 Feb 2022 21:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5671BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09A3A41663
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNQphlMd57nu for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6824341662
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 52D248379E; Thu, 17 Feb 2022 21:44:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:47:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f1e32f6d7e66e37e8ea79da08c91eff590078b3
X-Git-Newrev: e3c1efd5d2e60435f4863b8c2b5a97dc21756810
X-Patchwork-Hint: ignore
Message-Id: <20220217214408.52D248379E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre: don't override PCRE_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3c1efd5d2e60435f4863b8c2b5a97dc21756810
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PCRE_CONF_OPTS is wrongly overridden in a conditional since commit
9b28d48012c33b37d33101991fa042f9fc9d76eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pcre/pcre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index c85f6717db..59750c28e7 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -18,7 +18,7 @@ HOST_PCRE_CONF_OPTS = --enable-unicode-properties
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available
-PCRE_CONF_OPTS = --disable-cpp
+PCRE_CONF_OPTS += --disable-cpp
 endif
 
 PCRE_CONF_OPTS += --enable-pcre8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
