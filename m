Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B092D43344
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3030B41073;
	Thu, 11 Dec 2025 19:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUnmETjn4VZV; Thu, 11 Dec 2025 19:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0FE240F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481281;
	bh=V2/m4IRUJmpOseEt3Dq7KIUQ/wxvCxNUEl6ST3rzFro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nW9/KvN6LIHyyWJuf2wk8NhPQtYhT45Cv/DyPkD2lVskQGzdsAOImsW1slHNn0VeR
	 H+Ynd8XPr+/r3XCN7bDwGT/D3ZH/XtTwExpT4JOgid59lECdkjpj4HXYGvJCMe0faf
	 onVu4znbL/nh+tnkCfyl9eRRvXk3Msfi8QJzcAQGI1SuRzlIqTdjTi2kKqftxaYD3M
	 L40E1xLufrpcXY7Ir6pE5m474xp1PiMePKyBXPhAXhNOP/+LZWdzYK1b0Z/cE83syH
	 dKoRvgLIJu/AL3qqPboD2yo+BdnyUSY0wVuhSHulOwtZnyuACDdzyvHa8kgfo3sQom
	 gEqLwBYal+aIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0FE240F31;
	Thu, 11 Dec 2025 19:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31E992C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEEE740029
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYa-CvRk46t5 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD2534006E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD2534006E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB85786B47; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3afaa164ff2bef4477bced31b95feee0396b514c
X-Git-Newrev: 5dd6a33d6796e0cda2498e476de7d1e5f82808a4
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.CB85786B47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/unbound: security
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dd6a33d6796e0cda2498e476de7d1e5f82808a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
