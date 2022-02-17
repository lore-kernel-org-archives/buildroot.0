Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91160C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2924A83F6D;
	Thu, 17 Feb 2022 20:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87PynMnHUNkf; Thu, 17 Feb 2022 20:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE4F83F67;
	Thu, 17 Feb 2022 20:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B6E81BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E079415A7
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95XN3rff-CYP for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D5F9415BF
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id ABD588379E; Thu, 17 Feb 2022 20:21:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:29:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 862db5f610eb847fa859e247755db9d7dcbc0d23
X-Git-Newrev: 83f9f0b881fa401b67f2523faa4d68d20ca7cc17
X-Patchwork-Hint: ignore
Message-Id: <20220217202156.ABD588379E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgsasl: don't override
 LIBGSASL_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=83f9f0b881fa401b67f2523faa4d68d20ca7cc17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBGSASL_CONF_OPTS is wrongly overridden in a conditional since commit
c4ff6bf2272df54e8d4594a19fb76fe33e980da2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgsasl/libgsasl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index e813a354a1..b1981dea3b 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -11,10 +11,10 @@ LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-LIBGSASL_CONF_OPTS = --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBGSASL_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
 LIBGSASL_DEPENDENCIES += libgcrypt
 else
-LIBGSASL_CONF_OPTS = --without-libgcrypt
+LIBGSASL_CONF_OPTS += --without-libgcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIDN),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
