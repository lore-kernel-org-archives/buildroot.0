Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3BCC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C871610CE
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C871610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7238415E2;
	Sun,  1 Aug 2021 12:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0__66icMK5n; Sun,  1 Aug 2021 12:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 281B8415D5;
	Sun,  1 Aug 2021 12:08:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BECF1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A75A83C8E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9H0EZDyjuZL for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B8A83C80
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 813BF8076D; Sun,  1 Aug 2021 12:07:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 14:05:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4f4b3b6fe0d6914b0d2b8aab99c515761cff96c
X-Git-Newrev: f2fea137f587761941ad5251c1ee09202bece25a
X-Patchwork-Hint: ignore
Message-Id: <20210801120745.813BF8076D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeimage: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2fea137f587761941ad5251c1ee09202bece25a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:freeimage_project:freeimage is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreeimage_project%3Afreeimage

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libfreeimage/libfreeimage.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index b254fa8846..91299084a1 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -9,6 +9,8 @@ LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
 LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
 LIBFREEIMAGE_LICENSE = GPL-2.0 or GPL-3.0 or FreeImage Public License
 LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
+LIBFREEIMAGE_CPE_ID_VENDOR = freeimage_project
+LIBFREEIMAGE_CPE_ID_PRODUCT = freeimage
 LIBFREEIMAGE_INSTALL_STAGING = YES
 
 define LIBFREEIMAGE_EXTRACT_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
