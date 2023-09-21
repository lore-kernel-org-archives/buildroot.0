Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B71E7071B
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 11:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27CC81AC4;
	Thu, 21 Sep 2023 11:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F27CC81AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-Mmkgu04ghs; Thu, 21 Sep 2023 11:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8C08142A;
	Thu, 21 Sep 2023 11:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8C08142A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4802C1BF3C8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 11:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D10441EF3
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 11:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D10441EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2dI-cO0DMq8 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 11:10:21 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AED8241ED1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AED8241ED1
Received: from localhost.localdomain ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jHZYqToYlhgyOjHZZqiaHv; Thu, 21 Sep 2023 13:10:17 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 13:10:16 +0200
Message-Id: <20230921111016.1041614-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBij+iGU7GfDHO+I5HtKcOi7E8U/KCzm5AuhwyhMhOozxg5jkZ+PRnLxfrqs9vUyg96c+OKkHXj4NE9xFFxovCyyL0q01L8SO2p7tSRXk1KnU6n69t9E
 4YZlSOH+TlqMLd76qBe7zKLJNEJtNRgBhFmBlk+yQsLeD9PQQkkvPjT5mgucrn1lvl6TLkCr9zy+fyph+enIY2Nz50wU1twnZb/N8VwDkRl8VsQZ98MAZae0
 mYpZOggVYvf27U7UEQi7ORUVsHoN284cGKl7YsT/CvFd160GXS2Khw/CR0lb54Mt
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695294617; bh=zPUhGjrmDVb5BOBqx/dnTiFAfJWWdfuNsuMV5B6ocv4=;
 h=From:To:Subject:Date:MIME-Version;
 b=ALDDxjdbBybVzwSkilPpIqH2vZ1l2agCo2T5hM3ETGNncaQbIR+1fnmhRVsfbxlvY
 NJg2qosHpo+Dg8x7tVUIMUUvB8yWMMKDsVt3xqJ1PcWs5DVMSOr64517Ys5ieFcQG6
 kX8dgU496QaOUMWbJrTbWQ438/bBLOAlHI4FrBJjEPDmhVhuCyW2OhDFqqVqS9tzyJ
 Y8onv24rrKBQzwfZaHDu3Mm31Y08uDkMnEUeohEtLxcTWebAsPrF8ngqxf2/w9poje
 jAQz+HHyUF5FwdEj5sg2IMeIcimT+6dcs3a6iWfRarTSDkgLBYcZY/yYKfFNzXvdVq
 OyXuCAT6+B5Lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ALDDxjdb
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build failure on s390x
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x doesn't support Wi-Fi on Linux so let's disable the package for such
architecture.

Fixes:
http://autobuild.buildroot.net/results/f52e8a14330ff281a7096baa47f387f8c1859345

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
index 43c802fa44..42e1afa8c5 100644
--- a/package/esp-hosted/Config.in
+++ b/package/esp-hosted/Config.in
@@ -1,8 +1,10 @@
 comment "esp-hosted needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_ESP_HOSTED
 	bool "esp-hosted"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  This package builds and installs the Linux kernel driver for
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
