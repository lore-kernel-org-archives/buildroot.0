Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A13EC77B6C
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 19:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D264062A;
	Sat,  8 Apr 2023 19:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D264062A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fqslt-KyB6at; Sat,  8 Apr 2023 19:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 126C240649;
	Sat,  8 Apr 2023 19:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 126C240649
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EACA1BF82F
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68BFD84262
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 19:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BFD84262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzklODO4oUhL for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 19:48:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 943C884213
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 19:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943C884213
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BC15838EB; Sat,  8 Apr 2023 19:48:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Apr 2023 21:44:32 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 373b98b5a85466f60bf637eea4d2913522b97775
X-Git-Newrev: 021eba76f03e823591f5a0ce680623522cd55529
X-Patchwork-Hint: ignore
Message-Id: <20230408194805.7BC15838EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wireshark:
 security bump to version 4.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=021eba76f03e823591f5a0ce680623522cd55529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-1161: ISO 15765 and ISO 10681 dissector crash in Wireshark
4.0.0 to 4.0.3 and 3.6.0 to 3.6.11 allows denial of service via packet
injection or crafted capture file

https://www.wireshark.org/security/wnpa-sec-2023-08.html
https://www.wireshark.org/news/20230302.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9d39b2aed23dc822cfa56e6cc54fe605e0fd99d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7128b560ae..d89caa5de8 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.3.txt
-sha1  243b0057cfe6d447662e81b5646110aaf8b63c81  wireshark-4.0.3.tar.xz
-sha256  6c51e15bcc0afb93734e686dbff354ffd159f570bd2904bcbbad6f3feb7e9511  wireshark-4.0.3.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.4.txt
+sha1  ae3c28d6966c420ee3a8d058ea212a1b6adab50f  wireshark-4.0.4.tar.xz
+sha256  a4a09f6564f00639036ffe5064ac4dc2176adfa3e484c539c9c73f835436e74b  wireshark-4.0.4.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 12c36575df..f5a8e1f070 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.3
+WIRESHARK_VERSION = 4.0.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
