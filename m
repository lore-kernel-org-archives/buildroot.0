Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7414EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91DC841518;
	Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91DC841518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5WAf8gEbjrn; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B16D8414FD;
	Mon, 11 Sep 2023 19:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B16D8414FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA8531BF479
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2424400FE
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2424400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbDOFPL-ZRBe for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCEA14031C
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCEA14031C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAF5986C8C; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:20:19 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: abbc941e6fe17e3a566f215ef7acbfac7fef21bb
X-Git-Newrev: a4dc365b9ab68491a3bca54a0066dbbfb904fffc
X-Patchwork-Hint: ignore
Message-Id: <20230911190748.DAF5986C8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/yajl: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4dc365b9ab68491a3bca54a0066dbbfb904fffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

yajl_project:yajl is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/CD8C46A4-151E-4DC3-BCE8-4C322E9E10DB?namingFormat=2.3&orderBy=CPEURI&keyword=yajl&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 35d97842a234b429531be8164028497d59446ca8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/yajl/yajl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index d14a68b402..cd23c8728d 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -9,5 +9,6 @@ YAJL_SITE = $(call github,lloyd,yajl,refs/tags/$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
+YAJL_CPE_ID_VENDOR = yajl_project
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
