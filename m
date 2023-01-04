Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9FBC53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECCFD82054;
	Wed,  4 Jan 2023 22:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECCFD82054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4KlLTqkyPfl; Wed,  4 Jan 2023 22:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3451B82052;
	Wed,  4 Jan 2023 22:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3451B82052
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 940E11BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B6A2418EF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6A2418EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxwcqbp_fMIJ for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86F83418EC
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F83418EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F149875AC; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:54:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbb6a55e6e03ea0b4e0a9b744f289e11da963c62
X-Git-Newrev: c4f2459e8a94c1f30c0fcbeb3cd72b62b5ee3e64
X-Patchwork-Hint: ignore
Message-Id: <20230104220538.6F149875AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glib-networking: drop dangling
 GLIB_NETWORKING_INSTALL_TARGET_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4f2459e8a94c1f30c0fcbeb3cd72b62b5ee3e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 2015, commit "3fe434bf35 glib-networking: specify GIO_MODULE_DIR for
target" correctly used <pkg>_INSTALL_TARGET_OPTS with an autotools
package.

But later on, in 2018, commit "928a72c49f package/glib-networking: bump
version to 2.56.1" changed the package to use the meson infra, that does
not support <pkg>_INSTALL_TARGET_OPTS.

So this symbol is bogus since 2018. Drop it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glib-networking/glib-networking.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index e8905dfff4..4adc13d39f 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -21,8 +21,6 @@ GLIB_NETWORKING_CONF_OPTS = \
 GLIB_NETWORKING_LICENSE = LGPL-2.0+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
 GLIB_NETWORKING_CPE_ID_VENDOR = gnome
-GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
-	GIO_MODULE_DIR=/usr/lib/gio/modules install
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 GLIB_NETWORKING_DEPENDENCIES += gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
