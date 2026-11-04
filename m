Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE07606A326
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lb5Tm39J
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D652580BCD;
	Wed,  4 Nov 2026 11:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjH5G49SL_Qj; Wed,  4 Nov 2026 11:45:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 94F9280F44
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793792749;
	b=OGWVE1zVIzSXh8weEcVjLVjRE2IQ88iChOpH8GNzqI1JiNVARDAJ5Qwv0R2W6giZcaBf
	 /PZFrF7pH4ROpZAvkFfrC8tr7t5jrzrbZdj0V7GRy714E0DfZSxBKXodw7GlP99Poa+oV
	 uTJPkxEwx6oyYhwI4FROkRRv5KbwuHTMCkvI1fbSjDTNmPILV0AWpuc2agfiTSFsd5Vji
	 OZKKCv3TqgMYtVSbavlYpKFNVEcyFDXJEtg8l96Ruh3/SqWvclFNIknRs3/c1HiX8uGvJ
	 Aj4aMfHP146/aK/2f03hik5dCIoWTPuitSol5swFUzRA/ZyswWslVnPjZhnn6H0YI0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793792749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uNbETRKCny8vIQzZ4aCZwR66qot2Ndjg1B9tCZRtBbQ=;
	b=shxtToxxPF+1qUUbMkTLfcmCCh+PRWgn071d26YW57mOhCUFSdhXwRh/1T09PibKLhuM
	 OF6dRiruqtuerZY1d+Jq+xZH0b71J8tej2rISzukM7FuJrggCJciKCPhgIQ/rY7Svropr
	 eYEvj6VfcmmqB3JC2Pc4S/UeR98wh3IugDjcL3I5m6Kwk4rf3oTwYBCHItIsOIXfdqhTv
	 5gYhoiQsB8XTHJHnifdedOq72RUe3TyrT2jdggLAs2VsXXsVpoNPNOrxqtXXQRR12TlqU
	 4gWNKkgG5uR/LwpjBHVGcsqMAcAG5w8u/L+btokgenRGKzflZXa/ENhsDKqDdDhvgLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793792749;
	bh=uNbETRKCny8vIQzZ4aCZwR66qot2Ndjg1B9tCZRtBbQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lb5Tm39JCIP+rBxzkPaWoRvfkctxWLE1UbuYCZZgmI8TGuYD7QP6SmXcqdCzTkoSv
	 ykQBCSc5J6uhlzthZaSsFHR8KBrYPlRWudUdf9S5zMhBy0MYfaitrfXbAeqe6u9jmg
	 vmOUl02nujew1vjrNA7KIigkeOezbHOhz4cp43ccIDl/SgkjEeT4LEtOcspDEt5O/R
	 Hu7m3WtmOwzeo2iBf4a3N/ovLcvNHsDSyEcMU9P46y6WNiasOr3Pkg87SvhYDU12DZ
	 SKsg10dC/lshiaw4cIQicPt3kENAJUVsBWYZRd+HVx/twKu1gJrISeh58rHf3MzqQt
	 a6gpneeTQOGog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F9280F44;
	Wed,  4 Nov 2026 11:45:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 907EB411
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82948606F2
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XURfsTdmfB2W for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 11:45:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 221D4606EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793792747;
 b=o6XudHJtPfPqdaTGQAjQw+hBZrYiy9tmVOiKqwV38/LaY4hHsXMKt6akNQ+feaPNIZWj
 iXsKHYXEEIRMSc/219Sz9fVWhCByrbmFhzZkBf1A8ZJzkhQiO4neGlLwxEDtnp+maHy/4
 zGcX1I+BGLgUEb3ZXnvcT14k//FFEhMVqPLU1DahNTIJ8cpUx5FNYHsF1hwYCaQl6TjVx
 yTLbH7RK8+wM1CBOebl1GrxyTR9WycS38YZuvLir5H2mdCsDRROCkYMw3zxNh5+BIFE8x
 J6SOdt8HFQ+brS9zzXMcUn128jXJ5ieqnud8Y0uCABbancipa60xpTllUoapnrIwAIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793792747;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SiVgwMlCsKUDk1N2E94r/fEyzxAf8Ea0vdG9o8VV/wE=;
 b=ng/yMJb+uzOq8FuzsDK/1PpJbaxk94+iG++nbtLIH/uuCscOcay4pALXexbL+38Lly17
 wb+mQskR28BPT3tDpfaPKIrpW164Nwew79FFrq2Ls3X0FKd4VN6d8BQnFgVZY7NaPuNLw
 vXdZsY5KogiXWOb00jhZect1XwoIqkIXwylHw4ee9pfqBk96gB+2gixQnLwPb4BJYTtZV
 dPa2mFqCD1GiemLRPqH1VYmmWhKhdq93mETOYDaweLqUmIFo2vafmRjXGJxTtNXaJM1/L
 J+8E1s7Vy0JQNbwlTWnCX6twFxUEj43+4xPzkyHiJ4/8IK9OdXQtt2kEZNI1cJJVSSw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=kCBEwHEP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 221D4606EC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:45:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c3f8d72d7ceso104938966b.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 03:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793792745; x=1794397545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SiVgwMlCsKUDk1N2E94r/fEyzxAf8Ea0vdG9o8VV/wE=;
 b=IWY/JpmqT1cL4tz8WCh5/qNNasOrfC1tg3LwIbfn/motUWOusN6FGOztWvWU+qhZ9/
 5OcU1zEizEpc0xWRbTESNdYJyD0vjR60EvfqZNyY/mEQUFaGYShEFn/JziB5LmfayNos
 v9n4Ls1eNueypKfCC9N4pt0b1iJsQg235XhdBI7ET+R/czKsn4ohpfQTJwskEuZkqFxK
 9Wrp/8za/F0gKc/HiIazX3fe9o0bo7aSWW/Fs99SRbmX2z2KYoFKGpMY6fp0uOIjoXHd
 ByMjZ1/IclrDChCoMWHA2evUYCp+tsDgPDQBvilzlDwkAoAir6NUSJXcBpxy7V2NMRwM
 PopQ==
X-Gm-Message-State: APuU4Z+x3OCVSPrNYVEW0GM4aQxBbgBNmOXQZ4wdnnAAGy+1ip0fWoU1
 tLZhwHM/2Hzx4JioV1EcOGpKwLd2pGil0iUttP6o8QDzE13amXxpDLdcfFUcOA==
X-Gm-Gg: AYBFou1J5cjXYahsLUNpTtpWZj4kBzKJHvDoo2j71gkvBF+TuaHb2ULTeb0s5a1VQhp
 FP50UdGxOwaHKyngKpBh7wbUSpbMrWJFNrjlBazh4phUOwZzK5h0fV12eqA89EODFyln0mk+XtH
 rG0USij47jRIAq4ZQx3S2IerdUm8a3cOoiRgJJ5t04Av8K2/g3V/+LcvkEXlNhNEF+RRwnMV3Sz
 XiMvT+7HiYv2N0tKBtde0XHIYHVxYhiLQ2YECcFNxVnD/kI9p4G1adg/nDgrTXI9ecm3WjlwJMx
 Au87+I3esmaeTBbTsmk83p/SmYDR8TtGumfTNtQZVCwZiRCY+W8L7kgRu1djgXqQ9MAvM3rGWOw
 HM1jB1qVGdq+o0+JGEFDUAKNUTwTTr5y8nYI8nEzjjE52EAGkzkKJIwuXu6yPWwc+kSfghH9Wi4
 8qt7kuiP9BKYN4XQuDpPPfyU6kgcdy7IhPYUH7H6tFK/9/n6Z00k8XMR6Y1YC6jJHFR08SgUeQe
 Bao3BAreIu79+vOK/vW/jHJBFpH9WryrQMVFgVyDbf9OiC6KG8Jg9d+5k0G+EwzQFD2+W+ne+9r
 CWxlQTUgvCDlMjlw9zY3cyAX6aQx3rrorql7JWq0UINJrZFpWuOiSbxOzjtGHeHVo9nd26gxUQx
 s8N7K9f8/
X-Received: by 2002:a17:906:7309:b0:c41:c718:f5c5 with SMTP id
 a640c23a62f3a-c4ca7a15633mr1410116966b.13.1793792744401; 
 Wed, 04 Nov 2026 03:45:44 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e140005sm61847466b.5.2026.11.04.03.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 03:45:43 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Nov 2026 12:45:43 +0100
Message-Id: <20261104114543.2526646-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgpiod2: bump to version 2.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop both patches, which are included in this release:
- 0001 as upstream commit 6276b2514c8f ("build: do not require a C++
  compiler if it is not needed")
- 0002 as upstream commit fd67984496dc ("build: honor default_library
  for the installed libraries")

Release notes:
https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.3.2

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...uire-a-C-compiler-if-it-is-not-neede.patch |  46 ------
 ...ult_library-for-the-installed-librar.patch | 138 ------------------
 package/libgpiod2/libgpiod2.hash              |   2 +-
 package/libgpiod2/libgpiod2.mk                |   2 +-
 4 files changed, 2 insertions(+), 186 deletions(-)
 delete mode 100644 package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
 delete mode 100644 package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch

diff --git a/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch b/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
deleted file mode 100644
index ccc4430a8c..0000000000
--- a/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fce6b611e2530602c44fd914222529028173c509 Mon Sep 17 00:00:00 2001
-From: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Date: Wed, 19 Aug 2026 18:15:25 +0200
-Subject: [PATCH] build: do not require a C++ compiler if it is not needed
-
-Languages specified in the meson project() function are considered hard
-dependencies. When trying to build libgpiod in an environment lacking a
-C++ compiler, the build fails with an obscure error message ("ERROR:
-Unable to get gcc pre-processor defines").
-
-As the C++ compiler is only needed for building the C++ bindings, do not
-require it unless the option bindings-cxx is enabled.
-
-Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Upstream: https://lore.kernel.org/linux-gpio/0eb5c26d-731c-4ebb-be34-76466cf57720@grenoble.cnrs.fr/
----
- meson.build | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index c030b50..fed612f 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,7 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0-or-later
- # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
- 
--project('libgpiod', ['c', 'cpp'],
-+project('libgpiod', 'c',
-   version: '2.3.1',
-   license: 'LGPL-2.1-or-later',
-   default_options: [
-@@ -56,6 +56,10 @@ opt_dbus                = get_option('dbus')
- opt_introspection       = get_option('introspection')
- opt_systemd             = get_option('systemd')
- 
-+if opt_bindings_cxx.allowed()
-+  add_languages('cpp')
-+endif
-+
- if get_option('profiling')
-   profiling_c_args    = ['-fprofile-arcs', '-ftest-coverage']
-   profiling_link_args = ['-lgcov']
--- 
-2.43.0
-
diff --git a/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
deleted file mode 100644
index f369ee4248..0000000000
--- a/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From a92938c5d7bbb5a918937657a8940dc6072929ca Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Sat, 24 Oct 2026 10:28:49 +0200
-Subject: [PATCH] build: honor default_library for the installed
- libraries
-
-The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
-libgpiodbus) are built with both_libraries(), so the shared variant is
-always built, even with -Ddefault_library=static. When the toolchain
-or the environment requests a fully static link (e.g. LDFLAGS=-static,
-as done by Buildroot for static-only builds), linking the shared
-library then fails:
-
-  FAILED: lib/libgpiod.so.3.1.2
-  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
-
-Use library() instead, which follows default_library, and set
-default_library=both in the project's default options, so that a
-default build still installs both the shared and static libraries. As
-library() returns an object behaving like the shared library when both
-are built, the users of these objects (link_with, pkgconfig.generate,
-generate_gir, full_path) keep working as before.
-
-With a default build, the only change in the installed files is that
-libgpiotools, already declared with library(), is now also installed as
-a static library, like the other libraries.
-
-Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
-Assisted-by: Claude:claude-opus-5-5
-Upstream: https://lore.kernel.org/linux-gpio/20261024123124.3700266-1-yegorslists@googlemail.com/
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- bindings/cxx/meson.build  | 3 +--
- bindings/glib/meson.build | 3 +--
- dbus/lib/meson.build      | 3 +--
- lib/meson.build           | 3 +--
- meson.build               | 1 +
- 5 files changed, 5 insertions(+), 8 deletions(-)
-
-diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
-index 92625b5..a23c70a 100644
---- a/bindings/cxx/meson.build
-+++ b/bindings/cxx/meson.build
-@@ -3,7 +3,7 @@
- 
- cxx_inc = include_directories('.', '../../include')
- 
--libgpiodcxx_both = both_libraries('gpiodcxx',
-+libgpiodcxx_lib = library('gpiodcxx',
-   sources: [
-     'chip.cpp',
-     'chip-info.cpp',
-@@ -29,7 +29,6 @@ libgpiodcxx_both = both_libraries('gpiodcxx',
-   soversion: libgpiodcxx_soversion,
-   install: true,
- )
--libgpiodcxx_lib = libgpiodcxx_both.get_shared_lib()
- 
- install_headers('gpiod.hpp')
- 
-diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
-index 0ccd8e8..17e071c 100644
---- a/bindings/glib/meson.build
-+++ b/bindings/glib/meson.build
-@@ -61,7 +61,7 @@ glib_public_headers = files(
- 
- glib_inc = include_directories('.', '../../include')
- 
--libgpiod_glib_both = both_libraries('gpiod-glib',
-+libgpiod_glib_lib = library('gpiod-glib',
-   sources: glib_sources + [gen_enum_c, gen_enum_h],
-   include_directories: glib_inc,
-   c_args: ['-DG_LOG_DOMAIN="gpiod-glib"', '-DGPIODGLIB_COMPILATION'] + profiling_c_args,
-@@ -71,7 +71,6 @@ libgpiod_glib_both = both_libraries('gpiod-glib',
-   soversion: libgpiod_glib_soversion,
-   install: true,
- )
--libgpiod_glib_lib = libgpiod_glib_both.get_shared_lib()
- 
- install_headers('gpiod-glib.h')
- 
-diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
-index 9acf5e1..12cff4a 100644
---- a/dbus/lib/meson.build
-+++ b/dbus/lib/meson.build
-@@ -14,7 +14,7 @@ generated_dbus = gnome.gdbus_codegen('generated-gpiodbus',
- 
- dbus_lib_inc = include_directories('.', '../../include')
- 
--libgpiodbus_both = both_libraries('gpiodbus',
-+libgpiodbus_lib = library('gpiodbus',
-   sources: ['gpiodbus.h', generated_dbus],
-   include_directories: dbus_lib_inc,
-   c_args: ['-DG_LOG_DOMAIN="gpiodbus"'],
-@@ -22,7 +22,6 @@ libgpiodbus_both = both_libraries('gpiodbus',
-   soversion: 1,
-   install: true,
- )
--libgpiodbus_lib = libgpiodbus_both.get_shared_lib()
- 
- install_data('io.gpiod1.xml',
-   install_dir: get_option('datadir') / 'dbus-1' / 'interfaces',
-diff --git a/lib/meson.build b/lib/meson.build
-index ea1d92c..fb09b71 100644
---- a/lib/meson.build
-+++ b/lib/meson.build
-@@ -1,7 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0-or-later
- # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
- 
--libgpiod_both = both_libraries('gpiod',
-+libgpiod_lib = library('gpiod',
-   sources: [
-     'chip.c',
-     'chip-info.c',
-@@ -22,7 +22,6 @@ libgpiod_both = both_libraries('gpiod',
-   soversion: libgpiod_soversion,
-   install: true,
- )
--libgpiod_lib = libgpiod_both.get_shared_lib()
- 
- pkgconfig = import('pkgconfig')
- pkgconfig.generate(libgpiod_lib,
-diff --git a/meson.build b/meson.build
-index 7045d29..7633702 100644
---- a/meson.build
-+++ b/meson.build
-@@ -6,6 +6,7 @@ project('libgpiod', 'c',
-   license: 'LGPL-2.1-or-later',
-   default_options: [
-     'c_std=gnu89',
-+    'default_library=both',
-     'cpp_std=gnu++17',
-     'warning_level=2',
-   ],
--- 
-2.34.1
-
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 48f7c77855..baa8fe3cad 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
+sha256  dc48fb87cd72019745acb201599caf559556b5d913844df0ed011067d19e9a6b  libgpiod-2.3.2.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index d74c98684c..0372344fe4 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.3.1
+LIBGPIOD2_VERSION = 2.3.2
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
