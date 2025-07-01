Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE80C8303C
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AF9141740;
	Tue,  1 Jul 2025 19:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adgMpze_jy6r; Tue,  1 Jul 2025 19:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522FF41B64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 522FF41B64;
	Tue,  1 Jul 2025 19:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA2E2179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B79AF60BB7
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeDYklDiTPgX for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E47860DD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E47860DD7
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E47860DD7
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgLSuTx4S8eo9WgLUuLwxx; Tue, 01 Jul 2025 21:08:44 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  1 Jul 2025 21:08:41 +0200
Message-Id: <20250701190841.714026-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBk8PHDTqGd+iBXtlDbxHw5H25+AJldgoT1NcoW0A4JzFExoDJ8+MRhfLUXy2Fai1BjS3l7MwGhokOyfFDSp9W8Ue3f85TUEklNda3J6ApQz4lyJ0KP+
 QDjmBOM3LLQUgwjfH/OwYC+qCkRCm0Ysqc7qaTQGa13bOixeU2mnmVd7Lqs15bWzIL+dqPTfh2ZWo1VFxSUrGnbQgGf9O4DliLt3HmAXXv/EAFCb28gFan8B
 1JmkALFSf8BObOH+MGCUcWmno+/4ySeMhc1MmlTg2bdx9t3UR6IOnsT+bmZzA/355V/2+9OOsviG1By9eIWA8TTDlbRxr+Q0sxvBCX8hgMVcS8DOjrBx1N1V
 9i4A0kQSy0Qrod2jMl8TxY700AuYhUraiHWoYoLOobHQT225cUoO11hNsUYytqWFDOzGly/f
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751396924; bh=oQafLfhGJdnhIGkgGB5RmdoyW0tBnr1kmS1ykxPEtbQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=AUi8Y3lkihActxdLNAVaTbXJ9f8f6almYgbGPewbeGxSVDa6qNuxu7wr3uLrMj5B+
 GlbiBOHTcnyB75h43ZDh1mKXSSkHdyDZTNwWFpOVf+5G9q//+dj9nfjTTVWhiJ4DQX
 a1CK9PNvDvGthH3bBhPVTpFoA/GkiAmid7G/IeFScv0kMLxJfGz4/sLwNm5y/QITLi
 eqZ0X2j1kl7k2cXCnORV8+t9jbwjavuqC9zo4pQ8hBNVzedJjZ2VfsNEgffZw8r5Lt
 l9oVNSwf+JrctiL+x5GlvNh6pLH1ZC6Fw6BzJRNN58ZpQgdVrqsQcuNmMWjgBxrlYm
 FJRIw0MXGCjnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=AUi8Y3lk
Subject: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.15
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

Add 2 local patches pending upstream to fix build failure with Linux 6.15.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0012-Fix-build-with-Linux-6.14.patch      |  33 ++++
 .../0013-Fix-build-with-Linux-6.15.patch      | 177 ++++++++++++++++++
 2 files changed, 210 insertions(+)
 create mode 100644 package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch
 create mode 100644 package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch

diff --git a/package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch b/package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch
new file mode 100644
index 0000000000..adcbab4a59
--- /dev/null
+++ b/package/wilc-driver/0012-Fix-build-with-Linux-6.14.patch
@@ -0,0 +1,33 @@
+From ea7bdf9c6f37dbed0d7e7a94bd5d6ec20593eb02 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 1 Jul 2025 19:25:19 +0200
+Subject: [PATCH] Fix build with Linux 6.14
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
+adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
+cfg80211_rtw_get_txpower() according to Linux version.
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/9
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 5c92062..0e1375c 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -2230,6 +2230,9 @@ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+ }
+ 
+ static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
++			unsigned int link_id,
++#endif
+ 			int *dbm)
+ {
+ 	int ret;
+-- 
+2.39.5
+
diff --git a/package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch b/package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch
new file mode 100644
index 0000000000..2baac53dfc
--- /dev/null
+++ b/package/wilc-driver/0013-Fix-build-with-Linux-6.15.patch
@@ -0,0 +1,177 @@
+From acdbd9268841a5c0bac477418bb39707d9602957 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 1 Jul 2025 19:27:01 +0200
+Subject: [PATCH] Fix build with Linux 6.15
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8fa7292fee5c5240402371ea89ab285ec856c916
+drops del_timer_sync() in favor of timer_delete{_sync}() so let's backport
+locally functions del_timer{_sync}() when Linux version is 6.15.0 or later.
+Let's also backport crc7_be() and crc_itu_t() sinsce are not selectable
+anymore in kernel since commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5a40fcf82c1d3f26910ebe1c62fec8ae3b85f02
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/9
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ netdev.h |  13 +++++++
+ spi.c    | 115 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 128 insertions(+)
+
+diff --git a/netdev.h b/netdev.h
+index f06d45a..607a3b5 100644
+--- a/netdev.h
++++ b/netdev.h
+@@ -13,6 +13,19 @@
+ #include <net/ieee80211_radiotap.h>
+ #include <linux/if_arp.h>
+ #include <linux/gpio/consumer.h>
++#include <linux/version.h>
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
++static inline int del_timer_sync(struct timer_list *timer)
++{
++	return timer_delete_sync(timer);
++}
++
++static inline int del_timer(struct timer_list *timer)
++{
++	return timer_delete(timer);
++}
++#endif
+ 
+ #include "hif.h"
+ #include "wlan.h"
+diff --git a/spi.c b/spi.c
+index f7b43e2..5443633 100644
+--- a/spi.c
++++ b/spi.c
+@@ -9,10 +9,125 @@
+ #include <linux/module.h>
+ #include <linux/crc7.h>
+ #include <linux/crc-itu-t.h>
++#include <linux/version.h>
+ 
+ #include "netdev.h"
+ #include "cfg80211.h"
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
++/*
++ * Table for CRC-7 (polynomial x^7 + x^3 + 1).
++ * This is a big-endian CRC (msbit is highest power of x),
++ * aligned so the msbit of the byte is the x^6 coefficient
++ * and the lsbit is not used.
++ */
++static const u8 crc7_be_syndrome_table[256] = {
++    0x00, 0x12, 0x24, 0x36, 0x48, 0x5a, 0x6c, 0x7e,
++    0x90, 0x82, 0xb4, 0xa6, 0xd8, 0xca, 0xfc, 0xee,
++    0x32, 0x20, 0x16, 0x04, 0x7a, 0x68, 0x5e, 0x4c,
++    0xa2, 0xb0, 0x86, 0x94, 0xea, 0xf8, 0xce, 0xdc,
++    0x64, 0x76, 0x40, 0x52, 0x2c, 0x3e, 0x08, 0x1a,
++    0xf4, 0xe6, 0xd0, 0xc2, 0xbc, 0xae, 0x98, 0x8a,
++    0x56, 0x44, 0x72, 0x60, 0x1e, 0x0c, 0x3a, 0x28,
++    0xc6, 0xd4, 0xe2, 0xf0, 0x8e, 0x9c, 0xaa, 0xb8,
++    0xc8, 0xda, 0xec, 0xfe, 0x80, 0x92, 0xa4, 0xb6,
++    0x58, 0x4a, 0x7c, 0x6e, 0x10, 0x02, 0x34, 0x26,
++    0xfa, 0xe8, 0xde, 0xcc, 0xb2, 0xa0, 0x96, 0x84,
++    0x6a, 0x78, 0x4e, 0x5c, 0x22, 0x30, 0x06, 0x14,
++    0xac, 0xbe, 0x88, 0x9a, 0xe4, 0xf6, 0xc0, 0xd2,
++    0x3c, 0x2e, 0x18, 0x0a, 0x74, 0x66, 0x50, 0x42,
++    0x9e, 0x8c, 0xba, 0xa8, 0xd6, 0xc4, 0xf2, 0xe0,
++    0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62, 0x70,
++    0x82, 0x90, 0xa6, 0xb4, 0xca, 0xd8, 0xee, 0xfc,
++    0x12, 0x00, 0x36, 0x24, 0x5a, 0x48, 0x7e, 0x6c,
++    0xb0, 0xa2, 0x94, 0x86, 0xf8, 0xea, 0xdc, 0xce,
++    0x20, 0x32, 0x04, 0x16, 0x68, 0x7a, 0x4c, 0x5e,
++    0xe6, 0xf4, 0xc2, 0xd0, 0xae, 0xbc, 0x8a, 0x98,
++    0x76, 0x64, 0x52, 0x40, 0x3e, 0x2c, 0x1a, 0x08,
++    0xd4, 0xc6, 0xf0, 0xe2, 0x9c, 0x8e, 0xb8, 0xaa,
++    0x44, 0x56, 0x60, 0x72, 0x0c, 0x1e, 0x28, 0x3a,
++    0x4a, 0x58, 0x6e, 0x7c, 0x02, 0x10, 0x26, 0x34,
++    0xda, 0xc8, 0xfe, 0xec, 0x92, 0x80, 0xb6, 0xa4,
++    0x78, 0x6a, 0x5c, 0x4e, 0x30, 0x22, 0x14, 0x06,
++    0xe8, 0xfa, 0xcc, 0xde, 0xa0, 0xb2, 0x84, 0x96,
++    0x2e, 0x3c, 0x0a, 0x18, 0x66, 0x74, 0x42, 0x50,
++    0xbe, 0xac, 0x9a, 0x88, 0xf6, 0xe4, 0xd2, 0xc0,
++    0x1c, 0x0e, 0x38, 0x2a, 0x54, 0x46, 0x70, 0x62,
++    0x8c, 0x9e, 0xa8, 0xba, 0xc4, 0xd6, 0xe0, 0xf2
++};
++
++/**
++ * crc7_be - update the CRC7 for the data buffer
++ * @crc:     previous CRC7 value
++ * @buffer:  data pointer
++ * @len:     number of bytes in the buffer
++ * Context: any
++ *
++ * Returns the updated CRC7 value.
++ * The CRC7 is left-aligned in the byte (the lsbit is always 0), as that
++ * makes the computation easier, and all callers want it in that form.
++ *
++ */
++u8 crc7_be(u8 crc, const u8 *buffer, size_t len)
++{
++    while (len--)
++	crc = crc7_be_syndrome_table[crc ^ *buffer++];
++    return crc;
++}
++
++/* CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^5 + 1) */
++const u16 crc_itu_t_table[256] = {
++    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
++    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
++    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
++    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
++    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
++    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
++    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
++    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
++    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
++    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
++    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
++    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
++    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
++    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
++    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
++    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
++    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
++    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
++    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
++    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
++    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
++    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
++    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
++    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
++    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
++    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
++    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
++    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
++    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
++    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
++    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
++    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0
++};
++
++/**
++ * crc_itu_t - Compute the CRC-ITU-T for the data buffer
++ *
++ * @crc:     previous CRC value
++ * @buffer:  data pointer
++ * @len:     number of bytes in the buffer
++ *
++ * Returns the updated CRC value
++ */
++u16 crc_itu_t(u16 crc, const u8 *buffer, size_t len)
++{
++    while (len--)
++	crc = crc_itu_t_byte(crc, *buffer++);
++    return crc;
++}
++#endif
++
+ static bool enable_crc7;	/* protect SPI commands with CRC7 */
+ module_param(enable_crc7, bool, 0644);
+ MODULE_PARM_DESC(enable_crc7,
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
