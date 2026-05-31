Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AA7CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD6C60F8B;
	Sun, 31 May 2026 17:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpxFf8-Cdcfh; Sun, 31 May 2026 17:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1192160F8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247445;
	bh=4bUJrIUjrc0KGbXYuMO1eOzHvi46AsdlZYb4Ug7pceo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HRphuHoCHHdT/Mj6+5a1/BLmYQWILpIsyQMdt88Eykmr7uFI5uiBWbHtzMUEIY6M+
	 CtGNd1EH+Ybz0hOZa7LfAQ+yzBVV6JY04BM9E2vdSPCUUQyrhS+J9VEHygDriUWJIT
	 ozGvOmzMGFmrwJ3mHTkrjg3eEZhFcR+ZFZz0d8JOzaA5AMH5WlqBzhhAAuiwjnWmjf
	 6vK4vhQG+RQ1qEimit+DVjAyPHwjzHDMTZMsR4wJfy5RRbfhEIIxUb9IAwvfE94Fve
	 9/gx6WGJeo0piLoSutkQXRSQZyspS0j++JBqtx7GfCgHZakvnWdh4DqfDDxQUaU08J
	 q3nwaxNueMarA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1192160F8E;
	Sun, 31 May 2026 17:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4391F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B583885027
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdKtEB_OWmGN for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0EF84C0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0EF84C0E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:10:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6732E876F1; Sun, 31 May 2026 17:10:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 19:10:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6ebe16f34df84561466f435a5f4f4c40c9208bf
X-Git-Newrev: a72da6d7f5bba1113d5b6962498f2f8540ac31fa
X-Patchwork-Hint: ignore
Message-Id: <20260531171029.6732E876F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a72da6d7f5bba1113d5b6962498f2f8540ac31fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.23.0
https://github.com/strukturag/libheif/security/advisories/GHSA-jvmp-j3cw-84mh

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 22697f307c..780059facf 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.22.2
-sha256  eea48e4841f83fbe51d029337ffd2d14512d0203015dad40b90213d872958af3  libheif-1.22.2.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.0
+sha256  4c9182b18897617182eed12ab5eb9f9d855b3aa3a736d6bdb31abc034ec7d393  libheif-1.23.0.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 4b23f1fda3..be97b18bd0 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.22.2
+LIBHEIF_VERSION = 1.23.0
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
