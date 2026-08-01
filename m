Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6F7C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 10:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F9980D39;
	Sat,  1 Aug 2026 10:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ui-QKsp324Px; Sat,  1 Aug 2026 10:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DE7B80D7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785580431;
	bh=HtWrZ15PiUaaHZDpt1e48Hdk289e3sbtr1LoqiloFWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fbkbQijyOxks9GkNto+fp9pK7RUjVCq5/D7b02DAQ1LO4gIoP3mD3SSij9JFUfjc3
	 XYiKD0O+8kJlZVH2uGwKxJThVKQEcuHwUO1TgTXrR29B6Ye7G2DzQt1YbanxDs99bi
	 3uyAg2e8lK85+Fx1fDqkGyHDd8/6rTDnDJ6jvfhz1atBSsu//ubaIidptBflF199UO
	 Cjsi4NwZrvRHdyJTDfyDYHGOb1rRuPz0iQovQAqnYWaZwbcnsbyePDnB6i+3oM8Ieh
	 HUBoWNZQrHraVwGMa1WWQufgKtStT92FynsPxTThd9ZpYWNX/2zM3RNf2GY+vZat1d
	 qkq12EoxB6DBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DE7B80D7F;
	Sat,  1 Aug 2026 10:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EC751344
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5083B80D7F
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5_p-OO97lD9 for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 10:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722DE80D39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 722DE80D39
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 10:33:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E352186ADA; Sat,  1 Aug 2026 10:33:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 12:18:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f53e35703447b0e1709f6e217878894d265b672
X-Git-Newrev: cd8161a374464431514a72c50c7b12a0d9577800
X-Patchwork-Hint: ignore
Message-Id: <20260801103305.E352186ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump to version
 1.0.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd8161a374464431514a72c50c7b12a0d9577800
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog since 1.0.7

- 1.0.9: This is a bugfix release, fixing minor vulnerabilities
and expanding the test suite.

- 1.0.8: This is a bugfix release, fixing minor security
vulnerabilities and expanding the test suite.

Signed-off-by: Michele Comignano <mcdev@playlinux.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
