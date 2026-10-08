Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4416CA6007
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 07:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806346078E;
	Thu,  8 Oct 2026 07:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lf52cuaks-A; Thu,  8 Oct 2026 07:52:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8D0FD606FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791445950;
	b=h52u1+eqKWKJo5RzQdq06XxPhT6ydoh1kRKXCjbf3EqjFGwSFFwIEHqhYbMlK7rN68ue
	 VZEao8rVkFJ8TSYGd/8qQdaJ13UqaVrDEsl3uoqBBiUxUCsS245tBT8jrzHNxOGN1v0El
	 +K/dmSn8H1pOOC+vgx+J1+WtKEzPQCCLSm0iMOAc78atN0m4xNKS5AQ20lRyd4/RariXK
	 As4fXsfzx/EcYqWos95p/zee7slBCYwVELDaudNROYtjHCgqp5qHMtGtwfaioIPlfNCmC
	 TVQ3ZpoHzXLXENjeXr27uwv8zjeWUxlzuSxRg1d4ZnwIYcZlviRPqnJFvTBBpmAhCiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791445950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9LplC3KrChZviXO7PQptnDynJn7dbml5QpbuaEFENpc=;
	b=q1FQFvQ56nt7zCg8x2sUmDWN18OQN5MH767/fby91oG4F+Lr0Hl2KdwFgpfZc8sz5hFi
	 eIzPH8eSSPTb1LdW4jc2d3mFO3C7FIt4mXxcL6GTkHy2VV2Tne8zIdv5sKgVy2pPziC1G
	 LbD5jnjE4zfn9wFCn6vngLp07i5s0MJOhYypOl+OFUTx3wOUMoHYbWJKeDqlILj8DIiml
	 1swQkStt59Bhuu6GaEqm20pbfG7bvw2DNBEIjKCq5mib4Nb3BaPCX2+uNb+SzA1dNwdDF
	 zh5DARpFIc4ygopmBvUAe4h7G5bo3q9Xhwy94MwkmYOvX6Jl+v93KLaSGboXi5viu7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791445950;
	bh=9LplC3KrChZviXO7PQptnDynJn7dbml5QpbuaEFENpc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NNfGrhXMbpNFAmOKeOKca67xx9jPSZ7iaNJrDQv4TGmC3OjGr+jvsh3EzDowpbjpt
	 095fE/qaIYlwQ826G8fphfASBSpGE7Wqv7Yb57RS6X2z5t2AnNN4X3nJEmRdVfcLSx
	 zRr4J1L3zdly8hFGxg1mSCI1cUemLOYgQ7yPtnXOChGZR6Yl6vTSfLLvj1LxSOAAfE
	 Z/FyNVu5XQhjVHfUjvJDS3fi2yo1ymNaPAMndE9iXPXl06QDngfWJOoWZpAcUoiVaq
	 Ewj2AqPNfKmGeolg/Y16wk+rY0hMmciS/dq+PoLsylFq1pnAbCjh7R3eJKLPvfoTjB
	 iMIYcATqhc8kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0FD606FF;
	Thu,  8 Oct 2026 07:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 454272B2
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 07:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADB64040C
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 07:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP2mVoc31j0T for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 07:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EED03403FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791445948;
 b=bcjltTyXeubXd1nvZlZ3AwxpHSCL/WgOY1uNPBo0frbsnK4MLDWBLFPW9521qsU22zFP
 Na3/8cXTOYYvAS9OUQwEyhSrtowA79Jxi/DD8XEfQxCHuNiwPrnI48z1n5GnkxYCDM2yG
 VbiBVGUsGa5r7NZW2MtHXwRfY1HIomnMdCqPs6eY/wjeZnzeRrGxmeUZhzaXRi0OfeE5J
 aEQlwB9E4fed6XthS8lBfdVlMBFk/Kzt1skAZ2bsmJhzgql9d0URT/VuMPq8K7abGxU7Y
 Sd6M1lxcVvAkw0ZsiITogEFIxkrmnVNScgLxENqvF3vf7uP3PgVNxd8hxrNFZDXz1mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791445948;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=H76NgLZPnjIGuR6FHmenvsik4+vmCkJOk4lBZ/HD9EU=;
 b=bxlS/V1+uwAZUGqE4tVP19yS8s1U0Wq666dm+piFqzU8rnUa4wnfl2lKw61zwOqQkeMr
 MBLW1i2A/wJn3saZqM41FrpfUKTQ6jNkq2YIG1OHN8GSwVfKtks87nTsX7mysfY39Fbso
 r0pOG0ex8xUdEcQiEENXQxmdn5ODI2EHMsNz4CE2lVHna+rMmm+cqwo9BGD0t8SJoBSrH
 +bob+EZVwS7I2eiFcnE6x8/Xd+7IQxkJDVL4E0y1Y0uyr9pUH01yfEgIosoFq6njoT79a
 SAmVlfGXe1lM50Q81kX4Du9xp3Y5w9tysYhd7dOuq97s0RaRCJRmFieunwVdWBjxt1g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=UV+6mQKF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EED03403FC
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 07:52:27 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso6153296a12.3
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 00:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791445945; x=1792050745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H76NgLZPnjIGuR6FHmenvsik4+vmCkJOk4lBZ/HD9EU=;
 b=MjabEb7nL1PJi2a7dq2FwO13nlnNO3h2n+bUbV/ZkWNK9KSbyJeBwm47ncGfGb91HP
 sKmg6fYQB4SP7u/UO5MW5YGoYWW9uCAwSuXMSXatzpAQpKOI6D8t0G4z7gOCkG03zDCd
 ApTNedZ8yMFJhaT3HuV6Xv6TdP1dx8Nh+uN5s6DBTdqIRpqzYGpSZVnCZNC8o7kOdHxt
 5e6mVIl43vROEerIF+LlQTx2kmdsy7unqm/zArzyvCe5wp6ej1GAKv+RC7KUV/GwWdVA
 jsgD9vIUXnJpqogJ3kGYGg1ymMrkOJpMp0R1JgJgaZMkKWUaBXk/UvfSC0qTZZ2GTU8n
 ufHg==
X-Gm-Message-State: AFuF++mTliE7jPqWcMWhlB1z9zRSHZNWBasIZECukZEpYRTN1FqNp3k0
 +c5PqDq5sEcXK/jXRQs66dhFg2Cg9wuYprMn0cgOLpvTKyXFG7U77wefza/xSA==
X-Gm-Gg: AYBFou1IKjdyDoyBLcpvE2YarVgZr9tpMiflzBBzAYdZs3gwH01jvqhjaXyikDb8SEz
 /Z0xkyCcznUwqxPqoId3ec2IsAmYrqcYYAaktbQI+N9tk1lIwK9ECd9kzRtupUM4WbAgXmSLKRF
 Olp+nMTM2ZYtmRclawS8/BeXcr+gSDUxOKQQrYYja6NjLnT/66p8s+NVMxHzDFpuo6pa5fm/BuL
 ul9acsVhLY9IgN22pceL/YG+UO5hlPFeRBFXF20RHhIb56LrsKJsi97BGCSvWnRdaCuqsRZrXWI
 dlur0bouPH1glr0TDjxtSMVq/ldwKB5GbigM+5QN3r9j5MQKdtfJGNKdgy7bPngK+bxWwVZpFcm
 55tlVzLI3VAIY2SVYbac15gp4nr8xkXAhv/n/N0A6tOsNC5GTo5CDGEm4EIlSOLSov/GeNxLewZ
 0o+3jtys8ltYPoWrioXgcv8KegSuGdE1GspiNQ9x7pTWb2RLGkKWtUc1BFmK6/7JaP91CuRAks1
 M5c1PJXunu7/I6b+Kr9mRb9e4XlrVTU2J/4TiiHnG5aTSGNGZ68wBTfkNeUrGCS
X-Received: by 2002:a17:906:794b:b0:c26:22ec:db92 with SMTP id
 a640c23a62f3a-c317c193909mr504127166b.47.1791445945340; 
 Thu, 08 Oct 2026 00:52:25 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c317c17759csm186723766b.26.2026.10.08.00.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 00:52:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  8 Oct 2026 09:52:24 +0200
Message-Id: <20261008075224.3992252-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zlog: bump to version 1.2.20 and switch
 to the CMake build
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
