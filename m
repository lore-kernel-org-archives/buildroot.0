Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55833C71155
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 13:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01EA680AC4;
	Mon, 16 Jun 2025 13:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8Vo3r5lB9DK; Mon, 16 Jun 2025 13:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FFF780CE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FFF780CE8;
	Mon, 16 Jun 2025 13:02:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF90A16B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 13:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D15E380CEA
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 13:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFg62fSz-Dmd for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 13:02:12 +0000 (UTC)
X-Greylist: delayed 483 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Jun 2025 13:02:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8A1F80CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A1F80CEC
Received-SPF: Neutral (mailfrom) identity=mailfrom;
 client-ip=2001:41d0:303:5a36::1; helo=kmf2.trabucayre.com;
 envelope-from=gwenj@trabucayre.com; receiver=<UNKNOWN> 
Received: from kmf2.trabucayre.com (unknown [IPv6:2001:41d0:303:5a36::1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A1F80CEC
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 13:02:11 +0000 (UTC)
Received: from kmf3.. (localhost [IPv6:::1])
 by kmf2.trabucayre.com (Postfix) with ESMTP id 0B9C416022E;
 Mon, 16 Jun 2025 12:54:04 +0000 (UTC)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Mon, 16 Jun 2025 12:53:59 +0000
Message-Id: <20250616125359.1349323-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=trabucayre.com
Subject: [Buildroot] [PATCH] package/volk: bump to 3.2.0
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

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/volk/volk.hash | 2 +-
 package/volk/volk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/volk/volk.hash b/package/volk/volk.hash
index 3a363f0357..a24967f28b 100644
--- a/package/volk/volk.hash
+++ b/package/volk/volk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ce62f645c2ee3ef8b38f923de78ef4df9a1b7696d618f57781955803ee29bab3  volk-3.1.2.tar.xz
+sha256  93fcf717545f5e60491c57fd8dd348d814d3f95332d9dada5e53ab38015ff90a  volk-3.2.0.tar.xz
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 396f4e6e8b..7b10f57bac 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VOLK_VERSION = 3.1.2
+VOLK_VERSION = 3.2.0
 VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 VOLK_LICENSE = LGPL-3.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
