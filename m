Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB6FCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 16:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EA660EA4;
	Wed,  8 Oct 2025 16:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1T11ZCw5Foc; Wed,  8 Oct 2025 16:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A63360E7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A63360E7F;
	Wed,  8 Oct 2025 16:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA80D84
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04DBD40B5F
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Vb1aJgCGgxP for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 16:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1552D40B62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1552D40B62
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1552D40B62
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6WwrvyUuj3rWi6Wwsve6o7; Wed, 08 Oct 2025 18:23:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  8 Oct 2025 18:23:27 +0200
Message-ID: <20251008162328.3569687-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
References: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFlVDbbvg+bPFUlgXQ3mw7gBLxD3lCQhAeExq1/JVU5EUbAcwb5R73K9/jK/MJFpgKdESFuvva7mJ79xlcJz3lgfkJAXeKGqvfqY92zPflms45CkZBHN
 9t2tYoBnnXCx38oJtrB60E1MTiNisaZnks+wttmPKQJ67YjG59QDALYqsaxR+tnvHgsFpR2BBpeapw/3f8xrIB83QRogGPepx6EtSqknOu/Pv8MK5rfG6mnA
 hyD1e6CNW/RdVMA9RRHWsq5vGTnPAJaD/DOvSWuCG8JCM3WGJ1NOx51GU+Ms9QuCHXsu22uNq9UtEjfatZdpFVxDzPbehHCgwWa5ItOT/Kc7HpAQ8TCcWdym
 5kBD7jGR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759940610; bh=p/oSP1BvQ/AYJB2hsWfS4itLE2uFPS0fnxr9ImYDPr0=;
 h=From:To:Subject:Date:MIME-Version;
 b=FPAEzfxyS+BA6flYJZGxW8PvKEW2UeAMcwrg1/ddfpzyjwOaGVbrAo9n5bW56Q79T
 xV14MRY3rQKSIJ0hibY5la4jqUGzr3VpMK46THxdE1lPdq6pE+lQiIjbr7x0lIc1Aq
 nA7y1IKc09B+KdZuVffzlU0VW9rF540MiFsfLHsJ0sWnmlmWDllx3BDu8U50IgtQ8D
 tAfQs0tTI6XTFOuKW8nJ+uzx5IkbNDMk3+4tsNrGbKmHtkX7VWsepJb4YW8gVJJeas
 swKZD6+rjwcPxCCcZns+RiJfbu+TFYTUltdWL0Ghu5WsE2XHnGZHhvNOzd/XhMxrSa
 ZCT3tZslr8EYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FPAEzfxy
Subject: [Buildroot] [PATCH] package/rtl8821au: bump to 2025-10-08 version
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

This version allows to build with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 2796c50791..29b4d46f8e 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8d11753f88d670be7489fd1d5d30718543f4994ccc5031609f4408a5586ef3c  rtl8821au-4d39880a41201ddb14b19f2e7273054bb812b32e.tar.gz
+sha256  fe9840003e9481cf9fce3a5ed3f5b985615f862abc1b8d51fe6de7da9e4943c9  rtl8821au-dfe6801adb9b3a5572260ab308d3b69522992814.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index afd520b467..734b427019 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = 4d39880a41201ddb14b19f2e7273054bb812b32e
+RTL8821AU_VERSION = dfe6801adb9b3a5572260ab308d3b69522992814
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
