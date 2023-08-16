Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73276C25B5C
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15773613FE;
	Wed, 16 Aug 2023 20:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15773613FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AddoJugBHCPb; Wed, 16 Aug 2023 20:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63964613FA;
	Wed, 16 Aug 2023 20:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63964613FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9E51BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E78124011A
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E78124011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfO75tTLBCCk for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 20:03:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3D9A400EF
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 20:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3D9A400EF
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7370A4C09F0
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 22:03:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42790)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWMjW-00039N-1f
 for buildroot@buildroot.org; Wed, 16 Aug 2023 22:03:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Aug 2023 22:03:10 +0200
Message-Id: <20230816200310.1363595-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692216190;
 bh=CyL9b8XX8aWFg5HIx9rvdo0pWhZJw1vDb0NFQl1Sx4w=;
 h=From:To:Subject:Date:From;
 b=RIJj9NLX23DQMGDD/m+ORV17kwPlC3YgzYXHJw5n6//SOKHdE6AQHGUQUuiUUdfFU
 bgBy/xVIbfC5E1dVTuodUjBrzxvtyCIM4ydoI1dRjgI9JgArmNYP8CnlVC1ZnFF95B
 o9szN6txatQ6A2On1C38HopDYLZwWMqDgpWjGojC6zgJPsLLFwDQ7ccMECID3/6RXx
 +HfrlhP2wqRzjQrA+ZFipKbK361JyaccVEgzAwLS8/bGbYO0RSUCZK17S+HODYFIpK
 KPLaxumf/Vacw23Nh3bl4Zk82KRbpPNJYIFZfNix4yITzOYvpa2beCW1v5MiWmMKSb
 EwPC/miJU54vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RIJj9NLX
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.0.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://blog.clamav.net/2023/07/2023-08-16-releases.html

Fixes CVE-2023-20197 & CVE-2023-20212.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index ad9d1c9264..9a41806d1e 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0872dc1b82ff4cd7e8e4323faf5ee41a1f66ae80865d05429085b946355d86ee  clamav-1.0.1.tar.gz
+sha256  71dd39fe0d3937747fc280ea07c15cc990269257c4abb12dc438b4409d1b44c7  clamav-1.0.2.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 68a1799bfc..e677c3375a 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.1
+CLAMAV_VERSION = 1.0.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
