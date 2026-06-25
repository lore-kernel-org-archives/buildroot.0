Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E1C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09EE48231D;
	Fri, 26 Jun 2026 14:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gsowuY4etrx; Fri, 26 Jun 2026 14:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AF482328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485537;
	bh=CJOC2/okQHBYH0SZkcxNzB3ntJWXFWMe6B4iWFR4G0I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EHhM2fCuOgfLFW2cG6ChTTtbe6xut29YsAP+5tOZwF4BMdKuD9uxPgHJgxp4vu+gM
	 RKk62U1c49rYw8FuVBQTKazIJVu8wZwWEfz3yNWVBLHu0FsPnLZmu4pu18EIlwvEMu
	 F4gPjAeppYh3vxBSKrZ7pZdnY5AvTSOc/2K8k/vN6lz2O6ajsy94xQgxW9JAZLMjDR
	 A2XblVIJYt00QjN1n3ujFKcCHhbLN0s+JCTf5zFtqU9EKYxMLTCsQE8zCIt22i4npg
	 j/lHbrIVcew9ySNQqcGPeFna7bYFRpXtaQhVpT6UtI5zYw+SSmOO2zPok0tlJw6+Fd
	 yL2kd37WRTZdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31AF482328;
	Fri, 26 Jun 2026 14:52:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F7F83A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914CC40702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWp_szNm_Bce for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD66F4070B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD66F4070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2FC9864B9; Fri, 26 Jun 2026 14:51:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:42:37 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: cfb6bea3fff9d55305c981ded8323cb5e7c2826c
X-Git-Newrev: c9b6846a214f95aacdc74af86c4e0f7dbbfd1063
X-Patchwork-Hint: ignore
Message-Id: <20260626145122.D2FC9864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libgsasl:
 security bump version to 2.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9b6846a214f95aacdc74af86c4e0f7dbbfd1063
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

2.2.3: https://lists.gnu.org/archive/html/help-gsasl/2026-05/msg00001.html
       Fixes CVE-2026-48829: https://www.cvedetails.com/cve/CVE-2026-48829/

2.2.4: https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00001.html
       https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00002.html
       "GNU SASL Security Advisory: NTLM client use-of-uninitialized-value"

Upstream does not provide sha1 hashes anymore.

Updated license hash due to copyright year bump:
https://gitlab.com/gsasl/gsasl/-/commit/ec96bad53988cb79060964cf1f1568da4e301fd6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Fiona: fix notice about upstream hashes, sha256 is still provided]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 61056c34b4cda499e884aa31eb99862ed5fc2eb9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgsasl/libgsasl.hash | 10 +++-------
 package/libgsasl/libgsasl.mk   |  2 +-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index de24d73c2d..eedb9adf03 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,11 +1,7 @@
-# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
-sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
-sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
-
-# Locally calculated after checking pgp signature
-sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
+# From https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00001.html
+sha256  d32be15efd3a04cb19b232f721bdca02cc6ad7ab415df7d79fb2dd2c0da3e0be  gsasl-2.2.4.tar.gz
 
 # Hash for license files:
-sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
+sha256  16a8258f525326a71cba997365505ad32089be4be7a7100f64f308ed01419a11  README
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 8670f43b6f..db3b64e282 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 2.2.2
+LIBGSASL_VERSION = 2.2.4
 LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
