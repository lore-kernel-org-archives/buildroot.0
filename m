Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96622CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D1C96171B;
	Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HirfRHzVDhLA; Thu, 21 Aug 2025 19:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3039C616BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3039C616BA;
	Thu, 21 Aug 2025 19:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 543361C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE52741921
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN1Z7qgagK45 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160224194D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 160224194D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0556486DE8; Thu, 21 Aug 2025 19:20:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:50:20 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 265752718a5e12aa1267d2d476f4d944275b1827
X-Git-Newrev: 9fa033bb1d64d87d80e9b509dac0cfd86388bf47
X-Patchwork-Hint: ignore
Message-Id: <20250821192004.0556486DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/iperf3: security
 bump to version 3.19.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fa033bb1d64d87d80e9b509dac0cfd86388bf47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Release notes:
https://github.com/esnet/iperf/releases/tag/3.19.1

Fixes the following security issues:
- An off-by-one heap overflow has been fixed in authentication.
  CVE-2025-54349, ESNET-SECADV-2025-0003)
  https://github.com/advisories/GHSA-8xx8-qrh3-q8mq

- An assert in authentication has been removed. (CVE-2025-54350,
  ESNET-SECADV-2025-0002)
  https://github.com/advisories/GHSA-r6x8-74x9-5mc9

- A buffer overflow in the --skip-rx-copy option for zerocopy
  has been fixed. (CVE-2025-54351, ESNET-SECADV-2025-0001)
  https://github.com/advisories/GHSA-xjwm-4pfw-49g2

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 96febd9c16082c0f09bfaa7ebb2d3848c5836e3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 1ffb2c6c02..3d9ff0cf5d 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.19.tar.gz.sha256
-sha256  040161da1555ec7411a9d81191049830ef37717d429a94ee6cf0842618e0e29c  iperf-3.19.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.19.1.tar.gz.sha256
+sha256  dc63f89ec581ea99f8b558d8eb35109de06383010db5a1906c208a562ba0c270  iperf-3.19.1.tar.gz
 # Locally computed
 sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 69c4792f98..df6b32abc1 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.19
+IPERF3_VERSION = 3.19.1
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
