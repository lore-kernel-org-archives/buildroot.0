Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDB3C7EE39
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E22641994;
	Thu, 26 Jun 2025 19:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuB70Cxze2eZ; Thu, 26 Jun 2025 19:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB684195B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BB684195B;
	Thu, 26 Jun 2025 19:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B3410A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F8B341961
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4fc5drQhXXL for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A1341968
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87A1341968
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85AC58467F; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:44:22 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 883c977c9a65432b408f33a7d445ba6b16a36647
X-Git-Newrev: 17a252545ab3bcffae1e94f46d1646497add1f4c
X-Patchwork-Hint: ignore
Message-Id: <20250626194922.85AC58467F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python3: security
 bump to 3.13.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17a252545ab3bcffae1e94f46d1646497add1f4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

3.13.4 fixes CVE 2024-12718, CVE 2025-4138, CVE 2025-4330, CVE 2025-4435
and CVE 2025-4517 but introduced some regressions fixed in 3.13.5.

Release notes:
https://www.python.org/downloads/release/python-3135/
https://www.python.org/downloads/release/python-3134/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1bb4a955fa6acceba3b6aab2e7f5ee2e3bbabc9e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b13f5cc742..2ca8ad4930 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3133/
-md5  8bb5f0b8c9d9d7b87d7d98510e8d58e5  Python-3.13.3.tar.xz
+# From https://www.python.org/downloads/release/python-3135/
+md5  dbaa8833aa736eddbb18a6a6ae0c10fa  Python-3.13.5.tar.xz
 # Locally computed
-sha256  40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041  Python-3.13.3.tar.xz
+sha256  93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb96801647d640  Python-3.13.5.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3e6273a773..ec210ccac8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
