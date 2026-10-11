Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582ACCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6AA40581;
	Sun, 11 Oct 2026 13:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPOj9GPMeVK2; Sun, 11 Oct 2026 13:02:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1B0F040585
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723720;
	b=YMjNon33yfcOMlaMAFom7TSsANYMeXgC/ZfbBo+Z1qua24GqF1BjP+Ic298tns/D7BYh
	 Z3fGc9ZTIDleF2CqxGVLQL0Wktgve6lQ56d0NaHrg842K4iJh6tg0czmq5kfq9VgTXax2
	 eMt2BBR4KlUyL8NYJO339c6bBiEC7DTTecg2L3BgQZaOjqvO3FnclUrQ2J0PPYEZkSBiE
	 4xlVHocT5FVCG2RaOFn4raG44mQ4J5fSpW6F7dNWkryeDPTioSvkw8HK5arDkmIgCt6Mw
	 erX3qdbjerNb3LeKw7YUoaX5oK2L9kkBl4L0xGWiR+K3AakvgWCM6LtWJLl4Rh40u6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rlbP3eH7qzGqaU8UCXjfqbxU2CQq5jsPrQJzPtAfuig=;
	b=D9EfEavI6u0W6Zd2sTxrcaPIJzuaKzTLQ7D9HA4DU8DfkH1i5aZM5d5xI2Bzb9OAhr4i
	 9dlwpayJw6o26pGNzJa8MQzPC8KUVVSqDjE2cE8Eo639+1+9uuifnlE2KMHK//VrAWuCl
	 7UjSVPFpiat/vhoryhk7Puz3wMNVPH/3pFLq1mpvKRvC0xCxlOyy7X/jMmf0+qV9nsLrP
	 Dbb8IN2bylzHfDntd4ZOS1OYdAmTGpoYBN3S/Gx2H4O6zOjV4OXceS/Nkgdz56TsbBzJT
	 jOzGRfnKm4UwrnI96HMcDtVdoFNUTjOtOM+VoG3pmeaqlDoOfdOM5rdA7xq0XB6Ekow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723720;
	bh=rlbP3eH7qzGqaU8UCXjfqbxU2CQq5jsPrQJzPtAfuig=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oa3Orgswq348q5He+egxunrGxuWWvVUsYR/+H8QpAXLZ23ScSP3+KKKaYYn3Z/kmj
	 QJ2ad2rkNZ2STYR0zEnlGH/bwl03yIX7lHp3PJasfHn76VZ0rG7zBXzSE7WzxAq12B
	 9ySeqepzmdVM0za9zhyHF1PE925KJD3cfLnU2cXcr7ERnCQJH3fKVC+iBAoWG4k7NF
	 iaYCw6JiUAi2Q/hpjx9YYQf42DhQ/1yWEFfvSJRWQJzE31lglem6t0hcrAvxWXpGpO
	 IT133RfFtqjFVzhkh7BXMXHDIC4ocYhiwui26SoEYi1G3CzigBlWsVbL3swcy5mm08
	 QKQdi8Ot6Z7ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B0F040585;
	Sun, 11 Oct 2026 13:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9529194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF90960612
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNsMPyiQpgcE for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:01:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 842916060C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723717;
 b=sZlBKjF8AdRHZoOvPu1SUbvwm10DIXh+1GF3dkw7aZHh20loyYPrVScVaODTslKnBHcz
 fszqklLdghHV8qv19jsv8Vl7BJ977EzZOww0yeC+ZT+nB0ikqTRO5RZ45Li6geMrVaEzJ
 hlvgq1T1nGrw+JNHDFfAGOxUjRwhlPcqD1CcKFlll7FzD6XXDG2JVWHSOdOcmdH1Q7xtn
 q4WriOrbnMmKy2t5LIsmZ3E9osAJjERwilu0ZzApUSU1lWt5jqDoNkFS3kO62IiaX49wD
 2hXm9/9Q2XEhS3khEX/EQrG4yMl+61CLIJPw1oIHqXXRW+5U6xc/nMKc1warGRkgPMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723717;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=RC43+ccXOQO6Oa3XT5MoZtFOQfQWdDcT1A9ynKKAZms=;
 b=Wow9fq9VV0jj6PEalnTTYRGyNhOqXpyXgLNfqkaICbZjWPB8Esy7xy3NHfOxRtt4kM+k
 e5QVZSPhvlcPEGSHmrEz3rSc3W5ckBdZfnS7DV5MPgPJJk9Ihj6alH//+75q1+uaGao4N
 2gGLdSBFuykFD31OC7HyjaMi6pI98twZsis180ZBF3q2RH9zGb4RMY4aRSKCNb0SN3Vzv
 1o4WZizQ9zVNXAtfHBhqDbP4e97m+algVJQUjMlEtW7+3R/z6XO6FrUwb+CarHTE6iDry
 PmFZByW7zGMNv61XkjySi9m9cor+8wkAqx1Ki/9i2AhkGWvAM60r7W82SNjhmvSnhfw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sswGfdho; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sswGfdho
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 842916060C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723660;
 bh=RC43+ccXOQO6Oa3XT5MoZtFOQfQWdDcT1A9ynKKAZms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sswGfdhohnkH9GBy+D/IwfHBCYsuulrkVONpGeNxViOs5iX3XQJ4mzehtah1YC8Vf
 L8+j/9dhmy+HvgxuapZae52dI74kWsdubMABeJ38NMOAm0Z+Tp8IEBRBX+eS2i0ygq
 ryYSLkZBKtjufV85RMnNH91deg8h6a6QlK+waSWTt6ktdQN4JxSw7TGkXv4gnh8531
 s6GeNzmV02wksSkqTB00v4qf+m9AzaQELw5+JHLojUtOoHqaUvHVYeacKDoQKX8wNA
 Uhs9wL/DpFVR9OjrweFeqAvyseYo5hm/vJ6u+Ams4hr68+opYOchHBalk1EhO9ufV9
 OIsMhuG4JNLKA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 R1/kyEWF67cuLjmmpwuvfPmse5LhtGa51BGdZVsY2/YxMNrtBVEz4EgZIdvzELzCDTfWG4XlARC
 P4M0VQ8+f5v6eTGb/UWVYnkqvzWPfMkl8FOjsnbA/wkjDZsGeOH/udcyhIoYZub7ZLqwDKtUz81
 mZ8bQLc5hBLltaDlGfr/bLA+qUbFA4vHdKZpgL81lOgVhrJ94KFRaD/cX1p8Me3EoPN+KyvAtkG
 0FI8lpFR9eW6O+yOxh7TYaPepcii3ITBjdb90rl2Vg6L1zw4LDYpvSU60mbV9ta9guEOuQ1B43y
 l7sUSsh7xo5sCWl5qGb1MZuf8hWs3OSqAgNgAmRgvSEIaMM/mOiWrQgDtwBSgFWZAIRyBgV368S
 bbN9smt7SZ7hVD1gqwafxG+akb/CTd7+EQynvWT2NmWCqyzkauYBNeKfUOFQts+0WD/n6uJ/56A
 OvlIAo8lgPvnUh7XoTgaH17jYEqk0z915xCCvcPYX8+/t3HJDyiGzdxQZDPu3juUcO5OwylkNui
 qroRZb6hGSHY8TkbHMtmFMeIOoOOAnRcuUkKx/OukRwtoXTJFStmqgB2F2/eoL0r+NEMyOd0mpa
 ArvmZB3W+Xbu5qWGrjqJtoRahjcw/O/EW91Q8QuApPp2WHQ=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90115A4C5849;
 Sun, 11 Oct 2026 15:01:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAi-000000007Fz-1mhV;
 Sun, 11 Oct 2026 13:01:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
Date: Sun, 11 Oct 2026 15:00:09 +0200
Message-ID: <20261011130058.3443432-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v9 04/52] package/domoticz: bump version to
 2026.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added new dependency jwt-cpp needed since 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Added _EXTRA_DOWNLOAD for libwebem after its split from domoticz:
https://github.com/domoticz/domoticz/commit/7de4834e9959e8a9a21a2b82bb7700ea5af6e618
to avoid fetching git submodules. Use version number from upstream repo:
https://github.com/domoticz/domoticz/tree/2026.3/extern

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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/domoticz/Config.in     |  7 ++++---
 package/domoticz/domoticz.hash |  3 ++-
 package/domoticz/domoticz.mk   | 27 +++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 8 deletions(-)

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
index ae86a67b79..fc3904ade7 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
+sha256  10053191b4f6becdf244d2a416b9e655c91d357b51dd8280832c6e36f7d5d5c7  domoticz-2026.3.tar.gz
+sha256  937e31bfb4b414bb33e70cad1403afd023dfff6cebba3213ec62a9c91525dcab  libwebem-9126af0ce3456c24b936dfb20d1b5a8bdb797104.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..5387076b97 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,16 +4,30 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.4
+DOMOTICZ_VERSION = 2026.3
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
+
+DOMOTICZ_LIBWEBEM_VERSION = 9126af0ce3456c24b936dfb20d1b5a8bdb797104
+DOMOTICZ_EXTRA_DOWNLOADS = \
+	$(call github,domoticz,libwebem,$(DOMOTICZ_LIBWEBEM_VERSION))/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+
+define DOMOTICZ_INSTALL_SUBPROJECTS
+	rm -rf $(@D)/extern/libwebem
+	mkdir -p $(@D)/extern/libwebem
+	$(TAR) --strip-components=1 -C $(@D)/extern/libwebem \
+		-xf $(DOMOTICZ_DL_DIR)/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+endef
+DOMOTICZ_POST_EXTRACT_HOOKS += DOMOTICZ_INSTALL_SUBPROJECTS
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
@@ -25,6 +39,11 @@ DOMOTICZ_DEPENDENCIES = \
 # Disable precompiled header as it needs cmake >= 3.16
 DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DOMOTICZ_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
@@ -32,12 +51,12 @@ DOMOTICZ_CONF_OPTS += \
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
