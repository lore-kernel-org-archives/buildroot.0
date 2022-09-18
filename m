Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A5C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 07:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139E241B77;
	Sun, 18 Sep 2022 07:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139E241B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdlvrQ1vVE5H; Sun, 18 Sep 2022 07:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6E941A3F;
	Sun, 18 Sep 2022 07:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6E941A3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13AC71BF3BD
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D9060A7B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D9060A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jm6z1_Wot3kp for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 07:45:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 026A5607CA
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026A5607CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5F2F847A0; Sun, 18 Sep 2022 07:45:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 09:42:18 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6c7de82baa1458eb74a14ed5bd4b6d90f5c27cea
X-Git-Newrev: 7a3e63122854b8e968cc6c43104018336722aa5a
X-Patchwork-Hint: ignore
Message-Id: <20220918074512.E5F2F847A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libzlib: fix CPE
 vendor id
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a3e63122854b8e968cc6c43104018336722aa5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

gnu vendor is not found for zlib in CPE database [1].
zlib is the correct vendor [2].

[1] https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:zlib
[2] https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:zlib:zlib

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 7a94fa901293bda6e0e87eff5dcb677b856c70b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
