Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F9BCD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5247A41203;
	Fri, 12 Jun 2026 11:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHfHWcW81bhC; Fri, 12 Jun 2026 11:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2336941145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263386;
	bh=scqkcG9PP1ZkYqMAtZXMFnAzrmMjCAA3aB6+SyOoca4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RPIaN1KTKn3LzrWh0Ty2C644BhvKROa7bjlwZ+2FLmMEHtjiG+/8Q6+oT1wTS6xOA
	 QZE+InsQX4EYTt3hpUXiEofq9J4A1RT0X/pcqjm30oFijzve6L7k/BP3UlLsy24I7E
	 Bz2Fsg+xFmIRN59Ihaqz3mZ5Knq3neZh1W4L63B8sbWmskxprRM59Y18N7fmdi8Gx/
	 zHTp22KhMiJRB6wc+IUNClC/OFoRrPjFyZ0WIDsfvWwP48XZp1h4F3CJUK6ckExFcZ
	 OJW4Wt0zCPrUFL4/QZ1ZUwk78hYTSdyq9iqfxCZhlVubsfpeh6NUl5MBOE79bo5kUa
	 xQ8PJCVnQPplg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2336941145;
	Fri, 12 Jun 2026 11:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8A9B321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAFFB8329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLLYX8W7dTJB for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0571082CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0571082CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6528880E9; Fri, 12 Jun 2026 11:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:51:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0aa6bf8b37b6cc870a25f46adbbde3e2190e5256
X-Git-Newrev: 16aed32c4b8856297246b5850789edcb72617951
X-Patchwork-Hint: ignore
Message-Id: <20260612112217.C6528880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libusb: bump
 version to 1.0.28
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16aed32c4b8856297246b5850789edcb72617951
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/libusb/libusb/releases/tag/v1.0.28

Changelog:
https://github.com/libusb/libusb/blob/v1.0.28/ChangeLog#L4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[Julien: update changelog link to use tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 84b8a080517a8da70c314510d2e74f0da92ad441)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libusb/libusb.hash | 2 +-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 8ca68f03ba..3d51244b2c 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575  libusb-1.0.27.tar.bz2
+sha256  966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29  libusb-1.0.28.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 15649a2ab1..3d809bfb6e 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).27
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).28
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
