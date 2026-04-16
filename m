Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4058FF8D773
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 19:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB7A80FFB;
	Thu, 16 Apr 2026 19:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY2mjOl_vKty; Thu, 16 Apr 2026 19:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3218780FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776368028;
	bh=+w9ZlW7GGYKqQzVBrkKrxqwJpmnuZ5BG1HNzApJC+rQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TO44ffVlBK6vdcmCg6IIgPrHhx3XncdRvycZlhotOII521g52TY3wewAy1H7r3MOw
	 97VjJE2Zlr4uUicWXRSsl9Ca30VrLHYRw9+HDR732VADb+3NOtGP5e7DiLP7a+1SHi
	 598JVogIwo2H8iiJUhJfaM/j7O5agyMli0qniQLDBybPqqXU3mSx3XonsfSbSgPnv9
	 Ly8lN0jO2u9dTkJnGA0kMZDaFU/BVNGIl6SHSK+KgYtuczCQkVRrGd8yuJLoLHmyrw
	 jZLvOJNCQgeusXP2999sPkfX7Emvzlavzsycw+QNMVtWQozDEy2fohqzfXEhjZ9Zke
	 Ids0iym6L4khg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3218780FF4;
	Thu, 16 Apr 2026 19:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3016D2F4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21BDF60904
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Masgn4TpUMQf for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 19:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D591608EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D591608EF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:33:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE55E81791; Thu, 16 Apr 2026 19:33:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 21:30:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f9bcf42c31bb0d089ae0e70642242cf572ba5b6
X-Git-Newrev: 5fc186771e18bd2a39d8a643e85ddb662eaeae36
X-Patchwork-Hint: ignore
Message-Id: <20260416193345.EE55E81791@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump version
 to 3.8.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5fc186771e18bd2a39d8a643e85ddb662eaeae36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libarchive/libarchive/releases/tag/v3.8.7
"Libarchive 3.8.7 is a security and bugfix release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index be357183e2..665259f2b6 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.7
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
-sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.7.tar.xz.asc
+sha256  d3a8ba457ae25c27c84fd2830a2efdcc5b1d40bf585d4eb0d35f47e99e5d4774  libarchive-3.8.7.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 3b8fdbae1e..f11f5d8f6f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.6
+LIBARCHIVE_VERSION = 3.8.7
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
