Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E4D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90C681D0B;
	Thu, 11 Dec 2025 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVj7RutQve3x; Thu, 11 Dec 2025 19:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2BFF81288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481426;
	bh=1ugzLA99CJSrokKp7YuKxBI62kxWcG/s4LWFCLK08xI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NKBh7+vejEqTSLDCBZXCjJOoKVcL8UbnvqToIJOPvh+k+HNu3bPjbPEQc7uUmLS7s
	 ATEoRuhPJC2skAERI8hAI5R206gdcf98d173nZXwrHOeed8Rk96YgCbuwbz6DK7A3B
	 g+Dlg/+bx+2WLcsVWopx452vLes1MweuCBnQ0NcXb4kkdJKUC9HqhhuJVTnYqGfL4Y
	 NH21yRzLMeK/eC01poS1z3EIlfgZ1EIlYzr3bgYROYGkGatwqVh89gBng2x8pWkunL
	 95ELFZu1ODcqgh0bxMbD/CqnfMJWz3s+vhm8a5VtAir6gawwRQiKBv4zpM7yEb/emv
	 xSW01c7XmEygQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2BFF81288;
	Thu, 11 Dec 2025 19:30:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 021302C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFE5880D50
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwcEjH96ohJ8 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF2580D8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BF2580D8A
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B53186BE5; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:32 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: df5b2222910f0c883b3e64de221725c17dff1592
X-Git-Newrev: 032e91d9ea7487e6c2adbce57cd60f21cb8f0cc3
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.3B53186BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/unbound: security
 bump version to 1.24.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=032e91d9ea7487e6c2adbce57cd60f21cb8f0cc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Changelog: https://nlnetlabs.nl/projects/unbound/download/

Fixes CVE-2025-11411:
https://nlnetlabs.nl/downloads/unbound/CVE-2025-11411.txt

Removed UNBOUND_IGNORE_CVES, the fix is included in this release.

The unbound version 1.23.0 also includes a fix when compiling with
gcc 15. See:
https://github.com/NLnetLabs/unbound/pull/1262

Fixes:
https://autobuild.buildroot.net/results/d3d/d3d6b84ba667e3e2586b7cfdaddcd160232eddfd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add comment about gcc-15 fix]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a1f691fb020067031dd020d6c844a4be43061e42)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 5 +----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index d9397f698a..19966d889e 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.asc
 # with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
-sha256  3036d23c23622b36d3c87e943117bdec1ac8f819636eb978d806416b0fa9ea46  unbound-1.21.1.tar.gz
+sha256  44e7b53e008a6dcaec03032769a212b46ab5c23c105284aa05a4f3af78e59cdb  unbound-1.24.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index e9a32e6129..b435839020 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.21.1
+UNBOUND_VERSION = 1.24.2
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
@@ -23,9 +23,6 @@ UNBOUND_CONF_OPTS = \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
-# Only vulnerable if built with --enable-subnet
-UNBOUND_IGNORE_CVES += CVE-2025-5994
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
