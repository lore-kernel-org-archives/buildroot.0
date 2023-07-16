Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8F4EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D5581E4A;
	Sun, 16 Jul 2023 09:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D5581E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E37fFCNT3dfd; Sun, 16 Jul 2023 09:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A56681BB2;
	Sun, 16 Jul 2023 09:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A56681BB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E08F1BF33E
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 557B240354
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 557B240354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kd3-YF4PO32N for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:16:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B6740272
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B6740272
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7487884BD4; Sun, 16 Jul 2023 09:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 11:12:48 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 5f07925767271269dcba95da5c14db25b2aa62d4
X-Git-Newrev: e3b6770a7a156602baa7a0b20faea1238d3f0ddf
X-Patchwork-Hint: ignore
Message-Id: <20230716091659.7487884BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/wireshark:
 security bump to version 4.0.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3b6770a7a156602baa7a0b20faea1238d3f0ddf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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

[Peter: refer to SIGNATURES files now that it is again fixed]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit af25796d49cf36ad0cd3a4bf6fc71eed6b10d450)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index d89caa5de8..6598f51f53 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.4.txt
-sha1  ae3c28d6966c420ee3a8d058ea212a1b6adab50f  wireshark-4.0.4.tar.xz
-sha256  a4a09f6564f00639036ffe5064ac4dc2176adfa3e484c539c9c73f835436e74b  wireshark-4.0.4.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.6.txt
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
