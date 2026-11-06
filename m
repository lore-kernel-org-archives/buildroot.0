Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE87606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VLYRxbX+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3039381336;
	Fri,  6 Nov 2026 15:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF5HOOGOUkCg; Fri,  6 Nov 2026 15:59:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5075A812BA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980778;
	b=jKvu+0bsjzbp/1tD6p1yRRtP7vPjeVVTzNeloJ3kyzpXqULhYhl5OIECZmS7A9tjlwpj
	 rt1JxNTrUZCqSZjcFyBiGAhe/YFKu4t38RT5EXVO53mFqRGKfKBZfInaL5iZJ8qTzZTar
	 lpGAA5oW8v8XjRz8KHss2/IEaqoPH8Q6gsCJ4WlpDdheakviF0DGzTD6q41xRoyqtezJb
	 hnEJQWBnca87lJpk4xtkabTjEZi18QN6w++VKDWV6CNBKGMdBL16XfxopLXFIxWPv0LfD
	 ztlfZxmIGDMyqaoWyrcDM5ZpBRNnPzz1aMm5r800dr1Kowevg1wBjV0DdEOzHWxMBxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980778;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xi41FpYSWrgsFNu8tyhxiA4wD6VGRnWe6rjfrUcTrRQ=;
	b=KsRQmrCB4rwhT0je5W0NGOCPFnzxS+QR2NdqgvoujQiQRl+V3n4SEaJfOmj6Ct3muZf9
	 RSbEn2Ut0SEHfVonezbyQvRLrAAjSMpY4QU7SPb1UAWr696y4bnyXH574jtHqFxJk9IQX
	 na4GrQdGdPJ1o5mOwNW0tex2gH/P6Ah6SdcQlUFaIbYTzJT/qk0PrTz2ExeSwd+xambsv
	 81aKnd5dPhnjp/lVmFLXqGV21QbjNEQ158X2SHe4q1l/l35r9Sfc0NMaOAysiwMQ/9E0Y
	 3TjJ8rrRQqlTXO2mhCXYhdaZUBE9sPuVxssihMFo7IH3YnSNlgn2jvqSuAOqk+J3iDA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980778;
	bh=xi41FpYSWrgsFNu8tyhxiA4wD6VGRnWe6rjfrUcTrRQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VLYRxbX+wZvduX2OGDJ9cxD8GVEjaH6ZLK/isAz+/KaNu8ir89fEqzU6IEJr7fFpW
	 ZsTyR8p1R04NjTflsySuy70Z362kuQjCzj9SBLS5AJ9N9BW7yA6Qsp2oij06pgm/0t
	 MNjnASFQ/gmRtknPF0T0nzRJfK0Z0x4HPfOFrsmUUvXTL/P5fDCEYvqMxqKQpCrlBE
	 ucP+cBJsZxVi83YQhxV47Krgr8j19flfiFGd8CY6gtJwLQjKB4eD9nTGAYjHDJSgcx
	 rLr+MChF/RIRpecoc0pFk1E0wWlsFyb6DrXBFiR4EWTaAA5ELOyUKJQFA652weD9fy
	 n550nOSu1PzRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5075A812BA;
	Fri,  6 Nov 2026 15:59:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53EA534D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51CB1606BB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCEQx8rV0n6x for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 81EEB605A7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81EEB605A7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD5249E0AC; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 16:47:42 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6d4f7583c4d30d95261aeddfa1a48436f0fe3bb1
X-Git-Newrev: 7ce1b3ce0234fee7825373784d55b8abe247a550
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.AD5249E0AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-numpy: fix
 build on ARC big endian
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
Content-Type: multipart/mixed; boundary="===============4859045520770990628=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4859045520770990628==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ce1b3ce0234fee7825373784d55b8abe247a550
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The long double format is passed to meson as a property.
The table that sets it only handles BR2_arcle, so on BR2_arceb an
empty value is passed. meson then skips the detection program and no
format is defined, which makes the build fail:

```
../numpy/core/src/common/npy_fpmath.h:19:6: error: #error No long double representation defined
```

This can be reproduced with the following defconfig:

```
BR2_arceb=y
BR2_archs38=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/foss-for-mips-arc-processors/toolchain/releases/download/arc-2024.12-release/arc_gnu_2024.12_prebuilt_glibc_be_archs_linux_install.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arceb-linux"
BR2_TOOLCHAIN_EXTERNAL_GCC_14=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_16=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTERNAL_FORTRAN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_NUMPY=y
```

On ARC, long double is the same as double (glibc defines
__NO_LONG_DOUBLE_MATH), so the format is IEEE_DOUBLE_BE. This is also
the value that the previous size-based detection gave for BR2_arceb.

The master branch is not affected, as support for ARC big endian was
removed in commit 2d570f8369 ("arch: drop support for ARC big-endian").

Assisted-by: LLM
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-numpy/python-numpy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 3845b6c653..9c8fa32011 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -42,6 +42,8 @@ endif
 # https://github.com/numpy/numpy/blob/v1.26.4/numpy/core/meson.build#L376-L455
 ifeq ($(BR2_arcle),y)
 PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_arceb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
 else ifeq ($(BR2_aarch64),y)
 PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
 else ifeq ($(BR2_aarch64_be),y)

--===============4859045520770990628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4859045520770990628==--
