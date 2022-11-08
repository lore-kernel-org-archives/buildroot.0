Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2C4C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2880981E7B;
	Tue,  8 Nov 2022 19:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2880981E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6k9LunwOaFR; Tue,  8 Nov 2022 19:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 321E281E80;
	Tue,  8 Nov 2022 19:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 321E281E80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F03B91BF957
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB2E84046D
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2E84046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5boCmt5YRMq7 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:40:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD05840236
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD05840236
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C857788243; Tue,  8 Nov 2022 19:40:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:39:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3b4d49a55b5d0260f49fa4aa4b84bd7df5e757b1
X-Git-Newrev: db93b802bcaa1ce1349129b177687d40735866a7
X-Patchwork-Hint: ignore
Message-Id: <20221108194025.C857788243@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/shapelib: add
 SHAPELIB_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=db93b802bcaa1ce1349129b177687d40735866a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:osgeo:shapelib is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aosgeo%3Ashapelib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1545a88f9d5a694eed1a01dc0220ec1dabf5cabe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shapelib/shapelib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index bedd15dc35..52f9584e19 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -8,6 +8,7 @@ SHAPELIB_VERSION = 1.5.0
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = web/license.html COPYING
+SHAPELIB_CPE_ID_VENDOR = osgeo
 SHAPELIB_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
