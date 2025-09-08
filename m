Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA9CCAC582
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 19:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E17E3409D8;
	Mon,  8 Sep 2025 19:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbG0CtNUqAAB; Mon,  8 Sep 2025 19:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4234E409BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4234E409BB;
	Mon,  8 Sep 2025 19:24:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A3D1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB53380A67
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt1FXHIMnz6S for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37D7380984
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D7380984
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37D7380984
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:39 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id vhTgurtBI6z5ZvhTgunOaK; Mon, 08 Sep 2025 21:24:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  8 Sep 2025 21:24:32 +0200
Message-ID: <20250908192435.214306-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI91JVxf31JyvtVlFGtcy7PD1RiyzdtWj4t5othCyAEAKTRBBA9u/Np1rp9nwKQ5tuQSNTrCKKLDly5UHhzoodJNnxyKHa4FLbhriO4Xzy5W1BgaVHXn
 QKqB13j6gFp+52jmwkKIuHh55PCcFhKpO8sa7wfds5Yw0crCLaRn/CYXEDYpBaHV995smfCqDIqARmJ13P6fDWtpyBA4hNS+/0uS0MJ3R9oL5bVnPJVc93uB
 bxF65eVqNW6dwR35GBKe1Ig+Y2qIF/lbe1wHhSpM5fHE7evsbF1N5hWGlCnuXnWQDewQhMFxZzaDDyMZHbhGf5PuiGK89rQtermdu56Gm6e/vwHY+olwz37w
 ezASyjjBKlFTJIt9x0AxtQippTH9sXDbEN2JMn7Tjx0AIKSKLqDVkefgCU/kHoyecTHqrNzM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757359477; bh=vZS5WOoehfshfO9GBaVo8lb7KadcPbfvY8ABDkYkV5Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=iJwZq1KwwmsMEjyrx/eDDNldX7mUjHz5I4DstE84UiPeo1ZudyB9+RDQ3Fpy5xdXP
 efuAPZuAFqMHt5ikh4DLbzuqvn+szqcRqRVgKI+FK4lXPe7LS0O1Tr5Fok51PxJeTX
 x3TNyePExp/ANoqSjKm3V6Xq/31nCrHM61P4FnJbUqxUwzM1jV0MTDqIGE6B44ERsG
 W89HqXqoMVdEG+brMsyaLrZNpwjAPjuiObd3wnZGHIvJUsf9a7S1AYvGeCx+xTWIvr
 WBbwjETdwnNp3RAZ5mvNC/fb8ldH2aWQav3HOMz/KbOkk+0U4CjpYtbm3uzs87wlai
 YymJHz/cnqGtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iJwZq1Kw
Subject: [Buildroot] [PATCH] package/rtl8723ds: bump to 2025-09-08 version
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

This version allows to build with Linux 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index d647f9ff28..fa3c472f57 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  97231efcd0e36b8a95c7baf2aa387fd9cf8303ddd66ce463f25c83f9f989e405  rtl8723ds-97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a.tar.gz
+sha256  6cbe12b9ea2b816f52075cbcb402054ecd2cd984852b0da7bc82dfa2baa760e9  rtl8723ds-3ffabeef5e1af54ce3c19ce975ffd0dab731fd73.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 67104fd5d7..e3e020eb7b 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a
+RTL8723DS_VERSION = 3ffabeef5e1af54ce3c19ce975ffd0dab731fd73
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
