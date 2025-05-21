Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8656FC54E65
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 22:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 347D180BEE;
	Wed, 21 May 2025 22:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ED1cSSldQd6e; Wed, 21 May 2025 22:46:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C6C880BE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6C880BE6;
	Wed, 21 May 2025 22:46:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3526D228
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26D2740531
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckeV-MT7QDkY for <buildroot@buildroot.org>;
 Wed, 21 May 2025 22:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F57A4047B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F57A4047B
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F57A4047B
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:45:59 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id HsCDuqElQ0WuxHsCDu1Te0; Thu, 22 May 2025 00:45:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 22 May 2025 00:45:55 +0200
Message-Id: <20250521224556.560897-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJaVOJ2skI8/lv16Kn8mZei+F0O+ELlnWLg6rn3S1k7ZyGV3G+0FjlGT13i9pBl6aNJhL+OF5eii0cTa8VL4O7hUSInmwKTrfgGqGlZf6JTj8QrZ/Til
 AsCSSNII25fqQ8MoCebHyzy0qbrgNhu9WRmTPGAVXnvej1OXedGe3mw2rAm73/m2O3ARWMtg0Inp/iEa2909PyibekDSxvA5wyhpbUKz1Z3C9ZkvgoOZJX+l
 b0385f2sjuYvlVBfN3+id48T1JI2kak3H8oP43yO3ZaJr2ivdIofZLdmgmwhLe2KZ5QZxnMVroN7Z90qgksCEg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747867557; bh=L5u7FR1bjZq37UwUSbJviPVANetNFSVvvBwrPSMJNaA=;
 h=From:To:Subject:Date:MIME-Version;
 b=P0TtInbPyTivpHQ0e+zuYCICcK54/7IfkLywEv+V+6vZ0pi0bywcgvlr11ed80ncX
 U3sYV+JTCEJEhKAZqig4m38h44gEc9YDePIIHM1EBX2VEVSdNXSXBoxpMBJM4ojCmj
 Of/UkGgl81LokLH13+Egr6QpYWMzytZ0Ub/xUHBVtuBo3POQDDsTncpcdHKiVUoU5Y
 StvHdAE7fOT7vUKj7euLqrykvnqFjmKLaE1cvy0NqS0eTUklAy5XY2g005tSmKucb4
 siBcf+lSaJzvMXS016HUzCShryv0zhmRlUV6Ag+3dpZQtG4KhLJHPYBnUvv3z+XJRf
 Jl7GuV6ZxfuFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=P0TtInbP
Subject: [Buildroot] [PATCH] package/esp-hosted: bump to version 1.0.4.0.0
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

Esp-hosted project released a new tarball after almost 3 years where they
only committed patches to git repository. They also defined a template for
releases[1]

Release notes:
https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-v1.0.4.0.0

[1]: https://github.com/espressif/esp-hosted/commit/ced8383c2b8d44b0d15e04dbb424d5a51e7f468c#diff-2e8cb17d6e84161bc5a232fbdf4c0b8893c4330f185c66c564e33ced6ffc864f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 8de3c00190..8b0b3e5f90 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
+sha256  1025b8c8d982bab03ebec9859f828a1c81218077245b602621eb4f07c169bac8  ng-v1.0.4.0.0.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 4c249eec46..4d0224bb95 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
-ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
+ESP_HOSTED_VERSION = 1.0.4.0.0
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,ng-v$(ESP_HOSTED_VERSION))
+ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
 ESP_HOSTED_LICENSE_FILE = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
