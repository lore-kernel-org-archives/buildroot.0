Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9557CC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B42980A75;
	Fri,  3 Jul 2026 14:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTYvUJvTulZG; Fri,  3 Jul 2026 14:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB7380B48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088819;
	bh=IsA7wAUIx0ZFDyRv+2EK6QzbZXozmfaxlAtAeZtzSCo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=scoBGMoYzDOGdaqt3rsrax/imZivQ3242JzlE7dL3UpfwD4fPxeJ1v9h9+YqEhIkP
	 it9qrdgbDjYarWAwkzjiqSg8mZ+RMhfSuFhW9rw6bXHb2ObUJtcpdZmfIF43bUXwAt
	 jSEXXp1HHCRrdPBF7z9rLP/MBsen8GwTnntSAQdrYtiq1bTbk8l61V1XOtMaaXSooa
	 5pE9AbwoRbqkNvbPC6ontBV2Oteuk3FphM+mPq9GxJ31fEkKaXn/6bM4BksWuBOimt
	 PcDSY+BqQpnQcDOA1WG+UaBn1R/ppsn91oIwp2ZookJVKPyjBPptzbHsUQ/+H2NZyN
	 pfrwm/3NTtLpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB7380B48;
	Fri,  3 Jul 2026 14:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9EBF79DB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFCF14008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzFfhkbmBG5y for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDB8B405B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB8B405B9
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FFE6883A3; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:49:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6d844f4383090f6f9a6816e713056b4b72e0bba1
X-Git-Newrev: c4418f288470fac2652a075700cd657b37f70605
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.8FFE6883A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpp-httplib:
 security bump version to 0.48.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4418f288470fac2652a075700cd657b37f70605
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/yhirose/cpp-httplib/releases/tag/v0.48.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.47.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.0
- this bump includes a security fix
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.0
https://github.com/yhirose/cpp-httplib/releases/tag/v0.44.0
- fixes CVE-2026-45372 & CVE-2026-46527
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.4
- fixes CVE-2026-45352
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.3
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.2

https://github.com/yhirose/cpp-httplib/compare/v0.43.1...v0.48.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 614c32d2dd21eee612830e2608adc7aff3bef64d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index f3e05951e9..842b96f3eb 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
+sha256  d9ed142d319c6e19a961f477257e67f846909ce15288502188df2281941be84e  cpp-httplib-0.48.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index c21224ee3d..e723e30b44 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.43.1
+CPP_HTTPLIB_VERSION = 0.48.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
