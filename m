Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582ABCE7A89
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052AD81EA9;
	Mon, 25 Sep 2023 05:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052AD81EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJXuimnSApIg; Mon, 25 Sep 2023 05:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5439281E9C;
	Mon, 25 Sep 2023 05:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5439281E9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBCFD1BF3BB
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AA3081E9E
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AA3081E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njNLmIOZZ7CN for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:40:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2CFE81E86
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2CFE81E86
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E63B876B3; Mon, 25 Sep 2023 05:40:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 07:30:27 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9fba48c8dfcdd969a77272ccfe327d0349d8ce0d
X-Git-Newrev: 5b9debd5681fd3d3c5fa798114688716a5832078
X-Patchwork-Hint: ignore
Message-Id: <20230925054034.8E63B876B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wireshark:
 security bump to version 4.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b9debd5681fd3d3c5fa798114688716a5832078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-3648 and CVE-2023-3649

https://www.wireshark.org/security/wnpa-sec-2023-21
https://www.wireshark.org/security/wnpa-sec-2023-22
https://www.wireshark.org/security/wnpa-sec-2023-23
https://www.wireshark.org/security/wnpa-sec-2023-24
https://www.wireshark.org/security/wnpa-sec-2023-25
https://www.wireshark.org/security/wnpa-sec-2023-26
https://www.wireshark.org/docs/relnotes/wireshark-4.0.7.html
https://www.wireshark.org/docs/relnotes/wireshark-4.0.8.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit de0f8c66adae6f60914bf2144e9b88eeee21718e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 6598f51f53..f044f99483 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.6.txt
-sha1  a60b6f8063df2a711932ba869ae86e6476087cf0  wireshark-4.0.6.tar.xz
-sha256  0079097a1b17ebc7250a73563f984c13327dac5016b7d53165810fbcca4bd884  wireshark-4.0.6.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.8.txt
+sha1  8ca1cc4471d0cb835cd5216833c393fa23bc154f  wireshark-4.0.8.tar.xz
+sha256  16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8  wireshark-4.0.8.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 80a986cfa3..500bdbb77a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.6
+WIRESHARK_VERSION = 4.0.8
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
