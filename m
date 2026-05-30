Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD90BCD6E53
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE69D852AA;
	Sat, 30 May 2026 10:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLUw_qLYmKQs; Sat, 30 May 2026 10:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BC1082166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135792;
	bh=ajet0vFlnN3zHnQqbeKCXlyu4t1iyjEgCzR+lsFrEYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hC928L49ZkenUzNysRERRmvPs4m6mEUJiI1iZzHJAXmxtzdhJw+651Db/3xsiUCgI
	 3uZu41khJ+rTsfKCIMo0Mr96F4hel33vfCVnv7yXv7M0FtXv1oGBYO3AIpIfz8IX0t
	 wI6dNLf6Sy3V9JE049fN1MPjd2VTOfTfSuSqi9P7eqcyn6cZTeDf8UlxBgSOfHpgWn
	 zxZWzvJVjIrK//2sNL5GH4p3tEXiWXschmFCXjAuUIY2UutssFYp3klhBhmZg5Ks+j
	 Fz8657OWTZ/UR5HhZ61/4+J29zcvibR7YyovRlBTk5LPaOs+sYrAmtM5DyZl4Qx+4Z
	 sXFj0J/9CM7pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BC1082166;
	Sat, 30 May 2026 10:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4108412F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C696F47F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Sz_07YVrDaE for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D1006F478
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D1006F478
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 511C9870C4; Sat, 30 May 2026 10:09:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:01:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d22ff1628f4d0ba2ae6f24515e1a87fd3649a18d
X-Git-Newrev: 5b9a32dc7282787ab9d5a09afcb19241d7d600fb
X-Patchwork-Hint: ignore
Message-Id: <20260530100934.511C9870C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdill: autoreconf needs
 host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b9a32dc7282787ab9d5a09afcb19241d7d600fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
