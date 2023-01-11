Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D10C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95066404F7;
	Wed, 11 Jan 2023 09:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95066404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLUEVrLHBGCp; Wed, 11 Jan 2023 09:30:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91FE14028F;
	Wed, 11 Jan 2023 09:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91FE14028F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 221401BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9BE760B05
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9BE760B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IX3-p3SXR6Tf for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E5EA60B93
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E5EA60B93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F088F87815; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:18:08 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 63758bfed67325590c6c5a58e2f36748eacb83c1
X-Git-Newrev: 8ec1504f59847d66c0db6b574c8a63ab69cba933
X-Patchwork-Hint: ignore
Message-Id: <20230111092533.F088F87815@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/glib-networking:
 drop dangling GLIB_NETWORKING_INSTALL_TARGET_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ec1504f59847d66c0db6b574c8a63ab69cba933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

In 2015, commit "3fe434bf35 glib-networking: specify GIO_MODULE_DIR for
target" correctly used <pkg>_INSTALL_TARGET_OPTS with an autotools
package.

But later on, in 2018, commit "928a72c49f package/glib-networking: bump
version to 2.56.1" changed the package to use the meson infra, that does
not support <pkg>_INSTALL_TARGET_OPTS.

So this symbol is bogus since 2018. Drop it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c4f2459e8a94c1f30c0fcbeb3cd72b62b5ee3e64)
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
