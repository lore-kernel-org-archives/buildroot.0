Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD3606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TKdAAbIF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24ED48136E;
	Fri,  6 Nov 2026 15:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mWTF5eX7XtG; Fri,  6 Nov 2026 15:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 87F1D812E9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980768;
	b=lz2eZM3/bdelFQbJVkwqqMwDrz9El7UL28k495oYyHKSn5EAvCsV/LkVOJjeBPlDnuGN
	 RNwBAM0x7WQ1pzB6mOLQkvwAQF1ASR1K1PkXuQUFPtL80bV6rgVtQx8yHEmWHQtDp8TYr
	 is5/zDFdrXzzjDEG7go8Da2pSMmkU7LXyBilD3Q/YsXB8306dGwuH63ShyqTsY8R26lBd
	 oZLxC+c6ZeRerBrTlOEqSQj1VKMrEpmI3Zg59HzJ/f64LFZiJcPPGIm5V4NoTk4FJyFb7
	 BUVgDo4EisF+AOp1hV9rNHUMn8nBlyHlP231xeFvVpA8nOP9UGs9KUrEFLHnfP+IPiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xJDc4sXUD4AO/byFbgm81U0B/0PPEXJRIUc3Grtkmdo=;
	b=Y+vt/sh52LdL8VW2vMx3EzvlR0IgKT1A7OlopxuIrUN+P0i00Vt4qJmUaS9fD3J+91e/
	 fzjmPN7aQD6ZxE4obAy3DQtQXvK1i4Ioxqe74YQFCN5vekJRPRRE1Y73aTeG68iESD1Ai
	 8ptmLFw5Rot8/Mf4v5jFfj8pRa7LIJbL9LxqHWByQLAnUs73tXVxc82m4/Ra+xZ1DJY1N
	 MlL1XIwjFwMdM+Gp6I7m25ATq/7bcbaQzlHT0zusGHLC6KD6fI/KagmXaxOm+XMqXjNdz
	 q5QwoHJgZo0NEG3Ej3cIfjBeiipGMPZ/XHGMSYMpn4qnIJNO3tRw1H0DepPuA0upuBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980768;
	bh=xJDc4sXUD4AO/byFbgm81U0B/0PPEXJRIUc3Grtkmdo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TKdAAbIFMqpNU+RUUkeQBpInQI/UELI2clOZRqIpL0WtWw7QVNlA2ZxDsAEOyLwaM
	 N2Dnr1lcjAWLItSh+dTw9Uu/NuPetLktVuMdIOlQbZNff9nN/W2GW/dlM1wHsWZjct
	 PxKmM+jTEQLbSrk1pP8Vkzv7a3+sO9BjlWyWIXCYSOWt7d4YAR98speUxvW9yuVeWk
	 KR1CmVaoYmbqYWa7ef/fusecZwsgZlEX/GQ4Y7DhFplm8p+Y0oG0SKkLaT9gBlsPR3
	 ilA285uLvfuUwYe/tTmt5FBEq806AbYmMfB+8iLHTkmf6/u9zZhUAIeydwtalSoU6c
	 BAlvZPwIOyUCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F1D812E9;
	Fri,  6 Nov 2026 15:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04B6FAFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA0B3403D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJnx35eV0VPl for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 17E07403D8
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E07403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 505D29E09B; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9236d34291b0c59335970698e90d9bd3956a6230
X-Git-Newrev: 955e2347209bf962f9961a5e21d81b9bc486ebe3
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.505D29E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libaio: fetch
 from Codeberg
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
Content-Type: multipart/mixed; boundary="===============0516354968347785225=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0516354968347785225==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/955e2347209bf962f9961a5e21d81b9bc486ebe3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

pagure.io was shut down in 2026 and is now a read-only snapshot that
no longer serves release tarballs, so the download fails:

  HTTP ERROR response 404 Not Found [https://releases.pagure.org/libaio/libaio-0.3.113.tar.gz]

libaio moved to https://codeberg.org/jmoyer/libaio, whose releases
carry the original tarballs together with their sha512sum files. The
0.3.113 tarball is identical: it matches the existing hash. Point the
hash file comment and the homepage there too.

This is not caused by a Buildroot commit: libaio has been fetched from
releases.pagure.org since 2018.11, and all maintenance branches
(2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x, 2026.08.x) use the same
version and URL.

Fixes:
https://autobuild.buildroot.org/results/0019c80cc07db35d11241c516c04a0ad3e00ca57

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9462bb4baf4b58bec107ee1c6952b1e17072c3c3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libaio/Config.in   | 2 +-
 package/libaio/libaio.hash | 2 +-
 package/libaio/libaio.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index eed843f44b..6796035122 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBAIO
 	help
 	  Library for doing asynchronous I/O
 
-	  https://pagure.io/libaio/
+	  https://codeberg.org/jmoyer/libaio
diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index 4ddc97334f..f37e4cf4f4 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,4 +1,4 @@
-# From https://releases.pagure.org/libaio/CHECKSUMS
+# From https://codeberg.org/jmoyer/libaio/releases/download/libaio-0.3.113/libaio-0.3.113.tar.gz.sha512sum
 sha512  65c30a102433bf8386581b03fc706d84bd341be249fbdee11a032b237a7b239e8c27413504fef15e2797b1acd67f752526637005889590ecb380e2e120ab0b71  libaio-0.3.113.tar.gz
 
 # Hash for license file:
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 16cb502f16..0512c6a728 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBAIO_VERSION = 0.3.113
-LIBAIO_SITE = https://releases.pagure.org/libaio
+LIBAIO_SITE = https://codeberg.org/jmoyer/libaio/releases/download/libaio-$(LIBAIO_VERSION)
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING

--===============0516354968347785225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0516354968347785225==--
