Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFAFC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 08:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB3640C4B;
	Wed, 19 Oct 2022 08:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB3640C4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAyid-7eBOtt; Wed, 19 Oct 2022 08:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEFB740C40;
	Wed, 19 Oct 2022 08:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEFB740C40
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24C671BF983
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C11C41907
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C11C41907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYcvWJPFehHY for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 08:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16319418F8
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16319418F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01E4E86EDE; Wed, 19 Oct 2022 08:03:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 09:58:32 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 444611a9a12dd81635a635a994b4718afcc3cfdd
X-Git-Newrev: 062ab53211eb8ff43d7ae4b6621625fb6834b689
X-Patchwork-Hint: ignore
Message-Id: <20221019080332.01E4E86EDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/freerdp: security
 bump to version 2.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=062ab53211eb8ff43d7ae4b6621625fb6834b689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fix CVE-2022-39282 and CVE-2022-39283

https://github.com/FreeRDP/FreeRDP/releases/tag/2.8.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1e37cfd2dcc867e71519439e3cd9c630866b6140)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index a600a96172..94d0746d40 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.8.0.tar.gz.sha256
-sha256  fd26a41c367ea1f23a06716725d19efa41fd572c4536348d39b3465b116b3703  freerdp-2.8.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.8.1.tar.gz.sha256
+sha256  ea8903b29914134202a972c06052432678c89cb5eebcc8f5a41553030c97376b  freerdp-2.8.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c7e01fa541..ae844c589e 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.8.0
+FREERDP_VERSION = 2.8.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
