Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F493C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02A29408DF;
	Sun, 23 Jan 2022 19:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MbRIM7Gx-uRe; Sun, 23 Jan 2022 19:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A09E408DC;
	Sun, 23 Jan 2022 19:12:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FAD41BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AC6F83F6D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsiOl2UfdJvr for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EED1817D3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1689F82B2E; Sun, 23 Jan 2022 19:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 19:35:31 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 05b168b3a1d19c183c6085efab0196b6e7a514e3
X-Git-Newrev: 74d23e17d53e704921bc3a699c52c389c07a09fd
X-Patchwork-Hint: ignore
Message-Id: <20220123190408.1689F82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/lapack: add
 LAPACK_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=74d23e17d53e704921bc3a699c52c389c07a09fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

cpe:2.3:a:lapack_project:lapack is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alapack_project%3Alapack

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 52570be4e9bedf4fb543429fcef23873f77a1193)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lapack/lapack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index a80131c9ad..609075842d 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -8,6 +8,7 @@ LAPACK_VERSION = 3.10.0
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
+LAPACK_CPE_ID_VENDOR = lapack_project
 LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
