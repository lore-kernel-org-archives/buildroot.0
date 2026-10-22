Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED5606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DANmIfXt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E24C81776;
	Fri, 23 Oct 2026 12:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZlQ3w3WDdw7; Fri, 23 Oct 2026 12:32:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2560B81770
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758774;
	b=aPuQ/QDy8bezWZYP+WiwZGDvlSdtNzP0SZ9OUuraNWvQn3+Cm7lUWcgIgGzbUfKrDJ9B
	 PnlkOcemFPZ8tnw5v3LY/jfVShEEodvLGCQja0rQMBO1KPiUyuNYBDUeDlFTfO5tdi8sh
	 E4FBAugBoPfs5LOdLyPLFwExA5K35/f56WHmzv+bHrXgwu+j0TrbW+R9JP4rlISlDVA2Y
	 +VTNy12D1HyoohIw0hH6jAg3/iwup5oaEmlQdVRoy7OOY+9o8trtCw97Yfk1aWyILLw9f
	 Oz0U2Ni616N1W8lqGZpMzwdgGAzM4nVCEzJwRpaWkh/CF/OAFGKFMVnhMlj2G7DEH2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=nQiAyUJlBQS2rPST19y/y0PnIOom5MUgdPylBvw98uY=;
	b=c1Ya0b3vJFMn9w+XIho9qeg1iKyZnONyP21ygtkPG8PMexFAYc4bw8haaGgyayF28bIj
	 e8Exr9HXIUcGWgqNe6zpYBFVcqk7Gq9/2Ot5NdrUdUEnCgkISgTEBks4icX8EZ827sigF
	 Kgt/apimzEEtiQTST+WWgFGFsWIYuPvxGn+baP0tgaS03L5UOp+uSr+B98m95ENxpwZUL
	 k4jbEPbzxQbhhzovKWi1kgvjkROKLQkfuhiWl1JBtR4MyA7P8VhbG5KBx70RsXTB4VCiO
	 UYF3UCc9nrNbj01i4kX8SuXok467qeCfaWGdiOPPRjt7rfoc7VvKwzTf6AFzJ5C65Pg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758774;
	bh=nQiAyUJlBQS2rPST19y/y0PnIOom5MUgdPylBvw98uY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DANmIfXtJaglxHy6IY4k8MKUlHQ3pftIY3ZGPH260840tm7sl8mTc1IRIcxeCrrno
	 BWi9GO0M73P7DNIsphdb5KuFUQhvO52DPj/bg1yeJTe1RxVXLzjLCGwncJjhYupA+0
	 kt5GpJc5cI0vRTf3G0o6VneSYx6lwus1sAS+ziZKg4ew1DU1fQupKK+bvPsuCWgV+D
	 D4V34IIFvfxvJi3KweNOWprEFhS58z/5ZLav3o2v7zTbn+/5/gxbgDb41hfs4eiO9L
	 RgCN1S84sxfNknMHE5a0l6oIpIx4ANxNfuAGjhyXcwd7DdFmjFB1Hqt+eDx+5yzGWK
	 YcwpmJKnyORUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2560B81770;
	Fri, 23 Oct 2026 12:32:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15FB112C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07FD240934
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcKQ4uuWZoFQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 484F940928
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758730;
 b=SSglm+Itjpb9Bi+0S0Nbgt9xR17W/r5AuRplNV/A7xQqqFuL9dGUXH8Rzf1K68RBNDno
 sS3b4B7Xhdk5Mli0A0yy6+uG1JutvxGvQ1dYQs8VO0/5PRHp8VfOMdrayoSIQRf7rmDR8
 Ovm0XaEcFaZe7L35BHtl+Aqtwwi0SKGML22HqknGZJh3+6Z01VSljWo/c+IX8E6pDxBTj
 XPsWelXWMOcOyGJqXWZVqqnvuEWFEmPof8Yk10hpaBo+94iynLs5hQ866xZgmr50XDpAl
 cKESundnZ929Pl462coPuIWq/BZ2ro54TDpWPExQD4EEBC8IxdUAharzMX2KVYoPP3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758730;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wOI55bte7v/5/65ef99FEdQz1B77KMYClVAP6azL9QM=;
 b=nouGIv7NWtq3jnMWg1mPtrprslaEYsU3W+Nokbq0a/PBGfK9zzxNMq+dC6ZsjU4TVA6H
 k74+G94JzKV7GUbNw54PclDImyUL+m47ItSIozKhO7gR/9AogT+Jtwm2IyUeLkzHpbyi3
 Sg1IjT1BAGmzZbDKx+pf60B3/m5Pv9w5fFb+Q51axnaw9Q6Nkum9lkkuDxkp7j/gZNv+Z
 MWfQka4O4PzHTop9Nd+NXPptPLsB5LZm69q+hceDYzxlwEcTp6dLRTZfK+oY1hBG+UDkN
 GD2pafjEJiPn0WjPiYjHG9RZ69H814VDarh0OJhlGhHDEyEt3prtLrK5b5A/XmY1QGA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 484F940928
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBB609C66A; Fri, 23 Oct 2026 12:30:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:30 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a743e8f6c78fcdc2850fd74ae83e02f71baeef8a
X-Git-Newrev: 683478294a1424f948be2c3fda554fc9820a0d85
X-Patchwork-Hint: ignore
Message-Id: <20261023123045.CBB609C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 support/config-fragments/autobuild: use HTTPS for custom toolchain
 downloads
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
Content-Type: multipart/mixed; boundary="===============9013366279866404958=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9013366279866404958==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/683478294a1424f948be2c3fda554fc9820a0d85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Both autobuild.buildroot.org and toolchains.bootlin.com support HTTPS,
and even redirect from HTTP to HTTPS. Use HTTPS directly to prevent
manipulation along the way.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit de2b983811ed5ed8f9ec40ebf1f6c286e701f15a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config | 2 +-
 support/config-fragments/autobuild/br-arm-basic.config              | 2 +-
 support/config-fragments/autobuild/br-arm-full-nothread.config      | 2 +-
 support/config-fragments/autobuild/br-arm-full-static.config        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
index 1b811f267a..7637a99cc8 100644
--- a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
+++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index fbbeaaa773..3212cd5a66 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index 71592d688a..855a24f969 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -3,7 +3,7 @@ BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index f3a4d91fd1..33c7cffc72 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -3,7 +3,7 @@ BR2_STATIC_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y

--===============9013366279866404958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9013366279866404958==--
