Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D810C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 05:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E214C402E6;
	Tue, 29 Aug 2023 05:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E214C402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrmfuwWj-7MN; Tue, 29 Aug 2023 05:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A14B4016B;
	Tue, 29 Aug 2023 05:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A14B4016B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39C0D1BF317
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 05:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA6A4016B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 05:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA6A4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdA-wBJSfs4q for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 05:16:42 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07131400EC
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 05:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07131400EC
Received: from fli4l.lan.fli4l (p54a1b6f9.dip0.t-ipconnect.de [84.161.182.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD4C8A4C0753
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 07:16:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56660)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qar5j-0001jI-1W
 for buildroot@buildroot.org; Tue, 29 Aug 2023 07:16:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 07:16:39 +0200
Message-Id: <20230829051639.21063-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693286199;
 bh=HaMbElRGPyisZ7qMgDPkU6X//8Wg+AMwpJfC6BnxsMw=;
 h=From:To:Subject:Date:From;
 b=abPf2Ja4f81uCPtrxRe0nfwE2fMuAgpyb0IDGf7hFjVwGxi0+zrDhiOUg3he0f0E7
 8pC4WRwSDlyr4HmUjLnDgpCjGTNr3331YND5EiyOu6cH0LKjySOm6ppiYICHtubOGB
 rv4TSO+6VpycXrvzrJnjcCqAmHcPXrKEW41T7E6NoJyigU7ZuoJf/vewetAOIKPrOT
 yIWydFzm5LFV1liCAy70tlQbYgPB+8L/+LJK79EBk+mdNrqOoB0av7Sey1SPz9Gib9
 61V1XFYU2jPIl7jt7odCUQbuGc54X3YdSYQE23R1qur28d53jBiI2PyeeA3+uUJXfq
 +Pt7Y5r8EnOJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=abPf2Ja4
Subject: [Buildroot] [PATCH/next 1/1] package/unrar: bump version to 6.2.10
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

According to https://www.rarlab.com/vuln_rev3_names.html this package
is not affected by CVE-2023-40477.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index bc8f986875..f0600af771 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0c2d4cbc8b34d0e3bec7b474e0f52bbcc6c4320ec089b4141223ee355f63c318  unrarsrc-6.2.6.tar.gz
+sha256  55fe6ebd5e48d6655bfda3fd19b55438ca05e13c7e69772420caad9fdb68ef42  unrarsrc-6.2.10.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index f59d199558..ac19225937 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.2.6
+UNRAR_VERSION = 6.2.10
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
