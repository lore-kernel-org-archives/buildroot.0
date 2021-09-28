Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A09C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:57:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44DF76108E
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44DF76108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1521880D82;
	Tue, 28 Sep 2021 15:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YphwBhn1eWKI; Tue, 28 Sep 2021 15:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B6D280A9B;
	Tue, 28 Sep 2021 15:57:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 664FF1BF681
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DCE4414BE
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_XP19AX1O9Q for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 15:57:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18AC44148E
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 15:57:11 +0000 (UTC)
Received: from houde.tangerine ([185.195.233.153]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1M58zc-1mWLwH2NRk-00180v; Tue, 28 Sep 2021 17:57:09 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 17:56:31 +0200
Message-Id: <20210928155631.729512-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:mAQ1QxmT2ERlvanotugrZMAle9CvTwzsEcDSzC+c5cBB66B2NcY
 /ib2e8Vg9Uez5e1rCueafXdzV3rNBfNAD8K57jGG0sl79bPVpVCcKHLfROK6nHbQ+tlowyC
 s4kIb3OPbAt8W0V1cQbYHiRqlycWpc7nDYyjhE12tR/PROeXKWQeCM7K9bQfz0cMQvEO7S6
 OTH0XN7MFkjyBv5CWtupw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fgX56BSGqkQ=:i8lhBR7+26zUZdTrPK8RQj
 ogt98tV9Jkz7X9b4MejFGXWTwUCCnK3jfv12X8h66xS/y5beBjeJK+elBqIUdnSERJLwd8Ksr
 DsrZdq1mE3QJLUBRJuNhCfC+B1+6tUoCa7wiIy/C/tvZUYYG5K5mO5fzUOToxp4zKygSY64aa
 rIXcAcy0Pzc/sYzo1qQKyJ+QgXA5Ta4AG3u6pWHt8jAN/FhPipe9RpYjmf9AZdDsJ8twtnKsr
 5FG66F21hTxsz7GNHugoJm45mQDRB2zPaVgfnP0BmBHaEpgqmbEzSwt0bs0WVFrfE/+ZDzMzp
 sQxIy6UTKWBfbI+3tOC0OrshcR6G071+yV4WWaZqMTBJB2iDDTxs5u5xoLkH3AmFFG6fbZnLw
 SrcQOOtbb9mKUCozWcrkwLOooiDbL+dKruDzANGmQyLmOjON5WjWtf3w5f5hRSvWWN6hZZ64L
 vu7XwOUoJYq7DrCXRuqhrgVD19p2g2jCbUji65k8cFL+KiQ0wH3xgyDEf3JZenniddySOfYom
 udOVS+TQSic3but8oUHfG5Ugl2wCoyBOnng1E9tPapYZew8x8Lktl8hjMMVTv9YCBhwuZD6Ne
 VN7c13qIpxmT8Nzf1gnyo71YteDZNwcR1V+ODk7Z2QII2WMbeA8w2Hd9gA89TkkjG73eJJELA
 gY5hNWwpmMHT/A5N+CIdCz7R+cPuASj1fkLdv/PilJZ/ex3we8kRD4YostglAi5i3FTX6x9Dq
 nNpAao77l9EzDNA9UAMVmOXc/RiQ4TTI4jqYWBiSLgayiAOPUfg39DqEmLcNpnSvWKF4nxKb5
 7WzyadN
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 6.8.1
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index e6debd49ba..306996090c 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	c8695a15c3570ca0c8f84c79391f81a89b925a5fcca28dc5cd60942c0dade247	v6.6.1-dist.zip
+sha256	07d06f17f44399d86ddeac8d8000d39ff9db503257f77c59e5743d5934463623	v6.8.1-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index c8d2c07ee7..7a4922edc4 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.6.1
+OPENLAYERS_VERSION = 6.8.1
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
