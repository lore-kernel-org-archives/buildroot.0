Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC8DC6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:31:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE88B6121E
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE88B6121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F970608D4;
	Wed, 21 Jul 2021 21:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkE0xLPw9rao; Wed, 21 Jul 2021 21:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B34608C4;
	Wed, 21 Jul 2021 21:31:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6CFE1C1187
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3A5A82B61
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0lajpbQtv8rg for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:31:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F1A82B51
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:31:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BAD17887A4; Wed, 21 Jul 2021 20:56:57 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 23:31:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc3dc2b44ba1d80ed93f43a8d43c3d80ff548077
X-Git-Newrev: 99278e520826002dfdae61ec2d649846f43a9f36
X-Patchwork-Hint: ignore
Message-Id: <20210721205657.BAD17887A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgudev: add
 gobject-introspection optional dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=99278e520826002dfdae61ec2d649846f43a9f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gobject-introspection is an optional dependency (which is enabled by
default) since at least version 219 and
https://gitlab.gnome.org/GNOME/libgudev/-/commit/43a593b5b4097b887e49eaacafbc1337bd709718

Fixes:
 - http://autobuild.buildroot.org/results/3bedc9fa3b14939825fb9cdebc6977057c3f6118

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgudev/libgudev.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index 63d592f9ac..9aa64c2c22 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -13,4 +13,11 @@ LIBGUDEV_LICENSE = LGPL-2.1+
 LIBGUDEV_LICENSE_FILES = COPYING
 LIBGUDEV_CONF_OPTS = --disable-umockdev
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGUDEV_CONF_OPTS += --enable-introspection
+LIBGUDEV_DEPENDENCIES += gobject-introspection
+else
+LIBGUDEV_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
