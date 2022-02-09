Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999AEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1884D405BE;
	Wed,  9 Feb 2022 21:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BP_uGCLdIdh; Wed,  9 Feb 2022 21:42:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20AB040538;
	Wed,  9 Feb 2022 21:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E54A1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86DBC832D9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3VbLbpgjAUi for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAE2183227
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D07228323E; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:09:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baa88adcc66c8107fd8524186150bdbf09923532
X-Git-Newrev: 8d73a7adde447b730e11fea5a2938f7737f47b95
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.D07228323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libconfig: drop python2
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d73a7adde447b730e11fea5a2938f7737f47b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-libconfig/python-libconfig.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/python-libconfig/python-libconfig.mk b/package/python-libconfig/python-libconfig.mk
index 2db7e99cf3..c7d87f408a 100644
--- a/package/python-libconfig/python-libconfig.mk
+++ b/package/python-libconfig/python-libconfig.mk
@@ -14,14 +14,8 @@ PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
 
 PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-PYTHON_LIBCONFIG_PYVER = $(PYTHON_VERSION_MAJOR)
-else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-PYTHON_LIBCONFIG_PYVER = $(PYTHON3_VERSION_MAJOR)
-endif
-
 define PYTHON_LIBCONFIG_FIX_SETUP
-	$(SED) 's/boost_python/boost_python$(subst .,,$(PYTHON_LIBCONFIG_PYVER))/g' \
+	$(SED) 's/boost_python/boost_python$(subst .,,$(PYTHON3_VERSION_MAJOR))/g' \
 		$(@D)/setup.py
 endef
 PYTHON_LIBCONFIG_POST_PATCH_HOOKS += PYTHON_LIBCONFIG_FIX_SETUP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
