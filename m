Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1DFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A55C415E0;
	Tue, 24 May 2022 15:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnJF6FeQFByj; Tue, 24 May 2022 15:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2E5415CD;
	Tue, 24 May 2022 15:07:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1BB51BF983
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF8154027F
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8aWFSRI8o0gg for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09384400C1
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:07:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 655178648F; Tue, 24 May 2022 14:56:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 17:05:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a60117068b9d4fc3583ba68a9be87aa31b93b806
X-Git-Newrev: 2e8f172124bc5296b5338c6b6a26951024250fd2
X-Patchwork-Hint: ignore
Message-Id: <20220524145615.655178648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/expat: disable
 examples, tests and xmlwf
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e8f172124bc5296b5338c6b6a26951024250fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable examples and tests (enabled by default) through
--without-{examples,tests} which are available since version 2.2.7 and
https://github.com/libexpat/libexpat/commit/1fdfd8a1b490f8ac9e7e11896298e41cc210d87d

Also disable xmlwf (a binary that determines if an XML document is
well-formed) through --without-xmlwf which is available since version
2.2.4 and
https://github.com/libexpat/libexpat/commit/9d950527a07783c104aada685384edf3f8f23f8a

This will fix the following build failure on riscv64:

ERROR: reloc type R_RISCV_SET6 unsupported in this context

Fixes:
 - http://autobuild.buildroot.org/results/99890c9c7ebe3266dd533c81352a3cbcf4d3d738

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit dac5873314581786630466741074c1e3af61b2b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index b29b0e1d26..92a3bfda8e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -15,8 +15,9 @@ EXPAT_LICENSE_FILES = COPYING
 EXPAT_CPE_ID_VENDOR = libexpat_project
 EXPAT_CPE_ID_PRODUCT = libexpat
 
-EXPAT_CONF_OPTS = --without-docbook
-HOST_EXPAT_CONF_OPTS = --without-docbook
+EXPAT_CONF_OPTS = \
+	--without-docbook --without-examples --without-tests --without-xmlwf
+HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
