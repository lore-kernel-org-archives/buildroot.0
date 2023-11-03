Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5705AC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B0960BD8;
	Fri,  3 Nov 2023 22:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B0960BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8i1Ul02brnrs; Fri,  3 Nov 2023 22:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223FA60BE5;
	Fri,  3 Nov 2023 22:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223FA60BE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55F3A1BF5F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2848260C01
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2848260C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZieWI01Dn1b for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:17:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D26FB60BDD
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D26FB60BDD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C152D8660D; Fri,  3 Nov 2023 22:17:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 23:16:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4eb9c5d4511e47be56574b874253a273a6f4d8ba
X-Git-Newrev: f4a9cdb1f85c376c18a432208ce62c7d45d7b6da
X-Patchwork-Hint: ignore
Message-Id: <20231103221702.C152D8660D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: add MENDER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4a9cdb1f85c376c18a432208ce62c7d45d7b6da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:northern.tech:mender is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F90CE0C3-FCE6-40AA-8C0D-EDE2C81BD67B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
