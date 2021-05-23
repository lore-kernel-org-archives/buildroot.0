Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E184C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:30:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C8860F46
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3C8860F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6AFF6061C;
	Tue,  3 Aug 2021 21:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFVo5-lA-VXR; Tue,  3 Aug 2021 21:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF1D605C8;
	Tue,  3 Aug 2021 21:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D69D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E06944044B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9wPa5xFsCSu for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34BB240275
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7E9D385F62; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 May 2021 14:13:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 77d1a1be546aac3773e390b2a15647114567da1f
X-Git-Newrev: 648ff342db3bac164e098673ded1a82bb843f91a
X-Patchwork-Hint: ignore
Message-Id: <20210803210944.7E9D385F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hwloc: add optional
 dependencies to udev, libxml2, ncurses & numactl
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

commit: https://git.buildroot.net/buildroot/commit/?id=648ff342db3bac164e098673ded1a82bb843f91a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

udev:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L626

libxml2:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L1273

ncurses:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L340

numactl:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L419

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: drop unconditional --disable-libxml2]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/hwloc/hwloc.mk | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 77a25a1775..2a5a82cea4 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -24,9 +24,15 @@ HWLOC_CONF_OPTS = \
 	--disable-nvml \
 	--disable-gl \
 	--disable-cairo \
-	--disable-libxml2 \
 	--disable-doxygen
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+HWLOC_CONF_OPTS += --enable-libudev
+HWLOC_DEPENDENCIES += udev
+else
+HWLOC_CONF_OPTS += --disable-libudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
 HWLOC_CONF_OPTS += --enable-pci
 HWLOC_DEPENDENCIES += libpciaccess
@@ -34,4 +40,19 @@ else
 HWLOC_CONF_OPTS += --disable-pci
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+HWLOC_CONF_OPTS += --enable-libxml2
+HWLOC_DEPENDENCIES += libxml2
+else
+HWLOC_CONF_OPTS += --disable-libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+HWLOC_DEPENDENCIES += ncurses
+endif
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+HWLOC_DEPENDENCIES += numactl
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
