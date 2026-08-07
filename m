Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A105AC5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 785A880F10;
	Fri,  7 Aug 2026 09:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1iN30ezbCNC; Fri,  7 Aug 2026 09:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7A1D80F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095343;
	bh=NS61O1Kn2XsypA8k7baYMuW8nLm1LEg5AQ8UU/8KQ/A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hFwY/oXpjxIiUOelUW1umDtGhxrxi7Kv/bOrQhqAyauu3nCGvRCPhRotysorhPbOz
	 4fx3dIW6FKFCj4kLiA0OQdVogAyiJpTs3eulVShufx/LsYpaz7iTPa1LSkO+U7hE0h
	 YGZqxLQQDl6YlOhU01VP292Rq8b3FT0DXDn8SOxVurV5q3BiCfielCxkjgNa2N2CJ5
	 y75dG7afNzIxl5O2nEyC8s4dlHQV5I6xmYjAKZsPv1A2wEGkBSEuhiMyrgRRKRRL+L
	 AMkl5UExxZBboGyeN7FZ0q8A/XvabhfceTmNQgJFMgAx9bTjyzwv8l/fd+frV94jKw
	 8s/hDZSDCoOog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7A1D80F1F;
	Fri,  7 Aug 2026 09:35:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD3B397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF3BA409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrvxsUNh26EW for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A6C40A14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5A6C40A14
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B64C8CA40; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 129df625263e957e20cc1cc86c6ec9dcf3de6af8
X-Git-Newrev: aae95fb47dadcb4c121be22a8d7998748cf3f49a
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.5B64C8CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libmicrohttpd:
 bump to version 1.0.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aae95fb47dadcb4c121be22a8d7998748cf3f49a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Changelog since 1.0.7

- 1.0.9: This is a bugfix release, fixing minor vulnerabilities
and expanding the test suite.

- 1.0.8: This is a bugfix release, fixing minor security
vulnerabilities and expanding the test suite.

Signed-off-by: Michele Comignano <mcdev@playlinux.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cd8161a374464431514a72c50c7b12a0d9577800)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index d342eddc9e..b1b943ce87 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  827250db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98  libmicrohttpd-1.0.7.tar.gz
+sha256  6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012  libmicrohttpd-1.0.9.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 605291c046..c2e585adea 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.7
+LIBMICROHTTPD_VERSION = 1.0.9
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
