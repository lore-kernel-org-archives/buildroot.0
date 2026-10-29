Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EB606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ssWg7B+V
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0203781289;
	Fri, 30 Oct 2026 14:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-P3oCWgK-z2; Fri, 30 Oct 2026 14:07:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5D3D812BD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369258;
	b=oKfnXrd1EyAHP3TkNv613WXm8/5IXK2DGDLwncVY9KocM/2beTmCtTrpaVCyYErK7Cmf
	 6XYs+qFUBEhUPcZNbIrACYNP61V+nAuSxjp9ykNGx4XIHoxJWFQW8M4vUIU0VQtHLQpTd
	 HHmURyp4wbcNSMioveOZqE5b+bxfAdNM9W7wxHGSwDipMliKP9XYrjK3RkMYFtG+5z3W0
	 Ib0n6X6/MJLO0ZRzsFx5cPUEpejx4h5Xd5TU7XLwMaqofYqdCCSQjHVUO7AIODkafoshS
	 Vl9FIASbM1w9UWes3nRkaWfe/tEuBCYEIad0JHRfV7I9mbfveGUZE3Ipi2MWnZbvQlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=uCuMXTwTt4PUjdPq2E0GM5yp5+X8rmIKC8PN4zhybTo=;
	b=FvxnUc1rPwPZzAoH0NirfpaXEL4nVrPE0EDfIQUZsK0HJG1ETs3MAYvQKaBBqzPlUJ7v
	 yTiCeA+gHMAJYoCdvoyISgBGXsUPM25PjjPiMIUhhqThnhLNwJKMAYzXxviGrt2IhyutN
	 19XGxlGWJofP4KWumdZHLW++Uvtz600RPHP48628AOl9kI2WBj629pro5WVxbesd2kADm
	 vypqFSie3v17yMFjYHbkGSegnDUlREK/CSQqDTAgH8MpA3Xof/2mlCpqNXF4u6aTGt7T+
	 j6Ca2K26eUiBzZcPpc6Cw6YKeeZlps2k3ZB0F47Hb4jAKcr0hsvoKaPTu6rhGXatpdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369258;
	bh=uCuMXTwTt4PUjdPq2E0GM5yp5+X8rmIKC8PN4zhybTo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ssWg7B+VYHFPfydgNuOXxVFyXgj9e9lAICyeVp5GxkiEXpXqIzSMtV9971oIfwZYr
	 X6oHW86Hc++jg0tIvcXxMZKUXYdtxoNOets6gMHxTU8JRp+abD+Yf632ShxOJNnsEE
	 9s5BkaS7S7rO1EFK1q1OnE2e1k2tPykhZEY3hMnx2+CUWLdx1A6mEBMolb+nP+Re7Z
	 es2sD60QqlnOAwXLOCEXkL22k22l5LUM0vS4cP8kCXI4f1JsKhBpqFzc3PYkYgOoPC
	 KP3F3ufp9GbAUVm7fZYKrjBf8QCHj8emnPuSgEqIoP9Km+mnNFuX24NJbHXEVBtIIH
	 Nfk0K7Ywa4sLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D3D812BD;
	Fri, 30 Oct 2026 14:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90708D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81AE040B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJssyYT4v6-5 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8885840B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=dZN1kqDr74dWy9p5Hk6M4JjyX+1YFr0Z010JAQeaNOmXananV4SKNF/amWZ4gYaXfsBy
 7/W5Lp/iKF+8krZTGKiTLdad1Ui8E5NZ/PVV3R8LdHf+d6ioihNKgYvYtuUG1hZp7lW6o
 ME1WJyLWUYRkZl6yH/K5ro/oV+1V8fkKWC5sm17IMHvnUNfTP33X5NPd6V0HBOgpa/Tg+
 G0WFfnpeGLzUpbEryTq9aDP8qIgw61uDVQw2KH1zBTYhRk7NNneyYkaqhjaeNKh7EnDJW
 3pQIpaNlMT1LYV0GTBW3GKTmJQVMNOOKrchqAL3ZzEkHlSDgzoIUwbOwPr/3IAvYpIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=G4l/VQbmYetSNAu9ODOnrpcsdzTB6AU7ybhcOd9NqJQ=;
 b=A1xAaBJ9oTsm89OQkaf7lQsatc8QBMT4SbOXwxV0zgh2q8M+Rjqo4EmdSFhU66SFu4Bf
 bLbkStfZ5iywdXEQZTtqWJTJUbXVajTaQ5s/EVLgR94VVZtUJ76678V0lchokuqB91G96
 EpWg3g6GEUGWKgbax4iCQofiG0wiopxzIw/eet5r3E+UM4+oW/7Ka7mxaHdK6TM0AjcMM
 EVsnze6mDYXLDMA7PrSUKbQBFcXiSgC7MlSsYdqd+ddEI6tT90tqbEq0lu3e2mUPVgJO3
 /BX0sG/TA2x0mEm2He+Vxtu6Qdel/yvsp8iieQ1CVbVIy9EIcWThC+DxTIDthO7IRNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8885840B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CF489D38B; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 58e85acd4472d14da367c78f177049eb53f24c1e
X-Git-Newrev: 8a5114b517723448629b241480e4138f28fe5c7b
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.9CF489D38B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/parted: security
 bump to version 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5111468075806614422=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5111468075806614422==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a5114b517723448629b241480e4138f28fe5c7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following security issues:

- CVE-2026-89085
- CVE-2026-89088

Other changes in 3.7 and 3.8 include ExFAT detection support, several
libparted fixes for corrupted/unhandled disklabels and a gcc 15 build
fix. See the NEWS file for details:
https://cgit.git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.8

Drop 0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch,
which is included in this release.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92b2747f46673d69710f4f330adcf836c0d66294)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...4-PATCH-parted-fix-do_version-declaration.patch | 44 ----------------------
 package/parted/parted.hash                         |  2 +-
 package/parted/parted.mk                           |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
deleted file mode 100644
index 78709e07ad..0000000000
--- a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 12:22:22 +0000
-Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
-
-With gcc 15-20241117 compile fails with the below error, update the
-do_version declaration to match the header in command.h
-
-../../parted/parted.c: In function '_init_commands':
-../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
- 2469 |         do_version,
-      |         ^~~~~~~~~~
-      |         |
-      |         int (*)(void)
-In file included from ../../parted/parted.c:28:
-../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
-   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
-      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- parted/parted.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parted/parted.c b/parted/parted.c
-index 3abb52f..fc2aeba 100644
---- a/parted/parted.c
-+++ b/parted/parted.c
-@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
- }
- 
- static int
--do_version ()
-+do_version (PedDevice** dev, PedDisk** diskp)
- {
-     printf ("\n%s\n%s",
-             prog_name,
--- 
-2.34.1
-
diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 6643ba9fbe..9218deb39b 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612  parted-3.6.tar.xz
+sha256  a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63  parted-3.8.tar.xz
 
 # Locally calculated
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 5b55a9f21e..314bd0d3c4 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.6
+PARTED_VERSION = 3.8
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux

--===============5111468075806614422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5111468075806614422==--
