Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25088C004C0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 17:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FAA70881;
	Sat, 21 Oct 2023 17:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1FAA70881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imiYjYGWWwGc; Sat, 21 Oct 2023 17:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C48470882;
	Sat, 21 Oct 2023 17:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C48470882
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAF921BF576
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C162F85045
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 17:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C162F85045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEjqZ783IFt2 for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 17:40:49 +0000 (UTC)
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 263FE85044
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 17:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 263FE85044
Received: from localhost.localdomain ([146.241.116.60])
 by Aruba Outgoing Smtp  with ESMTPSA
 id uFxtq9b1SWrkVuFxtqgtVm; Sat, 21 Oct 2023 19:40:46 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 21 Oct 2023 19:40:44 +0200
Message-Id: <20231021174044.295503-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfO42gFql1+u7rubNZg+muTRLS/ESSpfBKj8ps+TFjQ8gKF0JCfGmpY7YKuLGSsFeODTrF4HulauoV1vp0gOBB8ZihERYI6ncAdKc0SGrZ1O87TfLjgd/
 cFjp14cbu19fep6JqF9VgmtgdVsC1gWUNVUCE9GM5ytwG1WPtJAOVuslPTkzcUXr/rQ61usmTsZwIAHUgpBmr6nrKmDZssriNsGVieHmlFrFFH5hmwvKAuGk
 4gf0jVpbfMhUUmWPyly2Igr0iQSNodQFrUjdef36h0c8t8OKvaJJY+HEYgxpePFxtsAOWYXT11YwjhHwqdX1WU/EFfrHVjUPLi7BmFF39oQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697910046; bh=7OucSpO9VIhIwwC4pOKMMY791kXRVjdXzczEt7VmkoU=;
 h=From:To:Subject:Date:MIME-Version;
 b=WYX+6gA6FUOdfvgnToobMxBqBfz47zCLwIBJQ+LmTUD/dAwMlZUAKAwnRUWsiObgf
 T3EHnZ1KogPnEg2An+9zHtW9Yywq132/gNNykwewn8YhH3RMjyhVP0vJi/nAn6/r5F
 1YwajZFErmL/aDwSlBXrav0Yn1CbL+oO2L11fsUXoik9rZf4G0sD0XDC1YXz1NCwa1
 2qMwyNi+Q3kmnN6Fygq+jdTcriLAa/tzeDXztVZOgXCU1ZQcCvcWo60HoYHJA2mZDI
 lTLJEToHeLL1/+/5RGAHxwqlLCJXtDnT+jMVM0dEnfAX7u66vlNqM4uvcqh1rH5fhR
 sKV4jPCnlPcKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WYX+6gA6
Subject: [Buildroot] [PATCH] package/rtl8188eu: bump to 2023-07-29 version
 on v5.2.2.4 branch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 29ce0e32c2..b3ead087d4 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c573529862861a7a75534a4f2bc34ba7e3b116125298b5bc0d432b3065bd7df6  rtl8188eu-f4af53305cb1e9a0d8d9957a042f7c01b7121bfc.tar.gz
+sha256  6bf8c026c7d875248f18f14de6fd116cac178db9bdb5bdbc1e267c8ac6b6237f  rtl8188eu-3ff6f7d84cb5346ed8d5dc21056769f2e03746d9.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 3698115d3c..f475bf3cab 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = f4af53305cb1e9a0d8d9957a042f7c01b7121bfc
+RTL8188EU_VERSION = 3ff6f7d84cb5346ed8d5dc21056769f2e03746d9
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
