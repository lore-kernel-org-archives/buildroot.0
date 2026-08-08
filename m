Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456F6C5AD44
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 23:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E255640545;
	Sat,  8 Aug 2026 23:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TiSKkuG6qoA; Sat,  8 Aug 2026 23:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84F84056F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786230263;
	bh=6JJ8G7JGw1dVXQDd6AlhApncQEQBvZgBF64bpofn+oc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kd1b4xP7f1Fti8nouqW6DD4mBjFkWl6ga0k5GemH77T0SrOOviUjOKE7s63RhADoj
	 jvQwCxmSspF6bapGqVQoRm44N+YIKmj7dtrTNF8SK4JHwadkaWj6G6rTXVW8qS47Db
	 31y4/W0bL7iioarzd1dDGYFrnZ8qHgiHRfX3FUiAnvX3CDo0JdGH1jPkDesosr5LY0
	 10WrHWpY3thi+jbl2tf+PMRxCqYWr9QANB9OPYzbPIJNcZiWS09sVY9O3V+Enf3gcN
	 7hDS8wF5xH0IlI+6GNDEVloxf3K2t+AFrulX1Di6vaqPyZOLXUGn5Zbk4viDRVIQ6h
	 K3Hg+KpY4W5Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84F84056F;
	Sat,  8 Aug 2026 23:04:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CB64282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A9636061D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LDYMfthJaA5 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 23:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C512605ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C512605ED
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 064E08D1CA; Sat,  8 Aug 2026 23:03:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 00:45:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8af01adda19b0d410072d7494b52448e9296f03d
X-Git-Newrev: 5ebaab7ecc0684d900795ae157675a8ff3b78e21
X-Patchwork-Hint: ignore
Message-Id: <20260808230333.064E08D1CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpdecimal: bump version to 4.0.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ebaab7ecc0684d900795ae157675a8ff3b78e21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog (https://www.bytereef.org/mpdecimal/changelog.html) 4.0.0 to
4.0.1:

    features
        Add Cygwin support.
        Update config.guess and config.sub to the latest versions.

    build fixes
        Fix pkg-config files for custom paths.
        Set LD/LDXX unconditionally to CC/CXX, since LDFLAGS/LDXXFLAGS from ./configure rely on it.
        macOS: use libdir instead of RPATH for the install_name.

This commit also updates the COPYRIGHT.txt license file hash, after a
year update.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: fix COPYRIGHT.txt license file hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpdecimal/mpdecimal.hash | 4 ++--
 package/mpdecimal/mpdecimal.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index 53ca182287..2ade012cba 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,4 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256  942445c3245b22730fd41a67a7c5c231d11cb1b9936b9c0f76334fb7d0b4468c  mpdecimal-4.0.0.tar.gz
+sha256  96d33abb4bb0070c7be0fed4246cd38416188325f820468214471938545b1ac8  mpdecimal-4.0.1.tar.gz
 # Locally computed
-sha256  2713324211652ce4a60e6e21e54f9dc3004299e591b0933a352f1a89c5fb53c2  COPYRIGHT.txt
+sha256  dba079e24a0286052f9f36a5e0b4f6cc95bc83ada657eb26bef8c0b6473f6512  COPYRIGHT.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index a2ab18523b..e9f13da373 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 4.0.0
+MPDECIMAL_VERSION = 4.0.1
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = COPYRIGHT.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
