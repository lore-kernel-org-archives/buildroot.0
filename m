Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712DAC433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 131D440297;
	Fri, 18 Mar 2022 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZkgWeKmqSHO; Fri, 18 Mar 2022 21:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5AA840131;
	Fri, 18 Mar 2022 21:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 807651BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EF6560812
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMLeBzEjJaqw for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:59:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCF6A607CE
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:59:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1A9CF814C4; Fri, 18 Mar 2022 21:50:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 22:59:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9bff8a0b0f68f070a5ae0e94cbffefb9b455b26
X-Git-Newrev: 0e41f883b800846435cd13081fa86abbc4e330d7
X-Patchwork-Hint: ignore
Message-Id: <20220318215039.1A9CF814C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e41f883b800846435cd13081fa86abbc4e330d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:openblas_project:openblas is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenblas_project%3Aopenblas

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openblas/openblas.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 608c2f24ea..085d32acc3 100644
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
