Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC3606A323
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eZn36wPx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA45811AB;
	Fri, 30 Oct 2026 14:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKowBVG_46KU; Fri, 30 Oct 2026 14:06:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0AB3181192
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369179;
	b=qIhJQ2cY7e9r7bRIAAoaAMay486AIGM1pDYBtKm1GuHifwuy3TQU/PiJ1JIXb/1Gu8Vu
	 cx9BBgMsxR+knXOn/5+1KmNtzwB/fWnkB3sUhMDLRwMrlzSCJsEbHowtxTkSM2M2mZE3A
	 0gwH82yvA3YAkSH/vTApX66PcDDsyriOwsqfHloEWWQ4oC2OwbuS+pOeq/fdPvg8Ab1I1
	 AF5DEQEAY7XzOgguDFtPkXB2DXEeX0sXA0FN+Owzk1UWx1ADuTvditthEKrQ1aLZkVOwd
	 n/97VU7Vophqu32oRiShWyMR7YOPUG6YmAUUMq2xSIERk95/mO9B/PZieeWK9qArvIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=l+H/OCUoSGvqXSz9ttBJUW/WBHOBDMVcwz5kcMa1sK8=;
	b=Yq8uYkOkew4sJHgJcmxETXyT1WRgGJg4aBS9vOkSgYJwkwLuSjgRMcTUYLR1n4tg+hVq
	 gGVtV3tUE9bmR/Z5BbOZNubf3H8pNwGbQ545kd3MDkNBF+6BVLJoH2UnHzPLQWIZKnPE4
	 UABp/rwvQstDW0HjD1VKCh1E8O62pcM8U1YPDd3DWczapwXl6dkL1kEuS+xpepBuSoM1G
	 4ryA3XdpguI1rupr2PZzba9ATwLEAF5g0EnIXnNNgF0MzwBWEMBHxx91zEU/ci5MVABMW
	 yHD6khaBd1T/5eAxoLaqtUkpQOJYcpKciLtts+eTGgAAZ1ZZZB0wKaJ7F3E5nHLwwOg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369179;
	bh=l+H/OCUoSGvqXSz9ttBJUW/WBHOBDMVcwz5kcMa1sK8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eZn36wPx9MkRBjdniX62DAZPvrMVg8yiyTMwqH3qPUPOXY+homV2DuVFXoKTpTL6Q
	 LfVMAIWrYW/Dsv8Q7oTnbLGLaq0wwN/W5G2Gr5PPkRRirXIUQblxb9MDj2H+AwjWkH
	 6HQH2icixODUcz4ag+yW4LOm3qv6GeeMZ41LRuLvHyhAn3tEx+v3MYwclRv02Q3mK5
	 2OT+S0jo5TJrOiHNPWpycucO49bobPXGS28S6qqa/omqAmluKG3NgmWiC80COC5Rmr
	 9JuAMXIPanVanoVGPWhPTVYk1J3E3lUvX1FBrccgqyk8kiFA4ApaIxEz1nbUSkhFtl
	 jGM+0LXGmUHDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB3181192;
	Fri, 30 Oct 2026 14:06:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75898D46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BA154052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZliN1CNq55Z for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0A8B840243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=AiJvDZVkxcwIkEDABM0XhKhVhz4Zzmv8wUZ3Rpr4Y2vpTxl8zRA4ectXm+ALcOnIfjto
 LwCkuy24etRPQruE5ydRpOlkDr4r6MiGnWAAm5lBTtRPLMOALgaezeKqHiSkDwiHZLkF5
 jTMMg0zjPgTlaDp8XJt6qhSZHpC2iUXf/fjilk1x46Hqh1sPykYi9W7T/r01O1iEZ3VKq
 4zjkeAoYQ0JinEdl4MVMOsO1yL5xLjDVc9SUG2qfWfBQknomIaYssJCuPqrKJIkOpNU5h
 TDK/m+QN/u8+4EjhXvdX0d6IPeQpkF/5ycWzqp0O4GEbis9gIzkvW174jXYWXghS+EA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yiSzrnpGXdzcO7HIqfCx0wewfWlgmjCgt4ezy7HfReU=;
 b=L3EXdbYxREkH3fKoKiHJfHTTy13tZ/NuBQ0CyajS5DIlOVUs/ewYKvSmEfN4mHF3Bcb1
 NQTQTv4bQ9DgSXZP04ce18ZKVygvM+pIx0IzEplbe8hVuwltYpz0Yvc3S7wPOSNPLQjxI
 tSWDrbmyW1hJDxRHhPmHvtDNZ6drgqz8cN6Bn4+bpZEsrZFNLTTduav05Rkf8ocjfeHwi
 yqIDy/CeIlBj7vYIUe9un6lZuijkufe9ZKqiZvrvv2b2oc1BPBGVNJ4G0e0HXNrk5MAkG
 +e9/p9SUJ44K5UtTxlNBB96CdXlTiI/JDcy4qgm/fY+rsqyRSMIEnZj5dUHNdAoHFSg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A8B840243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0ADB59D389; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cb33d3beac6920b9e1b376f364e967e05f19e228
X-Git-Newrev: add8a63fe0c3b3f72ac03066d8bedfb073b3141d
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.0ADB59D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sysprof: fix
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
Content-Type: multipart/mixed; boundary="===============4679695459757769500=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4679695459757769500==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/add8a63fe0c3b3f72ac03066d8bedfb073b3141d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============4679695459757769500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4679695459757769500==--
