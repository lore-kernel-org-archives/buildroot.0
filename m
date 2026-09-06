Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6FDC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA7480E09;
	Sun,  6 Sep 2026 12:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0y6on6dyPOR; Sun,  6 Sep 2026 12:18:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 25F8380DD9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697131;
	b=enVbIrfkq9/3+4TD7m6k3N6BOQdBKKFwWj945B6IA3dKbzp6s+6SWVx2GowPcedWZiK7
	 gtKBvOH9GENIsXfA50Spk1IlpGUrwJLzQmq1LEvuJLqs1/PGmG6j5jSDv0YWLc99gayMB
	 DhmKWlo0cIjp2X5nJsOWPLp2EP1BjJKEhvvrG2k+feyKuMJuSPGMoUkUB6M3sNVCqbPO8
	 X8Hq1ybYRzUoMY4HCMWFnPR0FgS71aYPl8POGRIYc0SYi6QL6830ZC2vKH9D4w4k1DXTm
	 SBL+MRJekrzdHMnSX26pUAWl/qk/qKh0e/8jCX7eZ9+u03nyN6bAhV34BPwz1NUo8Rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0yQBBgGgyoDm31i8JTo4rj7Tz55tTbpDJC3X6plQQ/0=;
	b=X6j3HcxAy1tYkzVBhNUDcdbDhA/4eh/U/uFM0qFMpk7kU3Vrr091/DKhRAQLr0bjXbIM
	 lWkJlHfPZDf+ZcmmA3kayHk7OHKzh6q2EjcrYYBtGnomuZzqrFur5W+7Ik4+hPle8rfiV
	 m4c3KDT21IQ/ZF1tiFeWP4uLCB8Vhm5WBWqKLpbMRPjCquYEA1xXAzxtWZulYGzrsMPrJ
	 DnVzCYNZIfFg/TtgLiRyVEHs2W0YV3XVtC94JjKJA2eIycZ4TRLjFlHsuZFObzou9eEJ0
	 5hk4ND9H6tc1mwujYhSAu5KHELpoiHQ0P3fJZG4AJtUrvrtZniPpJVYcN/NeVocryWA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697131;
	bh=0yQBBgGgyoDm31i8JTo4rj7Tz55tTbpDJC3X6plQQ/0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oi/NDvgj0bjSli4+t8MA//TqIjyNsjEoNQg669SezouTXaG1vWhI4gXNwgtONc+y+
	 43Dk2TdrAxJqgQNzala1zL+Fg5Zz0zn2kC/PixV/M65NEIE8WEr9i1XuVC+5F3fFRb
	 3VelTOaNg4F1TGSQ3Qt9ErkCQUJ4fcPyuBJVMbskGnVMTohYcxzsLCzpQFsiv8h1KH
	 B+ZDERtnbd1HFYTM/WN9X3DWfnEoSKd6KgrsukzslwhsXsXBQCEvIXg8HthFVgaiPW
	 a9kHhhOeWdiDNU+5b/ydDI/WsnR/PwsY6L8Huj6f3mhpXm6be7bmp+uc4oi9asQfCD
	 9qROnR4a/W9dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F8380DD9;
	Sun,  6 Sep 2026 12:18:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 213AA3AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E4060623
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBMNX_LO6uV5 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:18:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DADB860616
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697127;
 b=kj9DJOSYyINiA9kLK7W4wsG+gDptlAQST8VGDr2JEJp+Mjqev3sfKFDJokKHcy3RNoQs
 ljBI6RQKEUKDjXwrXnb/rP38bgwyk/V894gdwuAy06XQ3emyOg70zu5c3AV/LREJs8mgD
 7YL/07LcMX3Z6B5/oUPKrcY2xhWixySojOHFKbdMugOnzR2CuBI9ipxx8vmBFXoms7Jhm
 sw7kD3Y96A6lXE4QTDCJvc3uiXhPTrqZGvpOsowXk8LvQWapVwZN1JD3HnWPMDp8GmoNh
 C+lhblslPeoCWAPFkMTe0HDJ2OhCn3gtVYi2BRo4Jt6pnZQ22XZLAyrDiKx7mHZfdkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697127;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3XFeYsqVA88YfJzKWTroWmkQf+vRSRCqOd+/bGn/Fd0=;
 b=CXX/Dk2O/G0M61VE38F7Hw5tvVLiatAwDsD6gxlvhIRjeXWm7NviqMAsU5Vc+6l3+Aww
 ngUoPS4DympdWXJsadXFUMVBH0PKR7L2/Y8B5Atpw9hpOzMUws2Lwyjb+cSPSFtRH9kLq
 pPcDMnY1scY4FNGLUvUwBf3lnSHvfTM+D03n2XuywbFW1rJdJwRXR9NYyGQxAuVlXZlWK
 9AAlbKru8g00Bqq4meUGlPf4+JqO8EBY/UPWz6HSIULf+vpbwIXgxLl6G7Kk7B252NRGH
 j9Jxhn6Xm7Bw9W0FMTeeINtvHFok9AL8VPtdo3scL1QrmEzTmhHkTwJSPwcpQyTHrsw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DADB860616
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 595E99535F; Sun,  6 Sep 2026 12:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 13:04:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0838e968cb9e78d7ca5d1641f39655bc03a2be00
X-Git-Newrev: a1e25fe7051be4463ce58e492e2e0e183219d449
X-Patchwork-Hint: ignore
Message-Id: <20260906121746.595E99535F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump version to 7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a1e25fe7051be4463ce58e492e2e0e183219d449
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strace/strace/releases/tag/v7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 8df107c948..0be750c96b 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
-# From https://github.com/strace/strace/releases/tag/v7.1
-sha256  81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f  strace-7.1.tar.xz
+# From https://github.com/strace/strace/releases/tag/v7.2
+sha256  4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e3c0d6d4b709fe5  strace-7.2.tar.xz
 # Locally computed
 sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index a0688939ca..9634a6d02b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 7.1
+STRACE_VERSION = 7.2
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
