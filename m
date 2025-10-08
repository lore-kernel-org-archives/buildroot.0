Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909EBCCD183
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 16:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B78460EB8;
	Wed,  8 Oct 2025 16:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA1M80DN3Cbo; Wed,  8 Oct 2025 16:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB92460EB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB92460EB6;
	Wed,  8 Oct 2025 16:23:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B8A119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D38F060E07
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnkiKsPwFKZd for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 16:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1550660E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1550660E5D
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1550660E5D
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6WwrvyUuj3rWi6Wwrve6nh; Wed, 08 Oct 2025 18:23:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  8 Oct 2025 18:23:25 +0200
Message-ID: <20251008162328.3569687-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
References: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNWeTNmg7nRikH5gf2s679btU26J3qptSA1IiQuvEbuHqlNb0ov7itdNRmypxwZ4gQxxKcVmVCke32/TQBF4m0bysCftgyab6KGD+PPPpp0rhycdFhQ3
 dI0XJs2Du/PTchB6HKnZOFwdGEIu+zwcA7sDWBopLWPwqxESo1n3bc3G2IrocePThPCwZ+XshDD1OgGEiHmaMmckM1o4KDHqQkvd2NZ/V4JAbCVISSR54rXN
 c/T/0eDj/h/Dun0mRz4tFChtLX/gK9bqVmG1C0iqGTFVya1qc9EM9et+NWZaVm6an2vej/6XTp8pGv5gP4y24JpeGfMuteONTURmvHmKcJIVINxgel9VBHg/
 A+bJDxW0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759940609; bh=z7EQu5uYcg76JdnSJXRl0uzGn6up87cZq+MkL74/cpY=;
 h=From:To:Subject:Date:MIME-Version;
 b=idMkmzz47MRL2MKS0x7tUwGyQbRRQoFTW4KnSQ7q7W5LG+26bg+B97BMEf2LxZ0kS
 cYMPfdp/UrzkOXwsdKRKXT6G2Ntnfmm60/uxR4MMVFTI0c7dQMMT4msQl18d+I16/v
 MUhk1kZVnPqZYW89mri/lCN8iUJSyfV9xOhxSIWOUkLCcIhboAM6PHzu4aoUDNWMXp
 O3yhB+0YZtWHLo74KdKlh5mk29IF9QhqWY8uOZJMAT+OewT0OxUxnB6Be+/h6QNyCE
 bMiyYhloJ5//2vcUsSboJKb+xxPvQ/e8p/PKd+irSik4NJzZiTcFz3KS5wX5XDjYwX
 xZwECaHf5EYWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=idMkmzz4
Subject: [Buildroot] [PATCH] package/rtl8723ds: bump to 2025-10-08 version
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
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index fa3c472f57..c2691402bd 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6cbe12b9ea2b816f52075cbcb402054ecd2cd984852b0da7bc82dfa2baa760e9  rtl8723ds-3ffabeef5e1af54ce3c19ce975ffd0dab731fd73.tar.gz
+sha256  338f0fe08acdd1352428d86f88366935e1b967b134f252ac9a3e50cc8922fe14  rtl8723ds-546ffb2cb735e0c33e765936721bd66dd58e6893.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index e3e020eb7b..14938daaf6 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 3ffabeef5e1af54ce3c19ce975ffd0dab731fd73
+RTL8723DS_VERSION = 546ffb2cb735e0c33e765936721bd66dd58e6893
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
