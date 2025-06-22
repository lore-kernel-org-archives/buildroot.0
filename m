Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B8C7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4347F80B5E;
	Sun, 22 Jun 2025 13:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ep0TMmCyW5v; Sun, 22 Jun 2025 13:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8774780B6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8774780B6C;
	Sun, 22 Jun 2025 13:58:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B605EC8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B23D860A3F
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to7LIDau_O2q for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 13:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0463E60B73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0463E60B73
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:58:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E69B88419D; Sun, 22 Jun 2025 13:58:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 15:30:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52664093dee0f280db191c391167848dc5b09745
X-Git-Newrev: 1bb4a955fa6acceba3b6aab2e7f5ee2e3bbabc9e
X-Patchwork-Hint: ignore
Message-Id: <20250622135810.E69B88419D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump to 3.13.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1bb4a955fa6acceba3b6aab2e7f5ee2e3bbabc9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

3.13.4 fixes CVE 2024-12718, CVE 2025-4138, CVE 2025-4330, CVE 2025-4435
and CVE 2025-4517 but introduced some regressions fixed in 3.13.5.

Release notes:
https://www.python.org/downloads/release/python-3135/
https://www.python.org/downloads/release/python-3134/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
