Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55791CA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 11:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A04880864;
	Fri, 15 Aug 2025 11:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zp1ivK5d4Nrh; Fri, 15 Aug 2025 11:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3090980B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3090980B0B;
	Fri, 15 Aug 2025 11:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C299223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 11:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 022FC60E12
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 11:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Obt0YnNtJeN for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 11:16:48 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 15 Aug 2025 11:16:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DAFD60AFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DAFD60AFC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.243;
 helo=smtpcmd01-sus.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Received: from smtpcmd01-sus.aruba.it (smtpcmd01-sus.aruba.it [62.149.158.243])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DAFD60AFC
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 11:16:46 +0000 (UTC)
Received: from localhost.localdomain ([95.168.120.44])
 by Aruba SMTP with ESMTPSA
 id msJUufRMszKH1msJVu428J; Fri, 15 Aug 2025 13:09:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Fri, 15 Aug 2025 13:09:35 +0200
Message-ID: <20250815110935.6530-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815122406.3d466418@windsurf>
References: <20250815122406.3d466418@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN7ihVwJv82KNrXKr2urdZa38YVm0AGJQl0GhcJpxxr8R9EhSPMqRvr0Wd59kq3Uab3WJVeUfkSj6mLKD+YTbCksiPvfmGtoqylGqxZXg04/kQTYIwW4
 owvIgYLbdjJfdmp31Qg7anqEFcd5eV+XU0CbOs3W95qjGkqqliB6+AjNtI4Cz1UOewr/LseZl876ZrOzous7pVxiSbEB+4YG7ntSmuS+08/k79tXWLhgFZyz
 tcs+7MLtT7oCulVKDxHg7NocO97J89ndJB1oHop5gjEiqT3rAaBPpUH8Dd8GfLDIe0sFDVymUe5qRW2Xks3Wfb1It5+7Rhn/N9a1twdzr6I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1755256177; bh=cKgRPnnUgRQ41Icr89mI4B2CeVkFFCklfiJ6VyA8Y7s=;
 h=From:To:Subject:Date:MIME-Version;
 b=BTGVI7XeszOT7eZQNBXx9PsN5/LMA5tM7fV4duYn5738TUstzIQuokyk6yUJBUhbe
 1w6EcacWO19x1OKjBpOLJeSrQYHVdKw9N4C0cHt96Y/wY6q4k/eOFG/iWrwlHbKVFQ
 pmyt5f7eEj2IDKL9Po4ThTwOvCxdgOYi3E5afYoa6UWVRHMpj7xG61/4BU+cDg/6MS
 Vv61A5Ha0uBTsMetOp2dFX43S25GWFMObyFKyp0QoRElI9nWQmxVNFdFxvkpr1j7ND
 YdYSsr63qztXR0kbDCta0JPxWpUT8GttFra7NradPyK+p3C4hJyAB5TYBlNN6WtpJd
 A6oTdc19JXrDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BTGVI7Xe
Subject: [Buildroot] [PATCH v2] package/libtracefs: fix build failure due to
 missing NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With commit:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=31acfe1747b273e147f864b5a62a4e39197ca1a2
package libtracefs utest started to use pthread_barrier_() functions and
this lead to build failure when we build without NPTL. Since utest is
not needed on the target we can avoid to build it, so let's disable it.

Fixes:
https://autobuild.buildroot.net/results/69b/69b75908bebdf9382a4cd9b138fcaf1e34daba09//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* improve commit log to point when problem began as requested by Thomas Petazzoni
---
 package/libtracefs/libtracefs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index d24763fa7d..6b8f838c2e 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -14,6 +14,7 @@ LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
 
 LIBTRACEFS_CONF_OPTS = \
 	-Ddoc=false \
-	-Dsamples=false
+	-Dsamples=false \
+	-Dutest=false
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
