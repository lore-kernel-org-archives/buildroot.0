Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69163C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1143D40936;
	Wed, 15 Mar 2023 14:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1143D40936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTy0u9Xyq3GP; Wed, 15 Mar 2023 14:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA9E418E3;
	Wed, 15 Mar 2023 14:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA9E418E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0FB1BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1550060B95
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1550060B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXK7AW-mNgcK for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D64C60A91
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D64C60A91
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C8B187424; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:35:39 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 159ffa9b1b2664b6ea09ff19f2ba24a67bd1858b
X-Git-Newrev: ff274c142d00ed3ffaf7f20212d24189731d4d34
X-Patchwork-Hint: ignore
Message-Id: <20230315144315.2C8B187424@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gensio: use mdns
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff274c142d00ed3ffaf7f20212d24189731d4d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

mdns option is available since version 2.4.0 and
https://github.com/cminyard/gensio/commit/0b56fdd8205dff8f2343d1672e58b6583772f897

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 847ac3d9c8df70a7f082bd8a6046c1d987cf6eee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 89c734eec0..3374313c0f 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -9,7 +9,6 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
-GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),avahi)
 GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
@@ -21,6 +20,13 @@ else
 GENSIO_CONF_OPTS += --without-alsa
 endif
 
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
+GENSIO_DEPENDENCIES += avahi
+GENSIO_CONF_OPTS += --with-mdns
+else
+GENSIO_CONF_OPTS += --without-mdns
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
