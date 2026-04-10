Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29102F9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A8042C24;
	Tue, 14 Apr 2026 15:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNIovvOuSmDX; Tue, 14 Apr 2026 15:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBA842C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181779;
	bh=CUn9ehQEzSs87b0wSfK9mfoTpFkNhqj5TPvlCgWXc/k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FHoE+kP7sJW7z8nkBrvNI8wqHjd/9EJrZkTmo4bV1Fnzb18T253DXx3Qry0CjnyPA
	 MAkx1xY3vfimRFZyC6pkMutaXMMm2sVzUkm93JPA6MSnY4WbgyeAXTwEH92g88AFEx
	 IeNfd74JmXsNyj8/0JvOcz6g+DYkQcmkfKdXf1DZIJp0O7VKHgoGNgPaCRqy1fnb97
	 /rd5h06X8/xpZGjReONtgS+H4WKSugcFwyh0clmuz4ipYBMnFGTIqeiIF8H1jaNaJ7
	 LId5+zvjE2cZuT2DZ5gdi1QDkoVpCIweHwGxZ/HqpffEqppAvD2XOUK0rtfYHjQvFj
	 LPxED24wJ1p+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FBA842C09;
	Tue, 14 Apr 2026 15:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27895237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D0D842B0E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2WRTDPpe8ev for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CBC242B18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CBC242B18
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B30488150E; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:03:37 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 53cd2b0d0d56e2ee51932aa908f5e0f81de64370
X-Git-Newrev: 1125238c9f4d83d3504eaab03f3fb47ee44155c5
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.B30488150E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libinput:
 security bump version to 1.31.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1125238c9f4d83d3504eaab03f3fb47ee44155c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://lore.freedesktop.org/wayland-devel/ac3BI2BjKx53LqmH@quokka/T/#u

Fixes CVE-2026-35093 & CVE-2026-35094.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b9ac6cce071b322119ba3d3bcd7d919c9cc3184c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index a942bb069c..ec6e52e1e2 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  af04645cef8ec4ef9b571664828086ea5a610c6f3e872880055c7fe2c9377de5  libinput-1.31.0.tar.bz2
+sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index e018f87f00..8b930805b2 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.0
+LIBINPUT_VERSION = 1.31.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
