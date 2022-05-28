Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49D5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CC94264B;
	Sat, 28 May 2022 11:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0mVxcJgf6xF; Sat, 28 May 2022 11:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19C064262A;
	Sat, 28 May 2022 11:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53AF91BF37A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D00E849C3
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nm5H_KG10OSG for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B130F847B0
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4934A85EB2; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:41:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8ce01bc88057fc14349cd5d461d2e2b7268bfc4c
X-Git-Newrev: 09c422606a6d1405da660c2206a606abf9ecb5aa
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.4934A85EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nodejs: clean up
 DEPENDENCIES
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

commit: https://git.buildroot.net/buildroot/commit/?id=09c422606a6d1405da660c2206a606abf9ecb5aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

One per line, and alphabetical (was already the case for host).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: all host dependencies first]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fb5aad3024a1f592867068ff22962cf3d576ff19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 4fe34e0aad..5d8eb4af63 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,10 +7,21 @@
 NODEJS_VERSION = 14.18.3
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
