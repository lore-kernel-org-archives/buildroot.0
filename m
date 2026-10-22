Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D7606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q7AtxLnR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8508160874;
	Thu, 22 Oct 2026 21:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ts4XJsLXHNEZ; Thu, 22 Oct 2026 21:45:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90ACB6087B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792705534;
	b=VUWEvYJN8aMnpU1+iLBG1183lYCk20NCpLgj6dGPCM++ki85g28aCNrhph3jR4m0DMlE
	 +YaReper+sOETfxTA2x+63AA39wR+GJ3HZkyTBgHQalYCa5KnYCXUIINZuvU4mNl5UBrw
	 sBCLwltVxEmHR264ZujZxQPBycZOlgwPW9PsRFAJ80JTgSbJXu6yoF8dBf1kLH75yQfcp
	 qpQbkgjClAGvzB9fJao14S6roRgw8ljgHRUO8fhR3pDFF/+0HcgKYd7Z69n9kW7IoAEBT
	 H2BaK7hpzOc2qlcSi96xCERLzi9hoDEOItd/Bp88+mpHYDwtJb8ETR7izaDscUIwhJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705534;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d3QvlOnN8TKZclASdsBaCPeTUlKB6PZ2te6qum5Jykg=;
	b=iYCotZq7AbfLmoWBpgRSEll4uJLUS//OZ9roTlH4FdpvUJq6OJNwTdE8DNXpp6F5MJzA
	 25C1uzuCCyuhwNk5YfV2wNcnO/uA3NlP/fm/YAg1/W5VxSAr+3Kuuf9X08euBaT74H4el
	 hP3DCcOMeszpUterGeFBwvANSOFGawERCWBNehnZ2c9igy2YUPjaxJgbLQWd4GEZtF1Fb
	 yhODKsS8DBAs+6ugpq1VnzvVxI1LN7L49mFzHXrTJHtAfl1ar3O+NYqNSVzSEfS7qqE/b
	 H+YEFqbloa3x0y7ZNr98IsKA8gTs8WmQZOmLaYuQJnJ1cfEuf+9QarqdzKysXHE/rCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792705534;
	bh=d3QvlOnN8TKZclASdsBaCPeTUlKB6PZ2te6qum5Jykg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q7AtxLnRhLKaJ8bc9ADcDLVmpv1EB4/NEzsscl404GU1QRH+D4JjnWEf59PQnYcbs
	 qYjnl5HkIVTjdRYGKqiSnrtYfw24nIrykKaW8rVwcO39uPyS5NW7uwE6TQoqchP8Rq
	 JBvDn5nzqr2Zd0ofGNitnK76IgOSyO+Q7eLhhEl0GlQvwI0UMK6tC2JR7J/fqgtxYw
	 ObXk+B38rycGgSpf/OqSwVYFFxPMcG5IE26YwCQk0IsnAb5per8UJqF9Ib8+xxCo3P
	 6D7ljpoP4ffbcvCNi0gcS6zGC2TtHAMrOXrtk+cqiJEluyEzpdwzBtVvoBUYUc5Ddj
	 YGoQiOyE9xlUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90ACB6087B;
	Thu, 22 Oct 2026 21:45:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBCF33C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD5BA80E0F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrQ4CB45tg9Y for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:45:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EA93680D3F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792705533;
 b=jPiqv6IeSeZJ7Sy3dPKRV7VAUGteMBYIaEHBPuc9jZQO4E/kOo9cfJCeIyTFRfb6SWBY
 oL7F2jxw0mC3uJ6q3QQ8V0FHU+0eJCSqbXOE/RL852FAwyNxyemFwVYQExjKB7c6RGpwf
 UU8ToSt66jVUS8sy+fF+XB98Wp3IZhB/lH3jUjIooKvk3DKPCbBkGip4+RkkcVkTfB3Zf
 V3HAuzAPoagil/odp75L6MyISzCi9IHpD6ZRs275HGxNSgVEx4XPBFxDqbZE0ZcDFVFAc
 is5O2cN1mt8sr8y+kuXIp+HxjoJSIG39Bo8VH7EU80NYxxhb7WnLQ/Z+CGjHUnjEs2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792705533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=T4OnKj2l5kjAh6yqIHxWJiwSAfn3nJgA8lKMV75B4bI=;
 b=ceupZyGowFmZAM85idkUBVProYHOOKBqCQavFdewiP9qIaGS6LYDPGoPX0E/N+FgEXK+
 6tDyYWUi8T2bNb5AJJuCoHG8UeNkLWStUVngPWv/pcMZidQ3ru6vFpQfZRb49D9QKMdBQ
 SeWOSLec5NqjwAFM1i1ubDbC2cyWIVOhWHUsgOy2aS0io6UQ1CEiYiUL/XiiQJLBvDL2k
 NnEJLbnZjnaUF/8Mnepr0rN4OVuf761vkTvp/EPg0jQV8nE1tsMpHtV7rzG1wyVOR6SXi
 xe8DQ4lnYAtA7jslSoMjf6vvkK0esj34kdeAWXjMuPWBUXowGER+TRsn+nO9j7JJG1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA93680D3F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:45:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B73FF9C5C7; Thu, 22 Oct 2026 21:44:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:29:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69e98fc39aa8e1610a5cfd7e74e193641d57857d
X-Git-Newrev: 8579c1eb00c7465275eeaf12d04e2be02a6d7a2e
X-Patchwork-Hint: ignore
Message-Id: <20261022214408.B73FF9C5C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlog: bump to version 1.2.20 and
 switch to the CMake build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8579c1eb00c7465275eeaf12d04e2be02a6d7a2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

zlog ships two build systems: the hand written makefiles used so far and
a CMake one, which 1.2.19 reworked. Switch to the latter and use the
cmake-package infrastructure, because the CMake build not only installs
zlog.pc like the makefiles do, but also the CMake package files
(zlogConfig.cmake and friends), so that dependent packages can use
find_package(zlog) and the zlog::zlog imported target.

Dropping the custom build and install commands also restores the ability
to build zlog in parallel, as the makefile build had to be serialized
with MAKE1.

An out of source build is needed, as zlog rejects an in source one since
1.2.19: CMake would generate its own makefiles over the hand written
ones that are part of the source tree.

-DZLOG_WERROR=OFF disables the -Werror upstream turns on by default,
following the usual Buildroot practice of not letting a new compiler
warning break the build.

zlog uses C11 atomics since 1.2.19, and 1.2.20 adds 64-bit ones, which
need libatomic on e.g. ARMv5:

  libzlog.so.1.2.20: undefined reference to `__atomic_store_8'

So depend on BR2_TOOLCHAIN_HAS_ATOMIC and link the library against
libatomic when the toolchain provides it.

The CMake build installs the same set of files as the makefile build did
(zlog.h, zlog-chk-conf, libzlog.so.1.2.20 and libzlog.a) plus zlog.pc
and the CMake package files. The soname is libzlog.so.1.2 with either
build system.

Changelog: https://github.com/HardySimpson/zlog/blob/1.2.20/Changelog

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlog/Config.in |  2 ++
 package/zlog/zlog.hash |  2 +-
 package/zlog/zlog.mk   | 22 +++++++++-------------
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/package/zlog/Config.in b/package/zlog/Config.in
index cf86a26174..b764705362 100644
--- a/package/zlog/Config.in
+++ b/package/zlog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ZLOG
 	bool "zlog"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
@@ -9,4 +10,5 @@ config BR2_PACKAGE_ZLOG
 	  https://github.com/HardySimpson/zlog
 
 comment "zlog needs a toolchain w/ threads, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index f000b08f37..4f2d22dce2 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3977dc8ea0069139816ec4025b320d9a7fc2035398775ea91429e83cb0d1ce4e  zlog-1.2.18.tar.gz
+sha256  432723ccd9a5b07ec1e4b8cc985d9011d768633b1e4c4facfc0e3e9a7ad5fcf7  zlog-1.2.20.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 0d56471559..15a2951520 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,25 +4,21 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.18
+ZLOG_VERSION = 1.2.20
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = Apache-2.0
 ZLOG_LICENSE_FILES = LICENSE
 ZLOG_CPE_ID_VALID = YES
 ZLOG_INSTALL_STAGING = YES
 
-define ZLOG_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		WARNINGS="" -C $(@D) all
-endef
+# CMakeLists.txt refuses an in source build, as it would overwrite the hand
+# written makefiles that are part of the source tree
+ZLOG_SUPPORTS_IN_SOURCE_BUILD = NO
 
-define ZLOG_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
-endef
+ZLOG_CONF_OPTS = -DZLOG_WERROR=OFF
 
-define ZLOG_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
-endef
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ZLOG_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
 
-$(eval $(generic-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
