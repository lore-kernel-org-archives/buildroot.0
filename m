Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88C7C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 07:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F26960D94;
	Sun, 18 Sep 2022 07:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F26960D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIqLdkucBauW; Sun, 18 Sep 2022 07:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC2860D69;
	Sun, 18 Sep 2022 07:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC2860D69
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0C081BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAE9041CF6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE9041CF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjHSxrpwV9uA for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 07:50:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B91C40442
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B91C40442
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85CC6847E7; Sun, 18 Sep 2022 07:50:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 09:47:26 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 65a1b8967a8c7a846845e55fe098ff95ececd885
X-Git-Newrev: 80c36e87c98529d34fc893b47e0c35f63bda5459
X-Patchwork-Hint: ignore
Message-Id: <20220918075020.85CC6847E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python3: security
 bump to 3.10.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=80c36e87c98529d34fc893b47e0c35f63bda5459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- gh-92888: Fix memoryview use after free when accessing the backing buffer
  in certain cases.

- gh-87389: http.server: Fix an open redirection vulnerability in the HTTP
  server when an URI path starts with //.

Release notes:
https://docs.python.org/release/3.10.6/whatsnew/changelog.html#python-3-10-6-final

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
[Peter: Mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f4cbf417b59bfdfdfc163a21db71e5e3a75841a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 2 +-
 package/python3/python3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 8052e3f6e0..596f3e7c18 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8437efd5b106ef0a75aabfbf23d880625120a73a86a22ade4d2e2e68d7b74486  Python-3.10.5.tar.xz
+sha256  f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3  Python-3.10.6.tar.xz
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 40711dc99c..6dbd33d52c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
