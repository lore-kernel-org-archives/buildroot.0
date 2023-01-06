Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADD4C4708E
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 01:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C1D60AB0;
	Fri,  6 Jan 2023 01:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23C1D60AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVlSBn2ShZGa; Fri,  6 Jan 2023 01:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEE0C60ABB;
	Fri,  6 Jan 2023 01:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEE0C60ABB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD80A1BF36E
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 01:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7CE441B49
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 01:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7CE441B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrWoO4jWhcWR for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 01:21:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FEA41B46
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57FEA41B46
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 01:21:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DbQMprw6k6OgZDbQMpis4e; Fri, 06 Jan 2023 02:21:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 02:21:33 +0100
Message-Id: <20230106012133.2431588-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIAh8332cPSJ82NOyprYOsQ2w0LBNKyayEmcZ41VqYkgFmYjMwkzcea8N8RmmIXyGhZx+h4P2JUGom5uTKQiFp/VqyDnPS2UkabZpUF27niyUKNjKN93
 QWLnqnzhxPgz4l8zPAfU/R2GGQ8/JSNPir+8tvfQh8l1rDlWikVkHJjbEkMErQj74bsG9LoL4krxVLhahPoiOGi8ImTCRin9IiFX5s3b9asKrYzgSuRRZRMc
 pOSFoS7RXZs4mgAJ5wIS+qpk2VrCLjjS0UMKrzPukhRSYVRz4lpf3TDA3MxS8NSgyHfXNC3xmY+p+yh3u1LKxA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672968094; bh=zH7Cgneh9B7oQYjZQHRG0Jpy94cxvLOO5tOC+Vv2RXk=;
 h=From:To:Subject:Date:MIME-Version;
 b=c6RKUQ1hLGpDB6TrFCO5SO1MwMP8fhJ1Wu8zZyhJNGVlE6xsd+Dqh8gyy4Q05nkEI
 ijY0jQRKmATH2TFGUWSbcNx9pg/qbFdi3CcnLGEfNkh/Ho5rKc7rkNY04wDrP5jq9M
 ADF287a8ylbxJsFZMZkiup7eN1WJ5G1YJ2p4IZj0hBizNYmHjpWvTTPXDRSncy6SxB
 48KV/CzC7zWXBPkPmcPsTmDhvvMEEN7piuYi3TP9HmiLp8O5eJiZLxgb2kgOs1UlAB
 WibMBAA2KZeeQJJ26fTPNGvs32gDZpFGHjoJrQYgRoq7iqZNPYMYkaqVmcKooL0QUv
 SNxDXj9oVuuPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=c6RKUQ1h
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.87
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 50c5e583af..f847ec4f77 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_86_RTM/src/SHA256SUMS
-sha256  3f385fc686476bbba811035fa6821b542475d55747b18c20c221d4d66573b975  nss-3.86.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_87_RTM/src/SHA256SUMS
+sha256  68a1894496d3d158babc75f8a5dda3f55b7c1560573936e3b101a10fa4ac152d  nss-3.87.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index f8fe076fe9..a60e615f9a 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.86
+LIBNSS_VERSION = 3.87
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
