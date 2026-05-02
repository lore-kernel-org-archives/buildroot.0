Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80399CCFA13
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 10:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2829B4064A;
	Sat,  2 May 2026 10:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPwOIjURvlQQ; Sat,  2 May 2026 10:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61BD140650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777716302;
	bh=J9jMCdlFdz7WFBJ/JNA4JEDucI0ayD3HIuEI++rPHoQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hAYwS2GlIoLCRHg7KFxwXVbvuTO05A09elr3h6jD2u0HEIvlsdNYQSMZYlegKkjsq
	 OckzEb7HxG7l/28hfkd4jLs3nz36RRt49xailoIy6zZEuxJqs683Qt7OP1fvIykw4s
	 oTGFGb+qk3WHmcjBroL7IqSO2EtnTVBwRhKsirNq6Pfc6CaSWnzOdkzU44y7szq38a
	 VDB2GIzAuKxH6a3gWKiUpOdCc6v0AchLcH07T8OnLtJJncqcn4yMSZ19y5O4ia0wSe
	 AB+eLJsBxxsdzkxFzS+s6OfEep/YAf1eqCHFjx2YaH5tZHF4U2W7BUQdoqqo4MUcF+
	 TIerBk7DVnlwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BD140650;
	Sat,  2 May 2026 10:05:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9CF8127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 10:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB6794078B
 for <buildroot@buildroot.org>; Sat,  2 May 2026 10:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOgVBDKTGKGg for <buildroot@buildroot.org>;
 Sat,  2 May 2026 10:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C00384077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C00384077F
 for <buildroot@buildroot.org>; Sat,  2 May 2026 10:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1140F7FB78; Sat,  2 May 2026 10:04:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 11:57:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8940fae6070eb064042b9e54b862523cc1b8d6bc
X-Git-Newrev: d459d257c3a3895c3539d349c8e834f938ec909a
X-Patchwork-Hint: ignore
Message-Id: <20260502100446.1140F7FB78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: security bump to version
 3.8.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d459d257c3a3895c3539d349c8e834f938ec909a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnupg.org/pipermail/gnutls-help/2026-April/004922.html

Fixes the following CVEs:

CVE-2026-33845
CVE-2026-33846
CVE-2026-3832
CVE-2026-3833
CVE-2026-42009
CVE-2026-42010
CVE-2026-42011
CVE-2026-42012
CVE-2026-42013
CVE-2026-42014
CVE-2026-42015
CVE-2026-5260
CVE-2026-5419

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 209b6aa220..99a721d208 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.12.tar.xz.sig
-sha256  a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51  gnutls-3.8.12.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.13.tar.xz.sig
+sha256  ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e  gnutls-3.8.13.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0844bfe50d..6411a7d621 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
