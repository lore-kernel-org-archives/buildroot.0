Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B17EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 21:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 178F64028D;
	Tue, 13 Jun 2023 21:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 178F64028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMi0an_hE7il; Tue, 13 Jun 2023 21:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E07DB40333;
	Tue, 13 Jun 2023 21:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E07DB40333
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36FD61BF2A6
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D0B24097F
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D0B24097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAONM2Gp8jlO for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 21:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C52E4098F
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 21:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C52E4098F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5814082D99; Tue, 13 Jun 2023 21:51:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 23:37:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1e2f14d750ff4115f20ae5c2543b0002503da71d
X-Git-Newrev: b74ddc2f040cff416557fdf1eb5952c8afe9f3cd
X-Patchwork-Hint: ignore
Message-Id: <20230613215158.5814082D99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/tzdata: bump
 version to 2023c
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

commit: https://git.buildroot.net/buildroot/commit/?id=b74ddc2f040cff416557fdf1eb5952c8afe9f3cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

tzdata and tzcode (for zic) are released in lock-step, as they go
together, so we update both simultaneously.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 179ae2fa6b4acb49fe164dc0a2de28b21fee695f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.hash | 2 +-
 package/tzdata/tzdata.mk   | 2 +-
 package/zic/zic.hash       | 2 +-
 package/zic/zic.mk         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index aadd320063..3422655a71 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
 # From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
-sha512  72d05d05be999075cdf57b896c0f4238b1b862d4d0ed92cc611736592a4ada14d47bd7f0fc8be39e7938a7f5940a903c8af41e87859482bcfab787d889d429f6  tzdata2022f.tar.gz
+sha512  608bd286ebcbd0004cfdc1da183273f08aff61f90c8867661154453d77a05d421e4c46ad6d066a1fe2e87d5c82ec0f1c0224667a3b35f3180a3eb7f6ff84cbf5  tzdata2023c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 45bd7cf6e6..08f3c83bd1 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2022f
+TZDATA_VERSION = 2023c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 40f68f0299..6a7f9f2f94 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
 # From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
-sha512  3e2ef91b972f1872e3e8da9eae9d1c4638bfdb32600f164484edd7147be45a116db80443cd5ae61b5c34f8b841e4362f4beefd957633f6cc9b7def543ed6752b  tzcode2022f.tar.gz
+sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 229afaadc2..a915f6d256 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2022f
+ZIC_VERSION = 2023c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
