Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861A4CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5572D4212E;
	Fri, 29 May 2026 08:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyp4JluPOAsJ; Fri, 29 May 2026 08:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038FF4211F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043291;
	bh=DJgxFp3CDCzGFQyIcZF5Ug/8cvlgXhV+sHAjCOTTrQI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=abqT0HUxuQTrJZv+32ARnWS1RksSJCJI/Xx9rVgRu/+UWzIdyWbs1X1OZUZzi9oQp
	 6XKkwG+Mi1Lggc4uZZqkB7CYRyF+RF5tJB009+i2YQBoVumTpelYHN0BI/fKsYrC7D
	 FWww3IKsx/YdilE+iOAQH7LBC3dWHYdmgO+iHpYFNnCUm/GqlGxI8bHV/L5FjVBgKm
	 jD2wJk/e6wGb/e2HK1/Xxl3h029B0AtlveDsX0ohkm40daz2szBMdLyxXgyEY2sDcU
	 XsFugyrDBNavBMIIr0ALUDPtzNpeEhdqCFM4T4gviH/+aois95NfXlu/mjz2rTXQQV
	 g3Ugt2bbQeCcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038FF4211F;
	Fri, 29 May 2026 08:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10BC728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D46A61455
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcfA5lNb4P0Z for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29DBD6132E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29DBD6132E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC335873A8; Fri, 29 May 2026 08:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:25:49 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9efcaa28af0221d30eefac02692784ac663d6f9b
X-Git-Newrev: b1c614880327c73e6e9c362afc783dccd8aa25c1
X-Patchwork-Hint: ignore
Message-Id: <20260529082747.AC335873A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libgpg-error:
 security bump version to 1.61
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1c614880327c73e6e9c362afc783dccd8aa25c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/gpg/libgpg-error/blob/libgpg-error-1.61/NEWS
https://dev.gnupg.org/T8239
https://lwn.net/Articles/1071807/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 78a93cfa9b56791484598aef6b4f1686ce8c1de2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 1e52e78d22..cddf2c7828 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
-sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
+sha1  ec35eea78798a0321986168ea28d55baccd5934b  libgpg-error-1.61.tar.bz2
+sha256  7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93  libgpg-error-1.61.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 808339b935..df95e5fe0c 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.60
+LIBGPG_ERROR_VERSION = 1.61
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
