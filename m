Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B918DC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 22:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D92C60BD4;
	Fri,  3 Dec 2021 22:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5XvQqgBeVUy; Fri,  3 Dec 2021 22:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 910C560BD1;
	Fri,  3 Dec 2021 22:13:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA541BF9D1
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CFCC405B9
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAAbjwPfHxwv for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 22:13:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5608640140
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 22:13:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 608AB93505; Fri,  3 Dec 2021 22:09:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Dec 2021 22:56:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff420a3195281460322c82e9d6f6106113699531
X-Git-Newrev: 47f3f8a1c8311d32822fccab8c271001db65cf52
X-Patchwork-Hint: ignore
Message-Id: <20211203220906.608AB93505@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=47f3f8a1c8311d32822fccab8c271001db65cf52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mozilla:nss is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amozilla%3Anss

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnss/libnss.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 6504f30d31..2e26abdfc0 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -12,6 +12,8 @@ LIBNSS_INSTALL_STAGING = YES
 LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
+LIBNSS_CPE_ID_VENDOR = mozilla
+LIBNSS_CPE_ID_PRODUCT = nss
 
 LIBNSS_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
