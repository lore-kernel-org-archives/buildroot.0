Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A04F5510A
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4183941BD6;
	Sat,  7 Mar 2026 21:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o72OJ5PA198s; Sat,  7 Mar 2026 21:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6367141BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772919505;
	bh=wwVMLmOjD/ch94hmKuxHcmsP8oA8lO9J9k4sESWA4nc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K0k/3C275BJ+UgvRA2chovvidJchKuyfyV76oN5uiy9t3NM92OFyccDxRFHkj5Rl7
	 6FdiQpzuAaUlqtngnwo7BzUOuxO5Yil19kAsSSmzNAmTg/Lq5T6oB8YLvNSPfZvndI
	 b56NiKGhFybKAKLpbKOlGgaLAlejcVckAVMU0EfvYL9MpsoZoaw5/H4hcQ3YZJAM7I
	 uFAn5qHyBbCqGsneCUntMtMP6EA3rAXGiOzj6IMoUvm6E7e/EIIQlfYqN5ozau/xrj
	 oKL0jbar7dRI3FJvScH/1Y9VVH24e/XroEJLgtSyrfAspxRv4MowjR/yfpNXSFqvN7
	 TtUpv5j2paLtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6367141BD7;
	Sat,  7 Mar 2026 21:38:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91F40223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 702BB403FA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyTQBF3c48oh for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9373F40075
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9373F40075
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:38:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DB4884685; Sat,  7 Mar 2026 21:38:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 22:34:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b00d540bfff89583a58267b7c055c387d136e80
X-Git-Newrev: 4ed5af5288d3092c80e376cc260e7f2794363eae
X-Patchwork-Hint: ignore
Message-Id: <20260307213821.9DB4884685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: bump version to 1.21.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ed5af5288d3092c80e376cc260e7f2794363eae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.21.2

Use sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libheif/libheif.hash | 3 ++-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 3da82e3e27..0daabcb5dc 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,4 @@
+# From https://github.com/strukturag/libheif/releases/tag/v1.21.2
+sha256  75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42  libheif-1.21.2.tar.gz
 # Locally computed:
-sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index c4196f9353..77435dda5c 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.21.1
+LIBHEIF_VERSION = 1.21.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
