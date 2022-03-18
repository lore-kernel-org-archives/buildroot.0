Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF89FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 08:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D0184735;
	Fri, 18 Mar 2022 08:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1qwWD6TLmd9; Fri, 18 Mar 2022 08:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5D0584160;
	Fri, 18 Mar 2022 08:46:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA9E91BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2F3640470
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kLmUjz2gFQH for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 08:46:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1FFF4028D
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:46:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2B67884486; Fri, 18 Mar 2022 08:37:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 09:27:36 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e74c9f35bb428f0ac8cacc1ea64a2976910f2861
X-Git-Newrev: eb2ae01ba8600e5cc81ebccf271d1664f32d14f0
X-Patchwork-Hint: ignore
Message-Id: <20220318083735.2B67884486@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pppd: fix CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb2ae01ba8600e5cc81ebccf271d1664f32d14f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

samba:ppp, added by commit 63332c33aa0771532807fd2684d4eee4eb952435, has
been deprecated in February 2020:

<cpe-item name="cpe:/a:samba:ppp:2.4.7" deprecated="true" deprecation_date="2020-02-24T15:55:39.787Z">
    <cpe-23:cpe23-item name="cpe:2.3:a:samba:ppp:2.4.7:*:*:*:*:*:*:*">

cpe:2.3:a:point-to-point_protocol_project:point-to-point_protocol is the
correct CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apoint-to-point_protocol_project%3Apoint-to-point_protocol

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9051a6322187129ba65249b5ee2228e045a4fa8c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/pppd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 08560090b5..6de501a5b7 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -10,8 +10,8 @@ PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
-PPPD_CPE_ID_VENDOR = samba
-PPPD_CPE_ID_PRODUCT = ppp
+PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
+PPPD_CPE_ID_PRODUCT = point-to-point_protocol
 
 # 0001-pppd-Fix-bounds-check.patch
 PPPD_IGNORE_CVES += CVE-2020-8597
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
