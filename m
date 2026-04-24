Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DDDFED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D1784E20;
	Fri, 24 Apr 2026 16:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3JsGBmKZs_i; Fri, 24 Apr 2026 16:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCB084C77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047976;
	bh=/ejR9eMxwEGOVVn3Rk3vXiQjc4brFjevQQpKP7hTT4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B/Yr73v6cgvLSMiw8BbyDc8rAFSvpf6YYN0A1p/giGOx2NjlDLHQWp3K5EAvyI8/7
	 AQA20iLWU7WOE3p9aBq+XXaeGDndWYRxKu35KJYPCo5fU5/9DtUnv49bxeNZ0gW90t
	 AfJUk9Kq4KuGuaX2NNccH9rImnZlfATHMnH9Z0XnG4AF/CTZk/XO+7dVEIcXwDynrF
	 +1lM3VI4CVqHE2vFRXyZx1b55Bz3E2n02pII3pHZ5FF2Jyd3e2dpA3O/4F0IHU15r8
	 7nMMiJB40Kf2msfEitygkebX61dfDRJ3k7P+8iE1siryY/C6DtwSDRN2W6HkiKsSPl
	 HHqT7B9DCr/yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DCB084C77;
	Fri, 24 Apr 2026 16:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C1A194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E2AE42964
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJEgqwg11F3G for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCD64295A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDCD64295A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5C9282AE9; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:21:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7159759a9ab553d0892eee36c7b7fea607d671c7
X-Git-Newrev: bc9f770473a3495864135e0ef343d6f9176b4bc8
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.A5C9282AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libjxl: security
 bump to version 0.11.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc9f770473a3495864135e0ef343d6f9176b4bc8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release notes since v0.11.1, see:
https://github.com/libjxl/libjxl/releases/tag/v0.11.2

Fixes:
https://www.cve.org/cverecord?id=CVE-2025-12474
https://www.cve.org/cverecord?id=CVE-2026-1837

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit ccf69ab8c4cedfe5a1fdb7e5d90b962045064444)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index 56d1909110..5e76f0ee7f 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  1492dfef8dd6c3036446ac3b340005d92ab92f7d48ee3271b5dac1d36945d3d9  libjxl-0.11.1.tar.gz
+sha256  ab38928f7f6248e2a98cc184956021acb927b16a0dee71b4d260dc040a4320ea  libjxl-0.11.2.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 18bebad662..b877e42d35 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.11.1
+LIBJXL_VERSION = 0.11.2
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
