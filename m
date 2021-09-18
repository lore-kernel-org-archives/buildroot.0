Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBCFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:27:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1132760F12
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1132760F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B1984201;
	Sat, 18 Sep 2021 15:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O40gO2Sh73GR; Sat, 18 Sep 2021 15:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163DF841FA;
	Sat, 18 Sep 2021 15:27:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 552DC1BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50E62606B6
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feA8ulQCreT1 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:27:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F29F60662
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:27:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2DFB588271; Sat, 18 Sep 2021 15:25:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 17:27:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a48be36d5b188e0cd0f670875acfeb1a724e4d4
X-Git-Newrev: 7eedc9cc1e0c3cce1c18cb150157cb2346075b23
X-Patchwork-Hint: ignore
Message-Id: <20210918152554.2DFB588271@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump version to
 1.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=7eedc9cc1e0c3cce1c18cb150157cb2346075b23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- convert to meson (as no configure script is provided, alternative
  would be to enable autoreconf)
- disable tests

For details (since 1.21) see [1], [2].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041972.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index fd6b9925eb..b76bafb437 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-April/041815.html
-md5  8196416baac07cd833bcb86b69da41a7  wayland-protocols-1.21.tar.xz
-sha1  6e0e2a05edb43d32e3b2e3f681ef266a287a186e  wayland-protocols-1.21.tar.xz
-sha256  b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5  wayland-protocols-1.21.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
+md5  31a6c469718db37d2688109e548506e4  wayland-protocols-1.23.tar.xz
+sha1  8c4ebdce35953b1e2af458c139a432a308af6f50  wayland-protocols-1.23.tar.xz
+sha256  6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76  wayland-protocols-1.23.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 3d7a0e472d..41ab1e1c99 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.21
+WAYLAND_PROTOCOLS_VERSION = 1.23
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
@@ -12,4 +12,6 @@ WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
 WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
 WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
 
-$(eval $(autotools-package))
+WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
