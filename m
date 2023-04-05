Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A07C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 05:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29DA81395;
	Wed,  5 Apr 2023 05:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29DA81395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNamU3n0hz2J; Wed,  5 Apr 2023 05:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3031881398;
	Wed,  5 Apr 2023 05:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3031881398
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBED1BF3F0
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 05:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E37140195
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 05:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E37140195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhB7GGMor083 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 05:53:33 +0000 (UTC)
X-Greylist: delayed 00:07:12 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9984F400C5
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9984F400C5
 for <buildroot@buildroot.net>; Wed,  5 Apr 2023 05:53:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 686A035208CE; Wed,  5 Apr 2023 07:46:15 +0200 (CEST)
Date: Wed, 5 Apr 2023 07:46:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.net
Message-ID: <ZC0LJyYomtj0Oqq7@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1680673575; bh=33AXvf7xDq+kEdBWQbsGoKdy95E5cV6B9Z6Bzl18g24=;
 h=Date:From:To:Cc:Subject:From;
 b=jL0C9gWKtm0POmRWdOGJhTtw0VGWYZNaYIGUk17d4Ifng6PeIFbgVgcF3+neW7tiF
 qPpcLisoIzR7fSp0aIdNYJJIA5WRzB4INHOv8RYPrJmeJLx+MfJC1lSPmWhIOPC2zw
 YaLSZHc+FgN2MNUD4pIZhUSgg63WBLs5YROcnR/n5sXd05ebiRvRJOT/sEvHUnNq/x
 7N6yFirUyH9vkDPqaitbR4muaPHR/j+wtHbYHWlt4WI5c6XVrjnmc4j8ZoE9UtL1oG
 s2RHDMWFsljZ3FcWMTpTUfjsiA8B2OdwPD22xis1+YISBOn7I3Wf/MwVuzkeNH8IdJ
 0g7uxSVCGYpJA==
Subject: [Buildroot] [PATCH] package/uclibc: security update to 1.0.43
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

Security fix for CVE-2022-29503

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 0122d08789..cdca75b113 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.42/uClibc-ng-1.0.42.tar.xz.sha256
-sha256  ec6dae44ce86558885e56bc3bef6bd4d082397114e6e1fc15795f71e804d7016  uClibc-ng-1.0.42.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.43/uClibc-ng-1.0.43.tar.xz.sha256
+sha256  8c1f550f14728a9c06ff1fb3e85069f7f10f4d684b03e163f4d9d41727124047  uClibc-ng-1.0.43.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 4c05d36ab3..80c9caf07f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.42
+UCLIBC_VERSION = 1.0.43
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
