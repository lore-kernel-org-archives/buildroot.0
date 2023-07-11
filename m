Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30C4EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400AA41E8E;
	Tue, 11 Jul 2023 21:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 400AA41E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0225HlBmTB5; Tue, 11 Jul 2023 21:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDA941E7D;
	Tue, 11 Jul 2023 21:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDA941E7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37BEC1BF95F
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CEB841E69
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CEB841E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEivdx5kSFTz for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:31:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C9541E40
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55C9541E40
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:31:28 +0000 (UTC)
Received: from localhost.localdomain ([146.241.40.132])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JKxCq5TafLSVYJKxCqiIYY; Tue, 11 Jul 2023 23:31:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:31:24 +0200
Message-Id: <20230711213125.3587872-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFSi3MSAFCH4bATyqFTjbZNRnSDS+qXTQXp21Ld5/73ibyj5maQyNs9eIR4incTXex+x2y61REDqGDpYRMtd3jEisvcgInWRVj1K49kXXP2ZJn/gF/xC
 k1qXTQuesVUuzHyOhNnwLVkMaz3Vdt/a25BAKdfxy5UPjhkFPh/q7pf9FQX0J9f3eizM3spdMuz3p35fDxvHWc2V8i4ZdcUXix+oZ3SGsR5k6/6J+dVhAEqE
 tbZe+P81QlgXHFB8cxb/HWPtDBLuP6TrJ/gJe4LOV9VWvcZQjFJ9IO/7EVHIsh+uw80XU3pX8duuS6UFgZRRCO+7PyWWDUdGDiJV6758ZU+MQin8wMr8clOE
 BTLChkpD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689111086; bh=fCNieKQYLlOX/Gwey52r3YDV+Kkpc5GtDY8wSEjVho4=;
 h=From:To:Subject:Date:MIME-Version;
 b=OXT4JOlOGZ9eYvA2/O/obeCN6yNpxDeP2EXijhgI6UNKD/rZhjO8R19pf7ZqvmrHN
 p7iiYw3bYu++qe8Fux3iNkTlKOj+RRxNkI3V7gtEAiDasC2zbUHVTREP08kgEtAC4k
 BkEOMTdpbP9zkYprpH4zpl2lU82KsegG1Xu4p1gAiIM+pQuzXj7frrFPF+QyGMS1gP
 +FAwnmo7OQYnAcowEcKCHNCK3XQAO2Xb1IcpnW3kL3eFBv7iIcv4wMiit1c6k+2ucK
 vGh87SNhs5IUfxv9DlAf+90V9RQIPhntJbgASaQMLMk9dPa4/KpDhN8kIpmaiRTgYw
 ZdotKw0uO1g7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OXT4JOlO
Subject: [Buildroot] [PATCH] package/rtl8189es: bump version to 2023-07-08
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version fixes a wrong patching for Linux 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 64f6158654..4668c3832c 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  05d839c9b7820008bf7975c2f4a3dde6265dbae0c5dc48cefcee3a79492dc377  rtl8189es-ae7b31e55526ca0e01d2a3310118530bff4f1055.tar.gz
+sha256  0d59e75977a43e614c87e783d7af9d89b84063d8d0d1926820af427eacd01837  rtl8189es-05996691a5f3a61968a83f8b368454fd2c6885ca.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index a40f656d3e..e7bc915c79 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = ae7b31e55526ca0e01d2a3310118530bff4f1055
+RTL8189ES_VERSION = 05996691a5f3a61968a83f8b368454fd2c6885ca
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
