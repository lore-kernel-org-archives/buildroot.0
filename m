Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D1BC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A93561040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A93561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65A1060875;
	Tue,  3 Aug 2021 21:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id biYoLK6QFkTG; Tue,  3 Aug 2021 21:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACF7600BA;
	Tue,  3 Aug 2021 21:49:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 049871BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D70254051D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yx75uwrI9LR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2379F4025C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 755F387BB7; Tue,  3 Aug 2021 21:09:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 18:29:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d70da0be78779699a296e21532665ee149a2a3b8
X-Git-Newrev: 7fa481437e71484aa7064398e69aa63cdabb86b2
X-Patchwork-Hint: ignore
Message-Id: <20210803210938.755F387BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d{,
 -headers}: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fa481437e71484aa7064398e69aa63cdabb86b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:mesa3d:mesa is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amesa3d%3Amesa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: add to mesa3d-headers too]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 3 +++
 package/mesa3d/mesa3d.mk                 | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9c0079c3f9..d86ad929f8 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -18,6 +18,9 @@ MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
 MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
+MESA3D_HEADERS_CPE_ID_VENDOR = mesa3d
+MESA3D_HEADERS_CPE_ID_PRODUCT = mesa
+
 
 # Only installs header files
 MESA3D_HEADERS_INSTALL_STAGING = YES
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b18faeb2ce..ca44a66e54 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -10,6 +10,8 @@ MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.rst
+MESA3D_CPE_ID_VENDOR = mesa3d
+MESA3D_CPE_ID_PRODUCT = mesa
 
 MESA3D_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
