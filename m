Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD9C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A50B4212D;
	Sun, 14 May 2023 12:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A50B4212D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Kv9QaZ0w0tX; Sun, 14 May 2023 12:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D31B41E4D;
	Sun, 14 May 2023 12:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D31B41E4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 220AA1BF8A8
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEAE483C83
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEAE483C83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WS4JiMOD5cIl for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D76783C82
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D76783C82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A12A86620; Sun, 14 May 2023 12:26:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 14:24:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 994bf24bf0a17e294d4b05846f67ac1324189a7c
X-Git-Newrev: 179ae2fa6b4acb49fe164dc0a2de28b21fee695f
X-Patchwork-Hint: ignore
Message-Id: <20230514122606.2A12A86620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2023c
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

commit: https://git.buildroot.net/buildroot/commit/?id=179ae2fa6b4acb49fe164dc0a2de28b21fee695f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tzdata and tzcode (for zic) are released in lock-step, as they go
together, so we update both simultaneously.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
