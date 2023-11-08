Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1555C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 19:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F5741C1F;
	Wed,  8 Nov 2023 19:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F5741C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sWpFERmG1IQ; Wed,  8 Nov 2023 19:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5371341805;
	Wed,  8 Nov 2023 19:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5371341805
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC5D1BF966
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 19:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9FB8400FD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 19:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9FB8400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zGv8EGBoCgr for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 19:25:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8D01400A4
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 19:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8D01400A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C346086D2F; Wed,  8 Nov 2023 19:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 20:08:11 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1082b6f9f35ff1e48bb3d57e290e2b2be18353be
X-Git-Newrev: ec890da6456f52254886964f07cd779ef6de7790
X-Patchwork-Hint: ignore
Message-Id: <20231108192529.C346086D2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mender: add
 MENDER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec890da6456f52254886964f07cd779ef6de7790
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:northern.tech:mender is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F90CE0C3-FCE6-40AA-8C0D-EDE2C81BD67B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f4a9cdb1f85c376c18a432208ce62c7d45d7b6da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 724295f784..ee1398244b 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -7,6 +7,7 @@
 MENDER_VERSION = 3.4.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
+MENDER_CPE_ID_VENDOR = northern.tech
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
