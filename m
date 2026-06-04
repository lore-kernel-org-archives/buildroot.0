Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8701CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A09A681F39;
	Fri,  5 Jun 2026 12:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sae_7KEaZ40Q; Fri,  5 Jun 2026 12:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C185482081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663174;
	bh=tYWwJrV25fT7LG8NA9ZP0h/u5id6W0HCOyWqmRQVc8M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AEubkrhAqhNSM8olx9GIsPEzPIc3m7M1tVx+LfOoX9nzb3wju5KpGMZpb6ZAl6Ldt
	 3n+VegKoY6HCA2DxFEW6qwFl6urJo2t+/0iRpzJfhSNRuHgcl78BMOQISh8sSYH/0q
	 nr70q7snA4zp3ZGuOYOOxYpY0Yy5+6osa86ZaCS7TF/cgw7Obufi4bjCa7btuIXAaO
	 agPDoThmowsM5Me4fil7mxSkfTiMZ16XXtkUzunQ1n5CETh4VHQA81547qFT08417P
	 A+mw/7kZ36SeHn/yBSBcNpNwr3K4KjocenIHornGNjz06W+aPK9jmoBJv0T5ukfOuw
	 e+pkY1uV+5NFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C185482081;
	Fri,  5 Jun 2026 12:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB393B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5CD34105D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCO058GOJDGc for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF0CC4100C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF0CC4100C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E87E787B04; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:43:08 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c5fbbc198c281bb99cc9ba0fa8d2eb7b8c73117c
X-Git-Newrev: 34da6b3662724bfc9f6d42017ce5c02a7d7a8bef
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.E87E787B04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libmicrohttpd:
 needs host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34da6b3662724bfc9f6d42017ce5c02a7d7a8bef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 712121326f84e2508ab161053c2b04e45511c79f bumped the
package to 1.0.5 which includes upstream commit
https://github.com/Karlson2k/libmicrohttpd/commit/a1f937422658d3c6d53853c587bc025274afac4d
that breaks the build if pkgconf was not found:
https://github.com/Karlson2k/libmicrohttpd/blame/master/m4/pkg.m4#L84

Fixes:
https://autobuild.buildroot.net/results/e3e/e3e25753c670b5d86d042d850582e2e1e0eedca5/
https://gitlab.com/buildroot.org/buildroot/-/jobs/14386351826

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 0ff8b74a0ce71f51579c88710a96390f548b83c9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libmicrohttpd/libmicrohttpd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 7a243b42cf..a3b24d363c 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -9,6 +9,7 @@ LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
 LIBMICROHTTPD_INSTALL_STAGING = YES
+LIBMICROHTTPD_DEPENDENCIES = host-pkgconf
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
@@ -16,7 +17,7 @@ LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPL-2.1+
-LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
+LIBMICROHTTPD_DEPENDENCIES += gnutls
 LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
 else
 LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
