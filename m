Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A5ACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D36584542;
	Fri, 29 May 2026 18:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxxtbF_iX1FX; Fri, 29 May 2026 18:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B365B8453D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078303;
	bh=ILhUSNxv93m/ixX5Oo0tw6YbjR4OWpKjlxLhOr/oySo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SbSYgBvTYyXG92UyLQWIP1T3VAj+l0Wr+4uqKmEEqffaCzU5dtRAZ1d+PcEu1iy8v
	 ZAAsrbs6mNp5IT7qUc1dovemLHFfq3us/K1OHSUlFY35H3ouz/HfpGNno7Xyjn0LRs
	 NP6ncGs74d0ssoJKXwjN77zJJvW8/C1j0Klc7KVBjvDemY1rNxBSMkiUFiVcZsXviu
	 6Wkhxalepi8b++FiD6WBLENcf8tvTjcvzuS1Pg5Xtqaz5LZRFLitkn8kJ/KIdluBu3
	 DI6Rr14FOBJt52YoDt6yNgLR2kWBgoSEgiuI8K2imYXThLToo3/YA7IGULIRlvoGpm
	 z11ByJLO5KYdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B365B8453D;
	Fri, 29 May 2026 18:11:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF0F4D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 905066160B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbWnlvN_sEl1 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC8061606
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFC8061606
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F6508740F; Fri, 29 May 2026 18:11:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17b434cf07f2696d9c3b5290c85b7dfb54eff134
X-Git-Newrev: 0ff8b74a0ce71f51579c88710a96390f548b83c9
X-Patchwork-Hint: ignore
Message-Id: <20260529181128.0F6508740F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmicrohttpd: needs host-pkgconf
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0ff8b74a0ce71f51579c88710a96390f548b83c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
