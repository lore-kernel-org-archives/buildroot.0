Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D175CF3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2531611F1;
	Sun, 15 Mar 2026 22:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFQhj_TyEzym; Sun, 15 Mar 2026 22:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C33FE613D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613168;
	bh=K1NupAPOeI+yD/ZAYLZeJENLANYgF8NUDXZ4o0FsbfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ayZf4T2Duro+xThmw+dIH5XjjlM2mIghGiCT6bhbc8qLjhdJiO1+NV51AX6WDofZu
	 0pqy4JoxL7gN5jKK5ZNuOMzHtxPlWacPs3E4OHjLt3xDgaGH5F/ui9wYWcwFgVKK5N
	 0iIcfJjecJwnUqcV+/WAxsxvt7KDGMKHuCPZJruSoyoVnrS6en6H8x3HOcHhQkjgct
	 IIzAxgFEflwQ52suOtHbyoG/ECPO4U/IsKz3vBIkPOVUYNEzulBAm71RmvX5uFiYXS
	 u9tCmtNgOHNv9qsaTNxIwiGAGmZIqhZbuCtbJ5Ycql2kGNfkkvXKF4NVu9//wtdoXW
	 +6Z586p2oeHyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C33FE613D8;
	Sun, 15 Mar 2026 22:19:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D16B1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFDA4409DF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n45iw63tnoQg for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4806840AD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4806840AD4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A9E880FBC; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e59cc42d2f4b4fd557ceb4fef4b7865da17bf4b7
X-Git-Newrev: 50c9c7f5536966d907c4c922c03834be53ec9446
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.8A9E880FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tortoise-orm: bump version
 to 1.1.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50c9c7f5536966d907c4c922c03834be53ec9446
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tortoise/tortoise-orm/blob/1.1.6/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 0bb4224a9e..77144495f8 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  5c143e93e4c35dfd8cd19dfdbc064d6d  tortoise_orm-1.1.5.tar.gz
-sha256  d4074a7c34a8445fcca19ec865189d80ea7a00b29e4b12778460fcab67a5ce74  tortoise_orm-1.1.5.tar.gz
+md5  c3278bf834e12f7bcfef071ba52c0dbd  tortoise_orm-1.1.6.tar.gz
+sha256  30095a77aa7c3eb3ede1baf4b390a66b994dc7c4d0d06a609d23a16c50e55d0c  tortoise_orm-1.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 18ad37d5d9..e0190eb9ff 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.5
+PYTHON_TORTOISE_ORM_VERSION = 1.1.6
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/f3/b0/2b3962847aad793d32646c6e43e7fab6f845f34a5502da5722fe704ec847
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/40/76/629a5d69c170605dbdc10f3f3416d124fae05836860686ccd9e06726810c
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
