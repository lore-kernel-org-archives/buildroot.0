Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67599C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6CB060F25
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6CB060F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AA74400A4;
	Tue, 14 Sep 2021 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkNb5V75NVsS; Tue, 14 Sep 2021 19:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE4F34010F;
	Tue, 14 Sep 2021 19:52:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08BDA1BF228
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECA9780E2C
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAOS13PbR1hx for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 19:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4394880E2A
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 19:52:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A28BB8B3AA; Tue, 14 Sep 2021 19:50:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 21:47:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3af9c55de08bf0650ed10c1e1ac7b37fd15f6ef6
X-Git-Newrev: a2b0c9b5f98090d85a2cdf0362f2862f0251805d
X-Patchwork-Hint: ignore
Message-Id: <20210914195042.A28BB8B3AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xeyes: xrender is
 optional, not mandatory
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2b0c9b5f98090d85a2cdf0362f2862f0251805d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xrender is optional, not mandatory since its addition in version 1.0.99:
https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/5e825a140f4022b88dd7a1a20a9a01b653f1a95c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xeyes/Config.in     | 1 -
 package/x11r7/xapp_xeyes/xapp_xeyes.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
index 5cf7f6c052..a7b77375fd 100644
--- a/package/x11r7/xapp_xeyes/Config.in
+++ b/package/x11r7/xapp_xeyes/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_XAPP_XEYES
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  X.Org xeyes application
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 11eea802d5..a127e28ea7 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -9,6 +9,13 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
-XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXrender xlib_libXt
+XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+XAPP_XEYES_DEPENDENCIES += xlib_libXrender
+XAPP_XEYES_CONF_OPTS += --with-xrender
+else
+XAPP_XEYES_CONF_OPTS += --without-xrender
+endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
