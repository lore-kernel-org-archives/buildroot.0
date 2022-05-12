Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A708C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F9D826AA;
	Thu, 12 May 2022 20:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Szgmsjn7jnt; Thu, 12 May 2022 20:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7E98258A;
	Thu, 12 May 2022 20:17:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7F41BF398
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C5A1607D0
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXdPveZlR7_4 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:16:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81BF0605AC
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:16:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B940285D5D; Thu, 12 May 2022 20:06:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:15:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07408779cc068041a2da6838fe077d1a679f1736
X-Git-Newrev: fb5aad3024a1f592867068ff22962cf3d576ff19
X-Patchwork-Hint: ignore
Message-Id: <20220512200605.B940285D5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: clean up DEPENDENCIES
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb5aad3024a1f592867068ff22962cf3d576ff19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

One per line, and alphabetical (was already the case for host).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: all host dependencies first]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 6dcaf34aa4..708d5ac411 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,10 +7,21 @@
 NODEJS_VERSION = 16.15.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs c-ares \
-	libuv zlib nghttp2 \
+NODEJS_DEPENDENCIES = \
+	host-nodejs \
+	host-pkgconf \
+	host-python3 \
+	host-qemu \
+	c-ares \
+	libuv \
+	nghttp2 \
+	zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-pkgconf host-python3 \
+HOST_NODEJS_DEPENDENCIES = \
+	host-icu \
+	host-libopenssl \
+	host-pkgconf \
+	host-python3 \
 	host-zlib
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
