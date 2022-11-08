Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6187DC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB19A41725;
	Tue,  8 Nov 2022 19:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB19A41725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EA2AUN7EL26o; Tue,  8 Nov 2022 19:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B522B416D1;
	Tue,  8 Nov 2022 19:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B522B416D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 006CB1BF957
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD52D81E64
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD52D81E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKZklAvp-X5P for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:58:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F9781A3B
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F9781A3B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07374802C7; Tue,  8 Nov 2022 19:58:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:54:29 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: eaab840e13275dc995f64d0e3bce275afd7b10d8
X-Git-Newrev: e1501acca4409b2dda044d06c08f080ee15ec15c
X-Patchwork-Hint: ignore
Message-Id: <20221108195810.07374802C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lz4: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1501acca4409b2dda044d06c08f080ee15ec15c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
