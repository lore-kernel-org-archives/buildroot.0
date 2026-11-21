Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B239606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 18:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W6g8boGR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDOupl7J
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 949CE80D85;
	Sat, 21 Nov 2026 18:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzXhXsfNJ-BI; Sat, 21 Nov 2026 18:02:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A35BC80D74
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795284150;
	b=rtaGQfTTrFTGcKMcOcvJUyS+pxAtkxcYFJGs8YMdVWN1G7DODRB8xQFlR+84qmmExqO6
	 r0ccVKHfVMccrC2lNKUKSCRauDZAAxyTzM2Sja4EcPgmRVTMWwPBp5nciptObfhF3jysS
	 0TnIuVBe+DivxvzmleHUjOJoYfREkyUTeElkno9P3CKFOXKBuybw0J+h79AndcIqYnlX+
	 rQyp7lQsyLqMbgpHA3PFgBh1yYeN9cB+Nx3kD0449VoiW48hZPbMzSWi9OBvpDbxLohsA
	 FLHCfMzkCTBXw2GpQXjZ3Y2SJtQYOeAlfwySB5BERqTcgd0CTdGMxBpE2Ga8dIzcVzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795284150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=xp9ITJu4Yuu9+MXSPC7otnKq0bojLhoKQFRGY3HRrxI=;
	b=N3ThhXy+WakJsPVt8apOPlMKYXitYnCtlVnCxycLp+0gq66b2lOXLWarkG4d/sLTheOf
	 4pvFkwShmUtl+IV+XxUbD7y62g3/De+On7XAbtdHMVnRbuaHMp42nuPYLsyYo68x+pBb0
	 2e1XDIKMXIkJfdpWOQPXW0XJLE0LAfXglqv4WOimikoSmRA0FN98lbPxWVt1dKjaSsuRk
	 AAU2aaWIPDa9oCLPogQgw2TBrQYd0J1BVPYu9Av9GlmDCxAKGkTW8M68G+7aWa04rbNWm
	 Vfoso3cPj40EbZRr42O5Qvr5ZKRA9wuh/VzmVAsaU8p8egB5qjPzumLl+3lm2auQyvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDOupl7J;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795284149;
	bh=xp9ITJu4Yuu9+MXSPC7otnKq0bojLhoKQFRGY3HRrxI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6g8boGRc47cmp0Fhw3aVh8IRjW+4U31hR50Wlya6HWSNA26Vy7Wx7SxUnl8ESTlm
	 ft2eu+6uXYJqGUAiZUJ0+K5IZHQcRLddnEA/GCTTYmCxNKW+JaLcghyVd83wdG3XiQ
	 5RV9C6/fJytatG+qqn2Qtah4QsvJ8M0Wj2UxwOUg1AUYUFXtVrI1sBtRCCr5V3DhY2
	 1W7wUlLB3uUL0jwJ0gLccmRSQa7wLJ90m1Ng81VNUEs/CLX2Jt9/avjAsPsPZjMByz
	 WjZGB8QtjA7BKbzN2HIsydung5d9DKmoh54NkJ8hkBu959CPNZ44yKFx/Z9R5t3bX5
	 Y87cSL+LoVwDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35BC80D74;
	Sat, 21 Nov 2026 18:02:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A19E759
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B98380D85
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDmvsYKcyKLW for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 18:02:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0D8080D39
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=KDOupl7J
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0D8080D39
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:02:25 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bb69f5b161so12331535e9.0
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795284144; x=1795888944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y/nh75eVfRe5BlxchutlDMBYOvUCtechSit3UpiJLIQ=;
 b=KDOupl7Jzl7VSruAcO9yqzeiSbdTsj2qqCZedMpPskVUBvci6wJgUEhxfXtBZ7e26v
 teB0qb6ZfhH9UTZES7v3wu6cKUsu44OwRV69hVq6lcP8fmJZTu2Kul1bvVG5gKSz1ac3
 eCUv7bbVeSQh1qNmULhZCDC9ANQj1oPEWLFNMgLU0HKcA+lebWVc112lT9BZCPnjAzHQ
 XboGkSuE7i7JQ52wQuQp8tJe+LsV/5vZIHeK14jsGbgedf2SjRWrqd3JjooikBnmGSZl
 /7iIDqzKmYNo9985974cLVyo2uen4aswlmGHqfk3xMHdvLKTjEfE1MHSWR7UpiDGRFSk
 wSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795284144; x=1795888944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=y/nh75eVfRe5BlxchutlDMBYOvUCtechSit3UpiJLIQ=;
 b=V33DFk/wEIi3P2lifXuJNEZuKiGVIC3dxgGPP1BBRKH/cgVK8yKrpCVbM1gw3H9Mvh
 wgGW6+aOID644LVtNr3qcKjmQpmJukndz0g+cpcudpa6+ZhkNkLdCv2xumv3LtV3csaW
 mjoNlD82VdXuSSTNejz1QkCIFKjwr+owz1OjqlMWZaH6G0rTMNrSkzXCKMIUfNQP2N8w
 c0cHkexdrCFUUYn5jNw/oASCFL7IEiTAnreYXouOpWvsqIdBtkCNbAJ1xVkUN5y7wxT0
 LbYLUde2+Zkkqt1DrpByMzwuKzv1M9oXfcc4MUsHKo0WkgiZ7VbRCIZtoMNXEKF8CBI3
 hPPg==
X-Gm-Message-State: APuU4Z/oGgEL7zZ+wBecxbexgWWCc18nHi9fV3cAps4g/p+Lk2ssm7fp
 ieLu1HbTSzcGYbHH6Ucvu9wXrvHHGnY5PUiueIJ5P/+xsz7Ei0L1a26UR2jQRqFX
X-Gm-Gg: AZFdTZf66kR3R1p6pLM0ZdbNHf5NjkdjQFzroE8Mm6mxpLmCFgvigOSaNIxAjzru9oi
 jk/64a/phvgaztgsnV7XO1RclA3k/CqoRg9E7mEmPXDUrk87Fnd+7+dTW56W8EBIM2ZFYVTwSzr
 Fp5j/Vwp+viFlxr0mRfHPvaZte7Zp+nFTPtqIHoUZRll9a5bareotQP1rgLCzyfwE/tQqND3ADq
 Xo5Pt17ZfedHycnWmlfXp8iceDYfxgYYOkvLaV82goQyvAFDS3O8yRpc+R+VEtov33JuRRJ/P2G
 b7b3Y04hUsHh00YMRSL4SPKwHM9iV++6I9NEC30SyClgL6wBFxlPHY0+zcK+i9Z70zPmZpf+fhs
 O1fv4vyjzHGSAW4j3fkAI7TTRKBpH0yJjSULFIyuaSNY2lKN2DjVzLWFSGZlrC+I1T983jctdDX
 UBGBjGpzwwVHl1jRJmInhN/csh3l+I67hO9hWGUquw8JC53kRg795rI0JVYJyXt87MjLYsYt7Pw
 rdwLDRkM64OO4OBUr0JfPM6Vj4akb0nFC+sFS/CP7NOVWdiHrPcJcuU7dXHkKsYMDADfbh7lqzR
 6WT3BTIoO9fbic4hdtdXtoD52iYEOWaYCU/4jE2czEYd5thfhC4=
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id
 5b1f17b1804b1-4bb888074bbmr174873055e9.12.1795284143642; 
 Sat, 21 Nov 2026 10:02:23 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab65cb41f4sm12364707f8f.7.2026.11.21.10.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 10:02:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Romanov <svromanov@salutedevices.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Romanov <svromanov@sberdevices.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 21 Nov 2026 19:02:19 +0100
Message-ID: <20261121180219.3583305-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121180219.3583305-1-angelo.compagnucci@gmail.com>
References: <20231117094429.30820-1-svromanov@salutedevices.com>
 <20261121180219.3583305-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/sysbench: new package
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergey Romanov <svromanov@sberdevices.ru>

This benchmark was designed for identifying basic
system parameters, as they are important for system
using MySQL (w Innodb) under intensive load.
Handling of IO in case of many parallel requests,
checked as well as memory allocation/transfer
speed and scheduler performance.
CPU is benchmarked by using 64bit integer manipulation
using Euklid algorithms for prime number computation.
Benchmarks are designed to show benefit of multiple
CPUs as well as of multiple hard drives,
battery backed up write cache.

https://github.com/akopytov/sysbench.git

Signed-off-by: Sergey Romanov <svromanov@salutedevices.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - do not select the target pkgconf and libtool packages: host-pkgconf
    is already a build dependency, and autoreconf brings host-libtool
  - add the comment for the toolchain dependencies
  - add a runtime test, on ARMv7: it runs short cpu (two threads) and
    memory tests, under a second each
  - .mk file: header in lower case, fix the ifeq spacing
  - help text: link to the project page, not the git URL
  - DEVELOPERS: add Angelo Compagnucci too
  - rebase on master

Supersedes v2: https://patchwork.buildroot.org/project/buildroot/patch/20231117094429.30820-3-svromanov@salutedevices.com/

 DEVELOPERS                                    |  4 +++
 package/Config.in                             |  1 +
 package/sysbench/Config.in                    | 32 +++++++++++++++++
 package/sysbench/sysbench.hash                |  3 ++
 package/sysbench/sysbench.mk                  | 31 +++++++++++++++++
 .../testing/tests/package/test_sysbench.py    | 34 +++++++++++++++++++
 6 files changed, 105 insertions(+)
 create mode 100644 package/sysbench/Config.in
 create mode 100644 package/sysbench/sysbench.hash
 create mode 100644 package/sysbench/sysbench.mk
 create mode 100644 support/testing/tests/package/test_sysbench.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 5812ce6484..d2175d4f6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -264,8 +264,10 @@ F:	package/rtl8723ds-bt/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
+F:	package/sysbench/
 F:	package/sysdig/
 F:	package/uthash/
+F:	support/testing/tests/package/test_sysbench.py
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
@@ -3103,6 +3105,8 @@ F:	package/xr819-xradio/
 
 N:	Sergey Romanov <svromanov@salutedevices.com>
 F:	package/ck/
+F:	package/sysbench/
+F:	support/testing/tests/package/test_sysbench.py
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/aoetools/
diff --git a/package/Config.in b/package/Config.in
index 199f8b0bc7..a72ad20b54 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -149,6 +149,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
 	source "package/stress-ng/Config.in"
+	source "package/sysbench/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
 	source "package/tbtools/Config.in"
diff --git a/package/sysbench/Config.in b/package/sysbench/Config.in
new file mode 100644
index 0000000000..e30f691081
--- /dev/null
+++ b/package/sysbench/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_SYSBENCH_ARCH_SUPPORTS
+	bool
+	default y if !BR2_powerpc
+
+config BR2_PACKAGE_SYSBENCH
+	bool "sysbench"
+	depends on BR2_PACKAGE_SYSBENCH_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # luajit
+	depends on !BR2_PACKAGE_LUA # luajit
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_CK
+	help
+	  This benchmark was designed for identifying basic system
+	  parameters, as they are important for system using MySQL (w
+	  Innodb) under intensive load. Handling of IO in case of many
+	  parallel requests, checked as well as memory allocation
+	  /transfer speed and scheduler performance. CPU is benchmarked
+	  by using 64bit integer manipulation using Euklid algorithms
+	  for prime number computation. Benchmarks are designed to show
+	  benefit of multiple CPUs as well as of multiple hard drives,
+	  battery backed up write cache.
+
+	  https://github.com/akopytov/sysbench
+
+comment "sysbench needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_SYSBENCH_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/sysbench/sysbench.hash b/package/sysbench/sysbench.hash
new file mode 100644
index 0000000000..a31fdb1178
--- /dev/null
+++ b/package/sysbench/sysbench.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e8ee79b1f399b2d167e6a90de52ccc90e52408f7ade1b9b7135727efe181347f  sysbench-1.0.20.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sysbench/sysbench.mk b/package/sysbench/sysbench.mk
new file mode 100644
index 0000000000..771745329a
--- /dev/null
+++ b/package/sysbench/sysbench.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# sysbench
+#
+################################################################################
+
+SYSBENCH_VERSION = 1.0.20
+SYSBENCH_SITE = $(call github,akopytov,sysbench,$(SYSBENCH_VERSION))
+SYSBENCH_LICENSE = GPL-2.0+
+SYSBENCH_LICENSE_FILES = COPYING
+
+SYSBENCH_AUTORECONF = YES
+
+SYSBENCH_DEPENDENCIES = host-pkgconf ck luajit
+
+SYSBENCH_CONF_OPTS = \
+	--without-lib-prefix \
+	--with-system-luajit \
+	--with-system-ck
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+SYSBENCH_DEPENDENCIES += mysql
+SYSBENCH_CONF_OPTS += \
+	--with-mysql \
+	--with-mysql-includes=$(STAGING_DIR)/usr/include/mysql \
+	--with-mysql-libs=$(STAGING_DIR)/usr/lib
+else
+SYSBENCH_CONF_OPTS += --without-mysql
+endif
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_sysbench.py b/support/testing/tests/package/test_sysbench.py
new file mode 100644
index 0000000000..45679bdd0e
--- /dev/null
+++ b/support/testing/tests/package/test_sysbench.py
@@ -0,0 +1,34 @@
+import os
+
+import infra.basetest
+
+
+class TestSysbench(infra.basetest.BRTest):
+    # ck does not support ARMv5, so use an ARMv7 toolchain
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_SYSBENCH=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("sysbench --version")
+        # Short runs, under a second each: the cpu test runs Lua code
+        # through luajit, and two threads use the ck primitives of the
+        # sysbench core
+        self.assertRunOk("sysbench cpu --threads=2 --cpu-max-prime=1000 --events=100 --time=0 run",
+                         timeout=30)
+        self.assertRunOk("sysbench memory --memory-total-size=1M run",
+                         timeout=30)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
