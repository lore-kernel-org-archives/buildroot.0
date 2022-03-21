Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B60C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 13:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A44EB828E3;
	Mon, 21 Mar 2022 13:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-1C1XqY3Oz5; Mon, 21 Mar 2022 13:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF5382893;
	Mon, 21 Mar 2022 13:11:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E16D1BF282
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 13:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BFFA414D1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 13:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lOVrkeJBOEW for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 13:11:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD6641477
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 13:11:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2758F848DE; Mon, 21 Mar 2022 13:02:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 14:11:20 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 79f90ac0d352001d36053e7ac3e8a1936a9daab9
X-Git-Newrev: a12e8ddad2fada4e26525b1a98901761e887275a
X-Patchwork-Hint: ignore
Message-Id: <20220321130230.2758F848DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/openblas: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=a12e8ddad2fada4e26525b1a98901761e887275a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 2a9bd8b18c..330f7d42e0 100644
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
