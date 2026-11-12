Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6291D606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 07:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j+e8ZDBR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5AE18168D;
	Thu, 12 Nov 2026 07:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7odbhwXfBsi; Thu, 12 Nov 2026 07:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 845FC81673
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794468266;
	b=KDoYcMO5QJO3Nsf4IfXOIdDwU3ZzqznMR97Qf3nyjPT6F7fUdhi486gh3od7JIiMYevH
	 vzIlbdHh5/bRje32IAtk4YPGstTLgofGAcE4imfMZwFI1nKZsKym6iSIOeApmfo2FXb+i
	 rwzg5o0nAWshjF8wNpZ3biY5rHTATX4Tz/CS+M8Xu8G0HEH9OD2fEYyug3/UMc3inI63p
	 UHSkTELHLAkK7Bw6lhHfeS49j8TxQ3fWDVSI2f3+nHMLnJz4sy/Ba51C/D7tyD1Gc1KFZ
	 cWd83sP7sNhARQAxeIb+GMk9dcOtJVQGF7pjbleEC9VNKA+67k+78i4+O9aC1Uz2yUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794468266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7kLVD4mSc9xjdo03LpM4dp1i/mXbmXdSzI8gnjPonIM=;
	b=scYU6e2yq3apIhSsArCV1cFzW1rGPE5Cl03bXBBEzcEsOPrXLhPX3mqPz7pvtFG97bTp
	 Pm1z8g7OQsoh7U9akF9qKTmulXdFhgIy4qn4Fc1baFcjdXp8Pr0BQOn/6u4pkE5EmLK7v
	 wj4p/Tp75UEyMQzLJjsL5GG9Rua/Xf9PcHETIYrlngulK9bEjSaoXWXeYgAmyNOqcBhk3
	 W7Q8Cx4yBJ6/NxPPLGf3yzJt4C6LklF442qyIQqE8XNfFDHUKU0fa5LYk0ui0+6Zhs/x+
	 6mnap7WVCNticBpc/6H9Tppra0kbZQfKlcAmC/R5yz94YSqTylSMRxn2xFi+VG0yHpA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794468266;
	bh=7kLVD4mSc9xjdo03LpM4dp1i/mXbmXdSzI8gnjPonIM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=j+e8ZDBRd7dmeBuf2WKN6F2Lwz192kLwOL+XJ5c7diED66qPm5SjcLLbn+Dn0oC/v
	 GrVsLuJ4ogFJoMvDZ4DcDhUVOnj6fU40B1l+SXL1Nq/aLTQM2HyzUPqkjEDL8niFOu
	 VeLBGtmueayKMoexEQAlYVvBL848ThtRkPXGLg8lnkTrVUheOpUnND7SfjI0yv7WOg
	 WO5ByRlxu1WO5CUVfgu7wjZHcuBVBvVFM9DqNfHaV4PPUNtyyhNezJa84Ccb6UpyhA
	 pxbvLqP8erBS6hcKLR8hhNWHPb69r7uIXnr5nNHi2ezQRTq5IOLIRAmy0htDARC+Ml
	 w27/xYIcs7H7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 845FC81673;
	Thu, 12 Nov 2026 07:24:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E42E70B
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 07:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FCA840418
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 07:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-LVrm57GiPM for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 07:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 359BF400F3
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 359BF400F3
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 07:24:22 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c4cb6834eaaso635418766b.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 23:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794468261; x=1795073061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pjzdXkUNx0+fYm7Cvpgve0UXLpNGElHhHX2ZQ8N2odU=;
 b=yhkWztzOGArUlCC0jid2+TtuuDafdfE4FYjDv2I4MdDUnyrUJZWz0HpzK4LHvmOWtB
 9yiJkzl/qUWioBkURA8DDj+NUjwzJXBDaEnd/Gpao3fqtEycOI8iPjCO7nLUyZTBOKBP
 8opgvA6PbCvQsU8vHPxV6t3vDZUMUo+x+9xTytwWeDRsHeG97LGm9YrXXjE8w+7PHc/X
 aWnpC2UlU6IcX8HZEtXpVs7XaWFaRcxzYG9Cy5nPWsRia7wtFysFxkdjRz5qz4KzEzMU
 aGhh43WD2H0WekHese4pEUFlUc3pAFk5XQFwvXfc8mO+eia/5MTFOfFmzxof6JGVb5f2
 d4TQ==
X-Gm-Message-State: APuU4Z9RPVCICyaBiyZ8bs6Vy+SVhveQCeDEBAjuUlYYWsqRB/XTrUkt
 Rr4v9XdXy7gaPoULV2WbX7Eg3LPgtgCFte3nLPL6St9JbAJTiImCX9yc2tJ77g==
X-Gm-Gg: AYBFou3CdxUiv6Ri+igpBIgpbXM/kjGVje7ra0i5EVHPAo1UgUTEE4rF8OBTTK+zKdr
 2cHe4hTgLQx8PTpcLmNqhlh6ckL/m9Q0zkyGQ6SIWYVVzU7xZViXacd8a30dOK6czrUV/v3i6DB
 oIXk2FySAcdkF2KCQ2W54hdz/lYHEOhMATc4RSY0WWPpomUiuulrJKXVLCmaFEx57VagHvPubuM
 SRzXnxrpUbHUaUTNzsgM6r7ANCDfLO+BGMTIXLPSHqmFEEwS6ajnzj9hFLfQv0QtwsFFD0CMG4A
 mK5xRCTfzXvoZz4xxfhwSdJLzS02PflkZgK+gUUHgLlosWfKBuLFMoCaBl4NZAQ3mPagEn1xxJ2
 UYzTBJhVuvaWS4UdInBbYdZuPCwJxjxrGKFdxAoC6I3fXvhY/p8fYy3RJOujRCaZ/OE1bLCwP+t
 q8Z+vqWsYjDXoE9BW81rPBVfL0eluXip/onjJGokatzEkCs38xCND/Eqf78Eb+tcrKX6owhBArt
 j8MmPTfhTpgPzYRTgMTa9+d3iFV00DWDqxuDEZYzKeNQHMCvvj/SmavqT+uh3IkgS867rfcHrP+
 bxma9QN3P4mOfcznK35x7cFZDcG5x89KhcNWop7rvkMHpW05ZQq2AGjyiTB+EQBg83AWhidqQbB
 LAh/sZzVS
X-Received: by 2002:a17:907:944a:b0:c4d:5820:325e with SMTP id
 a640c23a62f3a-c5066aea0d7mr391022366b.13.1794468260962; 
 Wed, 11 Nov 2026 23:24:20 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a5704cfsm311435466b.15.2026.11.11.23.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 23:24:20 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 08:24:20 +0100
Message-Id: <20261112072420.2525558-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: fix static build with
 libpng or jpeg
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
Cc: Tim Soubry <tim.soubry@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With BR2_STATIC_LIBS=y, gdk-pixbuf is built with -Dbuiltin_loaders=all,
so the png and jpeg loaders end up in libgdk_pixbuf-2.0.a. Their
external dependencies are however only attached to the internal loader
libraries, not to the gdk-pixbuf dependency object used to link the
gdk-pixbuf-csource, gdk-pixbuf-pixdata and gdk-pixbuf-query-loaders
tools, so linking them fails:

ld: gdk-pixbuf/libgdk_pixbuf-2.0.a(io-png.c.o): in function `setup_png_transformations':
io-png.c:(.text+0x4c): undefined reference to `png_get_bit_depth'
ld: io-png.c:(.text+0xf4): undefined reference to `png_get_IHDR'

Backport upstream commit d1a187d41975 ("build: Include dependencies for
builtin loaders"), released in 2.43.4, which adds the builtin loaders'
dependencies to the gdk-pixbuf dependency object and links the tools
against it. It supersedes the local fixes proposed earlier in [1] and
[2], which were waiting for upstream feedback.

The relevant upstream build code is unchanged throughout 2.42.x, and
-Dbuiltin_loaders=all has been used since commit 7ecf22a2fe01
("package/gdk-pixbuf: fix static build") in 2021, so the failure could
not be traced to a single Buildroot commit. The autobuilders have hit
it since at least 2024, and all maintenance branches (2025.02.x,
2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x) ship the same
gdk-pixbuf 2.42.12 package and are affected.

[1] https://patchwork.buildroot.org/project/buildroot/patch/20240211154401.5516-1-fontaine.fabrice@gmail.com/
[2] https://patchwork.buildroot.org/project/buildroot/patch/20250711084708.1081039-1-tim.soubry@mind.be/

Fixes:
https://autobuild.buildroot.org/results/858f7a4943b52d2470a49c979ba3ce24282e1d56

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ude-dependencies-for-builtin-loaders.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/gdk-pixbuf/0001-build-Include-dependencies-for-builtin-loaders.patch

diff --git a/package/gdk-pixbuf/0001-build-Include-dependencies-for-builtin-loaders.patch b/package/gdk-pixbuf/0001-build-Include-dependencies-for-builtin-loaders.patch
new file mode 100644
index 0000000000..1d70f55f88
--- /dev/null
+++ b/package/gdk-pixbuf/0001-build-Include-dependencies-for-builtin-loaders.patch
@@ -0,0 +1,41 @@
+From d1a187d4197552751a86bc1a0d023ad66f591abc Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Thu, 14 Aug 2025 18:17:40 +0100
+Subject: [PATCH] build: Include dependencies for builtin loaders
+
+If we build gdk-pixbuf with builtin loaders, especially if we're doing a
+static build, we need to include the dependencies of each builtin loader
+into the global gdk-pixbuf dependency object, otherwise we won't be able
+to build binaries and tests.
+
+Upstream: https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/d1a187d4197552751a86bc1a0d023ad66f591abc
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ gdk-pixbuf/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
+index 10c1af7fb..db4f645fd 100644
+--- a/gdk-pixbuf/meson.build
++++ b/gdk-pixbuf/meson.build
+@@ -333,7 +333,7 @@ endif
+ gdkpixbuf_dep = declare_dependency(
+   link_with: gdkpixbuf,
+   include_directories: root_inc,
+-  dependencies: gdk_pixbuf_deps,
++  dependencies: [ gdk_pixbuf_deps, included_loaders_deps ],
+   sources: [ gdkpixbuf_enum_h, built_girs ],
+ )
+ meson.override_dependency('gdk-pixbuf-2.0', gdkpixbuf_dep)
+@@ -403,7 +403,7 @@ foreach bin: gdkpixbuf_bin
+ 
+   bin = executable(bin_name, bin_source,
+                    gdkpixbuf_enum_h,
+-                   dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ],
++                   dependencies: gdkpixbuf_dep,
+                    include_directories: [ root_inc, gdk_pixbuf_inc ],
+                    c_args: common_cflags + gdk_pixbuf_cflags,
+                    install: true)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
