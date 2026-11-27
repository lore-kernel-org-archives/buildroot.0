Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2BA606A329
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I8v72SlA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=EdtI44TM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA90E80AC4;
	Fri, 27 Nov 2026 12:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEg0JqWceJzQ; Fri, 27 Nov 2026 12:39:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 52FC380ACC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795783145;
	b=nP6o9qxiSqV6s04/vTxF1t3MtO422mDUhAxwoHZ2xhDn5KzOZDrl52T75mZXLqLhMIrt
	 X4fBOlY6tADWEbjJ92xUB/DPNCl5ZQpkEu7xwwxE6T71AFXyo12qD4VKDixt7j3uJqXM8
	 QVZizAd0L3d92do+dnEKnFBPo2VwI3++At9+7mvvydepAATebFpVqVpUcTCEydrY5ZIRE
	 S+0mDlL7lvMM5aZKn1e6Qi8AoCr+VQFkulIWhtxMmRPuNrtWGihexvuJziVpAIjSZqmat
	 2eDSVcApiQbGd8/dBFMB/fDr/e26kW0Dlblmp/12tLLTXTGQ9Ii1HH4eGVn1HaF7ycA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795783145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lJeJFfjQORAdwHY3gRnAzB0MvV09EkrHafGqtItMDLQ=;
	b=EXdG9+G7OghKZyaJIvHcxcIiFjPoOHkcB5QviA7uaflJKLMQ9UjivlgAsjN6k6W8HAum
	 JBiuTflLSkRGGxeZ2eNoAU7rLVJ6SCJ/krYDAgDRUCt4oDDq1DF8Aqb3I/Cwr3xoXtaZa
	 jlvHal36simiRpy5x5R+jSXArW98HpB8JDj2whgVMoFaqrAryJK4NmR4IazEshpuae6WQ
	 vKPPNX8zB9GyzJFjOqF7YJhP3EBSsw77yMrs4iJc6nCvmrFypBPB3U6VXjDGHo0ImW90q
	 W1OYQUUpccN8oqUuMTtjatPFnwfJJ3B164/uc1QsJ7Ym072z4ah5ltX07zRgzx7Cchg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795783145;
	bh=lJeJFfjQORAdwHY3gRnAzB0MvV09EkrHafGqtItMDLQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8v72SlA47DBM0WL0qPzawYoZBlXoPTdcaniVDNKhZCOaW0n9/4RXXOh3cE736ceK
	 Oa4q4lf8nLcPGPrilPeeR6+FAIEc+cfjJkP5ipBXqybKjDKEO3uuf1oqS+dsA+WNrB
	 sfYpPoW7Nw5rxN4cV3CdoPAYj2os7XxZuS900C+2Qnl+Q11b7xisLhaLOLcXBuEfhz
	 hBlCBFTCqvutwrw/tCttXjrU1PZd3f9wdjq67I/I1t3dLqNGGkHBJLi+iRxCNxXwvl
	 KR5JV220cg2CYnYPBtGaQxFadvO+Y/ffrwujD3+Yj9fORXFbxvRZ0vT5w26Uv6fXQ4
	 /t2lt3SKHw7RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52FC380ACC;
	Fri, 27 Nov 2026 12:39:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C54AE2DF
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C330D4004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4T9qUAN9nzL for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 12:38:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4778740571
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EdtI44TM
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4778740571
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:55 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id WvE3xMYVxV5J9WvE4xjmcb; Fri, 27 Nov 2026 13:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795783132; bh=81H4mh60rvQAx832+ZoJua0XMHrwK5hrW+pwPyb2Sh0=;
 h=From:To:Subject:Date:MIME-Version;
 b=EdtI44TMFAkHk4j9uI+BI4jyCHvVoM4pc286XZ6MA9ydLlyafYn7ln6Nz5kzL0G76
 Rkjrwekr18xNgjcZo6Z6m9DDGISKladG1jEXH82eGb4YsFnmrWXPEa8KeMrboh8PwJ
 uAb5Tfn2MzJfiIdF/9opZjpTifD7V9G3jz7A8evOq+iCO2JkSh9Ylr1myBl1+JK3Qw
 UxBws04OIELiOOdotbnZKf2HlZL5xHrFa/J22RVnaKYvDyKF7AmgpOZxr2oZyM48Zk
 nYTJ42Y2DJcDvEATw94OFIFI6pjm5n66uRN6DpcnnpTQEMsyBZYHM63bAVx6koVgJb
 4zMaUYfs8bxcg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jim Reinhart <jimr@tekvox.com>, James Autry <jautry@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Date: Fri, 27 Nov 2026 13:38:48 +0100
Message-ID: <20261127123851.2402756-2-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH v5 1/4] package/dotnet-runtime-bin: new package
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the pre-built .NET runtime provided by Microsoft, to execute .NET
applications. The tarballs for aarch64, arm (ARMv7-A, hard-float, at
least VFPv3-D16) and x86_64 are available for both glibc and musl.

Only .NET 11 is supported: it is supported until November 2028, like
the 10.0.x LTS version, and the applications built for older versions
run on it with the Major roll forward policy, as the help text tells.

Also add a dotnet-runtime virtual package, so that a variant built from
source can be added later, like for rust and go. dotnet-runtime-bin is
its only provider for now, so there is no variant choice yet. The
architecture dependencies and the options are in the dotnet-runtime
package, so that they are shared by all the variants.

The runtime is installed in /usr/share/dotnet, which is its default
location, so neither /etc/dotnet/install_location nor environment
variables are needed. A /usr/bin/dotnet symlink puts the dotnet host in
the PATH. The runtime loads its native libraries from its own
directory, so LD_LIBRARY_PATH isn't needed either.

The runtime only links against the libraries of the toolchain. ICU,
OpenSSL and libkrb5 are loaded at runtime only when an application needs
them, so they are installed with the ICU, OpenSSL and Kerberos options
of the dotnet-runtime package. They are enabled by default, so that
applications work out of the box (without ICU, they even fail to start
unless they use the invariant globalization mode), and can be disabled
when they are not needed.

libcoreclrtraceptprovider.so, only used for LTTng tracing, is removed,
so that lttng-libust is not needed.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
Changes v4 -> v5:
- only support 11.0.x, and drop the version choice: 8.0.x is end of
  life since November 2026 (zlib is not needed anymore), and 10.0.x
  is supported until the same date as 11.0.x
- document the Major roll forward policy for the applications built
  for older versions

Changes v3 -> v4 (addressing Arnout's review):
- rename to dotnet-runtime-bin and add the dotnet-runtime virtual
  package, without a variant choice since dotnet-runtime-bin is its
  only provider
- add a choice between the 11.0.x (STS), 10.0.x and 8.0.x (LTS)
  versions, in the dotnet-runtime package, bump to the latest releases
  and use the sha512 hashes published by Microsoft, drop 6.0.x
- depend on !BR2_TOOLCHAIN_USES_UCLIBC, drop the redundant threads
  dependency, fix the comment and add "dynamic library" to it
- drop all selects but zlib (BR2_PACKAGE_ZLIB +
  BR2_PACKAGE_ZLIB_FORCE_LIBZLIB, only for 8.0)
- add ICU, OpenSSL and Kerberos options to the dotnet-runtime package,
  enabled by default, to install the libraries loaded at runtime
- require ARMv7-A and at least a VFPv3-D16 FPU on ARM
- use the upstream homepage in the help text
- add ThirdPartyNotices.txt to the license files and the licenses
- simplify the tarball name with _LIBC and _ARCH variables, drop
  AZURE_FEED and the copy-paste leftover, use the new download host
- drop /etc/dotnet/install_location and the profile.d script, add a
  /usr/bin/dotnet symlink instead
- only install dotnet, host and shared (not the .stamp files)

Changes v2 -> v3:
- drop the DOTNET_RUNTIME_PREBUILT_IDENTIFIER check, that breaks the
  whole Buildroot build when the architecture is supported but the
  package is not selected (a testing leftover)

Changes v1 -> v2:
- add depends on BR2_INSTALL_LIBSTDCPP and drop the select of
  BR2_PACKAGE_LTTNG_LIBUST
---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 .../dotnet-runtime-bin.hash                   | 10 ++
 .../dotnet-runtime-bin/dotnet-runtime-bin.mk  | 43 ++++++++
 package/dotnet-runtime/Config.in              | 98 +++++++++++++++++++
 package/dotnet-runtime/dotnet-runtime.mk      |  7 ++
 6 files changed, 161 insertions(+)
 create mode 100644 package/dotnet-runtime-bin/dotnet-runtime-bin.hash
 create mode 100644 package/dotnet-runtime-bin/dotnet-runtime-bin.mk
 create mode 100644 package/dotnet-runtime/Config.in
 create mode 100644 package/dotnet-runtime/dotnet-runtime.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..73b3f6cbef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,8 @@ F:	package/bind/
 F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/dash/
+F:	package/dotnet-runtime-bin/
+F:	package/dotnet-runtime/
 F:	package/erlang-jiffy/
 F:	package/esp-hosted/
 F:	package/gcc/
diff --git a/package/Config.in b/package/Config.in
index 49659b007e..3c4b47ff05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -667,6 +667,7 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/4th/Config.in"
 	source "package/chicken/Config.in"
+	source "package/dotnet-runtime/Config.in"
 	source "package/duktape/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
diff --git a/package/dotnet-runtime-bin/dotnet-runtime-bin.hash b/package/dotnet-runtime-bin/dotnet-runtime-bin.hash
new file mode 100644
index 0000000000..e92973dfb0
--- /dev/null
+++ b/package/dotnet-runtime-bin/dotnet-runtime-bin.hash
@@ -0,0 +1,10 @@
+# From https://builds.dotnet.microsoft.com/dotnet/release-metadata/11.0/releases.json
+sha512  4857a8f2c4ec2f21381916923b2c6a0e94d69ad0380abff9a53f7f99a80b52a00b2a2438c86500b27551047233b1d416ada85ead25b9637c80e9b822274008ee  dotnet-runtime-11.0.0-linux-arm.tar.gz
+sha512  b624e647c72e8f62a0d186aa96aad1b113732e8c39f010be6f95ec026feb2633187e33f24c3af5168daaa1d9b4bb0bb9c396f6d172d18660b9673bb507fa9f45  dotnet-runtime-11.0.0-linux-arm64.tar.gz
+sha512  dbca05e02a6c206c93d02fe7acb6ca9f8025aacca3d17b1383f25dc18b7a3c09cc2c2105d0be92b6a11273a5bb370ff6d56caeca5de0805d12a251f4a44895ca  dotnet-runtime-11.0.0-linux-musl-arm.tar.gz
+sha512  7b32d53ee1c98078f71e73b510332aeca7a70b974f38d93201857ba8b8870e0d175f1d206b15cde03fd145e130bcf86e7c5749e67efec20ff62de0132119f7e3  dotnet-runtime-11.0.0-linux-musl-arm64.tar.gz
+sha512  85e1d28610719a44119ff706bb09f17487380a47d6d0400adad72888ba2cef55e80e2566d15b2812af442ecde469d05d272e15ded04d515f628b40a5345c7854  dotnet-runtime-11.0.0-linux-musl-x64.tar.gz
+sha512  d0846e7ad4a6b07fe3fb7c033a381e6938ec16afbe0b7f7454ff2f9b58247cbbc35758cc785af424385c4572c801060cbd656a822ef624f4907d3cc10a16a080  dotnet-runtime-11.0.0-linux-x64.tar.gz
+# Locally computed
+sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.txt
+sha256  d30078edf6426ec7ef9427b3048b407fee214d1eb7834a681a3a09290387d591  ThirdPartyNotices.txt
diff --git a/package/dotnet-runtime-bin/dotnet-runtime-bin.mk b/package/dotnet-runtime-bin/dotnet-runtime-bin.mk
new file mode 100644
index 0000000000..3da4a29d3a
--- /dev/null
+++ b/package/dotnet-runtime-bin/dotnet-runtime-bin.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# dotnet-runtime-bin
+#
+################################################################################
+
+DOTNET_RUNTIME_BIN_VERSION = 11.0.0
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+DOTNET_RUNTIME_BIN_LIBC = musl-
+endif
+
+ifeq ($(BR2_aarch64),y)
+DOTNET_RUNTIME_BIN_ARCH = arm64
+else ifeq ($(BR2_arm),y)
+DOTNET_RUNTIME_BIN_ARCH = arm
+else ifeq ($(BR2_x86_64),y)
+DOTNET_RUNTIME_BIN_ARCH = x64
+endif
+
+DOTNET_RUNTIME_BIN_SITE = https://builds.dotnet.microsoft.com/dotnet/Runtime/$(DOTNET_RUNTIME_BIN_VERSION)
+DOTNET_RUNTIME_BIN_SOURCE = dotnet-runtime-$(DOTNET_RUNTIME_BIN_VERSION)-linux-$(DOTNET_RUNTIME_BIN_LIBC)$(DOTNET_RUNTIME_BIN_ARCH).tar.gz
+DOTNET_RUNTIME_BIN_STRIP_COMPONENTS = 0
+DOTNET_RUNTIME_BIN_LICENSE = MIT, Apache-2.0, BSD-2-Clause, BSD-3-Clause, \
+	Zlib, CC0-1.0, Unicode-DFS-2016, Public Domain
+DOTNET_RUNTIME_BIN_LICENSE_FILES = LICENSE.txt ThirdPartyNotices.txt
+DOTNET_RUNTIME_BIN_PROVIDES = dotnet-runtime
+
+# /usr/share/dotnet is the default install location, where both the
+# dotnet host and the application hosts find the runtime. The runtime
+# loads its native libraries from its own directory.
+#
+# libcoreclrtraceptprovider.so is only used for LTTng tracing and the
+# runtime doesn't need it: remove it, so that lttng-libust, that it is
+# linked against, is not needed.
+define DOTNET_RUNTIME_BIN_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/dotnet $(TARGET_DIR)/usr/bin
+	cp -a $(@D)/dotnet $(@D)/host $(@D)/shared $(TARGET_DIR)/usr/share/dotnet/
+	rm -f $(TARGET_DIR)/usr/share/dotnet/shared/Microsoft.NETCore.App/$(DOTNET_RUNTIME_BIN_VERSION)/libcoreclrtraceptprovider.so
+	ln -sf ../share/dotnet/dotnet $(TARGET_DIR)/usr/bin/dotnet
+endef
+
+$(eval $(generic-package))
diff --git a/package/dotnet-runtime/Config.in b/package/dotnet-runtime/Config.in
new file mode 100644
index 0000000000..c79c47f5c4
--- /dev/null
+++ b/package/dotnet-runtime/Config.in
@@ -0,0 +1,98 @@
+config BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	# The official ARM binaries are built for ARMv7-A with the
+	# hard-float ABI. The CoreCLR JIT also needs at least a VFPv3-D16
+	# FPU.
+	default y if BR2_arm && BR2_ARM_EABIHF && \
+		(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A) && \
+		(BR2_ARM_FPU_VFPV3 || BR2_ARM_FPU_VFPV3D16 || \
+		BR2_ARM_FPU_VFPV4 || BR2_ARM_FPU_VFPV4D16 || \
+		BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4 || \
+		BR2_ARM_FPU_FP_ARMV8 || BR2_ARM_FPU_NEON_FP_ARMV8)
+	default y if BR2_x86_64
+	depends on BR2_USE_MMU # fork()
+
+config BR2_PACKAGE_DOTNET_RUNTIME
+	bool "dotnet-runtime"
+	depends on BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	help
+	  The .NET runtime, needed to execute .NET applications.
+
+	  Applications built for an older .NET version (for example
+	  net10.0) only run on this runtime with the Major roll forward
+	  policy: RollForward set to Major in their project, or
+	  DOTNET_ROLL_FORWARD=Major in their environment.
+
+	  ICU, OpenSSL and libkrb5 are loaded by the runtime only when
+	  an application needs them. Use the options below to install
+	  the ones needed by your applications.
+
+	  https://docs.microsoft.com/dotnet/core/
+
+if BR2_PACKAGE_DOTNET_RUNTIME
+
+# The pre-built runtime provided by Microsoft is the only provider
+config BR2_PACKAGE_DOTNET_RUNTIME_BIN
+	bool
+	default y
+	select BR2_PACKAGE_HAS_DOTNET_RUNTIME
+
+config BR2_PACKAGE_DOTNET_RUNTIME_ICU
+	bool "ICU support"
+	default y
+	depends on BR2_USE_WCHAR # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
+	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
+	select BR2_PACKAGE_ICU
+	help
+	  Install ICU, needed by the globalization features (cultures,
+	  string comparison and casing, time zones, ...).
+
+	  Without ICU, applications fail to start, unless they are
+	  built with InvariantGlobalization set to true, or run with
+	  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1.
+
+comment "ICU support needs a toolchain w/ wchar, threads, gcc >= 7, host gcc >= 7"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7
+
+config BR2_PACKAGE_DOTNET_RUNTIME_OPENSSL
+	bool "OpenSSL support"
+	default y
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  Install OpenSSL, needed by the cryptography and TLS features
+	  (System.Security.Cryptography, SslStream, HTTPS with
+	  HttpClient, ...).
+
+config BR2_PACKAGE_DOTNET_RUNTIME_KRB5
+	bool "Kerberos support"
+	default y
+	select BR2_PACKAGE_LIBKRB5
+	help
+	  Install the MIT Kerberos GSSAPI library (libgssapi_krb5),
+	  needed by the Kerberos (Negotiate) authentication
+	  (NegotiateStream, HttpClient with default credentials, ...).
+
+	  NTLM authentication also needs the gss-ntlmssp plugin, which
+	  is not available in Buildroot.
+
+config BR2_PACKAGE_HAS_DOTNET_RUNTIME
+	bool
+
+config BR2_PACKAGE_PROVIDES_DOTNET_RUNTIME
+	string
+	default "dotnet-runtime-bin" if BR2_PACKAGE_DOTNET_RUNTIME_BIN
+
+endif
+
+comment "dotnet-runtime needs a glibc or musl toolchain w/ C++, dynamic library"
+	depends on BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS
diff --git a/package/dotnet-runtime/dotnet-runtime.mk b/package/dotnet-runtime/dotnet-runtime.mk
new file mode 100644
index 0000000000..4bed1f9439
--- /dev/null
+++ b/package/dotnet-runtime/dotnet-runtime.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# dotnet-runtime
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
