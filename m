Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEC1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TTU4MW1T
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B35980F33;
	Sat, 24 Oct 2026 21:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2qHT4DZCVfM; Sat, 24 Oct 2026 21:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 443C580E0A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876737;
	b=WelPsgSrV8XCjkkQRhIXqPB2n5A+/ghr5au711hx9FhkI5LhAWZy2otokJo/ALqoddke
	 3VWWlM90usPfFe2fxBO/w98soj/VaCSa8pgmAViyMxlr9U5N2SiJG6flfNgIKsYy4cg48
	 8uCaNMv9bACoNPB37wox16BCskG1cE+poAWsu9ycHrn2G6oojIRtf6oXxo381JxmPtvzq
	 bZzT+E3pPtzK2ZuXnCjTD3UINP267cifVV97X2Ct1GLj9C+y/t3w3YTZAcg4286FA2OWQ
	 gIRmPDtjyPSqgTecvyS5BJvaVASLPIChLu+KR7sk9mOlB/d0LETxXb4Xuo1fUxD8aLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876737;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LqEkGZISHx9DTfn6Ia2bg8veoLvm5UVEg5ewZJ0sZkg=;
	b=WXpJHtcesK/GtkKDCPZVOpKmWcavnJTPCBNVIhXbsFGPSIyjr94/NO3FdCICfuQYASBC
	 XTXT3qyKvdCX9kZDT3yCdLYlI88tlLFQZmVcXchRIgHmUPAd0J+ii76a+3ZWFLyhQ/h7/
	 OLBthTlOvnZ/Rdcd1QZh1mjyEu2w8ROSCtkj4A/vBhhMs8U7dAj+GkGBINuVaRk6nEn3k
	 HYy9e25d9Y+JPVLpIVOaYSE8I1Jf1qDs5ajSuErKyHk4qRdMZF/HJ9BdiguxP2Klgb+6G
	 S/BzdfBIq89TAKmJ4RwgX8Ffl9Jt5WZFQ3rentyOy5YnTfK5vIOXJzC2G48z87MNG2Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876737;
	bh=LqEkGZISHx9DTfn6Ia2bg8veoLvm5UVEg5ewZJ0sZkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TTU4MW1TNY/WFaXqj8TESXOy199SomV1m1e8GitkEF3jjQIVhsog+XTm3R2aWKlww
	 ZJ3fI6eh9QuQCGNb4mqd32yKaNQhqcDcp1TdxTh9/HV49a3SMCDofxmkbDc9GZ88i/
	 BxqSLxOk/bSZoGqWtQxjj6cCuAlUxTIYc57jiMUgY9HEq6kJCIFLzfbBIKZ1MO9y0X
	 Ar6BG0hbBVAHLuWqFlX4nGVWcgQJ32ZzCXB1uB6NsO4/2oEdecI79tvKINycC1seUE
	 qCB3cgEncKS2EIqudkgQfSQb8hGBVgfgrGiyT+O0BDuz7uBQc/KcKCSKrvt3oGIiFS
	 o6chyYVHlFbRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 443C580E0A;
	Sat, 24 Oct 2026 21:18:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C942F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF7D840079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rzVtXkdfp1Q for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 179014006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876733;
 b=ireFcU1+e6T/h5ZxomMw6MpWXgMdW8/kt2LWB9YPHik/9uxRzq8vFxWjhXyFCAinSsb1
 zdj/Gvzue32aKkPOlqsh5SwVFpxNPnkHALStx2+OASV8m1izvUZoVLS2Ryu5sK4vDO5RZ
 Bh4+XvAfD4qf+Uf/3t05HRJelVwhukkGwUdB9UYzB6i/Kt0KscjpPYyNqEU8pOW/UOjFA
 ttFAOAiH/kcTVkedcT0lnk08c5yG5Z9cmwA5pQ1EucOL/4WgjzhPlkawYvikmP76xIUXc
 eMLQDlCyl3JZU3OZNW+nlc0HWHU3pJE1YJoqxawteDe7+88kU42827xlFvfRLS30Jww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876733;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4kEHM0oEEc6dDl5e0SuxiQRvEmTr2g4sBKjf9XxfLOc=;
 b=B+WG5FovwPdBaxh3xmcl2vIZbivQVielsnkv1fSU6P1rjXcrlhMd8fUcoKsfDhoMhRfM
 +I9siCMT9y7hczkJ8XYMRRJEoV5ClxOEurgBoC/TbXiSM+vjsYk9Opso3cglFtplOor5Y
 xWqzHaBjD6I+DA+JCkrfV33/9/hk0bD6dE+AjQ8narn+Xg+3jMWBJ5gZK20Xw8H8Kv5ra
 hGtpbMSu6oTfdRPh1ca8l7VyheEE1/RU6ZontD81K7WjygWVeBUKpRiNPx+MCrA/wzJL3
 xZatHGPdwFhP+pLaf76IYZiQPutRWhuXgjXJblxm9amqIuUmqcovZvHrko6f2ZhJPnw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 179014006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E52D09C7AA; Sat, 24 Oct 2026 21:17:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:16:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2466c7013051f6030bec5bee80cb6fcb9ab7e8b
X-Git-Newrev: c1209926be7654e6cbd25c0a89623999315d9dc9
X-Patchwork-Hint: ignore
Message-Id: <20261024211727.E52D09C7AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: bump version to 2026.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1209926be7654e6cbd25c0a89623999315d9dc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/domoticz/domoticz/blob/2026.4/History.txt

Switched to tarball provided by upstream which also includes git
submodule libwebem, it was split from the domoticz tree:
https://github.com/domoticz/domoticz/commit/7de4834e9959e8a9a21a2b82bb7700ea5af6e618

Added new dependency jwt-cpp needed since 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Raised minimum gcc version because libwebem depends on c++17:
https://github.com/domoticz/libwebem/blob/master/README.md

Removed configure option USE_BUILTIN_MQTT due to its upstream removal:
https://github.com/domoticz/domoticz/commit/be95eec094bf524c1ab011eebcd797d3b19b17fc

Link to libatomic to fix a build error

output/per-package/domoticz/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/15.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 CMakeFiles/domoticz.dir/hardware/Matter.cpp.o:
 undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'

detected by the Gitlab pipelines which is introduced by upstream
commit
https://github.com/domoticz/domoticz/commit/ec5488a7df963af4b260a92bfecea53edc20b136
that added hardware/Matter.cpp in version 2026.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/Config.in     |  7 ++++---
 package/domoticz/domoticz.hash |  3 ++-
 package/domoticz/domoticz.mk   | 18 +++++++++++++-----
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index a0e69a7601..2af63baecf 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -17,6 +17,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_JWT_CPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_MOSQUITTO
@@ -32,11 +33,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, dynamic library"
+comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_LUA_5_3
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index ae86a67b79..8f800e00de 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,4 @@
+# From https://github.com/domoticz/domoticz/releases/download/2026.4/domoticz_src_2026.18387.tar.gz.sha256sum
+sha256  88964b791050abf6b6df3ec9e1d262d18e198a6fa108638974eca8600d1a4568  domoticz_src_2026.18387.tar.gz
 # Locally computed:
-sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 498ca232f4..db89dd9e94 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,16 +4,19 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.4
-DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
+DOMOTICZ_VERSION = 2026.4
+DOMOTICZ_SITE = https://github.com/domoticz/domoticz/releases/download/$(DOMOTICZ_VERSION)
+DOMOTICZ_SOURCE = domoticz_src_2026.18387.tar.gz
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
+
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
 	host-pkgconf \
 	jsoncpp \
+	jwt-cpp \
 	libcurl \
 	lua \
 	minizip-zlib \
@@ -22,6 +25,11 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DOMOTICZ_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
@@ -29,12 +37,12 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, minizip, sqlite and mqtt
+# jsoncpp, jwt-cpp, minizip and sqlite
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
+	-DUSE_BUILTIN_JWTCPP=OFF \
 	-DUSE_BUILTIN_MINIZIP=OFF \
-	-DUSE_BUILTIN_SQLITE=OFF \
-	-DUSE_BUILTIN_MQTT=OFF
+	-DUSE_BUILTIN_SQLITE=OFF
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 DOMOTICZ_DEPENDENCIES += libexecinfo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
