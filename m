Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8AB606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XjKEqUAF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08BA40EBE;
	Fri, 30 Oct 2026 15:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pltb3qcu8eCQ; Fri, 30 Oct 2026 15:30:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9BC3240ED9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374207;
	b=Iee+aykYOBCalhEnoRZnKeDTveQEhSklm8pX3p1niY41rU304PQn2qpNsspEfPaBpFIC
	 MancOKJh/NzoWUvC1Q42UUEckYE5Csec4xxKEeaqX05h34gHIDtB9498EO4e2cvvtIDjF
	 qBLT16YrvmED+zXW2LDMTHX7rH9ZP6xz8/YiU+9/vvyNiLynjsWzsizn55XChk9Ohf8R0
	 NYZjT9j/HCcwfCvBjVlfNvWtbKui+SkSOQA2CHt9TGOUd6mxuJ2dwPBR1Gjy4O1Jm+OLO
	 ud8RMP7v5HYkIkvagWNsE6h/HE5xGCzQ+nQaCjFI8grxfEcN7Ek7ak5SID+MlPUHHdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=h9+dGo8aTuYQocqwOUzeIvD9Oa3nh4gGqEi2wUQuwIk=;
	b=JrAMXpjRayiFBGAFOGOPLa/qI+IGJSa9OcDXHIsxxBGUK9BYcguanarKP5/CpbyPBmK3
	 K2wWGOXMH9xN1tqe5txQSNwKUYOJsEYrs1zZEQmTxn9qXym9PF+BLN0RmeChZPbWzyHFw
	 xBiWcnGOOt8g+NlqKYep+ZL6GNiD8FC34I45GZM2v64NnkK+3PPpInSKsuJve96G8/Snw
	 GY+hxuNSGmZlCsI9VzQW56rvPz8Yq+ACEprwZzflih3+GVDIpyES6OlA4zmeI2c9sTRzl
	 iuJ4udN/7Egm2/gvPZP12q3pcT2el/CsNTzjDGmoKCrHITn2ZsmABv05TBtvn7pRtAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374207;
	bh=h9+dGo8aTuYQocqwOUzeIvD9Oa3nh4gGqEi2wUQuwIk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XjKEqUAFOk4gyHvZ5fKG1P5lAsai3Tq1O21J/e84JIUhTeg2Ci+e1n1nZDsE+VlRh
	 l2CwhhM+wu2SoFcnIcl2eAr9ML3f4F+ij7+f70AFKn/hbqCXbQdL4pfL51025FIO/n
	 t13RcrnkS4b6yS08J++PF7U/oo7DopBP/36bLTth+1pk1VHRpnWvkzEp4PyCz6pD33
	 N/kD7kgXKv/cReP3Sf1CtekVN1OdWxvxAKwyuGLlN4HQt7SdS9MXnXfGDbIYCbabPl
	 VrGgQ0vuXvEI7fOC87rfo4fuzJciD77L9Ry8lTYgnGyIfs2fL8RXfmcopH/WA/L1Xb
	 bOY9jg3b+f+ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC3240ED9;
	Fri, 30 Oct 2026 15:30:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BB3235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C0140D7A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAhdLEy9ZaBU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3EE1D40E26
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374182;
 b=PFx8Z8dG6gJnQYHwpsoptORggVsb8fBJyuYBjggOyDCZxmLde7t5jmI7LyoW7ceS7ToS
 z3rTsRns39X2qUNkIP7QfUs74CyUxk2LACB4eYbWQdPQN+aAqWDPbMrIcQUYQyMgsGF1u
 nmi8Cmn/Ls/1v2X+GEoAK4SdOTN9bg5NQM7LLquXoeyY9aq6UdOU0oNJdhBsMgokSTzwr
 Rs7X15BRHs6gPskbjT9Mgc9axy4F2ZnwqszGMqOeUIYR1flpdAi85WUmRCvYSUT13PKiy
 hxBbonLQEK9PRNX170dXa5rTqroGCp1KhZ0bErO11zWixrxr+3BOcg1Qf1TKx7zDL6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374182;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3alobzvn5hUKw8EhMBkhMtqcJlgXKPgYvm+8jN4Cm2M=;
 b=s9G6aqEv9jG0IQac2hkmD24lI7LpDd/vNZHPl7IquYO+t61htzB9rO72kWcknlKX69ke
 sP7Jh83VjkG4EobnAxTvoGYe6cAPIBcQkY7vypCVXPA8T2eeJ/63rA4sg87uPxPsU0lGx
 1bQRsZng0NCsLbD5WASXxBBW/5JWLpoCCM+WamqYmo8UkAgQtX4rVJwjw3M6U3jbn6waW
 mVwNEDPtLJ0AlFlvzr1wjq02ALnZ+2mDdBK1zJahiDN0etn/baptOndckKe2BwP/CPobm
 vB1cbRquUukCyPxNIzPhFD86nhTBEHyziIyBeNhPISNFoixgNVFJDPJAuObiZu8oMsw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hvmc8Zsn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EE1D40E26
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so7969835e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374180; x=1793978980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3alobzvn5hUKw8EhMBkhMtqcJlgXKPgYvm+8jN4Cm2M=;
 b=hKhGlfRMuU7NaY5tBADbm7n0x+w9qDhl7p4AiB1pS09wGLRerl/blqjyqhNeHE57oL
 sC2kzAdnhd3fDjn7imJwfxUuA1D9dZLdI73RUE3x8/KAA01zhuFgzto6KAiZTKCRx/d+
 letrCzw6Hkti4/cXOIT5D1b0CM+5NSnyOdkPUh+Dgg1zcww0bkCbJOUGS+9ZiIIFOlWj
 tqEbMaK3p/O0Reo3JU8L6+9I3t1NcU+WNIqdqirV3TQ95xkvy9P9YquFWPTLv19GJVCL
 v1Z8hZJHHleZYNgeMM7XYmc/AWqsT+uGRGhi5tDAezGjd8eSSSUUaohP39XPutN0Qpxi
 EBUQ==
X-Gm-Message-State: AFq9FYL9KmgmGIfvbvazKySsDuRXrjqvougLu/3fgwgpyJWcj67tnEcv
 bH5q/cDEkDmrDFiXrl3fxg9GXWMNvmiDqGHWHar3QOP6v2SvG51YzORXXFnZ87542X0KlvLc21A
 cy5QZLys=
X-Gm-Gg: AYBFou1htEZ9KpuAa0OWOGj7xpPxgrjmU1BUIFOCUtPJnhU1yRpfsZ3Wq0YjFRufgoz
 SH0VQ52cP4tBPZHLbiy4ODbrICsGGrs5lGmUHaPtkNWEiUNC/GEerZIU6/vPowq2yyPQaHWDlqU
 7h4DUGm2M+5UbeAEYuKn06HRIdFuzEl4tfRvrJFo4R0EaECq2H6W1f3U4L8OsL0zNk36OQGcsdf
 X7CbOFykbDt5EzxyrYWPFkl6ySYi8Ff3XURXuaKMZZ5uhMgZMXsTI8Fc9x6+fQv/1MuWBlH31nR
 isj/x/1JEP47paqUBuD6CVGTNJQgXNLrtg6/G2jlxNWrMWK4MknxTgG/GY34UhTvpcY8w+WSNUm
 SGPhItqU7eb1Ibz6qRKQbiVH+HnEHgLw+GFKc4IT5LpLgC7R2X8BTms+GmgVuaf6RvN5y1FkFz4
 zh7BNrxd7X18TOXG8Oo7E/t7x6eK/VkIuZ+O1apVOo0870ZbMK376F7O5ZHnqdWx25/sMQYj303
 eTC6LS6rcVGsdruwKZSurY2qkWM6rQ8IWx4HqLBRn+1cx+7tFNJn90eMlTzsrc5KCVX06/obRbo
 LrCIUOsk1Dlu4l26kLEK7jPO8ksdf/90TfPY9K4XVl2RSnyvFuD7e992zKPuh2NYRZde7Jgg
X-Received: by 2002:a05:600c:8116:b0:4a2:150f:160f with SMTP id
 5b1f17b1804b1-4ac1913eecdmr56953025e9.25.1793374180100; 
 Fri, 30 Oct 2026 08:29:40 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf0b36853sm61413855e9.0.2026.10.30.08.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:39 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:37 +0100
Message-ID: <20261030152938.1908036-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024132350.3708324-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: fix static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> libgpiod 2.3 switched to meson, and builds its libraries with
> both_libraries(), so the shared library is always built, even with
> -Ddefault_library=static. With BR2_STATIC_LIBS, linking it with -static
> then fails, e.g. on ARC:
> 
>   FAILED: [code=1] lib/libgpiod.so.3.1.2
>   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
>   [...] BFD (GNU Binutils) 2.47.20260726 assertion fail elf32-arc.c:1815
>   collect2: fatal error: ld terminated with signal 11 [Segmentation fault], core dumped
> 
> Add a patch, sent upstream, using library() instead, so that the
> libraries follow default_library and only the static ones are built.
> As a side effect, shared builds no longer install the unused static
> libraries to staging.
> 
> This issue has been present since commit 1d132d04fc0e
> ("package/libgpiod2: bump to version 2.3.1"), which switched to the
> meson build system. It therefore affects 2026.08 and later.
> 
> Fixes:
> https://autobuild.buildroot.org/results/7dc84554b75a370136bfa2451f4b4c3dde0d92e8
> 
> Fixes: 1d132d04fc0ecac014be003b7e1662c47672328b ("package/libgpiod2: bump to version 2.3.1")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...ult_library-for-the-installed-librar.patch | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
> 
> diff --git a/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
> new file mode 100644
> index 0000000000..f369ee4248
> --- /dev/null
> +++ b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
> @@ -0,0 +1,138 @@
> +From a92938c5d7bbb5a918937657a8940dc6072929ca Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Sat, 24 Oct 2026 10:28:49 +0200
> +Subject: [PATCH] build: honor default_library for the installed
> + libraries
> +
> +The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
> +libgpiodbus) are built with both_libraries(), so the shared variant is
> +always built, even with -Ddefault_library=static. When the toolchain
> +or the environment requests a fully static link (e.g. LDFLAGS=-static,
> +as done by Buildroot for static-only builds), linking the shared
> +library then fails:
> +
> +  FAILED: lib/libgpiod.so.3.1.2
> +  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
> +
> +Use library() instead, which follows default_library, and set
> +default_library=both in the project's default options, so that a
> +default build still installs both the shared and static libraries. As
> +library() returns an object behaving like the shared library when both
> +are built, the users of these objects (link_with, pkgconfig.generate,
> +generate_gir, full_path) keep working as before.
> +
> +With a default build, the only change in the installed files is that
> +libgpiotools, already declared with library(), is now also installed as
> +a static library, like the other libraries.
> +
> +Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
> +Assisted-by: Claude:claude-opus-5-5
> +Upstream: https://lore.kernel.org/linux-gpio/20261024123124.3700266-1-yegorslists@googlemail.com/
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + bindings/cxx/meson.build  | 3 +--
> + bindings/glib/meson.build | 3 +--
> + dbus/lib/meson.build      | 3 +--
> + lib/meson.build           | 3 +--
> + meson.build               | 1 +
> + 5 files changed, 5 insertions(+), 8 deletions(-)
> +
> +diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
> +index 92625b5..a23c70a 100644
> +--- a/bindings/cxx/meson.build
> ++++ b/bindings/cxx/meson.build
> +@@ -3,7 +3,7 @@
> + 
> + cxx_inc = include_directories('.', '../../include')
> + 
> +-libgpiodcxx_both = both_libraries('gpiodcxx',
> ++libgpiodcxx_lib = library('gpiodcxx',
> +   sources: [
> +     'chip.cpp',
> +     'chip-info.cpp',
> +@@ -29,7 +29,6 @@ libgpiodcxx_both = both_libraries('gpiodcxx',
> +   soversion: libgpiodcxx_soversion,
> +   install: true,
> + )
> +-libgpiodcxx_lib = libgpiodcxx_both.get_shared_lib()
> + 
> + install_headers('gpiod.hpp')
> + 
> +diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
> +index 0ccd8e8..17e071c 100644
> +--- a/bindings/glib/meson.build
> ++++ b/bindings/glib/meson.build
> +@@ -61,7 +61,7 @@ glib_public_headers = files(
> + 
> + glib_inc = include_directories('.', '../../include')
> + 
> +-libgpiod_glib_both = both_libraries('gpiod-glib',
> ++libgpiod_glib_lib = library('gpiod-glib',
> +   sources: glib_sources + [gen_enum_c, gen_enum_h],
> +   include_directories: glib_inc,
> +   c_args: ['-DG_LOG_DOMAIN="gpiod-glib"', '-DGPIODGLIB_COMPILATION'] + profiling_c_args,
> +@@ -71,7 +71,6 @@ libgpiod_glib_both = both_libraries('gpiod-glib',
> +   soversion: libgpiod_glib_soversion,
> +   install: true,
> + )
> +-libgpiod_glib_lib = libgpiod_glib_both.get_shared_lib()
> + 
> + install_headers('gpiod-glib.h')
> + 
> +diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
> +index 9acf5e1..12cff4a 100644
> +--- a/dbus/lib/meson.build
> ++++ b/dbus/lib/meson.build
> +@@ -14,7 +14,7 @@ generated_dbus = gnome.gdbus_codegen('generated-gpiodbus',
> + 
> + dbus_lib_inc = include_directories('.', '../../include')
> + 
> +-libgpiodbus_both = both_libraries('gpiodbus',
> ++libgpiodbus_lib = library('gpiodbus',
> +   sources: ['gpiodbus.h', generated_dbus],
> +   include_directories: dbus_lib_inc,
> +   c_args: ['-DG_LOG_DOMAIN="gpiodbus"'],
> +@@ -22,7 +22,6 @@ libgpiodbus_both = both_libraries('gpiodbus',
> +   soversion: 1,
> +   install: true,
> + )
> +-libgpiodbus_lib = libgpiodbus_both.get_shared_lib()
> + 
> + install_data('io.gpiod1.xml',
> +   install_dir: get_option('datadir') / 'dbus-1' / 'interfaces',
> +diff --git a/lib/meson.build b/lib/meson.build
> +index ea1d92c..fb09b71 100644
> +--- a/lib/meson.build
> ++++ b/lib/meson.build
> +@@ -1,7 +1,7 @@
> + # SPDX-License-Identifier: GPL-2.0-or-later
> + # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
> + 
> +-libgpiod_both = both_libraries('gpiod',
> ++libgpiod_lib = library('gpiod',
> +   sources: [
> +     'chip.c',
> +     'chip-info.c',
> +@@ -22,7 +22,6 @@ libgpiod_both = both_libraries('gpiod',
> +   soversion: libgpiod_soversion,
> +   install: true,
> + )
> +-libgpiod_lib = libgpiod_both.get_shared_lib()
> + 
> + pkgconfig = import('pkgconfig')
> + pkgconfig.generate(libgpiod_lib,
> +diff --git a/meson.build b/meson.build
> +index 7045d29..7633702 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -6,6 +6,7 @@ project('libgpiod', 'c',
> +   license: 'LGPL-2.1-or-later',
> +   default_options: [
> +     'c_std=gnu89',
> ++    'default_library=both',
> +     'cpp_std=gnu++17',
> +     'warning_level=2',
> +   ],
> +-- 
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
