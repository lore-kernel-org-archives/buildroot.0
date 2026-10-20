Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026F606A31F
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sYnIE3KW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BDC280CEE;
	Tue, 20 Oct 2026 19:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaqfvigISExw; Tue, 20 Oct 2026 19:34:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C1B980C4D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792524842;
	b=fg6KVjQvtkoOEB5ntQTAZVWbqA3Srj35wyGPwtTjUCOj4G2mB3WFPRTq1l0fECAH0HPb
	 RwbQewAApo4KZ5z6MOIRIfvjBBQFGtGfdMOPslywZPrBx8CnWhPIa4q/cKmH4Zh2K+N3O
	 d1zFjTnpSZxB1ChD1h/BDOQvGBXaijFLHbA84ursg1bmO4zwTaDg5Pjc8UI/8XuU4IYtw
	 BtGwVwvOzmNjRwYl8ADJYE9SwlVVD+OZyIfI3u8bAsETDHx66Pi2HenhmZvmHfulKwS6z
	 QqVT9xcTQnM3iOtuTcljWiGa56OECeYhd/Hh90dqBVmCwrbyFqaPPdyC2MNMiPUXUYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792524842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=plfkZjC8HnaNiSAcfH91MUHKJxQPQOEsZqX0eYNefoE=;
	b=mQ8OIhobaEf5KzbOhguCztpSi/BJdTyJOS4B7x41Trtx814T7HSLF0CPCBf9V2y1/DQ7
	 Od6dJVFw59lDuroXq6unez/bmcDofwmASr80xGpcA0JNeGgZmKx/HxZKx1k28yz2FfSzJ
	 1l4O106y+ongKkfFzCtF4BVAgOXapF4QgJJT5E/F9uCynSdHKZSJ5QJrgYhNOVX1Fg7+z
	 h1mS0wBP0U0s9a8G+Bvo0SOdafWV5/ZIm0vAcpVGHLfDXCobPXfYMKlZgwhrSXA2PtMV1
	 mNf26/AiVVNDOnZB5Qp/kca0RqRfyarN0zTS4ICsiQpDs/NmwvoSRjL7GPm+jCHID2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792524842;
	bh=plfkZjC8HnaNiSAcfH91MUHKJxQPQOEsZqX0eYNefoE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sYnIE3KWqCcjxXuoYbZBQIpkyfUtAjXPwkZM6qohmvvyWuzZEGRoWmcseVc4fcEA1
	 yrcZ7WwfMyWVqMMO15xw4Ia+eaPO5pWnGv7WF4U3/8ss0ZR4eN52pHwTG5BXGHI3cm
	 VYMq6MTiL2hpGjzHAeZcGXwKNRwKW2zhMpJHeoqF1gT8AvpSpFdOx7DCz9u2B0eaTI
	 250RRHFF6YNa2AMAZx4pxMwuOhemRJhWAbGRjbiqKj/AwJqH5aW//gk7kfYpNdQrka
	 3JmLIlw7S6z8lrjzwnDNpc5jm1AVQihSECLZh1WJ05GOAe+V8ymL4/P4eSJ5YJajd8
	 zuZkrlUHCslcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C1B980C4D;
	Tue, 20 Oct 2026 19:34:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD7B8380
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BECAC60719
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZKfvzTzage3 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 19:33:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A9655605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792524838;
 b=bFaumI/cRNKZTfM17fm7rlhnUuDcUk8oEkB8sVprBBusYaR4QOTAo0AYsDaRpgfHZ2j5
 H1r9sYYmMI+65kVl9X3a+UjxSlp62NdoenLMUMIjNaTIORcg/BReiXaAAXEnX/DyMTmRU
 sO11kdqOQoulsfzdRnRXW9+KucRM5E8lvvyv+sGAHSLQOfWK+T1w0kqwJZ9eCvXtWC8S3
 YfHbdgkzXjrsmg6uKhFfw8p9CAqlch37+mn3Olxx57rr4MANkuoII/dVam/tic2ypQS1W
 AzGgKD2kgEOY3GROUJ/e3iDFDK+RN2fsJNF/RksO7nKwIWVi7JV5PJNuvAJJeYdTN/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792524838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eV8eXVkbJiFTzisCnRKFGXWd/blVkBEH9PuxnioHNUg=;
 b=XT7lll7V38G6+GJgsDpL2btdYjU0eQRqf+27/GLttP+xvjapK8gi1cmQfi23CRmPiu47
 3AujbM+8bdkNUhsdXs4pgX8wqrc3IgLhrpO/fRElqAwrX+Ob1Bp6KN4HoFlIKG7mLhKUd
 /+P/DvGt/fqSh2KOs82X0J3UewarTpGNXyOLvyX/DgBIbIbGhxtNUx8wBNxH0tRxKfchI
 vYhrNOuDmMLJfJxmavvGe8njpYxZDbMEJxWEQL7Tv4HKW2hqdnlG3qAikEA1VlE3NgSiq
 eILeqbnkqy/AMoVQYIP0KFTkNwnYb66hev5mwIFOJLG6FlnFPXU/yMMK4qAxT/k3Tsg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9655605F1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 19:33:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A91D9997F; Tue, 20 Oct 2026 19:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 21:33:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90aa723ddfdf8407481d3c02704b077ea6d79ed4
X-Git-Newrev: 9ec34dc363d7db8d5bc460d2607b1facf2103961
X-Patchwork-Hint: ignore
Message-Id: <20261020193235.7A91D9997F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chawan: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9ec34dc363d7db8d5bc460d2607b1facf2103961
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Chawan is a text-mode web browser and pager for Unix-like systems, with
a focus on implementing modern web standards while remaining
self-contained, easy to understand and extensible.

It includes functionality such as CSS, inline images inside the
terminal, and JavaScript through a small, independent browser engine.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/chawan/Config.in   | 15 +++++++++++++++
 package/chawan/chawan.hash |  3 +++
 package/chawan/chawan.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9bba0d9698..19575d5207 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3507,6 +3507,7 @@ F:	board/stmicroelectronics/stm32f746-disco/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
+F:	package/chawan/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
diff --git a/package/Config.in b/package/Config.in
index 6615c2b2af..f3e84b1484 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2456,6 +2456,7 @@ endif
 	source "package/casync/Config.in"
 	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
+	source "package/chawan/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/cloudflared/Config.in"
diff --git a/package/chawan/Config.in b/package/chawan/Config.in
new file mode 100644
index 0000000000..220c81a16d
--- /dev/null
+++ b/package/chawan/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CHAWAN
+	bool "chawan"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_PACKAGE_BROTLI
+	select BR2_PACKAGE_LIBSSH2
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A TUI Web-Browser.
+
+	  https://chawan.net/
+
+comment "chawan needs a toolchain w/ gcc >= 11"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_11
diff --git a/package/chawan/chawan.hash b/package/chawan/chawan.hash
new file mode 100644
index 0000000000..95f996d10a
--- /dev/null
+++ b/package/chawan/chawan.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e0a06e1504e10a51c6009751d79b798c98d8274e559fe195d4b4b7ddadf91bb8  v0.4.4.tar.gz
+sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
new file mode 100644
index 0000000000..9f36d300e6
--- /dev/null
+++ b/package/chawan/chawan.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# chawan
+#
+################################################################################
+
+CHAWAN_VERSION = 0.4.4
+CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
+CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
+CHAWAN_LICENSE = Unlicense
+CHAWAN_LICENSE_FILES = UNLICENSE
+
+CHAWAN_DEPENDENCIES = brotli host-nim libssh2 openssl
+
+ifeq ($(BR2_aarch64),y)
+CHAWAN_TARGET_ARCH = arm64
+else ifeq ($(BR2_x86_64),y)
+CHAWAN_TARGET_ARCH = amd64
+else
+CHAWAN_TARGET_ARCH = $(BR2_ARCH)
+endif
+
+CHAWAN_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	FLAGS="--os=linux \
+	--cpu:$(CHAWAN_TARGET_ARCH) \
+	--gcc.exe:$(TARGET_CROSS)gcc \
+	--gcc.linkerexe:$(TARGET_CROSS)gcc" \
+	PREFIX="/usr"
+
+define CHAWAN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(CHAWAN_MAKE_OPTS) -C $(@D) all
+endef
+
+define CHAWAN_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(CHAWAN_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
