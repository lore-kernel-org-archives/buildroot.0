Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D6BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC894154E;
	Wed,  9 Mar 2022 20:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7C3RbjG-PXk; Wed,  9 Mar 2022 20:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BDF40912;
	Wed,  9 Mar 2022 20:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D70A61BF9C2
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6EA084352
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HznN_a6xtuDH for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12ED28434F
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C8DFF83972; Wed,  9 Mar 2022 20:39:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 21:47:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b058e15f5334dac93f42b92ea31525afdc2c27c
X-Git-Newrev: 9051a6322187129ba65249b5ee2228e045a4fa8c
X-Patchwork-Hint: ignore
Message-Id: <20220309203930.C8DFF83972@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: fix CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=9051a6322187129ba65249b5ee2228e045a4fa8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba:ppp, added by commit 63332c33aa0771532807fd2684d4eee4eb952435, has
been deprecated in February 2020:

<cpe-item name="cpe:/a:samba:ppp:2.4.7" deprecated="true" deprecation_date="2020-02-24T15:55:39.787Z">
    <cpe-23:cpe23-item name="cpe:2.3:a:samba:ppp:2.4.7:*:*:*:*:*:*:*">

cpe:2.3:a:point-to-point_protocol_project:point-to-point_protocol is the
correct CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apoint-to-point_protocol_project%3Apoint-to-point_protocol

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pppd/pppd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 19b6f3ccce..d9d6244f10 100644
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
 PPPD_SELINUX_MODULES = ppp
 
 PPPD_MAKE_OPTS = HAVE_INET6=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
