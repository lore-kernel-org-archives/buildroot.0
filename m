Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7671EC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186D1416D2;
	Tue,  8 Nov 2022 19:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186D1416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOJ5CvjkvRXa; Tue,  8 Nov 2022 19:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC65416D1;
	Tue,  8 Nov 2022 19:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC65416D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E244B1BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA6D260E31
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA6D260E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FfgVBug5U_l for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:56:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E754D60E2C
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E754D60E2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D593880035; Tue,  8 Nov 2022 19:56:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:53:21 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 4e747cf8a48926be321396d7bde98f6b6d7cb234
X-Git-Newrev: 2b61eaee9bbad9a9efda4e968ef43037d57083cb
X-Patchwork-Hint: ignore
Message-Id: <20221108195658.D593880035@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/lz4: fix
 LZ4_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b61eaee9bbad9a9efda4e968ef43037d57083cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

cpe:2.3:a:yann_collet:lz4, which was added by commit
63332c33aa0771532807fd2684d4eee4eb952435, was never a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ayann_collet%3Alz4

cpe:2.3:a:lz4_project:lz4 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alz4_project%3Alz4

While at it, also drop the note added by commit
45db4bb08e3e550db483d8745fe8aaede2fa7e98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ae29bb28808dbafd39d39e850820b3f063329f66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lz4/lz4.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 9b9b6198c3..541a03473a 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -9,13 +9,7 @@ LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
-LZ4_CPE_ID_VENDOR = yann_collet
-
-# CVE-2014-4715 is misclassified (by our CVE tracker) as affecting version
-# 1.9.2, while in fact this issue has been fixed since lz4-r130:
-# https://github.com/lz4/lz4/commit/140e6e72ddb6fc5f7cd28ce0c8ec3812ef4a9c08
-# See https://github.com/lz4/lz4/issues/818
-LZ4_IGNORE_CVES += CVE-2014-4715
+LZ4_CPE_ID_VENDOR = lz4_project
 
 # 0001-Fix-potential-memory-corruption-with-negative-memmov.patch
 LZ4_IGNORE_CVES += CVE-2021-3520
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
