Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56FA606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lkAyOJwW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=CWUXjxQ/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D1140A90;
	Fri, 23 Oct 2026 21:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GssVsZAlLYoD; Fri, 23 Oct 2026 21:17:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C2DCB40A92
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792790244;
	b=c1FUFY3RHlQmbEJpsRJ+Xh2ECUBGb2FQh0CMXt5kfToR9jzBI4hwM7UdrUheoSh6JOuX
	 pBwFVG11fUd8VYQE+SPIRNzPcNEuEyJef2go+IHxjEbMTlG8Zbje+HfRolAVtQjeOL0vW
	 1jo6rmYKFB6X/gtiXrfMhXJNUAs7U/VAPn0cyODiSBJhbNiV1CX3MiGMKyvfGsQH/wWKF
	 rKEuwnL/7+Xk0TZXrczJypdVDV4Lr32Y3JzymlpecZOcdu/4xYbYuArBfFNtUqMOXj0cx
	 UldIEqSqr6Lt4s71VARr9JfXHYHs8FEIUPYbWZXKWNa2u43rap5GoMiUkYFtayJy6Gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792790244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5Fs/kovm3CCJ5Q+F/U187n2jK5qwuKF9oGLeuWOna3c=;
	b=Z9PdrnLgBy9gT4wn+/+n1vp5iZLlZ0O0++UlaLXE9X/SQt8FNq0DJxwlgLh2GbEvrI8D
	 Tqscyy0rbybJIfwVhEHLfIMaFyRSDQRjCKB2X6FxghrM0yXXJ2HF34uwxNJs/J7LpVgFn
	 n5VxaDdYqJmOMII+MhizfApc1pqsP/cH1KlGWgh5wlxcjsduH4+lrkgF7YPIPQj+thBRo
	 g5k07xzSQqs6XEhXoajM9Bfe04GC1qhBRbHJ0b1C9Matlbrf8edPECK1WjR4AupRCLExD
	 Ydnx6eHN+2S5tsQcH4Dcj4tnNRSqhkZ3OVVy+Uye6LRJo9PT/xlkayt7B21meDBq+Ug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792790244;
	bh=5Fs/kovm3CCJ5Q+F/U187n2jK5qwuKF9oGLeuWOna3c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkAyOJwWQJXv44oeEpuu6Uk1A9vlqWwJS6GPtIYYTvk/OSaSzJk0qiSHaW/jeD9Z7
	 xZRf9t/xucFmN5fazMQPTodjRJ/iyaQiCSR8jOP4bPq5kUODwcC6EvH4jN0VsN0KxK
	 c6RaiKj+zlUUxxSpqRz1JQGwZe2krqcBYAnoeOqnXY72CMGfVHd7SAfkUdsvP5+maj
	 ZXukDi2O7fdG+7WYajVZDQP5zA6mFSj1fEOrrdcwX4DphuBnp9Od6WIkR4bBEE7DyU
	 B1pAHos/sMuW0bmGmHJnbhq7MSxE7BDBz5sRY/Qt9Wwa5Rw5nsOC0zo/M3k8+MDliK
	 nd2fvQy/XeQLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DCB40A92;
	Fri, 23 Oct 2026 21:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA4243C4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAD4581668
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5fkBZdYuhT4 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:17:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C7C71815DC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792790242;
 b=WRv5KBghHs5KrC9ewf6is6lY3J4ZEwBz9Y18QhqcYxdMCSWdyIMtXdGHJsje1h3c6SX8
 bauNoE/r3j5R5syUhUX8sBF7qHc/VbA8VcLL6Ew9SdCpeMG5t71v/9Ws2+eP3RF/Gtjqn
 T621k0EINi66Cf59SgrhSlcyDiShsDq8eEtFzcXuQEH3T9WPt2PxDztutSYqwCkRYkZvT
 HqA2/ha2unOeJyZp8ivodhrr4xju+hx4F7b0IIEBmh9P8oxNkTiEnTGPqDx4+ObrzHGAT
 etEtFYtm/urKyKp6rQcDx6KcOBbgmlPUkeeBzQlFX87IOC6cRWz8K/HeYq0lzsYrOVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792790242;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=BnoWiMkAbVZBxLXP2HjND5rWMOm0j8ri8Whm2XDuc9s=;
 b=H87KNiimlUnHjsSZiYlfpxTaAahgc2v2MqHNOc2n13GQyA/IfK5dL4iW73c8+VVzmKlp
 AhruB6XvleAfvGq3lR9zq0T4R0M/4ojSu6KOipRClEX/IWcftOb0wpM/6yh3tfSu5QJON
 47sdjZGI9kA9eineTCRzZwAEqn5mNtZFafS8B8eomY+uioQO3RUC/nd+VRwa31wjIc5Zg
 xwDUJtYBlzl6xXb7f+7YYUUYDi6l+QCiFUvlz41wvZcOXsVk8Fee7TBtXzzuT5VQ9YcGf
 QzZouWmT03Jnby3Poyu8y409cmTTwgbqFvp2olf4eH3R2PGfvrldest2VIwToCafdiA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="CWUXjxQ/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CWUXjxQ/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7C71815DC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792790222;
 bh=BnoWiMkAbVZBxLXP2HjND5rWMOm0j8ri8Whm2XDuc9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CWUXjxQ/3YjWD/2SinbADatH0WGpATOGYy0XsfwENczQCDcmZXblC54Wc4i9zwoAk
 XkHQW0ja3tS0TfH50ej1f+0gk7J4AFIFlugv614KG8IU4u/HHvFfX6zwt9Gb4SAtO2
 UZK8/clg8EkhrK5SMYGEZbdi8FsXsRO5bMxTK3evtaGA0uZ/g7g9Etw1daZdMKm9DD
 CMax3LQNi76opuJdo/kAS/rQkHRingi+uJe196tU3dat3s6op+68rioA5W12aYyCzJ
 2xnbe4BDIjUOK2lyZwk3gy2JHZ8PRV+cdcTeaqJFsYRCqsELrsHlt+VABrjWcDCdwZ
 4YbDYbNfNxFsg==
X-KAS-Sym: v3:f51bdf72230551df:YQnrCVOyQTYqHcX7/s5yotzTnrVz65+Dzp6MAZJ+SVYAZ
 FfXy6c8x4QD3oOA/6VMQJlxhP+bhQ6ku5NDC2l/n9r11qYAKdcXLuotMdBF85g3NTWv2f+tNs3Z
 +ScI2dQYrWUxgEnjKZpNXqu9rp4TuG1CgE+CGfSmRzU0CB4w4X6f1vObzjTrX0gZ9twAGRuIYWE
 pP3EUkO4N1q0JVwHe6KVzeYwyIUF9JsZJ5P+kVciIGvKs9ETulcxrjtgfZaatakimoOKpkbqCfw
 sWNp6hwY6fyz1Udjb4VJK9FcXAMv/mS8QbDtTBhSdADn3xBP3Pt0ssbLdetdlSR1h/soPpAQ==:
 g9WKi/eeHCJmJpoYQTgzYaEAWHTUo0b+ogXKUZwwklBcKNyzqs3criGiLerogEPLOv2TCEWA6E2
 ctKVEoP9V6ZDUWXo0CPV+Dc4u4jUvjbKlrOqcL5fNt4uuo4wdjE/813LfqfZknLuRgz9iaYHANk
 wckUmXKXPwCAHHrMel1peoASKj220hEnXe0ROC2Y0kXHZ/OQa0aKwnIyN3+S7dmO7Xztcls+kGk
 BvEYndll1LW8RDVLzvnJaiVllO/jVImc2STJbeat3b3dOuqyvI0xuNvW1fliYa/iIoNPtMlPJKv
 RW25L3n/91cnSoMjvCOQnWfM/ZdnBJ4cpRvgLPYUhhH6Rid3FuLNRU5rsdxOTF8Lj1RAp222gyC
 AzeQ9w/eRx1peePTAFW3oIrZzsn7Z1NQYGllxSbjVMivonXov+Yo3OAKNr/qRJYn39KyF2hhoLF
 Vs18h4B+5K7kXzn5IJrcD+4xCEIxQCsn1MZlH2GtLmP0PWuolF63ZrgvxZhw1M545lFSXvFsJKn
 8rfnHu3M+x1bmY7sgxxRigSHDc4MAvrBbqqu+b7WrBHXlFmqcUWXq6hkCzIQ/uJSGuFKA2Cc+di
 3xyPfL2PLM5s3jPLqU0zp1Jbm6E73t7+1QZ0PkXE6U1UjQq/haRg40sEziIo717YjxAexcNwP6D
 l0OuCsWSLj6MaAUBmPA==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B1B3A4C693A;
 Fri, 23 Oct 2026 23:17:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50400)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKMcg-0000000069z-1ZxW;
 Fri, 23 Oct 2026 21:16:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 23 Oct 2026 23:16:22 +0200
Message-ID: <20261023211622.2096562-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023211622.2096562-1-bernd@kuhls.net>
References: <20261023211622.2096562-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 5/5] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
https://lists.freedesktop.org/archives/mesa-announce/2026-October/000870.html
https://lists.freedesktop.org/archives/mesa-announce/2026-September/000869.html
https://lists.freedesktop.org/archives/mesa-announce/2026-September/000868.html
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000867.html
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html

Removed patch which was applied to fix a build error with gcc < 13 seen
with mesa 26.1.x.

Renumbered remaining patches.

Rebased patches 0005-0007 by replacing them with non-rebased versions
of the upstream commits. The rebase was only needed for the mesa's
26.1.x branch.

Added patch 0008 to fix a build error which would be introduced by this
bump due to upstream commit:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/6351df29e2d99a982dbfed931b23a76defca0132

Upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/3f9451b54c42a37b41246de3ceea991111389c37
added rusticl to the variable with_driver_using_cl which creates a new
dependency to the precomp-compiler:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.2.5/meson.build?ref_type=tags#L973

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Please note that this series does not pass all Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/1eefcb30f86c653755ecfd95f3d32417b6e23830

The only broken target is
bootlin-m68k-68040-uclibc/build/mesa3d-26.2.5/.stamp_built:

../src/compiler/nir/nir_opt_varyings.c:3207:1: error: static assertion
 failed: "dedup_entry layout changed"

The assert was added to 26.2.0 with upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/136596668e09431605d5cbac79243fb935da4520

but neither do I understand it nor do I have an idea about how to fix
the build error.

v3:
- bumped to 26.2.5
- renumbered and rebased rusticl patch set
- added patch 0008
v2: bumped to 26.2.3

 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...o-not-compare-sys_path-against-NULL.patch} | 68 +++++++--------
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch | 41 ---------
 ..._libclc-turn-sys_path-into-an-array.patch} | 68 +++++++--------
 ...oad_libclc-add-llvm-23-libclc-paths.patch} |  4 +-
 ...-floating-point-exception-flags-with.patch | 84 +++++++++++++++++++
 package/mesa3d/Config.in                      |  1 +
 package/mesa3d/mesa3d.hash                    |  6 +-
 package/mesa3d/mesa3d.mk                      |  2 +-
 9 files changed, 156 insertions(+), 120 deletions(-)
 rename package/mesa3d/{0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch => 0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch} (75%)
 delete mode 100644 package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
 rename package/mesa3d/{0007-nir-load_libclc-turn-sys_path-into-an-array.patch => 0006-nir-load_libclc-turn-sys_path-into-an-array.patch} (71%)
 rename package/mesa3d/{0008-nir-load_libclc-add-llvm-23-libclc-paths.patch => 0007-nir-load_libclc-add-llvm-23-libclc-paths.patch} (93%)
 create mode 100644 package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index fd715b5f84..d42e7c7a0a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.8
+MESA3D_HEADERS_VERSION = 26.2.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch b/package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
similarity index 75%
rename from package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
rename to package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
index 21cfe54e80..6883031951 100644
--- a/package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
+++ b/package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
@@ -1,4 +1,4 @@
-From f5011f50a7e9c3f8dc208e16a4bd3aadbd6fdae8 Mon Sep 17 00:00:00 2001
+From 1219dc3f7fe83b1f7f200190bf02a86ab57b3d4f Mon Sep 17 00:00:00 2001
 From: Karol Herbst <kherbst@redhat.com>
 Date: Tue, 22 Sep 2026 13:53:43 +0200
 Subject: [PATCH] nir/load_libclc: do not compare sys_path against NULL
@@ -11,14 +11,13 @@ Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
 
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/1219dc3f7fe83b1f7f200190bf02a86ab57b3d4f
 
-[Bernd: backported to 26.1.8]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- src/compiler/clc/nir_load_libclc.c | 84 ++++++++++++++----------------
- 1 file changed, 39 insertions(+), 45 deletions(-)
+ src/compiler/clc/nir_load_libclc.c | 76 ++++++++++++++----------------
+ 1 file changed, 35 insertions(+), 41 deletions(-)
 
 diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 4cb92bdb257..46beaf51cdf 100644
+index edcd13b3b26..913dd8ff7a7 100644
 --- a/src/compiler/clc/nir_load_libclc.c
 +++ b/src/compiler/clc/nir_load_libclc.c
 @@ -145,20 +145,18 @@ map_clc_data(struct clc_data *clc)
@@ -69,7 +68,7 @@ index 4cb92bdb257..46beaf51cdf 100644
  #endif
  }
  
-@@ -198,33 +194,31 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
+@@ -198,34 +194,32 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
     }
  
  #ifdef DYNAMIC_LIBCLC_PATH
@@ -77,7 +76,10 @@ index 4cb92bdb257..46beaf51cdf 100644
 -      int fd = open(clc->file->sys_path, O_RDONLY);
 -      if (fd < 0)
 -         return false;
--
++   int fd = open(clc->file->sys_path, O_RDONLY);
++   if (fd < 0)
++      return false;
+ 
 -      struct stat stat;
 -      int ret = fstat(fd, &stat);
 -      if (ret < 0) {
@@ -85,46 +87,40 @@ index 4cb92bdb257..46beaf51cdf 100644
 -         close(fd);
 -         return false;
 -      }
--
++   struct stat stat;
++   int ret = fstat(fd, &stat);
++   if (ret < 0) {
++      fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
++      close(fd);
++      return false;
++   }
+ 
 -      clc->fd = fd;
 -      clc->size = stat.st_size;
--
++   clc->fd = fd;
++   clc->size = stat.st_size;
+ 
 -      if (!map_clc_data(clc)) {
+-         close_clc_data(clc);
 -         return false;
 -      }
--
++   if (!map_clc_data(clc)) {
++      close_clc_data(clc);
++      return false;
++   }
+ 
 -      blake3_hasher ctx;
 -      _mesa_blake3_init(&ctx);
 -      _mesa_blake3_update(&ctx, clc->data, clc->size);
 -      _mesa_blake3_final(&ctx, clc->cache_key);
--
++   blake3_hasher ctx;
++   _mesa_blake3_init(&ctx);
++   _mesa_blake3_update(&ctx, clc->data, clc->size);
++   _mesa_blake3_final(&ctx, clc->cache_key);
+ 
 -      return true;
 -   }
-+  int fd = open(clc->file->sys_path, O_RDONLY);
-+  if (fd < 0)
-+     return false;
-+
-+  struct stat stat;
-+  int ret = fstat(fd, &stat);
-+  if (ret < 0) {
-+     fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
-+     close(fd);
-+     return false;
-+  }
-+
-+  clc->fd = fd;
-+  clc->size = stat.st_size;
-+
-+  if (!map_clc_data(clc)) {
-+     return false;
-+  }
-+
-+  blake3_hasher ctx;
-+  _mesa_blake3_init(&ctx);
-+  _mesa_blake3_update(&ctx, clc->data, clc->size);
-+  _mesa_blake3_final(&ctx, clc->cache_key);
-+
-+  return true;
++   return true;
  #endif
  
     return false;
diff --git a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
deleted file mode 100644
index af066287e2..0000000000
--- a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 345ccf93e9d00dfd0f71085832a7df0170b74f74 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 14 Jun 2026 17:42:19 +0200
-Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
-
-This is a C23 feature and not supported by gcc < 13, which
-many host distros still have (e.g. Debian 12).
-
-Upstream-Status: Inappropriate [yocto host distro requirements]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Upstream: N/A, code completely changed upstream
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/intel/compiler/jay/jay_ir.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
-index 8307044ef8a..abf175a71bf 100644
---- a/src/intel/compiler/jay/jay_ir.h
-+++ b/src/intel/compiler/jay/jay_ir.h
-@@ -579,7 +579,7 @@ jay_type_is_any_float(enum jay_type t)
-    return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
- }
- 
--enum jay_predication : uint8_t {
-+enum jay_predication {
-    /** No predication. */
-    JAY_NOT_PREDICATED = 0,
- 
-@@ -634,7 +634,7 @@ typedef struct jay_inst {
-    bool decrement_dep:1;
-    unsigned padding  :12;
- 
--   enum jay_predication predication;
-+   uint8_t predication;
-    enum jay_conditional_mod conditional_mod;
- 
-    jay_def cond_flag; /**< conditional flag */
--- 
-2.55.0
-
diff --git a/package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch b/package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
similarity index 71%
rename from package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch
rename to package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
index ff53b68f19..916af6547d 100644
--- a/package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch
+++ b/package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
@@ -1,4 +1,4 @@
-From 9d4685ec168e28bec7c25859f8d9162865c14284 Mon Sep 17 00:00:00 2001
+From 62ee563fd398169005906245831db680f813b19f Mon Sep 17 00:00:00 2001
 From: Karol Herbst <kherbst@redhat.com>
 Date: Tue, 22 Sep 2026 14:11:09 +0200
 Subject: [PATCH] nir/load_libclc: turn sys_path into an array
@@ -7,14 +7,13 @@ Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
 
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/62ee563fd398169005906245831db680f813b19f
 
-[Bernd: backported to 26.1.8]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- src/compiler/clc/nir_load_libclc.c | 63 +++++++++++++++++-------------
- 1 file changed, 35 insertions(+), 28 deletions(-)
+ src/compiler/clc/nir_load_libclc.c | 55 +++++++++++++++++-------------
+ 1 file changed, 31 insertions(+), 24 deletions(-)
 
 diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 46beaf51cdf..54b45ad7808 100644
+index 913dd8ff7a7..17b901db47c 100644
 --- a/src/compiler/clc/nir_load_libclc.c
 +++ b/src/compiler/clc/nir_load_libclc.c
 @@ -52,7 +52,7 @@ struct clc_file {
@@ -48,41 +47,26 @@ index 46beaf51cdf..54b45ad7808 100644
  #endif
     },
  };
-@@ -194,31 +198,34 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
+@@ -194,32 +198,35 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
     }
  
  #ifdef DYNAMIC_LIBCLC_PATH
--  int fd = open(clc->file->sys_path, O_RDONLY);
--  if (fd < 0)
--     return false;
--
--  struct stat stat;
--  int ret = fstat(fd, &stat);
--  if (ret < 0) {
--     fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
--     close(fd);
--     return false;
--  }
--
--  clc->fd = fd;
--  clc->size = stat.st_size;
--
--  if (!map_clc_data(clc)) {
--     return false;
--  }
--
--  blake3_hasher ctx;
--  _mesa_blake3_init(&ctx);
--  _mesa_blake3_update(&ctx, clc->data, clc->size);
--  _mesa_blake3_final(&ctx, clc->cache_key);
--
--  return true;
+-   int fd = open(clc->file->sys_path, O_RDONLY);
+-   if (fd < 0)
+-      return false;
 +   for (unsigned i = 0; i < ARRAY_SIZE(clc->file->sys_paths); i++) {
 +      const char *sys_path = clc->file->sys_paths[i];
 +      int fd = open(sys_path, O_RDONLY);
 +      if (fd < 0)
 +         continue;
-+
+ 
+-   struct stat stat;
+-   int ret = fstat(fd, &stat);
+-   if (ret < 0) {
+-      fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
+-      close(fd);
+-      return false;
+-   }
 +      struct stat stat;
 +      int ret = fstat(fd, &stat);
 +      if (ret < 0) {
@@ -90,19 +74,31 @@ index 46beaf51cdf..54b45ad7808 100644
 +         close(fd);
 +         continue;
 +      }
-+
+ 
+-   clc->fd = fd;
+-   clc->size = stat.st_size;
 +      clc->fd = fd;
 +      clc->size = stat.st_size;
-+
+ 
+-   if (!map_clc_data(clc)) {
+-      close_clc_data(clc);
+-      return false;
+-   }
 +      if (!map_clc_data(clc)) {
++         close_clc_data(clc);
 +         continue;
 +      }
-+
+ 
+-   blake3_hasher ctx;
+-   _mesa_blake3_init(&ctx);
+-   _mesa_blake3_update(&ctx, clc->data, clc->size);
+-   _mesa_blake3_final(&ctx, clc->cache_key);
 +      blake3_hasher ctx;
 +      _mesa_blake3_init(&ctx);
 +      _mesa_blake3_update(&ctx, clc->data, clc->size);
 +      _mesa_blake3_final(&ctx, clc->cache_key);
-+
+ 
+-   return true;
 +      return true;
 +   }
  #endif
diff --git a/package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch b/package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
similarity index 93%
rename from package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch
rename to package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
index bfef0c50ba..f43b7b7260 100644
--- a/package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch
+++ b/package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
@@ -1,4 +1,4 @@
-From c86bf6e6b9fbc9cfb02eeed3d798ffbdd3dc0252 Mon Sep 17 00:00:00 2001
+From 6b9cd5ab9cc3bfd0c79d9500a07a5e74351c72d1 Mon Sep 17 00:00:00 2001
 From: Karol Herbst <kherbst@redhat.com>
 Date: Tue, 22 Sep 2026 14:13:28 +0200
 Subject: [PATCH] nir/load_libclc: add llvm-23 libclc paths
@@ -13,7 +13,7 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 54b45ad7808..bb1efd0ce57 100644
+index 17b901db47c..889bde610a3 100644
 --- a/src/compiler/clc/nir_load_libclc.c
 +++ b/src/compiler/clc/nir_load_libclc.c
 @@ -52,7 +52,7 @@ struct clc_file {
diff --git a/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch b/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch
new file mode 100644
index 0000000000..7130588206
--- /dev/null
+++ b/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch
@@ -0,0 +1,84 @@
+From 0c567be6b8782b1fe3ed6f1e7499856bf6af9f6a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 23 Oct 2026 21:33:52 +0200
+Subject: [PATCH] nir: fix build of floating point exception flags with
+ toolchains lacking fenv support
+
+uClibc-ng supports C99 Floating-point on a restricted set of platforms:
+https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/extra/Configs/Config.in.arch#L163
+
+causing build errors on the other supported platforms:
+
+src/compiler/nir/nir_constant_expressions.c:24:10: fatal error:
+ fenv.h: No such file or directory
+
+Check for fenv.h and guard the fenv code added by commit
+https://gitlab.freedesktop.org/mesa/mesa/-/commit/6351df29e2d99a982dbfed931b23a76defca0132
+with ifdef's.
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45569
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ meson.build                                  | 2 +-
+ src/compiler/nir/nir_constant_expressions.py | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 5f19ef921a6..9c57445edb6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1613,7 +1613,7 @@ endif
+ 
+ foreach h : ['xlocale.h', 'linux/futex.h', 'endian.h', 'dlfcn.h', 'sys/shm.h',
+              'cet.h', 'pthread_np.h', 'poll.h', 'sys/inotify.h',
+-             'linux/udmabuf.h']
++             'linux/udmabuf.h', 'fenv.h']
+   if cc.check_header(h)
+     pre_args += '-DHAVE_@0@'.format(h.to_upper().underscorify())
+   endif
+diff --git a/src/compiler/nir/nir_constant_expressions.py b/src/compiler/nir/nir_constant_expressions.py
+index c4ae87db1a7..23f4aa6adbb 100644
+--- a/src/compiler/nir/nir_constant_expressions.py
++++ b/src/compiler/nir/nir_constant_expressions.py
+@@ -55,7 +55,9 @@ template = """\
+  * IN THE SOFTWARE.
+  */
+ 
++#ifdef HAVE_FENV_H
+ #include <fenv.h>
++#endif
+ #include <math.h>
+ #include "util/rounding.h" /* for _mesa_roundeven */
+ #include "util/half_float.h"
+@@ -660,6 +662,7 @@ nir_eval_const_opcode(nir_op op, nir_const_value *dest, nir_component_mask_t *ou
+                       nir_const_value **src,
+                       unsigned float_controls_execution_mode)
+ {
++#ifdef HAVE_FENV_H
+    /* Temporarily disable floating point exception flags while we
+     * evaluate shader constants. This avoids games unexpectedly crashing while
+     * we evalute shader math on the cpu if they have the exeption flags turn
+@@ -673,6 +676,7 @@ nir_eval_const_opcode(nir_op op, nir_const_value *dest, nir_component_mask_t *ou
+ #endif
+    if (unlikely(had_flags))
+       feholdexcept(&__nir_const_fenv);
++#endif
+ 
+    nir_component_mask_t poison;
+ 
+@@ -689,9 +693,11 @@ nir_eval_const_opcode(nir_op op, nir_const_value *dest, nir_component_mask_t *ou
+    if (out_poison)
+       *out_poison = poison;
+ 
++#ifdef HAVE_FENV_H
+    /* Restore floating point exception flags */
+    if (unlikely(had_flags))
+       fesetenv(&__nir_const_fenv);
++#endif
+ }"""
+ 
+ from mako.template import Template
+-- 
+2.47.3
+
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f45a675445..d1b6a38858 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -64,6 +64,7 @@ config BR2_PACKAGE_MESA3D_RUSTICL
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_SPIRV_TOOLS
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_OPENCL_ICD_LOADER
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index dc7776488a..fdcc345896 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html
-sha256  b320f65874fd9653ac6c0bd1616605387344e1247411a50c797b5f3fb9dc0b55  mesa-26.1.8.tar.xz
-sha512  eb3d46ae9aaba70fdd908486cef24041fec9264ddf586eaebbba65ce55e716d306ef9e91be83e742dfaec4dfc94105a5cd3a36b29bf56614febcbcf6c1f8b516  mesa-26.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
+sha256  794b3d1729075dae7ebd47c7283b7ca0cdb5dec668f7f11cc0a5d82f6138a0a5  mesa-26.2.5.tar.xz
+sha512  08c7d7ea426ddfb0f7bc51b06e18c363a4d31cf1a8b203828bb455eda0189e41d2215eb9f627585ed11e0d0f231a6a8c9f0c7176238760cd76b62e20c35ccd6a  mesa-26.2.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 04112eea8e..f20f02190a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.8
+MESA3D_VERSION = 26.2.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
