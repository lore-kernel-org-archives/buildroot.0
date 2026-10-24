Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859E606A320
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MxHEF+aP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0109813EB;
	Sat, 24 Oct 2026 13:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbZC08qYCVFX; Sat, 24 Oct 2026 13:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5BEF80C1A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792848237;
	b=ZaQ8VmVsprByYjW5HBGhscSAQzQnhnUjnw9mUpW2c/CyCFX0SM5FxAB4BOymVyyCCtw0
	 Ki7NWtEpMhntMtnIk5R08P//JNtqnfx1xlIUJVkDmrn6Cy/igNjHfWmmSUnbFQ37WGVVq
	 el4mTh1c2Ce59Trz39tZE6sN89Iu5vJjwuduYwpXfr3ueuWrRsLdMxw6Q12G4cqGfwQd5
	 wEmrly4eU6je7vg6Wk/rLwse30Wi3+Gg5ABwJWmIdOQq8o6bVI/ENXaVK+1LYjLAGLnMJ
	 DlX5dYkhzKTolxajhKG1Nri447IipbPf903jbVUPWIouM9AzjejT+vvdPKk1unT4ciA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792848237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SFIorqZXf7YJ0sQDUw0o812u2LWlp6NvWWLDmHmEdWw=;
	b=EZJakEDTcEdghCxsfSQUEKIRNmH3JKkaiiEs+sUcTpXdPNY3Q5jFfNWC1MSyjZ26XDK+
	 1CYVUgoVDn1G5U4JxJFosFhCbrb+jk1jllWmGNyVm5HVhgjl1QSXehTviFMH4YRwvNfcG
	 1sVrtX852G9f9giJwj64aLq90RUaGMKtolgLrpiNvntdm3EGo37mEXbvvKjwqRXw+puxx
	 sJJTMKd6kxPNmVrx63zrUk4wQoiTGDLbZy9dNP3u+s5sRgMqh9hD97XOLf+9BvGbVx8hQ
	 wEHZ28MzxSeCKCYknWQfI2kfjecRAdCsDsjfd41zORRvbUx9XUJemgmON/uOZTBiaVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792848237;
	bh=SFIorqZXf7YJ0sQDUw0o812u2LWlp6NvWWLDmHmEdWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MxHEF+aPmjXRgMuNrC5efxoOyIsh6jmtT0sKY+bWLH8Vw089c+OMUvJ8SBkbg/4qs
	 2LJNJtQYTr3nJl99tIhtOtkNsISf5oLeQtDBOBHMLbiQ2Rm0nzda29bVPzSCwicJQW
	 ts8Yle9unuJMeKUYgL2dcRUqE1Qu1jSOHbaie8D23sxF4Np8h4l2G8PsoFduf6v/nE
	 RJAOtAKl7n5GwHypXNr9kWly9ASckw1CxTRaBXJD4ho8eaaRcBo5rPgSoukTwqKvDz
	 sHyCninf/QxER4E6T21o382xnrxzdvsv/yjA1xhmjtO+D2ts3pC3eWP+BtJgKkeFj/
	 PqHUo1ZaDDj5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5BEF80C1A;
	Sat, 24 Oct 2026 13:23:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 975E343
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E0F1406C6
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjQeAiHw7mYn for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:23:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 202BD4057C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792848234;
 b=G+x13RDYs7/SC+hrdPDdNkbkd9PRD1GZS0305kX4gYsMwF4PXjwm7I/7VK8x9Oevoow5
 8Tjyo4O2M4zhS4TsZ9P9X086Y97UME5Glk92Qh5qjiBRiQchImPsTf22TYXG2a63g3ZFa
 LF3udnw6SYUqTUafIR3+gizj9d5YKEKaUmzrWTka+PvDxE7uYX3J8nzDGhFmPNL8Ah5aT
 v/Cwlaq3Hz87Sw67gx6Sru48TehydnfZZ3zKjZBTmxdl/HUkqjP3ytjNYliZdaFjm/43h
 lF2vGroRbzqabCVsFfFxtAQeQVM6pbVaQmtjDut0tAcgtRsw3UMjuqF6pvtcmQCqbbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792848234;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=of/V5Aa1ScWSLuy9HPjMxJjBZXpGTdH43gsoFrk7rLY=;
 b=IWmuxC8ZttsWkB1DAzOD7JByQAD5BSKagXkiSSEdJXHQN8NkGZq5RC1D6dnKk4DS/KFk
 60e5ihfqQTTCu5yftXaux7+i6ouGR6P4puUQCWYiaipWP4raXODzPvQ7HbzzftbNVmba0
 s2WejHg+l4qFpLzmuL5Y8J/SafEYOwI7y00EZ4xyhuJ45NOefarxDxtb1mvD4x/tOaN4c
 anr6i1CJ7pnOJRE4s7O8nraxBU2bjqf7iySC/2QjC70QYP1UAdOLLkcqdOY+FCroD9AnY
 homkLio/AQZoCupKmH+nCS6OS7uJW1FrdPSv55HQ53UJ9fBPe9I/oRilWD8xn60Sdng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=eCp0ppQP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 202BD4057C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:23:53 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c2afa22e1dcso229505366b.1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 06:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792848231; x=1793453031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=of/V5Aa1ScWSLuy9HPjMxJjBZXpGTdH43gsoFrk7rLY=;
 b=akDteN7QqXInSXrTlVSwYKcz0s3dGwOAF5QyrJCRVNUFX+dCkAOo3u8uVB5ufo7AFC
 evixOI0fbMjDbkFs4XZ8IoRFoksJcK36BmAwdHVbAOCYNG2BvLsL9LX7wNmORZWJK2gI
 nv6M7LVSULy4AKL0OfULaXREXctuvlca2qtVUzkgSYyvfONxQFHb90YQ9ltLqShC6XSj
 lgeYEbDZHKqPY61opdb+4W21+GlHwCqG2tlEGf11eKe/ZIhEBBzPUFuB1uCWWTzqN5+Y
 IOjEvojzUU1MzaaWvkFRTb6E+dHB2b7OrsP4cL8+pb02VU0DOvLakt07xRxfkXB0lUai
 et3A==
X-Gm-Message-State: AFq9FYJkjywgQpxwz7vcFEj0Veeb9dXjvFtsRCdmBQq1OE/XA+nVwkcM
 oy+4d2l/Ee+kpp0YhdLhmaqkwW+ZXYQ5+NQfzOQmJ1m7eW0dS0UI39GmoOmKOQ==
X-Gm-Gg: AYBFou1FlIuPBJ8/UUsQCe0wH3blrlNN/WyKtw1NHrWjS3Igd5JWdTeJm8tl55wEhiR
 ZpWMXuUdRUACMIfqLDT7YT1lw7WqGQGeK5XYELZoHiCg3P45dBXUw5/loxWSBnWab+EVYHBK7Ng
 i2CV4UoNrSbP0aqTZqd5C/cpTOcxH+AloCPx1OH9vi9lDDL7qQQtlHzCWG0hPEa1VEKg79Lf64q
 ScGaaH/nUoPgXQSJZs2HnpcxyCE5Smx7R91Kiz5w3qO/MTGKQ9AtmsxXo4+imxsMR2y9D+kd0jk
 3v1wE2y1uQMDKO8qnjx9Z9TqrErznOztZBI79Koe/ZtNqkDu6jK211XrxplpDMQPBAUJd/Jakl1
 nxan87kYHfB/e02lPAeCnhvbuqGqeXywNxs6hlJeWLdRNECePAA7cD7nwNRciDio8tHQVAhTINc
 ovJECJLtPNZWRQFVbcjKiCZBqROUgpELSo/CIQnGOfA+NelioSy0FddF0qZxtly/xr/UKex5p5D
 CweSZn0opNSYsWQCwihOBR1LOANwfGTo/Gh2MIRVo4bQHIXqgPUG3QwrWAuEiJRyA8P7u4qggqh
 YnNhmdg1ZFFfOz3rWbaVeadpoQwl2CqkaC8=
X-Received: by 2002:a17:907:9412:b0:c40:a4f8:e036 with SMTP id
 a640c23a62f3a-c46bdfde8d6mr215645666b.43.1792848231400; 
 Sat, 24 Oct 2026 06:23:51 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd34f95csm92252166b.5.2026.10.24.06.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 06:23:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 15:23:50 +0200
Message-Id: <20261024132350.3708324-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgpiod2: fix static build
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libgpiod 2.3 switched to meson, and builds its libraries with
both_libraries(), so the shared library is always built, even with
-Ddefault_library=static. With BR2_STATIC_LIBS, linking it with -static
then fails, e.g. on ARC:

  FAILED: [code=1] lib/libgpiod.so.3.1.2
  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
  [...] BFD (GNU Binutils) 2.47.20260726 assertion fail elf32-arc.c:1815
  collect2: fatal error: ld terminated with signal 11 [Segmentation fault], core dumped

Add a patch, sent upstream, using library() instead, so that the
libraries follow default_library and only the static ones are built.
As a side effect, shared builds no longer install the unused static
libraries to staging.

This issue has been present since commit 1d132d04fc0e
("package/libgpiod2: bump to version 2.3.1"), which switched to the
meson build system. It therefore affects 2026.08 and later.

Fixes:
https://autobuild.buildroot.org/results/7dc84554b75a370136bfa2451f4b4c3dde0d92e8

Fixes: 1d132d04fc0ecac014be003b7e1662c47672328b ("package/libgpiod2: bump to version 2.3.1")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ult_library-for-the-installed-librar.patch | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch

diff --git a/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
new file mode 100644
index 0000000000..f369ee4248
--- /dev/null
+++ b/package/libgpiod2/0002-build-honor-default_library-for-the-installed-librar.patch
@@ -0,0 +1,138 @@
+From a92938c5d7bbb5a918937657a8940dc6072929ca Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 24 Oct 2026 10:28:49 +0200
+Subject: [PATCH] build: honor default_library for the installed
+ libraries
+
+The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
+libgpiodbus) are built with both_libraries(), so the shared variant is
+always built, even with -Ddefault_library=static. When the toolchain
+or the environment requests a fully static link (e.g. LDFLAGS=-static,
+as done by Buildroot for static-only builds), linking the shared
+library then fails:
+
+  FAILED: lib/libgpiod.so.3.1.2
+  [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
+
+Use library() instead, which follows default_library, and set
+default_library=both in the project's default options, so that a
+default build still installs both the shared and static libraries. As
+library() returns an object behaving like the shared library when both
+are built, the users of these objects (link_with, pkgconfig.generate,
+generate_gir, full_path) keep working as before.
+
+With a default build, the only change in the installed files is that
+libgpiotools, already declared with library(), is now also installed as
+a static library, like the other libraries.
+
+Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://lore.kernel.org/linux-gpio/20261024123124.3700266-1-yegorslists@googlemail.com/
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ bindings/cxx/meson.build  | 3 +--
+ bindings/glib/meson.build | 3 +--
+ dbus/lib/meson.build      | 3 +--
+ lib/meson.build           | 3 +--
+ meson.build               | 1 +
+ 5 files changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
+index 92625b5..a23c70a 100644
+--- a/bindings/cxx/meson.build
++++ b/bindings/cxx/meson.build
+@@ -3,7 +3,7 @@
+ 
+ cxx_inc = include_directories('.', '../../include')
+ 
+-libgpiodcxx_both = both_libraries('gpiodcxx',
++libgpiodcxx_lib = library('gpiodcxx',
+   sources: [
+     'chip.cpp',
+     'chip-info.cpp',
+@@ -29,7 +29,6 @@ libgpiodcxx_both = both_libraries('gpiodcxx',
+   soversion: libgpiodcxx_soversion,
+   install: true,
+ )
+-libgpiodcxx_lib = libgpiodcxx_both.get_shared_lib()
+ 
+ install_headers('gpiod.hpp')
+ 
+diff --git a/bindings/glib/meson.build b/bindings/glib/meson.build
+index 0ccd8e8..17e071c 100644
+--- a/bindings/glib/meson.build
++++ b/bindings/glib/meson.build
+@@ -61,7 +61,7 @@ glib_public_headers = files(
+ 
+ glib_inc = include_directories('.', '../../include')
+ 
+-libgpiod_glib_both = both_libraries('gpiod-glib',
++libgpiod_glib_lib = library('gpiod-glib',
+   sources: glib_sources + [gen_enum_c, gen_enum_h],
+   include_directories: glib_inc,
+   c_args: ['-DG_LOG_DOMAIN="gpiod-glib"', '-DGPIODGLIB_COMPILATION'] + profiling_c_args,
+@@ -71,7 +71,6 @@ libgpiod_glib_both = both_libraries('gpiod-glib',
+   soversion: libgpiod_glib_soversion,
+   install: true,
+ )
+-libgpiod_glib_lib = libgpiod_glib_both.get_shared_lib()
+ 
+ install_headers('gpiod-glib.h')
+ 
+diff --git a/dbus/lib/meson.build b/dbus/lib/meson.build
+index 9acf5e1..12cff4a 100644
+--- a/dbus/lib/meson.build
++++ b/dbus/lib/meson.build
+@@ -14,7 +14,7 @@ generated_dbus = gnome.gdbus_codegen('generated-gpiodbus',
+ 
+ dbus_lib_inc = include_directories('.', '../../include')
+ 
+-libgpiodbus_both = both_libraries('gpiodbus',
++libgpiodbus_lib = library('gpiodbus',
+   sources: ['gpiodbus.h', generated_dbus],
+   include_directories: dbus_lib_inc,
+   c_args: ['-DG_LOG_DOMAIN="gpiodbus"'],
+@@ -22,7 +22,6 @@ libgpiodbus_both = both_libraries('gpiodbus',
+   soversion: 1,
+   install: true,
+ )
+-libgpiodbus_lib = libgpiodbus_both.get_shared_lib()
+ 
+ install_data('io.gpiod1.xml',
+   install_dir: get_option('datadir') / 'dbus-1' / 'interfaces',
+diff --git a/lib/meson.build b/lib/meson.build
+index ea1d92c..fb09b71 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0-or-later
+ # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ 
+-libgpiod_both = both_libraries('gpiod',
++libgpiod_lib = library('gpiod',
+   sources: [
+     'chip.c',
+     'chip-info.c',
+@@ -22,7 +22,6 @@ libgpiod_both = both_libraries('gpiod',
+   soversion: libgpiod_soversion,
+   install: true,
+ )
+-libgpiod_lib = libgpiod_both.get_shared_lib()
+ 
+ pkgconfig = import('pkgconfig')
+ pkgconfig.generate(libgpiod_lib,
+diff --git a/meson.build b/meson.build
+index 7045d29..7633702 100644
+--- a/meson.build
++++ b/meson.build
+@@ -6,6 +6,7 @@ project('libgpiod', 'c',
+   license: 'LGPL-2.1-or-later',
+   default_options: [
+     'c_std=gnu89',
++    'default_library=both',
+     'cpp_std=gnu++17',
+     'warning_level=2',
+   ],
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
