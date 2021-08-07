Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8CCC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:13:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D57A61004
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D57A61004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDB740400;
	Sat,  7 Aug 2021 18:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsq5o2Lteomh; Sat,  7 Aug 2021 18:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A78FF403E7;
	Sat,  7 Aug 2021 18:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58DD91BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63FCF40389
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VdAGFinBYvR for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 415E9401DE
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6F9778A496; Sat,  7 Aug 2021 18:11:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 20:11:25 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ea1c9842207c83eac582c428e9f72c9f2ec32b27
X-Git-Newrev: 71c1dbfa8ebe401fa3894adf94511d895ffe8ab0
X-Patchwork-Hint: ignore
Message-Id: <20210807181131.6F9778A496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/wireshark:
 security bump to version 3.4.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=71c1dbfa8ebe401fa3894adf94511d895ffe8ab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-22235: Crash in DNP dissector in Wireshark 3.4.0 to 3.4.6
and 3.2.0 to 3.2.14 allows denial of service via packet injection or
crafted capture file

https://www.wireshark.org/security/wnpa-sec-2021-06.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bb75c4b541fac144b53b63248e235f22ba1d25ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index ddb0f1954a..0876703e49 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.6.txt
-sha1  20596183210daeb0070ae43716529caf81c6187a  wireshark-3.4.6.tar.xz
-sha256  12a678208f8cb009e6b9d96026e41a6ef03c7ad086b9e1029f42053b249b4628  wireshark-3.4.6.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.7.txt
+sha1  3fa4bb774030442b9908243a9927d38479c52bf5  wireshark-3.4.7.tar.xz
+sha256  6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d  wireshark-3.4.7.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 8b0ab4bfbe..e852083de6 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.6
+WIRESHARK_VERSION = 3.4.7
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
