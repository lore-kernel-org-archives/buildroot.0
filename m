Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3BFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A980827DE;
	Thu, 10 Feb 2022 20:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxxRJv2kPwMn; Thu, 10 Feb 2022 20:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C52826DE;
	Thu, 10 Feb 2022 20:45:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9AFB1C113E
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B2BC40354
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QClHqk1mMgR4 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8F1440129
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8158582DBD; Thu, 10 Feb 2022 20:37:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 21:44:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c8ae13e7ce84d76e7ed06d05322a49b26bd3c7f
X-Git-Newrev: 0309124a499b37c3fb253386ad88eca19fa065ef
X-Patchwork-Hint: ignore
Message-Id: <20220210203748.8158582DBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigrok: drop host-python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0309124a499b37c3fb253386ad88eca19fa065ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python2 is gone, so always use host-python3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsigrok/libsigrok.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 2a26518614..639ee4dc25 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -60,7 +60,7 @@ LIBSIGROK_CONF_OPTS += --enable-cxx
 LIBSIGROK_DEPENDENCIES += \
 	glibmm \
 	host-doxygen \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+	host-python3
 else
 LIBSIGROK_CONF_OPTS += --disable-cxx
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
