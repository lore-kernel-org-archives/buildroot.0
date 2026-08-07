Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D47C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E608481270;
	Fri,  7 Aug 2026 09:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ta7TWFucELRA; Fri,  7 Aug 2026 09:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7C38126E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095247;
	bh=oiXtZ009wOaqVs7kY7QLl2mF8dtOXUkCIll1wPbToLE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jQVV24fH0miDAj2xsO3mXzYVq7IfArZ4bX/BqJjAv6pzDPX4DVD8a1+lBDKlXMcQH
	 6ojp0+YsaJj5HlixaqjYftEP9zH74rswrELqAOXnlbJs1Kuy6D2qzMVNZG8Kmg1TpB
	 8aVQF2zQcVN5iUMPDusZ+znGHky0bFOgGPHVWnX4E0VJjs4aB+wMB0pfNdkuUNwQ0n
	 8OTew0hrSF3T/qyDrxXOBRrFOToxsYU5uJmoNRawgjNpFBfFYVAQPodMMXc2+ED92K
	 zd0WZerrqK6sukbk0WmLtU5dGK66geudMhGCEnK+DGxGdi+3fReSQtj5D0xghQ4Chb
	 t6hoAiFdKDSsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF7C38126E;
	Fri,  7 Aug 2026 09:34:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4653F397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3474019B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5DVv-cnaxOQ for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27B84025E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E27B84025E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BBBD8CA43; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af97fbb9ca5c8e1eaef4ef182836c2b61774ee00
X-Git-Newrev: 18c3f6d8950de68b4084b6d508acec0240b3bbfe
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.6BBBD8CA43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libmicrohttpd:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/18c3f6d8950de68b4084b6d508acec0240b3bbfe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
