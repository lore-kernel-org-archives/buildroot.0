Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04460CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5B740F63;
	Fri,  5 Jun 2026 12:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59okl40VXL1L; Fri,  5 Jun 2026 12:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34EC340F6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663101;
	bh=bfBfezYTLh7CdsKAJSmVAwsla2FL1WZ+JYEoAHaIzwo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ORU+pXK4BzKesdXqg66JsUkyAgj0sNC6uvLt6G4xhwdE2nKDEtCI/DkN0Vh8cv32f
	 uWePut4rKAPFQXUf2r+OVwRBl0fAeQnIB08N3Hx0OPySUZ5DzxAMWbPbSD9sZKPEtB
	 d40r2/D00R69UWodrswcVGQQ21cwK6iReDgR7bekjAiqGal3fL9xOla/rxtQGvq/at
	 C+QMgfdjZymhWeIT81lDDvHY2bbV7D4HLRBEDiBAkEiO6Zml9f9PvSFIDiXFI7lCjO
	 jnUgJNERYzivzGcZQ9b/P3uJ81tWak2sN6UtDSJtW8NZuWwL7FgcbsBCVjkGRVV3F9
	 /E5LddhFwU9BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EC340F6D;
	Fri,  5 Jun 2026 12:38:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D739388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FE4681649
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euWfs1NvoiDD for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B82C581E92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B82C581E92
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0AB787B3B; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:01:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cff587367ed936e63df466c4c25eb96af203a062
X-Git-Newrev: 1748c12fbdd8bcc29837fb142c56a9c56d45b2e7
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.E0AB787B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libdill:
 autoreconf needs host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1748c12fbdd8bcc29837fb142c56a9c56d45b2e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 106e2b448c5249aa905aeaa0a5a1d1f87cf8f694 bumped libdill
to include an upstream commit:
https://github.com/sustrik/libdill/commit/b3b81d2c7bf4daf8a57925ddd40f5b6f13484187
which added PKG_CHECK_MODULES to configure.ac causing an error during
autoreconf when openssl, with host-pkgconf added as optional dependency,
is not selected:

configure.ac:119: error: possibly undefined macro: AC_CHECK_LIB
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:127: error: possibly undefined macro: AC_MSG_ERROR

Fixes:
https://autobuild.buildroot.net/results/05c/05c6a3f5a9290f1e5e4f62fea13a0f4cb1278c04/

The first build error of this kind occurred on 2022-08-21:
https://autobuild.buildroot.net/results/a29/a294492db81b6fd105dac88d8f5c8bc1a222bb8e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 5b9a32dc7282787ab9d5a09afcb19241d7d600fb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libdill/libdill.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index 9dda81d085..bea9aaeecb 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -10,6 +10,7 @@ LIBDILL_LICENSE = MIT
 LIBDILL_LICENSE_FILES = COPYING
 LIBDILL_INSTALL_STAGING = YES
 # Fetched from Github, with no configure script
+LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
@@ -19,7 +20,7 @@ LIBDILL_CONF_OPTS += --disable-threads
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBDILL_DEPENDENCIES += host-pkgconf openssl
+LIBDILL_DEPENDENCIES += openssl
 LIBDILL_CONF_OPTS += --enable-tls
 else
 LIBDILL_CONF_OPTS += --disable-tls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
