Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZfpnH16S
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D39D08154B;
	Fri, 23 Oct 2026 12:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f527HHp1XU43; Fri, 23 Oct 2026 12:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4B21C815B2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758294;
	b=EcfolNQCCvT8iwX/iCFlAhWwoxFAXJqqjqiTnjnYoGICXm71YmnqufyhsK8U1sdvayhk
	 m9mUjh37c2z1acDnvidelX1KJjZT/Z2T5ne6fNz/Io0shrnHAz/s0lwgWA0WCkMHbfWLp
	 Qm98h3QgJcC6PUOk4H8kr9/w9FpAmcJzb+dq3Vby/2rR9dTzepwpJ78I9K7R59ZtSZCYa
	 8o+g5TdcARo+AAbkb7R7+ZR6/SuEu0gcaCLVFrFlWpU5cYvhF5aBazAaZeLYz0CUIrPxy
	 Tn1E+PNvruI3sVgjy/G3Yn6EsUPE9eD+FV3Cgeqvi0MQIDbstB8/KR4R02+pFksnyZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758294;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=C3KN3kLYYW2RX5y0ycHD1EQOycyvYF3ISfyaXo8bUf8=;
	b=ZtjOL5BybCZrGGlgyXqtVeQaAVX3EZmoQDGqgldkjcB7zhsIULdSQThfhXBKZHu4xhfD
	 QOgJ2X+qeoLaZweCt7HimFGpEbuD6NIi1bd07aDP+QVQffnf2VKylJSkcny37RSStQHVK
	 PbBMzHMMem1ZbBCczcrFbHQf9WXwQzDApHprQ/dXjCSybiCO8OwmTkyixz8El+I6dCASm
	 vGoZgYpa0l6hRfKL1InByeE3pRhVKzlSv7TyqY2ugH4vHzJfc5ku12TqZyO8xgpt8otZp
	 b84rNoIq+ec3yXwdvkGXCha/UQxAGtCoWcmDJMH8P7RJdbBnyLIBO95iLZ4HeM1jadw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758294;
	bh=C3KN3kLYYW2RX5y0ycHD1EQOycyvYF3ISfyaXo8bUf8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZfpnH16SnlKjcnaIwCgTXKerhB+fnbwc9sxizxwPHov8jCIdeICkROhS1YPBcYoWS
	 xUvi3cfzqqiBubN8DesEQopNC68nQimXx/HjVtkE8gWQDD0rCf/EUKdRskygJtrkyO
	 6Hrdjl1ZkYysoHzN5IzI2grqiW+sZoOZ502NRfXZK5Ra1YT4qB81p/hR9EDA38wJPT
	 pBBkNObaWX5moqrFoMfqbW388cuBC4MaxdtUnidSgkflUJfwekpQT+i3UCU6Z/As4t
	 a30+ZudP0Av0kvvTu/b+wNw8icUIsWHwBk0hflwaI/H70EIsUCwvjpliy1SausyOAN
	 lXMqDw0bxu4hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B21C815B2;
	Fri, 23 Oct 2026 12:24:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5681612C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4816D4072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guwRzbb3DKMc for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 755CE40810
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758281;
 b=N5SA1PReHcVQ6QfjACwptxTfV3fiCWBXuxv08kjnkNYGEZ7CtwE5K24Mi7gXUc3JQuTj
 LyXhFh22bI3rDpP3bKKkweGFp8lK26oQx8Gn6ojOSyF2eolrPw7Q7509M1lSacATy0ate
 z6jZPpX7Mj6PNqaeLChOgBUsg31ycisqMYQvwIpTcWZM5Sgjsl1Wf2UxfsUwOEEfw1F48
 xcU2m5p5Q8/AykzbcNFIjJ9vOtVqw6cfGUuHkgNEqezwT2vLS9NyTLnylW7zIbXJms2cM
 LTPeb3ELh8bM13kDR2v8WYMhMonmgSlzuIzbL38CazaiJj3C+DFbnsjvAihluY3zijg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JG7EwtBYGC7gUt8a3GynHTRY1iknCYefY+HPOnz9oSI=;
 b=AA+SdwhSPmTyqG6FHSB+oCLU9Q9gP6+/rlEU79sAd494JpVHJqP2R66f8uNyTLHuHQE/
 +l66W45p8GMrkGtRiK7Va5XrmQPBA/Veah9sY8dXfBWQMZnaPJldTcELqghMcbDkDcFDu
 9ZW5r5R0ArT3q7ZqbDRWMEeImvWStNmvGogO59JodjiCNbHdVxTdaMHYNOIKQ+bW0F9ru
 oJBAAl+rNni5uCzLeumNeQMWUweTS0vpAvX8AqSs/0N+tPMWlXOWhHUMIIm7Ks1lUZnOR
 JchIBZt9145qQTKoCaGpCX3Vq6/JZMjbD4knjP1BPt7GAdsWZvewBWzVJ42LXGISyFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 755CE40810
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D871F9C669; Fri, 23 Oct 2026 12:23:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 479cd63564c23a1c81ea5e1290e5bac66aea60d0
X-Git-Newrev: 049251bc4720a2f3cdb2c15b44438266ee73115c
X-Patchwork-Hint: ignore
Message-Id: <20261023122316.D871F9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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
Content-Type: multipart/mixed; boundary="===============8035873920521021069=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8035873920521021069==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/049251bc4720a2f3cdb2c15b44438266ee73115c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============8035873920521021069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8035873920521021069==--
