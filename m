Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF3606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cCgbF37U
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA39360B59;
	Fri, 30 Oct 2026 14:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-6oAoArGpwu; Fri, 30 Oct 2026 14:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 270D060B0D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369239;
	b=ItBkaXBRLFfhHC9tL0qfrpwczPx3FryIzljId3Vwt0yH1jMIEPw2K+jnd8ZHgdJCAtAk
	 a/2KLt7j9H2tDYV2QLUYod3czoRdoLu27GY4jRUrPELIJKc8uRb9FICZREpyBfVeiWNIs
	 wSDlQhTEvTGHf1YnHwQMgznkHSX3i/Y+QVpOIgyQP5mn6YyW5QPYZBr2kqRXFUSJdvfSL
	 thboKe0GPy4HpV8yKqlwZjzAW7OvJ76pbth8Cm4q5uaAre/YiD/KmrVabA5KfOchAVRTr
	 Pwhsi3IFTj8nXMz6/5Y4EB8JOWs6W/i5vXVKd7wZOBzESi/6px2RBaRF4Olb1YXnYhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tMlAARu37lfsJCe0o+5luJgVxdrREAT4VvUJq7v0he0=;
	b=tAjG3odUIKW1sATY8YyeIowiTS7f1DRkLmpp7gMJMq13zsGhg5DiMHxNSZaIgginwmud
	 pa8eUVyZAo0qHdr0CiyPA7zTPHyuF3HRDkbHljPpq9LvPld76Lh8M69eJfpG0QqQcOeHm
	 NS6btpgima/uiFVZ+uUwmlMs/ZjnvThFRfNmEPI+DxJJkyNdkfnn8JO++6lHPexMOLHHx
	 9rs9a4xK2lMme4NkluoYqkC3buapywIH2D8ZyLdMgWGj9KXP6dfuF1wDAyr696/1AIdXY
	 vTBYVpAJUO180ocA3xSG4+aNePy3FQiiv0oVKJFitK2kLWrBkF9gqD3sVcJslHs7jsA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369239;
	bh=tMlAARu37lfsJCe0o+5luJgVxdrREAT4VvUJq7v0he0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cCgbF37UIFwwvCJW4vtsek+b+enpYBKxKnhmL4lEcWOaNQ74AW6Dqvp6/3QJcZZmP
	 OBlhIwq0fhpa25LIiIG4QMXghmKSa/TjxoazF/hLi2pKukuTwDP53HyfBZe+65ftu2
	 y6cgP8x9HyryGsT5vGzq6oycNpWGbzfl7Nl5HVv9KvWQ3UVhPFW9XEHKRwNdEEY8AF
	 KF3L6Bt+h8A4ZOKV9J+sK5Wyc84Lx0q3pKhVfy9pd0PuHp5ZW5c5KDdtD+XcEQ7bOq
	 80fbTz5YTqMSMvU3d7kFnonITOziMlA/wKSCPZCcVwiCYLbyCUKFbTkKJKAOjmupLj
	 8Cw4IXP/wZ0lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 270D060B0D;
	Fri, 30 Oct 2026 14:07:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C591D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11EBF8119E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRw2zURHXdKz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80F9F81188
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=gx4yRkbmdGRLLAS5udovTKwVgA5zdwFBfZHfIi3/UTCvufSjEwBrT9Wlw+U98VBI81zD
 fv4TDD3tWNbHcEgLm9QiW8G3Oz9I4Lj9vfmtNLeOx1xRYYlT3Dy7aFP+F9vuZSuTL+SvS
 UXau9879KWFOWvb4mI1YeCU2XzQm2DNM6x3Y7uUOz0k3V3dCUatKd4J3Rr0b7vcAPgM8O
 s6P2I8mWFWiRt/dKxEabQXEq9Xu6zqfD4nLqE+WGFnSaYFz/fptlkac1K3WEKRay87VIP
 XWBXaB5XfzxVKZgsGj5USkgcpEYFBSyvgGSEdnjo5i5+ldgo8CW0RvmlIZeHApCFgYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8jUkB/k0D8bcrx4N/DRWVYDqR5ogFpbR0MiMccrMJGM=;
 b=IZ0XnObCQ6xTD1vfPfc41M5ewR0tSu8H76v2QYF1rOPVoacMAFlqXm02a07xV1JfalwO
 Phk/yuX5ffb3V2+pw61kcaIc9n7Cs3Zo4MJc9e3EExJM2crOhvFUc6BllwA8YpToMcP0X
 2b6OWUKHSqfY0q1Cmr+pmvy4rCX6CHT6kOK4Jna2ma+7h1TzDH6rYKjwFly2vLySNMsoW
 iqQxc3vJi/jxJepDpycwAH1NpJTEJR7L1t70/9Oy3MMQVlFtG1OO+alp3daTEFoOB1S9+
 K/9b+zywQ1ZM9zJO2L4EzvQ+luh7LFHmXRMbA+e50hyq1Dd/QzBTB/BWdCkBInzgdyQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80F9F81188
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 788F89D389; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c85d1f66a8ba0eb9836a9f4a91ae4cc3b517b1ac
X-Git-Newrev: eb818212fe9a28fcacd419a6c3a24b31b6e6a2d9
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.788F89D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/brotli: security
 bump to version 1.1.1
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
Content-Type: multipart/mixed; boundary="===============8735962987424080114=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8735962987424080114==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb818212fe9a28fcacd419a6c3a24b31b6e6a2d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

CVE-2026-111497: out-of-bounds write permits remote code execution

https://github.com/advisories/GHSA-9v8h-qqgm-4m35

https://github.com/google/brotli/releases/tag/v1.1.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(alternative to commit f6dd7e28aec579e318b1f63dbaa1fd719f71e84c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 145467c420..0500fb79d5 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  6eb280d10d8e1b43d22d00fa535435923c22ce8448709419d676ff47d4a644102ea04f488fc65a179c6c09fee12380992e9335bad8dfebd5d1f20908d10849d9  v1.1.0.tar.gz
+sha512  f7f3a7e4620403aa26d69458e0bb886d322f7677685c55717fac824f0b789e0c25cf4ff7d8d455d70a8526d0150d7a09b9df292a11f9ef5d3bf625878cb51368  v1.1.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 80aa2566b5..b7049b104e 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.1.0
+BROTLI_VERSION = 1.1.1
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT

--===============8735962987424080114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8735962987424080114==--
