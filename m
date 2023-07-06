Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D09EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEBD7417CA;
	Thu,  6 Jul 2023 08:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEBD7417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiJc4KVMWjQe; Thu,  6 Jul 2023 08:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC563417BB;
	Thu,  6 Jul 2023 08:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC563417BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B70831BF575
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58BB440329
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BB440329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjC9TSjcCQEd for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5389F40542
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5389F40542
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D8A867AC; Thu,  6 Jul 2023 08:55:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 10:52:28 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 844d2f76261a9cb378fc2a19313d14ad691caff6
X-Git-Newrev: a7bab4b191424fa880daf19a4b37e44ee68bcb73
X-Patchwork-Hint: ignore
Message-Id: <20230706085515.42D8A867AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcap: security
 bump version to 2.69
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7bab4b191424fa880daf19a4b37e44ee68bcb73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes
- CVE-2023-2602
  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=bc6b36682f188020ee4770fae1d41bde5b2c97bb
- CVE-2023-2603
  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=422bec25ae4a1ab03fd4d6f728695ed279173b18

Updated license hash due to an upstream commit which added a SPDX header:
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=70998415a87587f31063a26a1e52c6f7806b7834

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3fc82816b4a898e51a45e46d77b0bc1fec397a22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap/libcap.hash | 4 ++--
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 5fc8173905..0f1501d31b 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd  libcap-2.65.tar.xz
+sha256  f311f8f3dad84699d0566d1d6f7ec943a9298b28f714cae3c931dfd57492d7eb  libcap-2.69.tar.xz
 
 # Hash for license file:
-sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
+sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 728a6ba6cc..c9727c75c9 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.65
+LIBCAP_VERSION = 2.69
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
