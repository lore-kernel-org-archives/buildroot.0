Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4285ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2B260A82;
	Sat, 17 Sep 2022 12:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2B260A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVmfOlCby6FU; Sat, 17 Sep 2022 12:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7260160A4F;
	Sat, 17 Sep 2022 12:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7260160A4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D81EB1BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B33A983F7F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B33A983F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwj4mC_q31_i for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:36:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FE183F75
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99FE183F75
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:36:09 +0000 (UTC)
Received: from booty.lan (unknown [80.233.62.104])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8F5D8240003;
 Sat, 17 Sep 2022 12:36:07 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:36:00 +0200
Message-Id: <20220917123602.961826-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
References: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663418167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9JunfoHTnwcL4nXEJkltPgMlxLJFWWKXdDh4u//EM8=;
 b=kESE6mdQr7wplfqLWsnSKp6GH2YTvGH+/znwqiAsTHi0csxUkDpLilfr+sgXxPmf0njqAF
 CAqB9Mzwoa5+fbR/6/k8RFJxgZ1G/HNITx7ya4w4HHqRyWMi0bUEO4eRiW7449z/P7X/04
 db08RJm6DZKNBLEeYdHGLTsS1Ub8qB2gUUwkhO9o7zEW+OaUKzXcvPNViBhTbO1C5vtgWt
 2LiR2dv/uapQk/PZPXv/c75VkOJEl0B4CLTOqzsTEshtE6dx4QZ9Hz24uHSTWOPsMcnQL+
 Lu68waqjc5LiM7eU+0FwsZXL4geeEDn6Fj04fDKRPcQqoj1r1e6Jz5asfIiQCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kESE6mdQ
Subject: [Buildroot] [PATCH 2/4] package/agentpp: bump to version 4.5.4
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Changelog:

  * Fixed: If USE_LISTEN_ADDRESS_FOR_SENDING_TRAPS was not defined, traps
    to IPv6 destinations could not be sent.
  * Fixed: Compilation without _SNMPv3 in some example agents
  * Added: Added new function Snmpx::get_session_fds_ipv6()

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/agentpp/agentpp.hash | 2 +-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index f8399963e51e..99aae7026363 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  bcfc014cc7ce37afdd6eefb71b59f1eabf23984525905546aa363c2a2c498c79  agent++-4.5.3.tar.gz
+sha256  5f2cfe98fd1d50683e02c65fccd9423351254df427e5825e4f321c488a9234eb  agent++-4.5.4.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index f30e75ef9c05..d020228e44bf 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.5.3
+AGENTPP_VERSION = 4.5.4
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
