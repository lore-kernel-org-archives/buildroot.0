Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463F0C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:15:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08BD460F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08BD460F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D824045A;
	Tue,  3 Aug 2021 21:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kn_sO07tZkpS; Tue,  3 Aug 2021 21:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D55640298;
	Tue,  3 Aug 2021 21:15:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 400721BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1383160641
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbWBPgYnrO_u for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CBB8605CF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B7EBD8B43E; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 14:20:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 28b19ccb487316353e01ce4248978d5ef3aade66
X-Git-Newrev: bf1925cb97d3a0a34120e5a7a8108b47eb75f7cd
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.B7EBD8B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/refpolicy: fix
 REFPOLICY_CPE_ID_VENDOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bf1925cb97d3a0a34120e5a7a8108b47eb75f7cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:selinuxproject:refpolicy is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aselinuxproject%3Arefpolicy

Indeed, cpe:2.3:a:tresys:refpolicy has been deprecated since April 21th:

  <cpe-item name="cpe:/a:tresys:refpolicy:2.20180701" deprecated="true" deprecation_date="2021-04-21T16:55:43.710Z">
    <title xml:lang="en-US">Tresys refpolicy 2.20180701</title>
      <reference href="https://github.com/TresysTechnology/refpolicy">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:tresys:refpolicy:2.20180701:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:selinuxproject:refpolicy:2.20180701:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/refpolicy/refpolicy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 0e7dfd86f8..a42483dba2 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -6,7 +6,7 @@
 
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
-REFPOLICY_CPE_ID_VENDOR = tresys
+REFPOLICY_CPE_ID_VENDOR = selinuxproject
 REFPOLICY_INSTALL_STAGING = YES
 REFPOLICY_DEPENDENCIES = \
 	host-m4 \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
