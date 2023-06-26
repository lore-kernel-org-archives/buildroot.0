Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF38EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 06:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE1CB60AD8;
	Mon, 26 Jun 2023 06:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE1CB60AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynCTHhkCg4Qb; Mon, 26 Jun 2023 06:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C647560B8A;
	Mon, 26 Jun 2023 06:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C647560B8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38EE51BF27C
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 06:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FEF140C1F
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 06:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FEF140C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUma55PSTedv for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 06:58:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17F340525
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E17F340525
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 06:58:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0042CCD1E8
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 06:52:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C386E0006;
 Mon, 26 Jun 2023 06:52:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qDg5U-008Fl5-7m; Mon, 26 Jun 2023 08:52:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 08:52:31 +0200
Message-Id: <20230626065231.1967152-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wireshark: security bump to version
 4.0.6
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

Fixes the following security issues:

- CVE-2023-1992: The RPC over RDMA dissector could crash
  https://www.wireshark.org/security/wnpa-sec-2023-09.html

- CVE-2023-1993: The LISP dissector could go into a large loop
  https://www.wireshark.org/security/wnpa-sec-2023-10.html

- CVE-2023-1994: The GQUIC dissector could crash
  https://www.wireshark.org/security/wnpa-sec-2023-11.html

- CVE-2023-2855: The Candump log file parser could crash
  https://www.wireshark.org/security/wnpa-sec-2023-12.html

- CVE-2023-2857: The BLF file parser could crash
  https://www.wireshark.org/security/wnpa-sec-2023-13.html

- The GDSDB dissector could go into an infinite loop
  https://www.wireshark.org/security/wnpa-sec-2023-14.html

- CVE-2023-2858: The NetScaler file parser could crash
  https://www.wireshark.org/security/wnpa-sec-2023-15.html

- CVE-2023-2856: The VMS TCPIPtrace file parser could crash
  https://www.wireshark.org/security/wnpa-sec-2023-16.html

- CVE-2023-2854: The BLF file parser could crash
  https://www.wireshark.org/security/wnpa-sec-2023-17.html

- CVE-2023-0666: The RTPS dissector could crash
  https://www.wireshark.org/security/wnpa-sec-2023-18.html

- CVE-2023-0668: The IEEE C37.118 Synchrophasor dissector could crash
  https://www.wireshark.org/security/wnpa-sec-2023-19.html

- The XRA dissector could go into an infinite loo
  https://www.wireshark.org/security/wnpa-sec-2023-20.html

The SIGNATURES-4.0.6.txt file seems to be corrupted, so instead refer to the
announcement mail.  Issue reported upstream:

https://gitlab.com/wireshark/wireshark/-/issues/19169

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index d89caa5de8..3bab652ab3 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.4.txt
-sha1  ae3c28d6966c420ee3a8d058ea212a1b6adab50f  wireshark-4.0.4.tar.xz
-sha256  a4a09f6564f00639036ffe5064ac4dc2176adfa3e484c539c9c73f835436e74b  wireshark-4.0.4.tar.xz
+# From https://www.wireshark.org/lists/wireshark-announce/202305/msg00000.html
+sha1  a60b6f8063df2a711932ba869ae86e6476087cf0  wireshark-4.0.6.tar.xz
+sha256  0079097a1b17ebc7250a73563f984c13327dac5016b7d53165810fbcca4bd884  wireshark-4.0.6.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index f5a8e1f070..80a986cfa3 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.4
+WIRESHARK_VERSION = 4.0.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
