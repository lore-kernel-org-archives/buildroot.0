Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EACDC00140
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 01:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBEF940C48;
	Thu, 11 Aug 2022 01:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBEF940C48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMOsl8J9ZLEG; Thu, 11 Aug 2022 01:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55C5140C3D;
	Thu, 11 Aug 2022 01:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55C5140C3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2894B1BF2A3
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 01:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D059160F2A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 01:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D059160F2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rLmdkvkZDdK for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 01:21:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F8F360EC4
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F8F360EC4
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 01:21:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DADD031E046B; Thu, 11 Aug 2022 03:21:06 +0200 (CEST)
Date: Thu, 11 Aug 2022 03:21:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <YvRZgrWS+N3bwLtI@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1660180867; bh=v0lOKdSzvOMp01A9oI0D5jFSfCa/R478bguh1157Ep4=;
 h=Date:From:To:Subject:From;
 b=n0wiIKyAFV+egknrMLXw3qqgz7y/XwoUD+r4M+LssuDPs4hbMdE7tWm7fZG0D/Bq4
 6D9ycWBjb8SORB0o39/11mPhN7j8OgXt0F1utL+j1b321JqlZHC5zZFgPMN7pJtH/3
 uJmxrwAdqNQ25j8GOTDFCzSsc6vVPz8GbK6OiRuuC/qhMY1fjp0IKTdN9fsj0Kcv0F
 8ILvfo3RrUY5+kGw8AoTmSUCJYSLLNhxCVmBvTYJD6wtyb1F43nEY4oS+PFRnNuR2x
 hGqS250tVAtuG9vrnZspQYKIGauFBiB0mhlbtxqxncEnKMMJaTJUbqmroJUmhk6nvC
 dvxBut8F5pjrg==
Subject: [Buildroot] [PATCH] package/uclibc: update to 1.0.42
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 3b29c351b5..0122d08789 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.41/uClibc-ng-1.0.41.tar.xz.sha256
-sha256  b32a92a0218d95922d6976464e6ef51e2ebacfbcdb605820458d9dbb8a61e025  uClibc-ng-1.0.41.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.42/uClibc-ng-1.0.42.tar.xz.sha256
+sha256  ec6dae44ce86558885e56bc3bef6bd4d082397114e6e1fc15795f71e804d7016  uClibc-ng-1.0.42.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ff98a05c16..f7810e4974 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.41
+UCLIBC_VERSION = 1.0.42
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
