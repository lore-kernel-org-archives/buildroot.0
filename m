Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC618606A336
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R30BoF2t
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EF498179A;
	Fri,  6 Nov 2026 16:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbWOl-VvKatl; Fri,  6 Nov 2026 16:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 19C9281786
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981366;
	b=tXcM5IvZIJbJhDPXfnFwoBbdG8ywYCFy4aaFhf2FJ5A+N+WTrvuqUnjsCmDwl7doe4GP
	 z8QR+7Pyns09iVP5AA79kUhD3c/vrPr8BhtNvcOPyQsOwZKRet0MgPqWU7ywdc7pCybg5
	 ma39mci9WM/VC02MhaQJ8gq4eg90Rb3SNzHrozM2bUiN3nCOMxTtqwt79YnN5iE+UcpkN
	 hTEgMQu9r3JAV07ke8qDtZXBQUPKkYwa/FiuXq9mtG4nxeH8kweRXrtuL533Hj6lDY7f0
	 dVL56t8tdCN3YgUnA+2BrZbxi47/GuIC2VmfKtjTTRStTM49OQegoyB15VlKKqFF0Nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dpkhvlvwC7KbSQ5Nb7G6iDfUTYQ2EgbexSf3nzLzHEo=;
	b=aHMpSRPWitu4DEy2CUtZUOd0I6HNX6I/L/81Jzzke1pQPwr8FAplOPmz7C82+harrXeB
	 heuUganiF4iV0UzOkAZwNPX8d3/QqSoAuMQlTpe7ixzM9xBd5kc1Ou7hvXU3dBDR0H+us
	 bVcodnnFRG6vUGQd+KUQVpFc0+l+aTRmnDr/sFWXmDgHQ4SD0nbt+CoKzGG5HfZ5tt6/y
	 M5wHejLbGIQuP6UkyzVft5+IAbf4+PsnUH9GC6hlo5ueg6he8z1IQLh5cO6VJNScwx62v
	 dyU9dqatfflXZ08SVMzWq0p1MHCRQQreb93wSgQLZkrFKK8BqseK9FGCYpoBQkGLUEA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981366;
	bh=dpkhvlvwC7KbSQ5Nb7G6iDfUTYQ2EgbexSf3nzLzHEo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R30BoF2tUeNjruyQ9773sz4bIP3ZBW7EzaC9udwco44ejGF7U0i0Jqmu1PUDZl86e
	 Gw16Y4dsF8P0OW9fO5adLMXrigw+nPQYn+7UUamx6NrHlMXFYSXyxOzXByim5+K1O5
	 yj+oLJ+LytviO0tkiwpkkQ69SkkUAXAJuuNv6n0nLe/0FB6moc/1xuBHgSvXOwXbo7
	 LYb/Tgg1x8TUoGxSedV9ihj0NF+PFfc407nI5oM9ir1e7dAC/uLZ3TRz6vkmwh/fS/
	 Z4WmiLrwyTW+2mlzmp7j3Z+zh5kFOeDbR1bOv2f01qR4FVIxyzX74ce3Awv2MnWvGs
	 PPvLGLnghrHfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C9281786;
	Fri,  6 Nov 2026 16:09:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77E832E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69D4E4090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5juXUOlMqvD for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B8D8D40911
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8D8D40911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F02A49E09B; Fri,  6 Nov 2026 16:07:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:31:00 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9f07c04c767c45f9a243c21870538d07115a1f55
X-Git-Newrev: 6d814913ce2d49fce06ccef4903ec584859ad508
X-Patchwork-Hint: ignore
Message-Id: <20261106160711.F02A49E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libaio: fetch
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
Content-Type: multipart/mixed; boundary="===============2941369934761239810=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2941369934761239810==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d814913ce2d49fce06ccef4903ec584859ad508
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============2941369934761239810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2941369934761239810==--
