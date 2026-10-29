Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78096606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CpzWn89w
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538ED40B26;
	Fri, 30 Oct 2026 14:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oJ9NYoWngh9; Fri, 30 Oct 2026 14:06:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7CC8640B5F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369191;
	b=fXhtEKYmNO5uVNx9zAFuIE8VB3vP5kw/on2/3/FTCkZy2+1bR0bcM+sA3DyediSfazVV
	 CjQxvl/8pS3ktofRnhGOE9bOR1n8EtrGiwZCrfADFm/2nMfOM15S3qOG3giO+udXyKTI8
	 e6wMjT4UISk7r6AyJ2gc6XHcJysKE81WECEKxuZtROj4lcXxWkE3Gx/9A1AFuSWGISNTg
	 irWMkdsKWTGfq6rASPDGaBKn8c3B9SIpphfVj0GMIbbxUbuUju37RFIDSleTmCf0dCtGH
	 gN7ZZ4syIbL4u3OdKARubXe3Zu5s1vjzSyaiZK7XCuXtEYu1HKx8E8zrfttgeK+2zxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=L5v6czXYk4oV6osSo1J70I2rt9Bc6RUc4VAg4niyKwM=;
	b=bhgEgzdX7MNrWelCzmteMQHAsSmtsujlDCq4j2QTRsrWiWHaNzOkF/aKZztizWCjNEdz
	 xFLeg1wPRrb/YOm/jsQNQc6gczNjhZkRb+iygSfBPEYIC6+Bw/9V6olS6ozJbZGNvgt/h
	 5bvm/hGEMNNWBFVcjPzzSOYQutDOXByDsDr95p8RnoIMxaT9sqLG0SlgUqGvXRKhcn10f
	 KjKl+uTcfp1tYNKwyYEug5reJog4mKMg4k8xduT2OhPv0TU/97xEw/QzoLBBUsxL4qSKE
	 s0inqGUWXuWT+UOb2jBxFn6HtUZPXGEcA/oOEaZtSHOge/qB0PmOMC7+IKVYDHXETEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369191;
	bh=L5v6czXYk4oV6osSo1J70I2rt9Bc6RUc4VAg4niyKwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CpzWn89wBAGzuzrLgXQ5S8nsYXaKinFRKea/Lk79KQqlYBsCMn5lmSjiM/2h0IuMY
	 ZqO4G6tKeegPSQ2D6CbI5ILwZ8F4uIhFxdbqUE7ZTefFnQ69pgETor5C3QIBhAfqfx
	 i0l9wFYlfoXrb7EK8PuuXW9cPso/PpAOTEJoZBkWlNu5nMANDDaZXA0qXqDzFu6vF2
	 sl8EMvo/H2CIZyT5X8MGrsi6dfrR1nyYZQKaeY2fJTnD2IVyYtsJCGBLZITSRXfAyE
	 kLNWKp1JyQd+I46M7qlV/Tkjse87vwRgMjqXIvPEnee2rdeJIA9bUrUGjPdgeShHn8
	 9clyxzPcrT1HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC8640B5F;
	Fri, 30 Oct 2026 14:06:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C9ACD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F98960ABC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhtTdeKKi4Bc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72F4960AC2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=QTYMUaz08xdEj4B1O+P3oSTFxVZ4Ml3G9UdHCo+lbbLCi8e29wtqcPyjO4kUWNuXrD6W
 hdp3m3wkvw3bi+OIPEweTUOIg3TxKiOHiiOXanQfkg88AO2jTvvXJrJPgY7WJN8RFpBAZ
 mjXuDuC0J4sPZwigIBhdb+rQfnPk/KFkm9nDU5yPq82NJaKLp8fLvwyIYNgZzPgnEn3MK
 yyzIw2yTmLPq9MSXs9V3SRhfMcUhTIFXYMt6RdfaZAd+dU3aJOaFRthwxXe4F01HmcsZ7
 4QV2USnEuarHxRngL0X9LRM0AjtGe2ZYnf9poF7u0rgb0K+dnPzrIwTeoG01CQQlSig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=siJje6ULxk+Bx++Hj2IKGdIfOYs/zmUuPD6sq/B3eec=;
 b=ejklKS4mHhX0XowzRQbcKF+Y/IKoM7H2Z+4PyCVGuJNqrR410ztvdmvegsN5Nt5ILoqC
 dQ0dmxZveV9oSs0gVq8EPkIeDesZqHjh00V7Kza96Dv+xR2RsvAzOGk3ael5in1Wid2Na
 OqOHQ2QvIAPT5EkHGXyxXljgS1LTUilAIJwp+NQwgnlLlj2PQKl88L5mgqKEf3K1p5jYg
 vq8NGN2jpt8dmerYdVQh3Pa1hPYZkx4tpJCVrdg2o35Rd2QRiEbwFNviRQv4iGFMSRMu+
 JxccNbOmLjb0QfFrcd1ve3eiCAdst+CvlcBTqmprjpXittyXhec6Dqew4NvssH4TkYg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72F4960AC2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 860B59D389; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b5e59b55987fa67dc1608b224ee3b53f6563a75d
X-Git-Newrev: e41686f0c6259ba8cc9d31882f82c7ab7d1c1a14
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.860B59D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "Config.in,
 Makefile: add BR2_HIDE_SECONDARY_TARGET_OPTIONS"
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
Content-Type: multipart/mixed; boundary="===============8572727399538601198=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8572727399538601198==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e41686f0c6259ba8cc9d31882f82c7ab7d1c1a14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit 4642f903cd613bc52f9bb8ea94c4d0ab18464c92.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 07c23d76938c403ce3d1e6b4ca8849c07a3d7712)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 Config.in | 4 ----
 Makefile  | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/Config.in b/Config.in
index d8f78f094a..23717f3f97 100644
--- a/Config.in
+++ b/Config.in
@@ -15,10 +15,6 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
-config BR2_HIDE_SECONDARY_TARGET_OPTIONS
-	bool
-	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
-
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
diff --git a/Makefile b/Makefile
index 5b838ddf2b..b3210e19af 100644
--- a/Makefile
+++ b/Makefile
@@ -258,13 +258,6 @@ export LANG = C
 export LC_ALL = C
 endif
 
-# we set a default value here to avoid a Kconfig warning about unset
-# environment varilable. This option is passed as an environment
-# variable to be controlled by autobuilders. The purpose is to test
-# less frequently some uncommon configurations which tend to generate
-# more build failures.
-export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
-
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")

--===============8572727399538601198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8572727399538601198==--
