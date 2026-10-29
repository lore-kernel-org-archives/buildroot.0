Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D19C606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kxh9kfLy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1959740BD1;
	Fri, 30 Oct 2026 14:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jdDsYPpE-LO; Fri, 30 Oct 2026 14:18:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1767140BD0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369887;
	b=A3G3gfovE1p4s0eX0rL+J2Tho0AKGsbxYXye5+SDQEVUxE1BFR2cM6d+DA+zroPbfhDV
	 Q9roCQs/4msd1hVqH75Aqmmyx3hqDo6/Fa34sUxGGE11hk36gGffURDFDY8La/ViA/1jF
	 lOO4Vbk7oI+Rtqd0x8PZIDaCKKpIno0zO+z9J98gUyeK94r3TxTDCYiVu5el1LoHI3Tgg
	 p/L3bSjIONtYbDxF7hgK/XSCX4O7htyhvbrctrVfJ9QzSVkkKL06u7p5XKGca7dSEN9w0
	 255vTTtkPD+VhD9V1eVUG2UtEBnpB5/T0zyrbtYb2ZwnR9zxjzXWNHli4u3vuerjjMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=v8toHTAOVyuz5c88cbQ7vb/Qd/ZA1KfxF5e0D6eIok0=;
	b=eA/HMEZLJ6g7g4K9o9KWLFp6YLQFukTZ2m3E4n9C4ldyfMMRmkOd3ivK6rrP+ZiAW3X3
	 ZPm/jX1F58W9rpBW5sEppjt3XgpbVB2WySs8w7kXUQ46KAHYRbdSHb7C7ZXw/SdlWb96Y
	 QGaqqBm2JN6R4uGG6KEnS1fLUJbH6BTnjxyObm2LGRmue0mxi4EzoJaseOwQeJMDUidbm
	 q4nEO6WROWixH0E/KDCN3kwENNhRsfmTs8U0sJr0lxLbV33NTwcHNWpjRo4UeuXr72hLu
	 6PhEUW9jC/1eW1FCMtenaeXcrYv/q6rAYnlCVVHig3op4Jl6xcvWtdcnF3P120B/SOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369887;
	bh=v8toHTAOVyuz5c88cbQ7vb/Qd/ZA1KfxF5e0D6eIok0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kxh9kfLy8SzryQla10ATH1vMcsyjRAwuY3UrkVzaXZXD1K7T5Mt/ll9CSlT21UliR
	 yQn/n+hI/K30sEyIYlD3T2wP6h63nZ/6Yw1TZ1qGMy5z2xfYEl2Mn+fSzp/+8d7JO/
	 BZh7mirrJPEApYmDX8cFFfEXGdrB3xUYvQ82dJ1y8pg8FSQ9h8H10te6cx5gFUlKbI
	 k5nOr5yT0fy2/qARRoDRG8FVQ5BdbmGM5SGH0ckOUHkM9ut7mvSvW8y0F2Witb1jR+
	 fjFFPcNXsK9okqHEsklPskYhcanJ6hxggQas5gccEDYCNgH5Nm/J2uYbRBtJCI2EKg
	 7z5n+h4vaITpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1767140BD0;
	Fri, 30 Oct 2026 14:18:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 549D3362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A91140530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLal55SxFq4I for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 75D0B400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=W9e2ngdIpTWKqjHcz014iE5HLwk2QK0z+n89UkNurOCN93ecvTZLwtDGjM0z9RawUXZd
 h4P7du3orIcEjtB5GxM67A0I/26DMPNPJUTznn3wS1JWq0Te1WlSRuRBf8ZiPZH6kXsdN
 EkJPycGVDLtLTBTwvgrNv8LRDkDVquUTAMinSJifzhnF+aLkuYoVT4XSBhrUKeLPvvKcm
 EMgUKuIM2Ez8copIN4mRIwlgMgGTbLsVyKYdTId96sL46flYgBe+EqBTJJL3qNiBmK00f
 /57CqzpJD4CtbMtVd5BDfuKp2duvsnCHTYLN01JwNt2cuALlW6CvNL/M+BBUCjxSTEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ds5i3mxZV5klMfFKiwa072zIuerR2FpQJIUS73f6+dM=;
 b=bsVxjGOpHO6Py8vl+ExuKgM0ge62JySrXtxJNQW4xAwpZL37s+zTR8rnGnq5akRgDvS+
 i9JNv7BhN2gFPrjJwZPZgrTw0S/4CB78Bz6/NUd/a5QOGevyBeouumkTQ75S9UXSHqwtU
 y4Mu3JhL7N95Y5gtWuuAb+4WTZV2ghjgWpmz0Xckd5ts7+4CYjNi9L+OcYJ+rzfhwWvQg
 IsNARskTaOEn0rxFXB2B2cRo/JmFlgGu8OKyh5yybGXvwzw7WvsiEopH9P+bEqUPbj45i
 IDQHrW8LxAyQj56IJ8HXl0ASSLeRv/Z9NFN5XerF9wDsp/DOmTa86YmWs37WxYArjbA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75D0B400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 870599C645; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0f04a915e60a752f5aa33f0b59c78ab5d88a64b1
X-Git-Newrev: 3f5f2fc67282b18e658dd0dbe52eb3ecd8e62191
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.870599C645@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sysprof: fix
 build on 32-bit x86 with AVX2
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
Content-Type: multipart/mixed; boundary="===============1234812962446740670=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1234812962446740670==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f5f2fc67282b18e658dd0dbe52eb3ecd8e62191
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The bundled CRoaring code enables its x64 specific code paths as soon
as __AVX2__ (or __POPCNT__ and __SSE4_2__) is defined, which also
happens on 32-bit x86 targets such as i686 with BR2_x86_haswell. This
results in calls to 64-bit only intrinsics:

  roaring.h:260:18: error: implicit declaration of function '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'? [-Wimplicit-function-declaration]

Backport the upstream patch that defines DISABLE_X64 when building
for 32-bit x86, so that the portable implementation is used instead.

This issue has been present since commit 0d57555407 ("package/sysprof:
update to version 46.0"), which switched to the new sysprof code base
bundling CRoaring in contrib/eggbitset. It therefore affects 2024.08
and later.

Fixes:
https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351

Fixes: 0d57555407 ("package/sysprof: update to version 46.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 145bbce3eac839e55183db7f09b07e5af2ecaf12)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...tset-disable-x64-code-paths-on-32-bit-x86.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
new file mode 100644
index 0000000000..2b2c6cb6cb
--- /dev/null
+++ b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
@@ -0,0 +1,53 @@
+From 22c10f0dbd3c357e96f83f430ebe05d24a25c536 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 17 Oct 2026 22:47:15 +0200
+Subject: [PATCH] contrib/eggbitset: disable x64 code paths on 32-bit x86
+
+roaring.h enables USEAVX (and thus IS_X64) whenever __AVX2__ is defined,
+and USESSE4 whenever __POPCNT__ and __SSE4_2__ are defined.  This also
+happens on 32-bit x86 targets such as i686 built with -march=haswell,
+where 64-bit only intrinsics like _mm_popcnt_u64() and
+_mm256_extract_epi64() are not available, so the build fails with:
+
+  roaring.h:260:18: error: implicit declaration of function
+    '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'?
+    [-Wimplicit-function-declaration]
+  roaring.h:1011:23: error: implicit declaration of function
+    '_mm256_extract_epi64'; did you mean '_mm256_extract_epi8'?
+    [-Wimplicit-function-declaration]
+
+Define DISABLE_X64 from the build system when building for 32-bit x86 so
+that the portable implementation is used instead. This keeps the bundled
+CRoaring sources unmodified, making future updates a plain copy.
+DISABLE_X64 is only set for x86, as it also guards the NEON detection
+used on ARM.
+
+Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/22c10f0dbd3c357e96f83f430ebe05d24a25c536
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ contrib/eggbitset/meson.build | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/contrib/eggbitset/meson.build b/contrib/eggbitset/meson.build
+index 82cd8a40..f2f81685 100644
+--- a/contrib/eggbitset/meson.build
++++ b/contrib/eggbitset/meson.build
+@@ -6,9 +6,18 @@ libeggbitset_deps = [
+   gio_dep,
+ ]
+ 
++libeggbitset_c_args = []
++
++# roaring.h enables its x64 code paths based on __AVX2__/__SSE4_2__ alone,
++# but they rely on intrinsics only available on 64-bit x86.
++if host_machine.cpu_family() == 'x86'
++  libeggbitset_c_args += ['-DDISABLE_X64']
++endif
++
+ libeggbitset_static = static_library('eggbitset', libeggbitset_sources,
+   gnu_symbol_visibility: 'hidden',
+            dependencies: libeggbitset_deps,
++                 c_args: libeggbitset_c_args,
+ )
+ 
+ libeggbitset_static_dep = declare_dependency(

--===============1234812962446740670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1234812962446740670==--
