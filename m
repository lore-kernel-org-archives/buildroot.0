Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9338C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 547A984819;
	Fri, 22 Jul 2022 08:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 547A984819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwGoIuKTa4Yh; Fri, 22 Jul 2022 08:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4989E84803;
	Fri, 22 Jul 2022 08:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4989E84803
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 847F81C11A9
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69AA341916
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69AA341916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vS_XNl9BXPyM for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7524C41814
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7524C41814
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 457BF8414F; Fri, 22 Jul 2022 08:25:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:35:21 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 4ee62081954d4dbbd8e7684cdfdb699ead7ac3bc
X-Git-Newrev: a85c032d9a4ad26decd44f4c5024a2282374fd53
X-Patchwork-Hint: ignore
Message-Id: <20220722082516.457BF8414F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/keyutils: add
 KEYUTILS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=a85c032d9a4ad26decd44f4c5024a2282374fd53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

cpe:2.3:a:keyutils_project:keyutils is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeyutils_project%3Akeyutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 876be2b0f32e9618aede307e78204105d37f3bc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/keyutils/keyutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index cba57cf199..5af5c4e92c 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -8,6 +8,7 @@ KEYUTILS_VERSION = 1.6.3
 KEYUTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot
 KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
+KEYUTILS_CPE_ID_VENDOR = keyutils_project
 KEYUTILS_INSTALL_STAGING = YES
 
 KEYUTILS_MAKE_PARAMS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
