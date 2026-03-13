Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F5107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D0A861043;
	Sat, 14 Mar 2026 08:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Spux-boUWAhf; Sat, 14 Mar 2026 08:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98AFA61081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475228;
	bh=m2+98aA2ly/8fsvWzFAlg/kXo8Cr7UZmadb1dOfUCBQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NtxTBzYOT64i4BLtqeoS84d7jSNMD059ub+GUYZr+od+NaFIBB9nuTZgunsKa7EoM
	 hL3l5fkRZ5T8+tw8QcQmyh+u4i6LMFGzg0gNWSn48sm0rK9vQha81JxLJJZFYktFHF
	 x6tDehlszmFejn732q541y+NSGxUxipsLxZ9Y7VaRCu4WiyW7Di+rLVNY5FqvlBUIM
	 TH0axbR2uOUhnaEQe4H6Xi0SsdVHQ5RfINvKasZ/YchW7jWGp09q8nj3XQehKfI6rt
	 2EuwmOE6NveSlxuBFoANMzsZroeMgZUH9WLYtf1E0b6qN7yCL+AOr9I+clQTP3GmCx
	 olVeF2Zv2UtAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98AFA61081;
	Sat, 14 Mar 2026 08:00:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 519211B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50F4141012
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yIfFoiOneOe for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D5F4103F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D5F4103F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FDA285E16; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:00:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ea8df0a72a745194e9693ba54385e6056a90a75b
X-Git-Newrev: 55723bb54312f86876e64940b29a90b180e8779c
X-Patchwork-Hint: ignore
Message-Id: <20260314080009.9FDA285E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libsoup3:
 security bump to 3.6.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55723bb54312f86876e64940b29a90b180e8779c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

While there is only one CVE number assigned (CVE-2025-14523) for one of
the patches included in this release, the bulk of the the changes are
security fixes.

Release notes may be found at:

  https://gitlab.gnome.org/GNOME/libsoup/-/commit/25eac153004f777581ca2d95e31a02ca96844332

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-14523

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1a9998e511ca6aea86a166511c4e3cb8456afb06)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 32aa7382fa..c0b860875c 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.sha256sum
-sha256  6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234  libsoup-3.6.5.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.6.sha256sum
+sha256  51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740  libsoup-3.6.6.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 0db587a93a..34a9ed2741 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).5
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).6
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
