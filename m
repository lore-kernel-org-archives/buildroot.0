Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA26606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CUxaQnwG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=QqmfHND+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09EB980D88;
	Sat, 24 Oct 2026 18:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mXNF-6NISUR; Sat, 24 Oct 2026 18:22:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9DE3880E47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866121;
	b=G7z4nZEznKLCoWHyqrpoYWap2g1gg9JS7qlp6c5/C/N5iad2Q75RlONCDkiKVY4Pyg4B
	 7WG0Vs6XOod/S/NfStzy6m0o6eLQpsfT90xUgQ1rpQke2O6EzxpfwOhLpO1dd7LbDwsUE
	 3/XDwNChxa8iLHu7wOj9FZkBkML4ZB7PJSInomxVKEctH6wmee3k4KEUp0kpR0pA5Hg8Y
	 1TiuVFZgzBTKcCdnPZFeDyWMbiM8mqOqkPMrQFvpUG2zZa7HS8/SuYaV3G9Cbhb4JEdSD
	 3CGe++hZ7Bh6cdCjaKmopjmBwvAr81Rcl4vsAUJIjGHkwTgW9BioeKs6uDH3bYStbUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yQacj677YbmYZZZnneI+CrOxGHTqrhU36OT/mIuha4w=;
	b=Qvxct+Hyn7OPotZ+MlbMDcc4X32btQjS0AG9hvqK8OwMU1NugHXtxE8LFJ1pKz7nEF/1
	 i+drKm8VCXFuQfrfwjypUaGfGlFRylJBoZh+Zx457sG8ZJrdMn8JAv9dqalynEz8hTUra
	 hC4s/KKPXn3GuH86ZKTfeIWiDAudyx39Kz/Zb7KMpMlrENoP0YAln3uQMlcPgv3heXLlq
	 Wr3685dQ2SQCZM/vfmC/vCNZOIFV+n/1NfEPTXarp1Bh9VQC50/g10QPZWjVHV/P4WIvS
	 IqPF7MK1Lu7vqwn4jHnLWOxd9MABoAlWC9nP2uAETFw5SvIovx7RAtPJEkgSxtbYFlA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=QqmfHND+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866121;
	bh=yQacj677YbmYZZZnneI+CrOxGHTqrhU36OT/mIuha4w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CUxaQnwGuTaNOyBmBAbr+D1nAGCVS4NjE2uBsxufSOHnVAsb5OviSnwpRNRsNROJX
	 ca/j8SREoXTtmGKuFQ7cNqWqncb9tx6ObHZ7AKej6qULKl15p+3Y2Ybwl/O50TwNhg
	 R7A+SRbeCkQTPPRGTVdmPl3pF/yymURrilrFc5/V4UMZTJvAEnhibdyzbj9RbgrN0Z
	 MeR56Ei6FfcxiX4H97W3KKaN3ZjB5DV3KfGm3IERj1AYuiMs/3Otct/vKEyxyElWZ3
	 U/HfJp3D7/IRNeKbKfiBqrI+k1dcX8C91Qh3xvQM70sBtplTHXS72+UB45I7c+5BXj
	 yTFSHb72/friw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE3880E47;
	Sat, 24 Oct 2026 18:22:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BB503D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D71380E47
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JezR_DzXNQGI for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:21:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 07C2280D88
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866118;
 b=RgVXSgf+mcuCWHD3LvAi6jA3w5Ez++k0Eg94R/isQsAPkaD2WpSfvaeYVZpFp6Ye8jVi
 J9RtRv8rVD4IXN/ZeNWN0Z6pqVSKLCyhC+V+8XRh6yZHMzE7S9k5E0diGsaLpY49E7DuZ
 4VxWF0Z4c+6e5aJDvOJ/1gweW22FzAHBzUypkF+oUcJm80x2PhwGpUY5VHurYlL2HQZqP
 rStJxi9I2uk5950f+wzxlUAd6C7cKdyMu2whvdeHf+xmCFJo0ET2yi71YpXUaxxPcqO2A
 cp3brP72WEkKeV3WQlKtuYVszKqOpt7M6Yqqjm37fPi6+nIeLtU4pf1K+BGvZGhoE7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866118;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TUW2dAV7/vAGLEveSB2x34DFbuHbXfqgzmqJmDyvmes=;
 b=K9XqRR51DN36vU9VgF2pi3kIX8vcgEcPhnKrto/h0OM/2QUo21DDPDTxF57W6qUoQQga
 DaAz5HOabfsHqlGcO9K8g65XI5YooKfEIY5Sg4I/YPdugWbOTK5WaE3ncQs2NObmBfyzn
 UixfIDFCw+pztVXQixClCs+QMNJaB5gWJ9c1i8PbmbLfyVwGeq5NfX9/s9JYwuiv6fDoe
 j4L0vNv0emh9Xy0OvKr41jw3ux32hK55qFZY7tL2KqfMI6x+3/WPsaUoqYEDtpG8+SpPA
 yhICg7zN6Wn1OJbvQlMn82U6XYZBXIGQgz6NO8IRzDtrRaVK3dV0ecvancgIEICwJPQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QqmfHND+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QqmfHND+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07C2280D88
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792866100;
 bh=TUW2dAV7/vAGLEveSB2x34DFbuHbXfqgzmqJmDyvmes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QqmfHND+SWG4q9LwBWPaw1x9JwBuqr5N8SovxuFw/8skgt5ITE5N4elwmFdUUI/KF
 pSMpZAD+gVl7m8Lv23HBZfb5us2tYc2u8MtL0Ujt2Gho32xQWHTHLfevEzXP5DNYkw
 hxq2mT8Cj67N6QcRp68I14mPPQwuILAgMfzVSC0eoqoX5Pwa2gu4n5i+6RuDMeF24s
 kfvVxV6Cbr3tmQh+LfmOHXITbWEhjafAhX0bMd5YKp8Ts4afIvndSH6vzE4c3SEQaQ
 xFDqTSIy/2a+tiK7h5fexX75Ex7g2bmkwpDZzEmeXYja797oNLDkkAC3BfsWHmJSA9
 IdjM6SRYlbgGg==
X-KAS-Sym: v3:f51bdf72230551df:DxOslTHEAY/NhNBhgtsSTh9ZX9KwDanaNuvu9IuBsTp0F
 v8h9kSMLNjQvrVXUgjnfulNVzFWfSnRr1/xW8OaU2cMMpVrlqsXwBDs1myx8dReiXzwJUgM/5OU
 KoaJh3f9JILY/QSCxXdrnNDBs1oL/2a3ffJb0qjCIQtHfdowGY4hErxtN46AVRYQYDcyqKvFzfd
 ugGyOk3DuFZL7A0gUNY2dqIjxDrL7SqxQYlxY1WuBVCGL3G3qC50Bl7+a+JWOKYkky1WyNAtIk7
 6cZQAVlsuWJYtbIWMOVpoxJKKF7Ad7ChZrzh70h/Oyc3jI0moXCzxyx5yaApbepQ5I4q9+4Q==:
 UmelKEcTPeL5ADxNTolvwD1ca43SLN8ezvyNp/w7SDT2OUa96By4RO5X5X9gzb+AUzENV65Tazm
 UhWeN8vRCOHcDbX8nUJ2Z8D4Hjvhb1giGoXFVpjGfpjn9N3HDofAMclqzDYtXJ+e4iBaKeL1u4e
 XY1SXEnyIN6d/2rLjJjnUjppEJU/TkQIcn8wLNK+JK2byB+CJYPv404bLqcHRdh+DFkp0hY+TO2
 NO1+Rb9PqyN7jC7/8ebQk7A0UEyYI+g6yiK+I0mEV3p1gjVRXat1+BQh3z8QeMCWr36ERNn8MQ/
 SXH27jv3o0uvcNW4/GZZVUhoMJ8fFViBPeg657cknAN5+9GTeFjc0oiDRNINj72A3uSqfgHZvnc
 6CVjhr+vEaDMiflbfKzNqzet6j64fpOplU4A/4Hff3vRwEOpWtOjiIafS5/PR+v8c6eS+k4GIQk
 fW4nymE+du8G89CgrdpVNzY+BCM0wdrJWWMDJC1nujCBq9bqDVyQlJTuK28c2cfkqCIJeqcuj+A
 jZ5rjMv5r2UWaBJv68BIKBYQpLgpbCbBunTCNPVDVJxhloN6iiy3gV7OugvzzBxUjUR2o5JNq6A
 J/rE2qqPtFRRZBJaZQk1TbXrItoNa/C5oQY3t1nE50nYDDM=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22190A4C6819;
 Sat, 24 Oct 2026 20:21:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33870)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKgN9-000000002u6-47LI;
 Sat, 24 Oct 2026 18:21:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
Date: Sat, 24 Oct 2026 20:21:39 +0200
Message-ID: <20261024182139.3264878-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024182139.3264878-1-bernd@kuhls.net>
References: <20261024182139.3264878-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/domoticz: bump version to 2026.4
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
---
Series passes Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/dcbbc7e8c57e5b14e279e86daca45624836d0a6f

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
