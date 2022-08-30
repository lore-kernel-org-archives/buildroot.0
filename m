Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC819ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 21:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E2C41802;
	Tue, 30 Aug 2022 21:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E2C41802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOn0I2R6aENt; Tue, 30 Aug 2022 21:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F342C417EF;
	Tue, 30 Aug 2022 21:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F342C417EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29CCD1BF388
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121A16102C
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121A16102C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tz2_1g4pvBoj for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 21:31:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5980761026
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 21:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5980761026
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1845A881CF; Tue, 30 Aug 2022 21:16:05 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 23:24:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d16db6d8a405c8410f4e892a3993686a3269bdc2
X-Git-Newrev: 7a94fa901293bda6e0e87eff5dcb677b856c70b4
X-Patchwork-Hint: ignore
Message-Id: <20220830211605.1845A881CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzlib: fix CPE vendor id
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a94fa901293bda6e0e87eff5dcb677b856c70b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnu vendor is not found for zlib in CPE database [1].
zlib is the correct vendor [2].

[1] https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:zlib
[2] https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:zlib:zlib

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libzlib/libzlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index 933732d6ba..431c48739a 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -11,7 +11,7 @@ LIBZLIB_LICENSE = Zlib
 LIBZLIB_LICENSE_FILES = README
 LIBZLIB_INSTALL_STAGING = YES
 LIBZLIB_PROVIDES = zlib
-LIBZLIB_CPE_ID_VENDOR = gnu
+LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
 # It is not possible to build only a shared version of zlib, so we build both
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
