Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AF606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SEdFZLbL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CD580C41;
	Mon, 26 Oct 2026 21:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDaa7aauVVrU; Mon, 26 Oct 2026 21:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 01C9780C5C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793048868;
	b=cmD3YZ5ae61UpyoMEJg9t7zkM/VXf24adfvB6ZD2cTwuu7TKB7R5ffBUKjKeGgvGPzb6
	 Y9bWemLIJ7pSgISsIfzmWtvXwOtUffVThIXB094Z6oksoH06+NnRraxsyF9Ci75uN+SG6
	 CUXuA2dgIhKzt4A+6H558kXUqD/JHS1VV9sR2D4iJWJrk6+MFEa3BsW4Cc9ED2R5kPZFB
	 ZY3VVekZvdwoC2UYNTpy8mWZsjzfuZNN6tnkJSXLrZO5FfI3vuMBulmVlaCsPovdMGzXp
	 +Vw7oVqwTXuNPhCgYZvzYZhctqGnhK3SjHMDeDujj6LZ2YRj7G6ng04SXtFIrWExFgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793048868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SIsa25biAt0PIy4x1hJwzCQD7MNuH+1KyB0NH2pbbsI=;
	b=qD1BXcbZI05dvxB47jV0tvPTfsAhlknL+AcfJi2VsdJMenrXcU83ucLMrrvfyiZv2JBi
	 rAy7uiQmbjOZpwLugCUx6d2dPZ9v6XyuhAh6qRCAnO+dHXI/sdM/fF+T6nXSUq+hASHRz
	 CsFk7zDFrswuEU1oCsCQ7H3GhRWAiKO6sHB/ikyMM85x+9mpqsAqcU7kmsV+n1Vx6U2/X
	 /DqlGWFtYw/GRWobRsClzUpVtpm3fIz+rtxa1jG3yDwGhWwDNUvQqS//XSy2nkBatsiLX
	 iQw9w4etnGLXnu6o+S5iGZtPGRHOcKZ52wNv0A0CyTbDRjBF732ZJAXC3cPkaBBHVJg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793048868;
	bh=SIsa25biAt0PIy4x1hJwzCQD7MNuH+1KyB0NH2pbbsI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SEdFZLbLC/SA/GPvNx3GR5fcivtPF/A2usxRByX4TMiCTRUHTH5TI9aHtVQ0wBNaB
	 cOS9kQBJz1TyNjB+mSHAuli8gMKsG3uSr6QnXXPOGcwB9dBVwqdeaqoN9fknWe11Kh
	 jhTC4XUfXvTM871WfYXd3lG8rq6qiLlf3IN1yBzAfees5Tm2kymKlFwLkxkmlhwBtH
	 jbkHWXBDuYVsrE2NcgicM/tNTkTrEiQIPAIzpLfOU8qJzxDVaYg6ZNmckm/k5uN0aI
	 znqrDSN49RZ7eLaWwPpWYLdxzek/ritnBGbz2Kmd3BNJZ22GAl5tkNt6tyjY6q3HaP
	 0lEaPenwNRnhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01C9780C5C;
	Mon, 26 Oct 2026 21:07:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C888235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6F6460607
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awvXco6nOcAq for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 366AF605B5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793048865;
 b=k0gq9yHDsCCfnaGgtTT+7FFwQAXMWqGxDOMRy96z43SVcPn5joRHfulk5C3bMKrkNlit
 +/iO+UNQuOXCPK8ah+XnRQaFTIIhZcBLB9JhRIjDFHRqueDgYfleIrToxIlhJ4MChDq9p
 zpSFRED/CTe5ia4Ipi1KwxFUY+1WtTxh+ztX7Yumj4I834lzOdSSQbLvmGMdFPr4I/eTP
 cEcNdIG8iSnjGQV2pz60AYnsL8ZW9Mm9KmG2AM0QVX9uMRe2J4TvgBx6Q2Bceg9q97Tdc
 5pm/PAAovF7Vc3NsxQBGovo0FmpvoD8Ughd8lanx8imgj9mbqcEEoNy7gRu0uHv/QiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793048865;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PtOp3+3IBtcFXaicJ1CEsTbvntqo78SyoCJejzGSy54=;
 b=ZCZSbtEDG68DmY06Td92euA66uB8P4MSsjBMo4bQds9ZX0vNKIxMntF3sbIXTJZYHNje
 ZJ3R/+/4vFkiNxm9Fx9KJaNBS8eXpkfVVufI7XhS8krVLI8f1cWkCIb6B3p4/6qbBcaPZ
 onIHthhAbarf01HfZVYbppCDva+4Joxs4a5hWAVcsB2q4axGTzZCZBIPcudNQp/0hDLDp
 14yfz96zDOmAlQa8EC1uQog6pYYnJaKDLyJckHkemFx07QKhP7hFwFZ8Ci9WbfEubFi76
 8/gUjnpMQmZrjyWMxv6PzkIiuYTiZilfuGkDjG/edi02/ZLMie0qyarqI12wxYu/XJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 366AF605B5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:07:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 176A89CFFF; Mon, 26 Oct 2026 21:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 22:07:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56f15ebd01b1057fb7d28574c4176e837b586fae
X-Git-Newrev: 562171bf85606c6f9bc552073695fa7ed910aabe
X-Patchwork-Hint: ignore
Message-Id: <20261026210619.176A89CFFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sema-linux: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/562171bf85606c6f9bc552073695fa7ed910aabe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the unified sema-linux package, which replaces the archived
sema-linux-ec repository from Adlink. This unified upstream repository
provides support for both BMC (Board Management Controller) and EC
(Embedded Controller): devices.

Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  4 ++++
 package/Config.in                  |  1 +
 package/sema-linux/Config.in       | 14 ++++++++++++++
 package/sema-linux/sema-linux.hash |  5 +++++
 package/sema-linux/sema-linux.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0da286107e..b4ada4e1f9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1761,6 +1761,9 @@ F:	package/autofs/
 F:	package/dawgdic/
 F:	package/rapidxml/
 
+N:	Jorik Devreese <jorik.devreese@barco.com>
+F:	package/sema-linux/
+
 N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog/
 F:	package/python-simplelogging/
@@ -3248,6 +3251,7 @@ N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/librdkafka/
 F:	package/libsoup3/
+F:	package/sema-linux/
 F:	package/yq/
 F:	support/testing/tests/package/test_fluent_bit.py
 
diff --git a/package/Config.in b/package/Config.in
index d3bef2d5f0..796c4f1ad6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -615,6 +615,7 @@ endmenu
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
+	source "package/sema-linux/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
diff --git a/package/sema-linux/Config.in b/package/sema-linux/Config.in
new file mode 100644
index 0000000000..04a1448444
--- /dev/null
+++ b/package/sema-linux/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SEMA_LINUX
+	bool "sema-linux"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  SEMA (Smart Embedded Management Agent) is an agent used to
+	  manage system health and access the I/O pins through an API.
+
+	  https://github.com/ADLINK/sema-linux
+
+comment "sema-linux needs a toolchain w/ dynamic library, Linux kernel"
+	depends on BR2_STATIC_LIBS || !BR2_LINUX_KERNEL
diff --git a/package/sema-linux/sema-linux.hash b/package/sema-linux/sema-linux.hash
new file mode 100644
index 0000000000..a66c0ade05
--- /dev/null
+++ b/package/sema-linux/sema-linux.hash
@@ -0,0 +1,5 @@
+# locally computed
+sha256  510d30023e8216626bfd0fafa9bc75ad5f9f8e7c98eed3fe2a23884c6a3b361f  sema-linux-v4.4.5.tar.gz
+sha256  71be2577bc5028f0e15bb170439878b61593967460e88e0d26a889430a32db00  LICENSE.BSD3
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE.GPLv2
+sha256  f484be998be05569aa68e5afb1d29a37cbe2cc7947aea66df83bab7bbdfd74f3  LICENSE.dual
diff --git a/package/sema-linux/sema-linux.mk b/package/sema-linux/sema-linux.mk
new file mode 100644
index 0000000000..1fd2e37167
--- /dev/null
+++ b/package/sema-linux/sema-linux.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# sema-linux
+#
+################################################################################
+
+SEMA_LINUX_VERSION = v4.4.5
+SEMA_LINUX_SITE = $(call github,ADLINK,sema-linux,$(SEMA_LINUX_VERSION))
+SEMA_LINUX_LICENSE = BSD-3-Clause or GPL-2.0
+SEMA_LINUX_LICENSE_FILES = LICENSE.BSD3 LICENSE.GPLv2 LICENSE.dual
+SEMA_LINUX_DEPENDENCIES = util-linux
+
+define SEMA_LINUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) app_build
+endef
+
+define SEMA_LINUX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) app_install
+endef
+
+define SEMA_LINUX_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BACKLIGHT_CLASS_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIO_SYSFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIOLIB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HWMON)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C_BOARDINFO)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NVMEM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG_CORE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
