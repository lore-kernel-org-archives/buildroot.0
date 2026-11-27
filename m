Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3BE606A31F
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pZZZWA0w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=j3UOPPGO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30BD740A42;
	Fri, 27 Nov 2026 12:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t86FTHHRRATh; Fri, 27 Nov 2026 12:39:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BD43640A57
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795783146;
	b=Urg8F4hH7cVTg8kW45zP5HJROosNeCtN59ytbfZUm6YtGcr4BpbQLCKZ2Gp1UihIAKLE
	 RzqbxCOLvrN6amoUlrjUjScmMZOMqg2y/bPzW0OBsup+a04S0SHKElHeETpwKG7E3267/
	 8VK+HiYr6cHfGgBNjokI3wf5OxRczu5V9kAdtFDVVZh2hKq76jNT+aQ8jWj8AGPEIRJGe
	 Ho522yFZuBdoDuQHYcuPCYOFB55QaaPz8pCZLdfFBd8bOQ82qpyhtATKVLZ0p++y1Fpf3
	 C3TX02gjPxC2KLcKSzxXjoz7IDRuQSvTapT4g8KCv8Bj3w0oBtQcexZcjZxoMQePJxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795783146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xHWTyiJbKUgLpAtamjJsQwoEo7YRYOxLfksEDpidgVY=;
	b=pzEECQieiZOIEqDEqg0IEgYNfjQl3W9xOotc4fLUCHSgH7wRMcD0Fwj5ValxhD7BLvme
	 L/hwewX/6EJRA5XtshF7W7RDzulIwuMXAcRLjbWW9123GHQ8vmaLUCvZkwhn0+HOHQLaD
	 K8iCAItmclrZ6LdGHrP+5m1QDEmMl9yIhZcOx1U6jTBkFH8CCnPJd1iWebTUYfjbQ6Hr+
	 +SrYyZkz+wcU0rxaYdKXB1cvcYQHwi0u5dSXCny3yfNTjAFiDH6BsRFk3JcjEvzsqdGSR
	 7FJVeSpA31j1vRPcbFCqvZ/89pezeAaE9/0lm+epMStU6uw7NOC4YZKKttGa5qJ+BWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795783146;
	bh=xHWTyiJbKUgLpAtamjJsQwoEo7YRYOxLfksEDpidgVY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZZZWA0wKeAZXu16WsVY+h8mYulIY4XF9CdHmLQEsFfUMTWwLy+bNrRLirnDWi8kF
	 tSiDzyLBm67HzxE8Va5WezrnsZJFiLv2fzCFPgSwoq/R9t9Q5EheUN/Og4UNQCHfcu
	 +Cr7ieJmJnHX2s2Ovxt5oDQ73xywUGa1zQOFDBMmWZbigW18kOgbb/0gKY0aIY09pL
	 iyviuB9IAuvV65j/GY/H+rE0zSJlpjzFMl0H5caqFaBCyTxPyrD6MnR6/WkRMI7wcu
	 hsYOk4PmrDTICgW4OX2Hq41VH9MRsYpfGGeFa2EydlqpxuE4LRe8MPhXiX2D7E34vD
	 wFDD6Rbj36qvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD43640A57;
	Fri, 27 Nov 2026 12:39:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A91D1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 334704004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHTVlRKOBiOc for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 12:38:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1C997401D2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=j3UOPPGO
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C997401D2
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:54 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id WvE3xMYVxV5J9WvE4xjmcr; Fri, 27 Nov 2026 13:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795783132; bh=kxzaIZ2KYaGDQYxDyiv/CxBWQcrFXVkzCPxe2WTQXvg=;
 h=From:To:Subject:Date:MIME-Version;
 b=j3UOPPGOS/VHN4kbUOddquGymvffwiRTK9VobeA+JY1XH4gRAV8YwaM8bgbLkZvLY
 QKEY9LXHQ0xnc3fPWuy5IM0Nje4oLNZuXUmrQnq8ZaheVr8UYtqxc2ojDqqjtvmWqs
 6CaiG26ivNtAfepou1na5r4vAHtLyPqQEp8LvyF13SxcJ1Teg4rsps4yK7TIXT4rnG
 ynRts/oYscRbalyY15z7MPG8LeW4bndlTxFO++mw+/9YYUMVAQPuWxytEoICX6IxSy
 D526Jlx0TLEt31VEsPaP5SCwfWyKFLeN5qczv+uzhDgQWQg6gYjlEGUaJM7eGxqY6y
 9tmEthQvp4c6Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jim Reinhart <jimr@tekvox.com>, James Autry <jautry@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Date: Fri, 27 Nov 2026 13:38:50 +0100
Message-ID: <20261127123851.2402756-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127123851.2402756-1-giulio.benetti@benettiengineering.com>
References: <20261127123851.2402756-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEaoEdNhIYao+QtkVetUB6eEZgjoXCDcBx+fkFMv6b6dnoKqemn8xDMIbtiMhRSzIvRintO8xonllswkE68RxjpipXiHd1neu98wEJTZhnKVn0KYU3sf
 DLx/VdM9eOgmYSI6e8rcchqusoL3t3/DKwKWlSSRsO2q3E7yVmxEHIggYBDLQJLhFwqi7HeQHyGHoHOzmb+sq1FIpJhU2K5RHrNaEQSmRP1NyzzSr4mGYwlD
 0xmDXLJjXEhGn84AypUV3JGn3zbVfpaaXmUoi1h7Pu4P9QbChFNNOMf2Grx/5DOyCZojsvcycjsgVX+IVKBLYHy4LA5HtA8U4XRjAwtxsRXAqSC94JbYPaDI
 IahDN8ijk/VQljZXBisMMzlXPrQC4JY+Hcyrg4ZUaw+Wx6iSN8KfS8lLp8zJ0qDwIPTw5OV2Lr4+nuzWIVkthBC3UESAtXuWI7+mMhV8V63V72K0g1HHhb15
 XC3HjW+QfhIXiVCr
Subject: [Buildroot] [PATCH v5 3/4] package/dotnet-runtime-src: new package
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a dotnet-runtime provider that builds the .NET runtime from source,
for the same 11.0.x version and architectures as dotnet-runtime-bin.
Since there are now two providers, a variant choice between the
pre-built runtime and the one built from source is added to the
dotnet-runtime package.

The native parts of the runtime are built with CMake, without the
build.sh and MSBuild scripts of dotnet/runtime, that download a .NET
SDK and NuGet packages:
- src/coreclr: CoreCLR, the JIT, the GC, createdump and the debugging
  libraries
- src/native/libs: the System.*.Native libraries
- src/native/corehost: the dotnet host, hostfxr and hostpolicy

These are three separate CMake projects in the same source tree, so they
are configured and built with the Buildroot toolchain file from a
generic-package, each in its own build directory:
- the binutils are looked up from the compiler target tuple, that the
  Buildroot toolchain file doesn't set, so they are passed with the
  CLR_<TOOL> environment variables
- eng/native/tryrun.cmake provides the results of the checks that can't
  be run when cross-compiling
- the version files, normally generated with MSBuild, are generated
  like build.sh does when MSBuild is not available, but with the real
  version, that the hosts report and use
- CLR_ARM_FPU_TYPE and CLR_ARM_FPU_CAPABILITY are set from the FPU
  selected in Buildroot
- -Wno-template-body is needed with gcc >= 14, that otherwise rejects
  some unused template code

The managed libraries are C# code, that can only be built with MSBuild
and a .NET SDK. They are architecture independent and built from the
same sources, so they are taken from the official runtime tarball of
the same version, downloaded with _EXTRA_DOWNLOADS. Each native binary
of the tarball is replaced by the one built from source, and the
installation fails if one of them was not built, so that the same set
of files as the official runtime is installed.

The System.*.Native libraries are linked against OpenSSL, the tracing
provider against lttng-libust, and ICU and libkrb5 are needed to build
them, and are loaded at runtime. So the
ICU, OpenSSL and Kerberos options of the dotnet-runtime package are
selected, and host gcc >= 7 is needed, like for icu.

Patch 0001 fixes building the ARM assembly with GNU as. Patch 0002
computes the addresses of the variables used by the ARM assembly
relative to the PC, like with clang, so that libcoreclr.so has no text
relocations, that the musl toolchains don't allow.

CMake >= 3.26 is needed, and two more CMake options:
- FEATURE_DYNAMIC_CODE_COMPILED, that the MSBuild scripts set by
  default, and without which tiered compilation, ReJIT and PGO are
  disabled (and the ARM thunk templates don't build)
- the WHOLE_ARCHIVE link feature, used for the static apphost, which
  CMake only defines when it identifies the linker from the "gcc -v"
  output, which fails with toolchains that only show collect2 there

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
Changes since the dotnet6-runtime RFC (addressing Arnout's review):
- rename dotnet6-runtime to dotnet-runtime-src, as a provider of the
  dotnet-runtime virtual package, next to dotnet-runtime-bin, and add
  the variant choice to dotnet-runtime
- build the native parts with CMake instead of build.sh, take the
  managed libraries from the official runtime tarball: no .NET SDK or
  NuGet packages are downloaded anymore, so an x86_64 host is not
  needed, and x86_64 targets are also supported
- support 11.0.0, like dotnet-runtime-bin, drop 6.0
- drop patches 0001 and 0002, upstream since 9.0, and patches 0003
  (-skipcrossarchnative) and 0004 (--verbosity), only needed with
  build.sh, add a GNU as fix, merged upstream in main:
  https://github.com/dotnet/runtime/pull/138021
  and a fix for the text relocations of the ARM assembly with GNU as,
  both submitted for release/11.0:
  https://github.com/dotnet/runtime/pull/138374
- drop the redundant threads dependency (glibc and musl always have
  threads), the dependencies are now in the dotnet-runtime package
- no static linking is done, so !BR2_STATIC_LIBS is enough
- drop the select of host-cmake, use $(BR2_CMAKE_HOST_DEPENDENCY) and
  BR2_HOST_CMAKE_AT_LEAST_3_26
- force libopenssl, since the build with libressl has not been tested
- select the ICU, OpenSSL and Kerberos options of dotnet-runtime
  instead of icu, libkrb5 and openssl, and depend on host gcc >= 7
- one dependency per line
- use BR2_ENABLE_RUNTIME_DEBUG, through the Buildroot toolchain file
- also handle NEON and ARMv8 FPUs, and require ARMv7-A and the
  hard-float ABI on ARM
- drop libcurl, not used since .NET 5
- drop /etc/dotnet/install_location and the profile.d script, add a
  /usr/bin/dotnet symlink
- add THIRD-PARTY-NOTICES.TXT to the license files
---
 DEVELOPERS                                    |   1 +
 ...ix-WriteBarriers.S-build-with-GNU-as.patch |  52 +++++
 ...m-Avoid-text-relocations-with-GNU-as.patch |  70 ++++++
 .../dotnet-runtime-src.hash                   |  11 +
 .../dotnet-runtime-src/dotnet-runtime-src.mk  | 204 ++++++++++++++++++
 package/dotnet-runtime/Config.in              |  39 +++-
 6 files changed, 373 insertions(+), 4 deletions(-)
 create mode 100644 package/dotnet-runtime-src/0001-CoreCLR-runtime-arm-Fix-WriteBarriers.S-build-with-GNU-as.patch
 create mode 100644 package/dotnet-runtime-src/0002-CoreCLR-vm-arm-Avoid-text-relocations-with-GNU-as.patch
 create mode 100644 package/dotnet-runtime-src/dotnet-runtime-src.hash
 create mode 100644 package/dotnet-runtime-src/dotnet-runtime-src.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 74fcb6482f..e838b2172a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1332,6 +1332,7 @@ F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/dash/
 F:	package/dotnet-runtime-bin/
+F:	package/dotnet-runtime-src/
 F:	package/dotnet-runtime/
 F:	package/erlang-jiffy/
 F:	package/esp-hosted/
diff --git a/package/dotnet-runtime-src/0001-CoreCLR-runtime-arm-Fix-WriteBarriers.S-build-with-GNU-as.patch b/package/dotnet-runtime-src/0001-CoreCLR-runtime-arm-Fix-WriteBarriers.S-build-with-GNU-as.patch
new file mode 100644
index 0000000000..811655dbbc
--- /dev/null
+++ b/package/dotnet-runtime-src/0001-CoreCLR-runtime-arm-Fix-WriteBarriers.S-build-with-GNU-as.patch
@@ -0,0 +1,52 @@
+From 6e8557db27c0d1af8f2547a16f7cda68c75046c7 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 26 Nov 2026 16:57:47 +0100
+Subject: [PATCH] CoreCLR: runtime: arm: Fix WriteBarriers.S build with GNU
+ as (#138021)
+
+GNU as doesn't concatenate a quoted string with a following macro
+argument, so it sees "RhpAssignRefAvLocation"\EXPORT_REG_NAME as two
+arguments to GLOBAL_LABEL and fails with:
+
+src/coreclr/runtime/arm/WriteBarriers.S:123: Error: too many positional
+arguments
+
+The label names don't need to be quoted, and the LEAF_ENTRY names in the
+same macros are already unquoted: drop the quotes. clang generates the
+same RhpAssignRefAvLocation<reg> and RhpCheckedAssignRefAvLocation<reg>
+symbols with both forms.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Co-authored-by: Claude Opus 5.5 <noreply@anthropic.com>
+(cherry picked from commit f3075b382cd458205fe6066539084c9b1f17f190)
+Upstream: https://github.com/dotnet/runtime/commit/f3075b382cd458205fe6066539084c9b1f17f190
+Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
+---
+ src/coreclr/runtime/arm/WriteBarriers.S | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/coreclr/runtime/arm/WriteBarriers.S b/src/coreclr/runtime/arm/WriteBarriers.S
+index ee906187b99..b202a3296dc 100644
+--- a/src/coreclr/runtime/arm/WriteBarriers.S
++++ b/src/coreclr/runtime/arm/WriteBarriers.S
+@@ -120,7 +120,7 @@ ALTERNATE_ENTRY RhpAssignRef
+ 
+           // Write the reference into the location. Note that we rely on the fact that no GC can occur between here
+           // and the card table update we may perform below.
+-GLOBAL_LABEL "RhpAssignRefAvLocation"\EXPORT_REG_NAME  // WriteBarrierFunctionAvLocation
++GLOBAL_LABEL RhpAssignRefAvLocation\EXPORT_REG_NAME  // WriteBarrierFunctionAvLocation
+ .ifc \REFREG, r1
+ GLOBAL_LABEL RhpAssignRefAVLocation
+ .endif
+@@ -190,7 +190,7 @@ ALTERNATE_ENTRY RhpCheckedAssignRef
+           dmb
+           // Write the reference into the location. Note that we rely on the fact that no GC can occur between here
+           // and the card table update we may perform below.
+-GLOBAL_LABEL "RhpCheckedAssignRefAvLocation"\EXPORT_REG_NAME // WriteBarrierFunctionAvLocation
++GLOBAL_LABEL RhpCheckedAssignRefAvLocation\EXPORT_REG_NAME // WriteBarrierFunctionAvLocation
+ .ifc \REFREG, r1
+ GLOBAL_LABEL RhpCheckedAssignRefAVLocation
+ .endif
+-- 
+2.47.3
+
diff --git a/package/dotnet-runtime-src/0002-CoreCLR-vm-arm-Avoid-text-relocations-with-GNU-as.patch b/package/dotnet-runtime-src/0002-CoreCLR-vm-arm-Avoid-text-relocations-with-GNU-as.patch
new file mode 100644
index 0000000000..fb1bd95705
--- /dev/null
+++ b/package/dotnet-runtime-src/0002-CoreCLR-vm-arm-Avoid-text-relocations-with-GNU-as.patch
@@ -0,0 +1,70 @@
+From 412cef445ace759b034d44a811a061fce4a8a305 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 26 Nov 2026 17:01:09 +0100
+Subject: [PATCH] CoreCLR: vm: arm: Avoid text relocations with GNU as
+
+With GNU as, the addresses of g_TrapReturningThreads and g_pPollGC are
+loaded from literal pools, as absolute addresses. In libcoreclr.so,
+these literals in .text need dynamic relocations, so the library gets
+DT_TEXTREL, and fails to link when text relocations are an error, like
+with musl toolchains:
+
+  ld: read-only segment has dynamic relocations
+
+Compute the addresses relative to the PC with movw/movt instead, like
+the clang code path does with its literal pool, so that the linker
+resolves them and no dynamic relocations are needed.
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Upstream: https://github.com/dotnet/runtime/pull/138374
+Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
+---
+ src/coreclr/vm/arm/asmhelpers.S   | 8 ++++++--
+ src/coreclr/vm/arm/pinvokestubs.S | 4 +++-
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/coreclr/vm/arm/asmhelpers.S b/src/coreclr/vm/arm/asmhelpers.S
+index d09438bf62d..275858a0bff 100644
+--- a/src/coreclr/vm/arm/asmhelpers.S
++++ b/src/coreclr/vm/arm/asmhelpers.S
+@@ -832,7 +832,9 @@ ProbeLoop:
+ 1:
+         add     r2, pc
+ #else
+-        ldr     r2, =g_TrapReturningThreads
++        movw    r2, #:lower16:g_TrapReturningThreads - (. + 12)
++        movt    r2, #:upper16:g_TrapReturningThreads - (. + 8)
++        add     r2, pc
+ #endif
+         ldr     r2, [r2]
+         cbnz    r2, LOCAL_LABEL(JIT_PollGCRarePath)
+@@ -843,7 +845,9 @@ LOCAL_LABEL(JIT_PollGCRarePath):
+ 1:
+         add     r2, pc
+ #else
+-        ldr     r2, =g_pPollGC
++        movw    r2, #:lower16:g_pPollGC - (. + 12)
++        movt    r2, #:upper16:g_pPollGC - (. + 8)
++        add     r2, pc
+ #endif
+         ldr     r2, [r2]
+         EPILOG_BRANCH_REG r2
+diff --git a/src/coreclr/vm/arm/pinvokestubs.S b/src/coreclr/vm/arm/pinvokestubs.S
+index b102ae12d79..c3cafd48c74 100644
+--- a/src/coreclr/vm/arm/pinvokestubs.S
++++ b/src/coreclr/vm/arm/pinvokestubs.S
+@@ -138,7 +138,9 @@
+ 1:
+         add     r2, pc
+ #else
+-        ldr     r2, =g_TrapReturningThreads
++        movw    r2, #:lower16:g_TrapReturningThreads - (. + 12)
++        movt    r2, #:upper16:g_TrapReturningThreads - (. + 8)
++        add     r2, pc
+ #endif
+         ldr     r2, [r2]
+         cbnz    r2, LOCAL_LABEL(RarePath)
+-- 
+2.47.3
+
diff --git a/package/dotnet-runtime-src/dotnet-runtime-src.hash b/package/dotnet-runtime-src/dotnet-runtime-src.hash
new file mode 100644
index 0000000000..ec5d4ff417
--- /dev/null
+++ b/package/dotnet-runtime-src/dotnet-runtime-src.hash
@@ -0,0 +1,11 @@
+# From https://builds.dotnet.microsoft.com/dotnet/release-metadata/11.0/releases.json
+sha512  4857a8f2c4ec2f21381916923b2c6a0e94d69ad0380abff9a53f7f99a80b52a00b2a2438c86500b27551047233b1d416ada85ead25b9637c80e9b822274008ee  dotnet-runtime-11.0.0-linux-arm.tar.gz
+sha512  b624e647c72e8f62a0d186aa96aad1b113732e8c39f010be6f95ec026feb2633187e33f24c3af5168daaa1d9b4bb0bb9c396f6d172d18660b9673bb507fa9f45  dotnet-runtime-11.0.0-linux-arm64.tar.gz
+sha512  dbca05e02a6c206c93d02fe7acb6ca9f8025aacca3d17b1383f25dc18b7a3c09cc2c2105d0be92b6a11273a5bb370ff6d56caeca5de0805d12a251f4a44895ca  dotnet-runtime-11.0.0-linux-musl-arm.tar.gz
+sha512  7b32d53ee1c98078f71e73b510332aeca7a70b974f38d93201857ba8b8870e0d175f1d206b15cde03fd145e130bcf86e7c5749e67efec20ff62de0132119f7e3  dotnet-runtime-11.0.0-linux-musl-arm64.tar.gz
+sha512  85e1d28610719a44119ff706bb09f17487380a47d6d0400adad72888ba2cef55e80e2566d15b2812af442ecde469d05d272e15ded04d515f628b40a5345c7854  dotnet-runtime-11.0.0-linux-musl-x64.tar.gz
+sha512  d0846e7ad4a6b07fe3fb7c033a381e6938ec16afbe0b7f7454ff2f9b58247cbbc35758cc785af424385c4572c801060cbd656a822ef624f4907d3cc10a16a080  dotnet-runtime-11.0.0-linux-x64.tar.gz
+# Locally calculated
+sha256  71fd13a699c3e440ec99cfeccdc406a4dc44fd3f93c78b46bde4755fd7945f0d  dotnet-runtime-src-11.0.0.tar.gz
+sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.TXT
+sha256  4790bb15f0edd1b105aecb05174fc6c589d4d9fad0c50616ef5f7dc365f1c8a6  THIRD-PARTY-NOTICES.TXT
diff --git a/package/dotnet-runtime-src/dotnet-runtime-src.mk b/package/dotnet-runtime-src/dotnet-runtime-src.mk
new file mode 100644
index 0000000000..76179bcd2b
--- /dev/null
+++ b/package/dotnet-runtime-src/dotnet-runtime-src.mk
@@ -0,0 +1,204 @@
+################################################################################
+#
+# dotnet-runtime-src
+#
+################################################################################
+
+DOTNET_RUNTIME_SRC_VERSION = 11.0.0
+DOTNET_RUNTIME_SRC_SITE = $(call github,dotnet,runtime,v$(DOTNET_RUNTIME_SRC_VERSION))
+DOTNET_RUNTIME_SRC_LICENSE = MIT
+DOTNET_RUNTIME_SRC_LICENSE_FILES = LICENSE.TXT THIRD-PARTY-NOTICES.TXT
+DOTNET_RUNTIME_SRC_PROVIDES = dotnet-runtime
+DOTNET_RUNTIME_SRC_DEPENDENCIES = \
+	$(BR2_CMAKE_HOST_DEPENDENCY) \
+	host-python3 \
+	icu \
+	libkrb5 \
+	lttng-libust \
+	openssl
+
+# The OS part of the RID, that the hosts also report and use as their
+# own RID (the fallback OS), like the dotnet/runtime build scripts do.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+DOTNET_RUNTIME_SRC_OS = linux-musl
+else
+DOTNET_RUNTIME_SRC_OS = linux
+endif
+
+ifeq ($(BR2_aarch64),y)
+DOTNET_RUNTIME_SRC_ARCH = arm64
+else ifeq ($(BR2_arm),y)
+DOTNET_RUNTIME_SRC_ARCH = arm
+else ifeq ($(BR2_x86_64),y)
+DOTNET_RUNTIME_SRC_ARCH = x64
+endif
+
+DOTNET_RUNTIME_SRC_RID = $(DOTNET_RUNTIME_SRC_OS)-$(DOTNET_RUNTIME_SRC_ARCH)
+
+# Only the native parts of the runtime (CoreCLR, the native libraries
+# and the hosts) are built from source, with CMake. The managed
+# libraries are built from C# with MSBuild, which needs a .NET SDK, so
+# they are taken from the official runtime tarball: they are
+# architecture independent, and built from the same sources.
+DOTNET_RUNTIME_SRC_MANAGED_SOURCE = \
+	dotnet-runtime-$(DOTNET_RUNTIME_SRC_VERSION)-$(DOTNET_RUNTIME_SRC_RID).tar.gz
+DOTNET_RUNTIME_SRC_EXTRA_DOWNLOADS = \
+	https://builds.dotnet.microsoft.com/dotnet/Runtime/$(DOTNET_RUNTIME_SRC_VERSION)/$(DOTNET_RUNTIME_SRC_MANAGED_SOURCE)
+
+# The tools are looked up from the compiler target tuple, that the
+# Buildroot toolchain file doesn't set. tryrun.cmake provides the
+# results of the checks that can't be run when cross-compiling.
+DOTNET_RUNTIME_SRC_CMAKE_ENV = \
+	PATH=$(BR_PATH) \
+	CLR_AR="$(TARGET_AR)" \
+	CLR_NM="$(TARGET_NM)" \
+	CLR_RANLIB="$(TARGET_RANLIB)" \
+	CLR_STRINGS="$(TARGET_CROSS)strings" \
+	CLR_OBJDUMP="$(TARGET_OBJDUMP)" \
+	CLR_READELF="$(TARGET_READELF)" \
+	CLR_OBJCOPY="$(TARGET_OBJCOPY)" \
+	TARGET_BUILD_ARCH=$(DOTNET_RUNTIME_SRC_ARCH) \
+	ROOTFS_DIR=$(STAGING_DIR)
+
+DOTNET_RUNTIME_SRC_CMAKE_OPTS = \
+	-C $(@D)/eng/native/tryrun.cmake \
+	-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
+	-DCMAKE_COLOR_MAKEFILE=OFF \
+	-DCLR_CMAKE_PGO_INSTRUMENT=0 \
+	-DCLR_CMAKE_PGO_OPTIMIZE=0 \
+	-DFEATURE_DISTRO_AGNOSTIC_SSL=0 \
+	-DCLI_CMAKE_PKG_RID=$(DOTNET_RUNTIME_SRC_RID) \
+	-DCLI_CMAKE_FALLBACK_OS=$(DOTNET_RUNTIME_SRC_OS) \
+	-DCLI_CMAKE_COMMIT_HASH=N/A
+
+ifeq ($(BR2_arm),y)
+# CLR_ARM_FPU_CAPABILITY is 0x7 with 32 double-precision registers,
+# 0x3 with only 16 of them.
+ifeq ($(BR2_ARM_FPU_VFPV3D16)$(BR2_ARM_FPU_VFPV4D16),y)
+DOTNET_RUNTIME_SRC_CMAKE_OPTS += -DCLR_ARM_FPU_CAPABILITY=0x3
+else
+DOTNET_RUNTIME_SRC_CMAKE_OPTS += -DCLR_ARM_FPU_CAPABILITY=0x7
+endif
+DOTNET_RUNTIME_SRC_CMAKE_OPTS += \
+	-DCLR_ARM_FPU_TYPE=$(call qstrip,$(BR2_GCC_TARGET_FPU))
+endif
+
+# Options that build.sh and the MSBuild scripts normally set:
+# - the JIT related features (tiered compilation, ReJIT, PGO) are only
+#   enabled with FEATURE_DYNAMIC_CODE_COMPILED, that the MSBuild scripts
+#   set by default
+# - the static apphost is linked with $<LINK_LIBRARY:WHOLE_ARCHIVE>.
+#   CMake only defines WHOLE_ARCHIVE when it can identify the linker,
+#   which it can't do from the "gcc -v" output of all the toolchains
+#   (only collect2 is shown), so define it like
+#   eng/native/configurecompiler.cmake does for Haiku.
+DOTNET_RUNTIME_SRC_CMAKE_OPTS += \
+	-DFEATURE_DYNAMIC_CODE_COMPILED=1 \
+	-DCMAKE_LINK_LIBRARY_USING_WHOLE_ARCHIVE="LINKER:--push-state,--whole-archive;<LINK_ITEM>;LINKER:--pop-state" \
+	-DCMAKE_LINK_LIBRARY_USING_WHOLE_ARCHIVE_SUPPORTED=TRUE \
+	-DCMAKE_LINK_LIBRARY_WHOLE_ARCHIVE_ATTRIBUTES="LIBRARY_TYPE=STATIC;DEDUPLICATION=YES;OVERRIDE=DEFAULT"
+
+# Some unused template code doesn't build with gcc >= 14
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
+DOTNET_RUNTIME_SRC_CMAKE_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -Wno-template-body"
+endif
+
+# The version files are normally generated with MSBuild. Generate them
+# like build.sh does when MSBuild is not available, but with the real
+# version, that the hosts report and use.
+DOTNET_RUNTIME_SRC_VERSION_LIST = $(subst ., ,$(DOTNET_RUNTIME_SRC_VERSION))
+DOTNET_RUNTIME_SRC_VERSION_MAJOR = $(word 1,$(DOTNET_RUNTIME_SRC_VERSION_LIST))
+DOTNET_RUNTIME_SRC_VERSION_MINOR = $(word 2,$(DOTNET_RUNTIME_SRC_VERSION_LIST))
+DOTNET_RUNTIME_SRC_VERSION_PATCH = $(word 3,$(DOTNET_RUNTIME_SRC_VERSION_LIST))
+
+# $(1): runtime_version.h path
+define DOTNET_RUNTIME_SRC_RUNTIME_VERSION_H
+	printf '#define %s %s\n' \
+		RuntimeAssemblyMajorVersion $(DOTNET_RUNTIME_SRC_VERSION_MAJOR) \
+		RuntimeAssemblyMinorVersion $(DOTNET_RUNTIME_SRC_VERSION_MINOR) \
+		RuntimeFileMajorVersion $(DOTNET_RUNTIME_SRC_VERSION_MAJOR) \
+		RuntimeFileMinorVersion $(DOTNET_RUNTIME_SRC_VERSION_MINOR) \
+		RuntimeFileBuildVersion $(DOTNET_RUNTIME_SRC_VERSION_PATCH) \
+		RuntimeFileRevisionVersion 0 \
+		RuntimeProductMajorVersion $(DOTNET_RUNTIME_SRC_VERSION_MAJOR) \
+		RuntimeProductMinorVersion $(DOTNET_RUNTIME_SRC_VERSION_MINOR) \
+		RuntimeProductPatchVersion $(DOTNET_RUNTIME_SRC_VERSION_PATCH) \
+		RuntimeProductVersion $(DOTNET_RUNTIME_SRC_VERSION) \
+		> $(1)
+endef
+
+define DOTNET_RUNTIME_SRC_VERSION_FILES
+	mkdir -p $(@D)/artifacts/obj
+	cd $(@D) && $(SHELL) ./eng/native/version/copy_version_files.sh
+	$(call DOTNET_RUNTIME_SRC_RUNTIME_VERSION_H,$(@D)/artifacts/obj/runtime_version.h)
+endef
+DOTNET_RUNTIME_SRC_PRE_CONFIGURE_HOOKS += DOTNET_RUNTIME_SRC_VERSION_FILES
+
+# $(1): component name, $(2): CMake source directory
+define DOTNET_RUNTIME_SRC_CMAKE_CONFIGURE
+	mkdir -p $(@D)/buildroot-build/$(1)
+	cd $(@D)/buildroot-build/$(1) && rm -f CMakeCache.txt && \
+		$(DOTNET_RUNTIME_SRC_CMAKE_ENV) $(BR2_CMAKE) $(@D)/$(2) \
+		$(DOTNET_RUNTIME_SRC_CMAKE_OPTS) \
+		-DCMAKE_INSTALL_PREFIX=$(@D)/buildroot-install/$(1)
+endef
+
+define DOTNET_RUNTIME_SRC_CONFIGURE_CMDS
+	$(call DOTNET_RUNTIME_SRC_CMAKE_CONFIGURE,coreclr,src/coreclr)
+	$(call DOTNET_RUNTIME_SRC_CMAKE_CONFIGURE,libs,src/native/libs)
+	$(call DOTNET_RUNTIME_SRC_CMAKE_CONFIGURE,corehost,src/native/corehost)
+endef
+
+# $(1): component name, $(2): CMake targets
+define DOTNET_RUNTIME_SRC_CMAKE_BUILD
+	$(DOTNET_RUNTIME_SRC_CMAKE_ENV) $(BR2_CMAKE) \
+		--build $(@D)/buildroot-build/$(1) -j$(PARALLEL_JOBS) \
+		$(if $(2),--target $(2))
+endef
+
+# $(1): component name, $(2): CMake install components
+define DOTNET_RUNTIME_SRC_CMAKE_INSTALL
+	$(if $(2),$(foreach c,$(2),\
+		$(BR2_CMAKE) --install $(@D)/buildroot-build/$(1) --component $(c)$(sep)),\
+		$(BR2_CMAKE) --install $(@D)/buildroot-build/$(1))
+endef
+
+define DOTNET_RUNTIME_SRC_BUILD_CMDS
+	$(call DOTNET_RUNTIME_SRC_CMAKE_BUILD,coreclr,runtime)
+	$(call DOTNET_RUNTIME_SRC_CMAKE_INSTALL,coreclr,jit runtime debug)
+	$(call DOTNET_RUNTIME_SRC_CMAKE_BUILD,libs)
+	$(call DOTNET_RUNTIME_SRC_CMAKE_INSTALL,libs)
+	$(call DOTNET_RUNTIME_SRC_CMAKE_BUILD,corehost)
+	$(call DOTNET_RUNTIME_SRC_CMAKE_INSTALL,corehost)
+endef
+
+DOTNET_RUNTIME_SRC_INSTALL_DIRS = \
+	$(@D)/buildroot-install/coreclr/sharedFramework \
+	$(@D)/buildroot-install/libs \
+	$(@D)/buildroot-install/corehost/corehost
+
+# /usr/share/dotnet is the default install location, where both the
+# dotnet host and the application hosts find the runtime. Only the
+# managed libraries and the metadata files are kept from the official
+# runtime tarball: each of its native binaries is replaced by the one
+# built from source, so that the same set of files is installed.
+define DOTNET_RUNTIME_SRC_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/dotnet $(TARGET_DIR)/usr/bin
+	$(call suitable-extractor,$(DOTNET_RUNTIME_SRC_MANAGED_SOURCE)) \
+		$(DOTNET_RUNTIME_SRC_DL_DIR)/$(DOTNET_RUNTIME_SRC_MANAGED_SOURCE) | \
+		$(TAR) -C $(TARGET_DIR)/usr/share/dotnet $(TAR_OPTIONS) - \
+		./dotnet ./host ./shared
+	cd $(TARGET_DIR)/usr/share/dotnet && \
+	for f in dotnet $$(find host shared -type f \
+		\( -name '*.so' -o -name createdump \)); do \
+		src=$$(for d in $(DOTNET_RUNTIME_SRC_INSTALL_DIRS); do \
+			ls $$d/$${f##*/} 2>/dev/null; done | head -n 1); \
+		if [ -z "$$src" ]; then \
+			echo "$${f} was not built" >&2; exit 1; \
+		fi; \
+		$(INSTALL) -m 0755 $$src $$f || exit 1; \
+	done
+	ln -sf ../share/dotnet/dotnet $(TARGET_DIR)/usr/bin/dotnet
+endef
+
+$(eval $(generic-package))
diff --git a/package/dotnet-runtime/Config.in b/package/dotnet-runtime/Config.in
index c79c47f5c4..44c6e4308b 100644
--- a/package/dotnet-runtime/Config.in
+++ b/package/dotnet-runtime/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
-	# The official ARM binaries are built for ARMv7-A with the
+	# The official ARM binaries, whose managed libraries are also
+	# used when building from source, are built for ARMv7-A with the
 	# hard-float ABI. The CoreCLR JIT also needs at least a VFPv3-D16
 	# FPU.
 	default y if BR2_arm && BR2_ARM_EABIHF && \
@@ -35,11 +36,40 @@ config BR2_PACKAGE_DOTNET_RUNTIME
 
 if BR2_PACKAGE_DOTNET_RUNTIME
 
-# The pre-built runtime provided by Microsoft is the only provider
+choice
+	prompt "dotnet-runtime variant"
+	help
+	  Select the .NET runtime provider.
+
 config BR2_PACKAGE_DOTNET_RUNTIME_BIN
-	bool
-	default y
+	bool "pre-built"
+	select BR2_PACKAGE_HAS_DOTNET_RUNTIME
+	help
+	  Install the pre-built .NET runtime provided by Microsoft.
+
+config BR2_PACKAGE_DOTNET_RUNTIME_SRC
+	bool "built from source"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # aarch64 FPU assembly
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
+	select BR2_HOST_CMAKE_AT_LEAST_3_26
 	select BR2_PACKAGE_HAS_DOTNET_RUNTIME
+	select BR2_PACKAGE_DOTNET_RUNTIME_ICU
+	select BR2_PACKAGE_DOTNET_RUNTIME_KRB5
+	select BR2_PACKAGE_DOTNET_RUNTIME_OPENSSL
+	select BR2_PACKAGE_LTTNG_LIBUST
+	help
+	  Build the native parts of the .NET runtime (CoreCLR, the
+	  native libraries and the hosts) from source. The managed
+	  libraries, that need a .NET SDK to be built, are taken from
+	  the official runtime release.
+
+	  ICU, OpenSSL and Kerberos are needed to build the native
+	  libraries, so their support is always enabled.
+
+comment "built from source needs a toolchain w/ gcc >= 8, host gcc >= 7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_HOST_GCC_AT_LEAST_7
+
+endchoice
 
 config BR2_PACKAGE_DOTNET_RUNTIME_ICU
 	bool "ICU support"
@@ -89,6 +119,7 @@ config BR2_PACKAGE_HAS_DOTNET_RUNTIME
 config BR2_PACKAGE_PROVIDES_DOTNET_RUNTIME
 	string
 	default "dotnet-runtime-bin" if BR2_PACKAGE_DOTNET_RUNTIME_BIN
+	default "dotnet-runtime-src" if BR2_PACKAGE_DOTNET_RUNTIME_SRC
 
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
