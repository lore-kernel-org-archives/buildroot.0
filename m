Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2519606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TnWjKBvc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884F460B2D;
	Fri, 30 Oct 2026 14:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9Cy_IxkqY1T; Fri, 30 Oct 2026 14:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9E9BC60B0F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369194;
	b=l45zd7aF9XLL7ezhITVrhzmP/SkSpY6XPM2oJwESfIwPz86lw6xZCpN7BKvwH5tzjdY7
	 1ajy97OxjcJ1+i4PIh5nP6rUfzgg0fM3YmwWy4+kGY7jKTmoWCfjM58lV6tqAunfTsZR4
	 ii7Zl2tJchMTamSYjahFFuLGSf1SIMbibLoIPHhmzgLj6XsxFPA0C1wGbhA2Vg6FMSJV2
	 zC2XuqIAD07p8AjjmAN1tLQ87ODeUFEMK8uvvhc1LiAC+sRKEhfVG+UuPUXA3DPkxnslE
	 tmj2K+hhWtnuShuzKo/c9jymg91fbwwBoqg7zAwnN8auck9xzoMV4eb1TNDZyauy5rg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ukYNew3rPkZeBX+UAmqxqNjiasXFqOWB4BZEAgY41H0=;
	b=XekkxwPM4IXqgz6nNkY3TQ/W5nWdS0t38SZKVcTVSKTasKnFaJd7unEi+XmOE1vGAT6M
	 IuDIEBgxefnpVM8zWo/8ZegpW8mJq7oH5W5Let+sAuRPRmhtre5uW1oLJDYGPitdLOZB2
	 NtfmQtgl+/CQLXKGgM/wZUjSFRe0IVjTtj+ix88hfSlYeOnGc93kL/+4BQSqBhknwuZoH
	 TVqD04ruY5HGh6ioakVFquzvBuIed9AoIOlpX+eICOeIqnQstH7tDT49mi8BlVh5iTltB
	 uvmfyLgiwVhkGJx+FN5lQimvG9MId80Tul23lyh8ORCpsuoQOaH7HSY8J1CTCjAjAWA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369194;
	bh=ukYNew3rPkZeBX+UAmqxqNjiasXFqOWB4BZEAgY41H0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TnWjKBvcFGCGcAtBkZSf4QVw0lV7Lb4TXEXpRqH493XkRNV/bdWl6mHeDytR9aUwo
	 DQCIR44Z7qMkCR91PLlJVKCM9ZAh+ZKgx1Dj1RqC5DRMOK9rTCeRH865nATDckurxL
	 fuhjxflElnLyekf8nk3exhZj8xu5hY5fXKRob5M4pC9KdBb7/EDzPKnHzL9QlvmmrM
	 iaA+GDgTfL6S9Dea8DYlVTvB7CHvFF+rwoWWKOhNf3TywAm6ZPtrxLMlBcKKOINfkN
	 4of8dUxL1+RV1nTw0XI7MFUfUQv1Rb/kH6fSus0imN1IYNn0cmND2LIMYn1O2HQiS9
	 8xy+j5M5tCt7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E9BC60B0F;
	Fri, 30 Oct 2026 14:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 629D5D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52BF040B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUSNDeLvgyX0 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 832F040AF5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=RgQxkKyNcRJeHCeasfBfcGpDvBGieJPw5EVywRKephRlQZmUty/VpFZC8bdeGbfradnv
 sfPxxl4EdkZvMJyEL1rSuPXSpnciJb1QyfrptXBa30T1Gc7N9ohNzpr3GswMxJR+1adRJ
 RJcIArvUM6Hf9NRF3GOiFAJMrO0Wv89/NS1kgxOVPVoHJYwIarvyvElHdBjg3cbVDANFF
 0IqK3p7grdvy162rmeuNxVvSb1Okl2z67z1lOLauXbaisGjftKlRyK8sgHr42T+nXtSpV
 qJ9GHUPNdeOG14UldkcEQzgvqCq3VOZpj/lsSCxA/pnfxIs5+K4TzWA0t37aDK6uhyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=htHg9ImOjHcmcGMF4NOp7xO/VsFrU/InHs9D/vSZ2io=;
 b=XySYz23mPgTz1ldJT6gttwSPWzEJRtHeUBADW7bKCiuiIZOqHdC5qxl61TDXE6PwjTe8
 cFbOFInw5EFUIzNdoSD6bNStgpkHmmeUKLQWpk15UzX4cQqPGZ8BMYOYsf34q+UID+6hW
 KRvZE7Ie/NC7S3x1wHwvO0xQpV69KAUUB6ECjEflu8CbGLPVhGkjhyz0TEBsEfMcW/kqM
 mlUS21x0Y1hpf+m3jN88hbNKd3oZ4S6FWTkNuSusWvyECV2L1dMkLwcfuQzvqtJLBvqyd
 8AVnyZcP6hk8Lp8l6SmRll9+7wjX/U+YAlMALZVdl/9J5zrh7QooGN1YQMRO1Hn4cfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 832F040AF5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2AB69D388; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ddeab96e14b646fbc1f2de5be044d95f29d97076
X-Git-Newrev: 6d13792aa675d8df40095ec909cfa7080ccc8b04
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.A2AB69D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xxhash: make sure
 installed .pc file is correct
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
Content-Type: multipart/mixed; boundary="===============1400010121056304883=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1400010121056304883==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d13792aa675d8df40095ec909cfa7080ccc8b04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The libxxhash.pc installed by our xxhash package is incorrect as it
contains:

prefix=/usr/local

while the library is installed in /usr. This causes for example a
build failure of libplacebo when xxhash is built before:

output/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR: Include dir /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/local/include does not exist.

The problem comes from the fact that the .pc file is generated during
the build step from .pc.in template, and we don't pass PREFIX=/usr at
the build step. To fix, we pass PREFIX=/usr during the build step, not
just during the install step.

The problem has probably existed since we started installing the
libxxhash library in commit
cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8 ("package/xxhash: install in
staging"), but we tested in 2025.02.x, and the problem exists so this
patch should be backported to 2025.02.x.

Fixes:

  https://autobuild.buildroot.net/results/344af8504a77ae96e4009d76a77572180cf49b14/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 75a1aea9b420ac97b9dd3058db172e6d0c46a812)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/xxhash/xxhash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 51bf6ce855..fc2084c878 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -31,7 +31,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
+		PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS

--===============1400010121056304883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1400010121056304883==--
