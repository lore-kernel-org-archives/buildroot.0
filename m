Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7180C5B542
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 21:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B70A810C1;
	Tue, 27 May 2025 21:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7QuvDlrYyCI; Tue, 27 May 2025 21:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8966481097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8966481097;
	Tue, 27 May 2025 21:13:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B7A819D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 21:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F092F605E6
 for <buildroot@buildroot.org>; Tue, 27 May 2025 21:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQJT6Y2CfaXL for <buildroot@buildroot.org>;
 Tue, 27 May 2025 21:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.101;
 helo=smtpcmd10101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E755460595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E755460595
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E755460595
 for <buildroot@buildroot.org>; Tue, 27 May 2025 21:13:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id K1cEuFyPs1ugbK1cEusa09; Tue, 27 May 2025 23:13:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 27 May 2025 23:13:42 +0200
Message-Id: <20250527211342.612688-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD/blrm6tT7dyhhQbCFnCLUmw3ns9og7QJNBP++iwLFw4xlOfEYKXI5cboVQZq/7sYpgEa8LOgyXjY2Vm7uFxJ8rZvUIEVFQdHMUdXBpN0CljA/zKz/q
 /yKa97VSqAs1HvtwZCcs/q16mNPoZ0lQEAuZi3omd8/k4i1wVdzWYZuj+7MRkrpGRBgjsne5XJcgfQzY1EroaNcI5SN/kMDlutBDUf4pGvPPCYOsttAlX4pc
 0p+kO6KNr41aPr4vu8RkzDkyHuCaSzCd+4+YTJGERBAcUQ6efPQKRgq/L00m+u28NwUE+H083IwzilYjcsD0GQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1748380423; bh=v8LcPKxv5VXfda60Dx+BI6tcfgyzhPwjCM1H0miNFN0=;
 h=From:To:Subject:Date:MIME-Version;
 b=TKz5gG+O1O2CXbrV3lkZ3cmz8gkgu2L1t/TfPsYUYnvRW7im2lEgyTNJsIkH+iqwa
 EqBuSbL5GIidNLPcgHmH4M+kxI20YjP60btl+0DE2D5mmOM7py0LURVG7AqUeagH17
 yboZaizNixhu39SSO3fQqojC+8iyTQThp6HQrKA9e9wxVCyKr6gmhZG8hUzuTNCVNS
 VX8gAdTGifeOIKW/ebcyakGFGo276iYhxsp35Rbn9IRMpDIg8LO/oEE4ddHGcPMiqY
 HIY8cHPaK+6Fe1U5x7A0id+DXR0y6i2jQQXBtjgAfSRu+K48V4fakGNBORv+K1lTb6
 rVWpZFDPx4DfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TKz5gG+O
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.112
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_112.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 03e91e4212..00bc5baa45 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_111_RTM/src/SHA256SUMS
-sha256  5a4d5a44e91ef03cdc0c4897cf616e3c92f4e590ea835d3e0ccad8b005bd73c6  nss-3.111.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_112_RTM/src/SHA256SUMS
+sha256  33ae72d43b275957252adc8639e84229d3ae692a57b6191b059d9456b8568a68  nss-3.112.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9e848aa332..8d7fc94207 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.111
+LIBNSS_VERSION = 3.112
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
