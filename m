Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E062C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:52:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75F061107
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D75F061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8853C403A5;
	Tue, 14 Sep 2021 19:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5x78PSNML_L; Tue, 14 Sep 2021 19:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECECC403B0;
	Tue, 14 Sep 2021 19:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219EA1BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 116D3403B0
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWfGaJMyfWHm for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 19:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD17403A5
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 19:52:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id ACC748B3AB; Tue, 14 Sep 2021 19:50:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 21:51:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2b0c9b5f98090d85a2cdf0362f2862f0251805d
X-Git-Newrev: 2c5e13de7c2ca181f60a06799ae5e52d1d4eda20
X-Patchwork-Hint: ignore
Message-Id: <20210914195042.ACC748B3AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xeyes: add xlib_libXi
 mandatory dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c5e13de7c2ca181f60a06799ae5e52d1d4eda20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails since commit c47ebe7aeb70015614ff1d477dc1a71e8c161425
because xlib_libXi is a mandatory dependency since version 1.2.0 and
https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/420c2d8517246c9e422739cadb7acb29e35a3bed:

configure: error: Package requirements (xi >= 1.7 x11 xt xext xmu xproto >= 7.0.17) were not met:

Package 'xi', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/896f45fb9eadcd235aeab096db479ee0aa5d0860

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: split multi-line dependency]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xeyes/Config.in     | 1 +
 package/x11r7/xapp_xeyes/xapp_xeyes.mk | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
index a7b77375fd..268bc5807e 100644
--- a/package/x11r7/xapp_xeyes/Config.in
+++ b/package/x11r7/xapp_xeyes/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XAPP_XEYES
 	bool "xeyes"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index a127e28ea7..3f37aaee8c 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -9,7 +9,12 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
-XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
+XAPP_XEYES_DEPENDENCIES = \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXi \
+	xlib_libXmu \
+	xlib_libXt
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
 XAPP_XEYES_DEPENDENCIES += xlib_libXrender
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
