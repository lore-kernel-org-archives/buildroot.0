Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38522CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AEDC60F1C;
	Fri, 12 Jun 2026 11:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKUhXnQMWH8e; Fri, 12 Jun 2026 11:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 634076107F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263388;
	bh=YEbUuBrBE0U2lmQc3v1WPYPICkN0d5dv5eP6V3yIVVk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sFCY4w5PulnOksMaJ0H7vMFkSDMa5YOGfPaHo8F4JTU67FbT3+TllKZD13JQxyGSl
	 HttCGviRwMS/bESxCxMYQBsehyYJxoTl0C0dGxex9vvOb6UI+xhEbiAXTzmXArTwli
	 cRtp/b65zxiRLGajm0lR4QX3+iuEtrddDqxUSeBme3btjJkhF0dntKRCGXgl3RcP3x
	 B+jgUyQwFdk3uyhxJI3ios062qyb8fJotfMc643uGU66uCB/vNfFuRchlt44dCzP+J
	 Eww85v/DrAZRS9x/KbeMQ0jqCh54iai240vfQ32GyXmUNOWF0iJwxp+8ighGntqYUt
	 GciyVkjD+TNXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 634076107F;
	Fri, 12 Jun 2026 11:23:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D8A321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DBE760F25
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWAK6kK6jQzH for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CD9B60F42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CD9B60F42
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBA8287B3D; Fri, 12 Jun 2026 11:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:51:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 16aed32c4b8856297246b5850789edcb72617951
X-Git-Newrev: e32fcaefe2b9d5e2ee80a681d0724d40ed9999b4
X-Patchwork-Hint: ignore
Message-Id: <20260612112217.DBA8287B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libusb: bump
 version to 1.0.29
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e32fcaefe2b9d5e2ee80a681d0724d40ed9999b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/libusb/libusb/releases/tag/v1.0.29

Changelog:
https://github.com/libusb/libusb/blob/v1.0.29/ChangeLog#L4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 66dc76de82cdee83f379d499c82b51d46e265f90)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libusb/libusb.hash | 2 +-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 3d51244b2c..4c76609930 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29  libusb-1.0.28.tar.bz2
+sha256  5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85  libusb-1.0.29.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 3d809bfb6e..95ce8b17df 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).28
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).29
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
