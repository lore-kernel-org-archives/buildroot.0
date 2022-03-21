Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D99C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 13:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEBF41508;
	Mon, 21 Mar 2022 13:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKsDi7x3oISL; Mon, 21 Mar 2022 13:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6268741477;
	Mon, 21 Mar 2022 13:11:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B56061BF282
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 13:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A242982896
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 13:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLhC21iAQZ8m for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 13:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AD3282893
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 13:10:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6BF1D848D1; Mon, 21 Mar 2022 13:02:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 14:10:53 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 404d4bcc66374c08425f810db3c41add65b2ac87
X-Git-Newrev: 11374e363a42a8efb0bb87e3bbd01cd6cbfc755b
X-Patchwork-Hint: ignore
Message-Id: <20220321130203.6BF1D848D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/openblas: add
 OPENBLAS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=11374e363a42a8efb0bb87e3bbd01cd6cbfc755b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

cpe:2.3:a:openblas_project:openblas is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenblas_project%3Aopenblas

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0e41f883b800846435cd13081fa86abbc4e330d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/openblas.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 4d506fa618..1d7d6d0538 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -9,6 +9,7 @@ OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
+OPENBLAS_CPE_ID_VENDOR = openblas_project
 
 # Initialise OpenBLAS make options to $(TARGET_CONFIGURE_OPTS)
 OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
