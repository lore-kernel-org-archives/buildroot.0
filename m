Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791DAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2304940C36;
	Fri, 17 Dec 2021 21:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UMzSYpeToHY; Fri, 17 Dec 2021 21:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F5640C26;
	Fri, 17 Dec 2021 21:50:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1C31BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A23584DAF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0pkbjLvAgE6 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:50:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B602D84DAC
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:50:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A7778810D3; Fri, 17 Dec 2021 21:45:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:50:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2cb5d2e6197b68a47f21cd3805400c6e4571d59
X-Git-Newrev: 773743a007cc05139366635744d2d59abc2c641f
X-Patchwork-Hint: ignore
Message-Id: <20211217214512.A7778810D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modsecurity2: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=773743a007cc05139366635744d2d59abc2c641f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:trustwave:modsecurity is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrustwave%3Amodsecurity

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modsecurity2/modsecurity2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 52ae6f4c31..5d91818ade 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -8,6 +8,8 @@ MODSECURITY2_VERSION = 2.9.4
 MODSECURITY2_SITE = $(call github,SpiderLabs,ModSecurity,v$(MODSECURITY2_VERSION))
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
+MODSECURITY2_CPE_ID_VENDOR = trustwave
+MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
 MODSECURITY2_DEPENDENCIES = apache libxml2 pcre
 MODSECURITY2_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
