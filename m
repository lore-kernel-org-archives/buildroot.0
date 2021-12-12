Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E3FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0DAF4063A;
	Sun, 12 Dec 2021 17:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9G3g0-Ehwnt; Sun, 12 Dec 2021 17:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0432D4063D;
	Sun, 12 Dec 2021 17:41:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1A11BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD37C4222B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQ9t2vTlDZSe for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75BFD421BF
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 47F9983655; Sun, 12 Dec 2021 17:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:30:14 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 401fceef78ee8933a33b4c92b41abfc663270fd1
X-Git-Newrev: 816abf861c08b0ba884bcfbfab82d348f7fbe348
X-Patchwork-Hint: ignore
Message-Id: <20211212173024.47F9983655@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libhtp: add
 LIBHTP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=816abf861c08b0ba884bcfbfab82d348f7fbe348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:oisf:libhtp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoisf%3Alibhtp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 44048a09c82ca4e188b685252a97f06227fea8cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhtp/libhtp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 382750ea79..532eaa340b 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -8,6 +8,7 @@ LIBHTP_VERSION = 0.5.39
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
+LIBHTP_CPE_ID_VENDOR = oisf
 LIBHTP_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
