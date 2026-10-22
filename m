Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B975606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CYFQlv+o
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 655EE813F6;
	Fri, 23 Oct 2026 12:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ky2J7xGcPSNo; Fri, 23 Oct 2026 12:24:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DEB4815B2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758292;
	b=nZdoPBlAuDaaoWdrKBpVsO4CqWpwd4H8XRl/jP9+vEhj/JgfXIjNV9tjlm3WM+0ls7/g
	 uGXqAckGJztEcCT+o/sNapOJ9rUzBUS9oR3afSpMfqFcqbYoUI6Dg/Mg/3g39RIvYtj3f
	 eisrMhxHVC2V1dV2wzwV4k/6UnOhklc39ArCaeobae7fuF1EsVoxmxlxAogpWCaCGzr65
	 ndMABvZW4fVfdJiUbXsfJtmlFepmKK9OjCFopL+Nt48XejRGeqGzXsMTwbtcnkqntTal1
	 PIOIaFMKUOEAw2rHgL7Mu2b3g+0HiyulSdvioXKMSi9GhCG1yK9djul971LgaZNcaUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758292;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tZ2hDfJoPwPGH0f3ZxnEJrYxecAqyJ8ReAd0IPvLt8M=;
	b=jM51LmTnOjUDNGtkX4LF0UA+9HyT5IyAm1qBHxATskWfEbU6QxDnIsGKk5+NbvG5bprN
	 cbTxX33GWRDkWmkD2XLL/5BZIGNNfN1s7m+++wcWIRG74LwxbVdM+87yeEMl6RNYWeR48
	 aDBA6wCo7O1spH7CGOIcc5xCJFVIzjNgpbM2TAZZZZxk6yazu/3tG4Ulugkz2q4D/2B29
	 v4ahL7h4cTdmbceHQE6f27Brzi3VAo9OYZ/BrQPS35YLDouOQJdn/SEV7sgPW2NVdr+9B
	 dWQhq1MIlCUDtkj1o+MrwVvk2tKXbbT6cDKOiYeZfTEKjLAY7PDZh6mTqUKwcyp92hg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758292;
	bh=tZ2hDfJoPwPGH0f3ZxnEJrYxecAqyJ8ReAd0IPvLt8M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CYFQlv+oCHbDKfCLXmWWjfpflc+esty6QpMxSJVrz9KXPHA+M6r+TAomNeDO3R1NJ
	 Fkhs3w3vGdZN7NSnAqcYKt7WXbcyrqpOAarIX9YVzOP/dLHHGmX37zG5ULcz3USFoB
	 gYGEeCbSqvfFF/isW8dgiWJCQoL8A5UoKseaFzMWkogiSwc0iiuAU+YF63DdT5a68U
	 fXX5pRcaJphRW+B5XWbXEbPzQkyiYUXpHJCrYHNWXEp505tKeMqfAHo4c63Y+H3/Jq
	 +Gt4z4Se1yvzZqm2H5q9KaGKlKq5EFTH0ysWjaL6UGCvU+spUNtYf8F2ZWwloOJllk
	 w3DrrEsgqY/WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DEB4815B2;
	Fri, 23 Oct 2026 12:24:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23CE712C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15CE440782
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OobrgwTwxJeV for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 69EDD4072E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758281;
 b=jJ+rRk8XNlP4QDjJ82p/f/JOVHfRTRsmA+0RN9kIBSNHIgo2DuHQyEL+AKEFOGGsMJi7
 fBZOy1F1CGXsvYbkfh9q7RaXo2GEVSJU6vOyizfFLnkIED2ng2b5P4AbbygrKXJt8kqKd
 PAWrz96O83Yfwic52QfKds6oid8JqnhmzBSL12HEiCL1wjy6wpb7T2B4gf2MWyCAaYyDh
 euMtcDg0/e55iD4MFll2cYzACBowATGtlexAefIB5O3uyRnaJfOQBqWFXeMiSoQqC4l96
 T2i369vVpDcSk6tl2znYz06wMhQLAHshMItftgR3G9IxfRXjjRQ0062sWVgyddU9Skw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QyINoc1JkEUCeFo6aOai4a3gVrViURVALC2qCyCFZt0=;
 b=Gk1LLXnfx5gAxu78ph1Dzl4eQubZTRYnc/ZRvM+7JrijH2xXauOAlb2SjNEgkg9Px+Xl
 1m83Yzzr/ztkp6hIXxHulg1Bf9e47tQX+HXK3Cmo1SsZbEFSKb8j5CvPA8s1ikd97TiJg
 IpzedpjQY63NDawhjDi0YDX7XvKZBFL4IqtBvctBMuX/wYqIinDNGbqiq9koEuQgpNrO6
 Fx5LjgRVKoXRTYUIfNQULnidXTIfnx5w/LS/QS2MQw/lOjfU0gcUwhXWS2htj8jcevudt
 ee2MIi4mWvL2zPh3NnhVkIwR+4HkJcgDYfWrjkeaQunB4YHHHF7Svq2K2wVM9NCPzhw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69EDD4072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFA379C66A; Fri, 23 Oct 2026 12:23:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 049251bc4720a2f3cdb2c15b44438266ee73115c
X-Git-Newrev: fe3a392a06f004deab25cb5ca6259af3e1e580d9
X-Patchwork-Hint: ignore
Message-Id: <20261023122316.EFA379C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/testing/tests/toolchain/test_external.py: use HTTPS for downloads
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
Content-Type: multipart/mixed; boundary="===============6779330809714046195=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6779330809714046195==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe3a392a06f004deab25cb5ca6259af3e1e580d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The servers already redirect from HTTP to HTTPS. Use HTTPS directly to
prevent manipulation along the way.

Also switch from the autobuild.buildroot.net alias to
autobuild.buildroot.org, like all other toolchain downloads from the
Buildroot autobuilder.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d04496c8c14a84c6ff9f23a023eb70eea61c683a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/tests/toolchain/test_external.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 27dfd68500..3c09659b5c 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -78,7 +78,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
@@ -104,7 +104,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
         BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
@@ -129,7 +129,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
         BR2_TOOLCHAIN_EXTERNAL_LOCALE=y

--===============6779330809714046195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6779330809714046195==--
