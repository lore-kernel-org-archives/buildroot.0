Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16E3C282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D41A408A7;
	Sun, 16 Mar 2025 19:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiORKpeDmbCd; Sun, 16 Mar 2025 19:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77BD340967
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77BD340967;
	Sun, 16 Mar 2025 19:55:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDCB16E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F24F181778
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 19:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXQvB4jqkw7P for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 19:55:38 +0000 (UTC)
X-Greylist: delayed 1799 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 16 Mar 2025 19:55:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2733281699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2733281699
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=78.46.3.230;
 helo=www571.your-server.de; envelope-from=ak@it-klinger.de;
 receiver=<UNKNOWN> 
Received: from www571.your-server.de (www571.your-server.de [78.46.3.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2733281699
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 19:55:37 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www571.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <ak@it-klinger.de>) id 1tttBL-000JvI-1i;
 Sun, 16 Mar 2025 19:57:55 +0100
Received: from [2a0f:6480:1:600:fc64:4dfc:9829:9e5f]
 (helo=anderl.linuxhotel.de)
 by sslproxy03.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <ak@it-klinger.de>) id 1tttBL-000Dm9-2h;
 Sun, 16 Mar 2025 19:57:55 +0100
From: Andreas Klinger <ak@it-klinger.de>
To: buildroot@buildroot.org
Cc: Andreas Klinger <ak@it-klinger.de>
Date: Sun, 16 Mar 2025 19:57:44 +0100
Message-Id: <20250316185744.332684-1-ak@it-klinger.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Authenticated-Sender: ak@it-klinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27579/Sun Mar 16 09:35:38 2025)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=it-klinger.de; s=default2502; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=srX5FbpibpZOtLc94ZR0Vhd4++XW7TqQoobAGcLHfVY=; b=n0f9noCg/iwrTWMQWx6sxoOdT0
 rye1RtslJkHj7JDNia5L/Q2iN37zMDgAzsbVLh5GQ1yjj1yjKAz9rYwZtPFDoTxrWU0BURgjftjix
 UaDQE047z1Kesr80CVVDT5t0YkQ+ARNx8Bg4tkP6eCOQFGd6u4NaB4cnmyC6qHUravQZp9yDwCDe6
 4ofYYh8rGbWFU8YHLC+JUfJTYLsL+ujtxoYu+XIO0MMsbH4k2U6i0IsGbjuzI2yOw4qdRdfYq6pUJ
 Rr4LO6gk/h0fX7beLRzV+cY9J/edABfnpH1NJQPrDmbAoXgy7UeXv0NsjEqNIWlRvGl8Sjgo5WVkT
 dg5ieWBA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=it-klinger.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=it-klinger.de header.i=@it-klinger.de
 header.a=rsa-sha256 header.s=default2502 header.b=n0f9noCg
Subject: [Buildroot] [PATCH] package/ply: bump version to 2.4
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

Bump to new available version.

See: https://release-monitoring.org/project/143128
Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 package/ply/ply.hash | 2 +-
 package/ply/ply.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ply/ply.hash b/package/ply/ply.hash
index b6a56aa909..ee9a57462b 100644
--- a/package/ply/ply.hash
+++ b/package/ply/ply.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  99be1ed3942370699cbfc7f493bc3ffd4601312a81471215ac7ccb2e04a0a8b2  ply-2.3.0.tar.gz
+sha256  f7c1461f3c570c91f28b1d33424846ead0d6e4429e4a9ce4429db8f2327283a5  ply-2.4.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ply/ply.mk b/package/ply/ply.mk
index dc02fc5472..964765b918 100644
--- a/package/ply/ply.mk
+++ b/package/ply/ply.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PLY_VERSION = 2.3.0
+PLY_VERSION = 2.4.0
 PLY_SITE = $(call github,wkz,ply,$(PLY_VERSION))
 PLY_AUTORECONF = YES
 PLY_LICENSE = GPL-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
