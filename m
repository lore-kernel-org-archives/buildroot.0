Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6237FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA7BB415B3;
	Thu, 27 Jan 2022 19:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmtWBPq94aQn; Thu, 27 Jan 2022 19:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44CF241616;
	Thu, 27 Jan 2022 19:27:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA6E11BF3C3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9942384E21
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPTmNIe0f5ww for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E802684DEF
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:27:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7E49582946; Thu, 27 Jan 2022 19:20:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 20:26:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e7e19a5b07e533716f3e1612c10a85fa2966d6e
X-Git-Newrev: b630df6fb24ec7f79564bea5fd6d0154268a6ed3
X-Patchwork-Hint: ignore
Message-Id: <20220127192022.7E49582946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jasper: simplify disabling
 documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=b630df6fb24ec7f79564bea5fd6d0154268a6ed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace CMAKE_DISABLE_FIND_PACKAGE_{DOXYGEN,LATEX} by JAS_ENABLE_DOC
which is available (and working as expected) since version 2.0.20 and
https://github.com/jasper-software/jasper/commit/cddb7b199a1c78f3ec0b2c6b8af705588437af4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jasper/jasper.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 6ef1afcac7..59c5b3d66a 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -11,9 +11,7 @@ JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_CPE_ID_VENDOR = jasper_project
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
-JASPER_CONF_OPTS = \
-	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
-	-DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE
+JASPER_CONF_OPTS = -DJAS_ENABLE_DOC=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
