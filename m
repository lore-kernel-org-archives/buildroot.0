Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DECBC55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E06B580EB0;
	Sat,  8 Aug 2026 16:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JB3j5J_fnOR; Sat,  8 Aug 2026 16:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC33580E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786205105;
	bh=ed18gCZgPoPzTVLLyMZpdbsTgwxF8SYuetfms2g8D6k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jn2ErhAgSuAOT+APiqRZcGXq58N55Bq7G0+AF7cGfoIgp2GejPKkteMD59wdQBsxV
	 cQfoTe1OtHtYGwKYOMpvRb0HkSkRisAOW6xL1oC7tRVuJJn0xDrjkoUrOoDchlhTZx
	 OBaJbUu5s0DLcmkSVI65xSi4o8pw/kYoLaxNuilfx/gCQYOxrCvHKxP3xJNJgFW3zx
	 Qxi6oDflNsuJYayZEHGgeqSc8mHjDjXpvqPt5f+Ehwk+zO1vMVz97wV04ab40/BDzR
	 sAZRsMBsWsXpPzjb3k1c6sYbQ2I+1QrWjteDaT7Sj1DaGtnMCjOOObj3KjwqsN+1MD
	 BwL6artmtH61A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC33580E78;
	Sat,  8 Aug 2026 16:05:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 403A9218
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EF866068F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLN6LrQo51WR for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5053D6067D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5053D6067D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:05:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BA1B8CA4E; Sat,  8 Aug 2026 16:04:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 18:01:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 015c7fe9ac664c873d5a4eefffb3a75092daeb5e
X-Git-Newrev: 55fb101003c1922b1f63f4e0463d56484e3b8410
X-Patchwork-Hint: ignore
Message-Id: <20260808160416.3BA1B8CA4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libudev-zero: bump version to 1.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55fb101003c1922b1f63f4e0463d56484e3b8410
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/illiliti/libudev-zero/releases/tag/1.0.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libudev-zero/libudev-zero.hash | 2 +-
 package/libudev-zero/libudev-zero.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libudev-zero/libudev-zero.hash b/package/libudev-zero/libudev-zero.hash
index fbff8e65e3..45643c68f9 100644
--- a/package/libudev-zero/libudev-zero.hash
+++ b/package/libudev-zero/libudev-zero.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  10148cfd6047d387bf71eca72cd19c177084224d96434a118d8def6e0a3d6316  libudev-zero-1.0.4.tar.gz
+sha256  bf4372f79ddbe6b0e266a3d2994ffac7018a7edf4f87632aecb5176565d96138  libudev-zero-1.0.5.tar.gz
 sha256  9169cc15bda9e4597784ea29530d6754af6fb00adce5907bf0a794c575591d3f  LICENSE
diff --git a/package/libudev-zero/libudev-zero.mk b/package/libudev-zero/libudev-zero.mk
index ba41fe09f3..9d648dd345 100644
--- a/package/libudev-zero/libudev-zero.mk
+++ b/package/libudev-zero/libudev-zero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUDEV_ZERO_VERSION = 1.0.4
+LIBUDEV_ZERO_VERSION = 1.0.5
 LIBUDEV_ZERO_SITE = $(call github,illiliti,libudev-zero,$(LIBUDEV_ZERO_VERSION))
 LIBUDEV_ZERO_LICENSE = ISC
 LIBUDEV_ZERO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
