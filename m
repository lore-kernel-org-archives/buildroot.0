Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B5606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=efoxAZBO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C6A40B44;
	Fri, 30 Oct 2026 14:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sUpza6Sajvm; Fri, 30 Oct 2026 14:06:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D35ED40B45
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369187;
	b=SdPtYgfnIYnv/YiSf7SIG4e+UUJRRHcyOfAiXUnpBBnITNg4dxnBt6V8Rai1dcQjw2/1
	 uARIkQ5VgzJYZ9mrEBYQR6gG7AH+GbphohVV5/KBj9XqKdDamjAnoc9otY3QOqdiGvyb6
	 Sy+YojEgYiGZcsQh6nZImnzwxEUR1LELA9dtBlYJwTlbwXdjLU8WtOYTXuw5/JQzcxebi
	 KdxincxJq8M8Fd972kJBP2dAkGbxCKKfNxRP9vZ4rctUYmZDMpl5p/rgxj+w0wJS+UcaE
	 5TtdIyjqhlUsHP+BljREv0kKffNx7jCJ5Bip3Bd/UHo/2BK1xfaW/t2BiQRBJRRK3wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=63XJXjYI8LXZ4/qZq6V6QpK8lB86rdK5D/PNUTIBDiY=;
	b=olJkvKPDei6epIVRAt7p2XER3i3FbYv00qxIsobjgrNO7zhbJfRdNQ0WqJTAHw+q+1CV
	 7Zb7F15XyaT97/2zMP2HYY29MtZvm4w9Y8YTQYAHlsfB+o5vBNKnB5uyfKAomeu+un2Y8
	 gC9W75DcuBKOJE0OKLEcDQQh7ZYYlo8+oL2Xcz2u8+tr9piJN/xKM3/8g5ld656nyJ+iG
	 hMfk0bqESsYcM8OBbyIGFRfTQ4W9xxFk0OIusB0vLjh7EKjFY5T+LSQvP1IaAigs8CTog
	 PUn3T9lMcKbAW+Wd7c3hjPe2dqIIrbjzp1T+g3PvaSafvJu52hdgVs2jnPhjPh75RMw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369186;
	bh=63XJXjYI8LXZ4/qZq6V6QpK8lB86rdK5D/PNUTIBDiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=efoxAZBOLqnrvkMX7rEAHIZtKteO4OF46NvJUol/h9qYi0MgStftNh8BLqF9D264j
	 /sQT8H6czCBiJRHMEtq5/3jNnMsWMwu9P46joEzSB+/EDmac5wkNhQTkKi4sROCvxb
	 Y3T5WdoLbdRT+Vid4pyGXBC0q6ibha+qxF2hSmld0oFJ6DASuNpc9mBHpsVSaL7c3E
	 xzaMCvshccxfqdtZkoXLf0B5ly2okDL1UsrhPwuFzbcdrBzEAMFqlaoR9cPGSdI+EV
	 EW7gbhbrz+j1JoNyU7d/R9EcNdsYerXYbCLWjP55WFSCxR4Ik2XKJN4lH1WqQivhhB
	 mhXuIwbZUW5LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35ED40B45;
	Fri, 30 Oct 2026 14:06:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 001A6362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D889E40B26
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUXZnVZRSvta for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0613840AFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=N4S2McZaOicEOfOYmy//F5YAsHkYEm3dgKLkEKCsY7CTv7jC3h/jhODuhCUvseO1rk9p
 iAAM5IvjyUrpYErqk1v+SnRnKUxxBBtadvqqHtknwW5nJpCDS8MrRWEAWeIZU1OZn+Xbg
 UzdE7Wv9ik+OF45wOnl5pSA8A7GsDEnkEev1cujHVrLpsDbvnjptNssAsSt19H7puJ8dl
 v4ptQMeSc20Tfw6oEf8Ad0T/YNZDAtK2HWeJMAzb9BaWhbAW4gV3xbnLtZM63dMOeCWJL
 EbNhNYGGYs/vOlT6AmfI8GookucP7/a+HoLR3kO/OTBhej9stvC/Ln7Eq0DTOHPXi8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ifo6+Chwqqiw4ouQESKkk9wJL3/nMG2gII1g0Ce+scg=;
 b=OosXdUgLDD8P8UNLHv73bfKHIb8xwvf7CsmL+b355P0X4fWGHJQqFIPrbHseZxH290ZH
 gOJxiwg4URzD2Yw/mg29nQe1z2SCFWRMKt7GHnfLUj9xJNZwq8ydpHO4P42hrF1YyakQC
 I6Jo8TKSEmDeRPhniVo6VcmQtboLVuqabCF13sSYU2yO5H5FjXTlOEe9OFYIA7TBITEYX
 qS1UPeJDRk2UBxPfpJWywrnGU/TYebx9jkc0+Y8m2YxiKxLSk+mSqIRYito21gwwiVmj9
 mvdc9tRj9b0izw0Iq+c3ZNqzOSQz2KSnWe1tLHvQfu6H3cuRt/lNs0mfxZlF8hqlpOQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0613840AFD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25E989D388; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 073cd35212a4891fa030413d4c4f3fef39b57759
X-Git-Newrev: e9d4fc79827b7f054e749899d54b73bf719379e2
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.25E989D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-golang.mk:
 make GOPROXY configurable
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
Content-Type: multipart/mixed; boundary="===============2275740676470596167=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2275740676470596167==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9d4fc79827b7f054e749899d54b73bf719379e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

The default value from the toolchain can be read with "go env GOPROXY"

We rely on package developers to audit their dependencies in go.mod and go.sum.

The value can be configured to:
- A comma-separated list of proxy URLs
- "off" to disable all downloads
- "direct" to download directly from source repositories

For more details on Go module proxies:
https://go.dev/ref/mod#module-proxy

Discussion:
https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f14e138f6f643d208455c500ca3ba7cfa9de30b4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 0bfe6d1ab5..d8f78f094a 100644
--- a/Config.in
+++ b/Config.in
@@ -339,6 +339,22 @@ config BR2_LUAROCKS_MIRROR
 
 	  See http://luarocks.org
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By
+	  default, it uses the official Go module mirror, falling back
+	  to direct downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "https://cpan.metacpan.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index d1bb1a5ff5..00aa10360b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -88,7 +88,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY="https://proxy.golang.org,direct" \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # Because we append vendored info, we can't rely on the values being empty

--===============2275740676470596167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2275740676470596167==--
