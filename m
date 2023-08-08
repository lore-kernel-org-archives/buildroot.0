Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1415DC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2F5682094;
	Tue,  8 Aug 2023 18:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F5682094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogW44kWSnvxp; Tue,  8 Aug 2023 18:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2AF28200F;
	Tue,  8 Aug 2023 18:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2AF28200F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37F9C1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C7544016E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C7544016E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-mzQjytMC_G for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:07:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43D3B4008D
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D3B4008D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D98D84BC6; Tue,  8 Aug 2023 18:07:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 20:04:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df5fd7dec45eb26a2ac97c494cf1904123e29c5f
X-Git-Newrev: 642b42928eeaf74db7dc7d7bf6670f37b7b7d274
X-Patchwork-Hint: ignore
Message-Id: <20230808180737.2D98D84BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: security bump version to
 1.2.2a
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=642b42928eeaf74db7dc7d7bf6670f37b7b7d274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2023-4012 (see [1] for details).

[1] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_2a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntpsec/ntpsec.hash | 2 +-
 package/ntpsec/ntpsec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 44e04b2403..8d98b5c411 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ad45f5b88d08a159bc9f44ecb79e08358d26d3d22bb6c96ab7aaa3734de130e6  ntpsec-NTPsec_1_2_2.tar.bz2
+sha256  ef901df5a05d486563db22f4d0dad3840a3bf5d0a9aceb8c3ecaeb396c67a805  ntpsec-NTPsec_1_2_2a.tar.bz2
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2
 sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3
 sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index e612e982ec..f6262cdaca 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.2
+NTPSEC_VERSION = 1.2.2a
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
