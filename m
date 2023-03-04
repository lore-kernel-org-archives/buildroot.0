Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C135BC678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 10:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ED61418F6;
	Sat,  4 Mar 2023 10:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED61418F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n70zaeGihISF; Sat,  4 Mar 2023 10:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBA941901;
	Sat,  4 Mar 2023 10:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BBA941901
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 132F91BF853
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 10:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E294240443
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E294240443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcmUCNMIj-VO for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 297B340438
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297B340438
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19015860BA; Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 10:02:57 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0ec207bed529f815779597d07aed823f1a62a5c2
X-Git-Newrev: 62b2303df35faaabcbe7e0f451ec77f4c40e7b56
X-Patchwork-Hint: ignore
Message-Id: <20230304104624.19015860BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/apr-util:
 security bump to version 1.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=62b2303df35faaabcbe7e0f451ec77f4c40e7b56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

*) SECURITY: CVE-2022-25147 (cve.mitre.org)
   Integer Overflow or Wraparound vulnerability in apr_base64 functions
   of Apache Portable Runtime Utility (APR-util) allows an attacker to
   write beyond bounds of a buffer.

https://downloads.apache.org/apr/Announcement-aprutil-1.x.html
https://downloads.apache.org/apr/CHANGES-APR-UTIL-1.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4231054b05436978795267330202f72be0d3a4d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 59ef590109..7e2793cd77 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From http://www.apache.org/dist/apr/apr-util-1.6.1.tar.bz2.sha256
-sha256  d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b  apr-util-1.6.1.tar.bz2
+# From http://www.apache.org/dist/apr/apr-util-1.6.3.tar.bz2.sha256
+sha256  a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5  apr-util-1.6.3.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index fb0735f5e7..02b6d5e277 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.1
+APR_UTIL_VERSION = 1.6.3
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
