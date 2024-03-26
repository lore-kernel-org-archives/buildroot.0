Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12832CD11DF
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 22:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BFE0408CC;
	Tue, 26 Mar 2024 22:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpWd_hBBcvbE; Tue, 26 Mar 2024 22:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70CA0408F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70CA0408F1;
	Tue, 26 Mar 2024 22:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05B941BF2AF
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 22:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4FB240569
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 22:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lcq6Je9x6R_7 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 22:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56E8E4053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E8E4053D
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56E8E4053D
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 22:50:35 +0000 (UTC)
Received: from localhost.localdomain ([79.54.175.3])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pFclr9KIiJAuQpFcmrBn6f; Tue, 26 Mar 2024 23:50:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 23:50:30 +0100
Message-Id: <20240326225031.224022-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
References: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIvAxgoedLNsciNceAscyJSUuJ1QIicUGclQ7QHck6dwgr0PQAcMYoNLKGrsoEGCQ38ie30lIHF50BhUofwgWKNftf0WkmWq45LNU+q4SduIHbNMxEXg
 Me+cxUqqvhY8Bm7X1IfuwJ/22Ee58BrsPU4nlrs0CPgAobH8TBG+W8B3QhFjHZffP1dvIPQCVItbYTQCIK9BsgsB90YR383CXF41sqqjN2wvL7mO74a71Vjb
 t58SLHsDaYcWc8TN8ibxXIbADCEYqJZbVZ98bDv+1hQI6Obi+lViLsbCi70qoDWPClsHCdqECEGewNaX1+waxfI/G/b3FwaAoEjSG+ILyWueoPub7vVWhxi2
 iGKnztXp
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1711493432; bh=QEBz+DAZXkfHe6l5MnUkqphFHjwbqQSmXx2zSPFnDK0=;
 h=From:To:Subject:Date:MIME-Version;
 b=heu5gdh2T1GydqrIbFovpN0QURG8iVzdebslY18dQapdz8Lz4zyWq1Ki3Q/aoNISk
 wWQSGZwxrx7vKiOOX9zP+MJVxWbh4WN83nHbLR/r9HmhCqycqW8mdR8kKJueEz+nr/
 ESP/hL/kEFWEoPNXbZGbXUycKMNsTourkwItSFQZJDpVnb4Kbbf3E9hRVY5mjpW46o
 gGnt6GWDSA9Ofhu9wBbOTXRDStcWivXxhT+pL65T+Y6bBC6OH/LyKPNIYGYt6gGT9l
 zHb20G4N4Pcn3HNUV+Yi/8jHAU8WzLeUMxFG9UuXlfFF2XkpbSATUYd8FIkn+parTB
 AIurP9zWqqCgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=heu5gdh2
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2024-03-25 version
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
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version allows to build with Linux 6.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index a08ed04010..a8b7cb9358 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b5d3b8de0b4f05aa2b452dd01f4386e9b671e03c2bbf8e032f1c593befc5a153  rtl8192eu-e90a6043be141bde8847e84223e106eff38ecdfd.tar.gz
+sha256  8da0f54bd9ae094b5f61fe3c4dd207b2df62b4286970e2828f7c5ce1146447fb  rtl8192eu-56f672a8b9572c743148f2e60068fd341d52d5a3.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 3d24b0caf8..0f00d301a8 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = e90a6043be141bde8847e84223e106eff38ecdfd
+RTL8192EU_VERSION = 56f672a8b9572c743148f2e60068fd341d52d5a3
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
