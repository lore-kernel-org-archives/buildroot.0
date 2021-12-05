Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B584C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 300F9834AE;
	Sun,  5 Dec 2021 11:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51EsDfuJaeZh; Sun,  5 Dec 2021 11:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB268345D;
	Sun,  5 Dec 2021 11:57:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAB251BF96B
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AED28345D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osYtKyjlEnbJ for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:57:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2D8083415
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 11:57:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2CF7C7F89A; Sun,  5 Dec 2021 11:52:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 12:28:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f7e96a01abaf976016f50b5c29daf17d96f2ec6
X-Git-Newrev: 8022e00b2dc822c3403eee28db7181b5899c22dc
X-Patchwork-Hint: ignore
Message-Id: <20211205115206.2CF7C7F89A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=8022e00b2dc822c3403eee28db7181b5899c22dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:apache:portable_runtime is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Aportable_runtime

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 466222586c..c45829aacc 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -9,6 +9,8 @@ APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
+APR_CPE_ID_VENDOR = apache
+APR_CPE_ID_PRODUCT = portable_runtime
 APR_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
