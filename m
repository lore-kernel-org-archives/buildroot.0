Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE9BCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6365C81EB5;
	Fri,  5 Jun 2026 12:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSyd4XC2gepb; Fri,  5 Jun 2026 12:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A7482164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663209;
	bh=9eLLyqz66teUNt4qZ4Mfin8Xih+yvKhNWiftXSVq/Vo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p1bEE9l2r/LnBxEuzrNW2NTyNzWeBcSNUQfChLO1OL1uPCnNHPkHV5DF3GPJ4U/Ou
	 YweqFC+VyKuqwcSQKEYHtHZS4rAtAUWXRmw1Nie3TGN6oMmw5hvQURK20Y6sEpnzR7
	 qa968REv5OjweFVvL0LWAtTOAgTF92mi3ht7xFvEafx0qSycb7crXYbOhg4QyQUFGB
	 eI/UDK+pYqZgRfw4A+DwWY6HQ4Pw3rb/GMoAbux115anGUYrxgLs24kXeq3NOdJdiZ
	 ouV3AFrz9SvJ2sLcCi7AdzM7YogIObZkOYJIkxdHiBA19OxO0UbAGLJea3YWJI1mVj
	 rkhoLgMQ4Pq9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A7482164;
	Fri,  5 Jun 2026 12:40:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0272E388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 178D281E78
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ne9ejhcVqu8u for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20E4681FE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20E4681FE9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49F9C87B2F; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:01:36 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cf2b6482edb84e29d24f53c483521aece0fe5d86
X-Git-Newrev: 516e0521e8b05103eb5112d7266a1962cb9a952f
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.49F9C87B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libdill:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/516e0521e8b05103eb5112d7266a1962cb9a952f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
