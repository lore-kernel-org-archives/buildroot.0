Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE01606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c0eCXZmJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5oRBZDP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DB880DC2;
	Sat, 21 Nov 2026 18:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khViNGJqMA6Z; Sat, 21 Nov 2026 18:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3638980D74
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795284148;
	b=Ae5mGKopDBX5942fgIOr85+YS8i3q0IjaCbWwyvUPa9+CjO9ajfYHiTKJPStfRuiJGyz
	 3fcUx58AGFXF/QquUreheQPavk8l9OrarFfHx3yaQRoP5+ztIRNkdZ1lHIK8YN+Bz06MP
	 1wRTaLwA1P9a2Mq4PQuGzzEMdtFHwLdJweHUFTwzAamDI+f3znrlAKzmzT5E8k3bbxb69
	 TLFCVf4fxMGG9cJ4Qon7nNMSUNariUvgRpUijWcIWlNocceK/ZVYVZ57vgnXl0hm3kNhR
	 szU+3wrxMqElfba67plSHNej4lMMKO8EhHZiiSb9HBXSb8FlZ2IInSzmONYcCVkszjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795284148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kSFPPrdPcZyXUk1gjfN9UD3ZZC1uoZU/lyQ2Bx7KNKk=;
	b=JuMhFeYdusj+ru/lr7GGXa0XKDnPv3Ny7zFPLUK8Ru/at6w8UMSn4lc8mUSyDgoCUdTv
	 xh7+OsagyOlHo4BYlORtSOtatKAagZI0wJ8SE3UXLYvT5oByfRa7oDdbMO3usUVgCCpY6
	 kB9WhUCiYUE7u79+PJMxENgduwk1sUIYFcWlU0eez6kO/ws3z2YJuhy8PgupZt5jj4ZZK
	 a9oKCazCmukxzOlMbIz/VnnQ4bS/OPA6f0fNYls9vD4P013ZGtwZtSPqfR5VsyHeAI6Dn
	 0VMuz/+nNFIqaYl6354iWfGNrlI8WeXZtRBZ5D9kEp1jt7AHM0P8ytYEeedLzT21r4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795284148;
	bh=kSFPPrdPcZyXUk1gjfN9UD3ZZC1uoZU/lyQ2Bx7KNKk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0eCXZmJRWh5besXP+9tVhcbuau46mLuv9/cNZKHfvbUfDIlnUBiBOu4eGe2DWPE0
	 2xhielAcDRL1VutwFFTJv3eaiCzit2GXJ7Shna0eCoPB7YSgLVzoi9h2esEBFAz5+K
	 481jccKq9ISHkTNe/GrMj4pyfCwttionSAj7TCir0cWvAZvFz32Esnp4lETP9UUF0B
	 AgFRddFgxKKxI3dMgRNDsnqPfKX5FHdWJYoZ3dO3s46mt6h34T5IY65jTawneunc2v
	 mvHNDoZUW2APXdIUjehadjI08pgRmSUV3DVzsx8BLyOd9j/crkcHU2V9TGzkb6roQu
	 vCcXPHnBZ9QTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3638980D74;
	Sat, 21 Nov 2026 18:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B307759
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C74840081
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5M5elUR2bIrj for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 18:02:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3115D40012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=q5oRBZDP
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3115D40012
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:02:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso896107f8f.1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795284142; x=1795888942; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lMtOchm9Wue1BYvZfKDuqdHj4IT7F/b1cFGR2kxoPoc=;
 b=q5oRBZDPAcGS3qfdP523kYTcjKv4rgD7Hodh0LcZvlT1kkYfwOiVupv7I/YfYQ7YUe
 nOocnqPpyuNPSnGlSnqqvyQBWb7wT7BjJabhZfZV5zlCcEpIcJvma3Ujk54KaPUeNLYS
 Z40/BuGshL4+0arOMFhTIrEB7UV/7U3mx9QdUlXqJhgSUyHEZFaPCYRXqE0rFZfEjbtH
 MLSSE6EkROrd3XFd0DcCwWLPQPjEa4BSl6kMDyAlwMQ6w8BSabem4/6g2zXodtI5nVOx
 tVpayTCQ8DeyINT5udd+QaackU0VE3LiJK0irih3v3Hh9tjEqv8zFwil6cj7MhRDbcN9
 zDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795284142; x=1795888942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lMtOchm9Wue1BYvZfKDuqdHj4IT7F/b1cFGR2kxoPoc=;
 b=13QO/IrVZu2yyNrYsig+VnQ4hzA1CHXh/Hj7ID1a+Dcokw0/SYNB607qA+x4RBUe7y
 eoZlvKH+E9FyxyTPbEeER7HqdW2B8mYYZzu7T7o1mLKSXBx+wsuyos4vEufPDXTHtiTo
 nDyEzANKT0CZ5ltR05xmfGlMWyt/UKswgVRdvCnzd+f+7u4lZDPkY0PBMiDcySGUpgdG
 og+qryj4k+IUsXblGzycz6g5JRShfKeDMQL3hQO+u4JoNGGLcO3lknYsFigQYgiYakbg
 5wZLYCGugbHy40601VuqwXd2GjERy81l9/9RSusyCdkGVZScK53lP+cjUZh/Jn1q/AUy
 sOlg==
X-Gm-Message-State: APuU4Z8ojmSorGSUKtGJ/TjnNTis1QkAixdSirCYRJBYTgcBuWoSd4ed
 WVeC0XtiEJ786xeSsgoHxniaFNQMur0hIsTEEMN/ePm1l3vEAr/Wn6CldStBd91K
X-Gm-Gg: AZFdTZfh2DzyIDSWVCp9EgYywKXYjbip+oidnYew8weejC4fSsAorvtHi7AlTU/xT+D
 1+C4n7IsjiXJmvM81lQn0fkKd7Bvb4JRO2L+gRLhj5NhBzYztuvTSE/Ip0RmaYFu3uTRwirbtwS
 0kAPwuGiGenCjuhYH6BbtD12EFCE1oQ2Ggh9Ej5nBdnSO+RGqrldN1FXS4sSff2Z+M0usDantWa
 BtyiWco5YplZO5g3gDUEya2oWuPj76ltL8w8jMkTKtUzptgJusc1BqpCBC4cKzaUS0ajztSzKeK
 /MhzECOtQTDnV/+TxIoqF1B1+PVAKZUEJVXqgN4JhjTSK7vUG7lb29I7ADNF0L7b8ycFPxVAiJF
 ruXKOusJkXuRl2TPSX9rsehvzwtg+Ba6uFC6GPJuaWCyefTcXPWdQyKaikhFpGWeo0CJWQXU5kl
 ISUx85GcPgaZLD+dqz/Efs3LpzPngs6jA+2s8snq5YTLDAeuZpU0KS83/TM2jkoypxk6ptuwXmY
 H4CdZLrg6NxwwTnS9FFtXmIcYg9Kh0gbiBG7cLJu5+Yy4n6VgP/wifvFN5TFENSbVQw0PpnaBoE
 mv0bLz5UaWsWum6Al4yj9tk/wUrskegyS0hF8iqu2/VXZ+LIhoE=
X-Received: by 2002:a05:6000:4a0e:b0:48b:451:4f19 with SMTP id
 ffacd0b85a97d-4abb7971c1dmr13859191f8f.51.1795284141529; 
 Sat, 21 Nov 2026 10:02:21 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab65cb41f4sm12364707f8f.7.2026.11.21.10.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 10:02:21 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Romanov <svromanov@salutedevices.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Romanov <svromanov@sberdevices.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 21 Nov 2026 19:02:18 +0100
Message-ID: <20261121180219.3583305-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20231117094429.30820-1-svromanov@salutedevices.com>
References: <20231117094429.30820-1-svromanov@salutedevices.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/ck: new package
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergey Romanov <svromanov@sberdevices.ru>

Concurrency primitives, safe memory reclamation
mechanisms and non-blocking data structures
for the research, design and implementation
of high performance concurrent systems.

https://github.com/concurrencykit/ck.git

Signed-off-by: Sergey Romanov <svromanov@salutedevices.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - bump to version 0.7.2
  - move the package to the "Other" libraries menu: ck is a library
  - do not force -march=armv6k or -march=armv7-a: Buildroot already
    passes the CPU flags. Instead, exclude arm1136j-s and arm1136jf-s,
    the only ARMv6 cores without the ARMv6K instructions that ck needs
  - exclude i486: the configure script stops on it, ck needs at least
    an i586
  - pass --disable-sse on 32-bit x86 CPUs without SSE2: else the
    configure script adds -msse -msse2
  - give --platform the name ck knows: powerpc64le is ppc64le for ck.
    --platform sets the memory model of the target in ck_md.h
  - pass AR to make: the configure script does not set it, so the
    static library was made with the ar of the host
  - keep TARGET_LDFLAGS instead of replacing them, and drop -m64: the
    x86_64 toolchain already builds 64-bit code
  - build only the libraries that the configuration asks for: shared,
    static or both
  - simplify the .mk file: one variable for the profile, and the
    configure options inline. Explain why the configure script needs
    --profile
  - help text: link to the project page, not the git URL
  - DEVELOPERS: add Angelo Compagnucci too
  - rebase on master

Supersedes v2: https://patchwork.buildroot.org/project/buildroot/patch/20231117094429.30820-2-svromanov@salutedevices.com/

 DEVELOPERS           |  4 +++
 package/Config.in    |  1 +
 package/ck/Config.in | 22 ++++++++++++++
 package/ck/ck.hash   |  3 ++
 package/ck/ck.mk     | 72 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 package/ck/Config.in
 create mode 100644 package/ck/ck.hash
 create mode 100644 package/ck/ck.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..5812ce6484 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -227,6 +227,7 @@ F:	board/sipeed/lichee_rv_dock/
 F:	configs/sipeed_lichee_rv*
 F:	docs/website/
 F:	package/apparmor/
+F:	package/ck/
 F:	package/corkscrew/
 F:	package/cups/
 F:	package/cups-filters/
@@ -3100,6 +3101,9 @@ F:	package/rtl8189fs/
 F:	package/wpa_supplicant/
 F:	package/xr819-xradio/
 
+N:	Sergey Romanov <svromanov@salutedevices.com>
+F:	package/ck/
+
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/aoetools/
 F:	package/asn1c/
diff --git a/package/Config.in b/package/Config.in
index 49659b007e..199f8b0bc7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2172,6 +2172,7 @@ menu "Other"
 	source "package/catch2/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
+	source "package/ck/Config.in"
 	source "package/llvm-project/clang/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/llvm-project/compiler-rt/Config.in"
diff --git a/package/ck/Config.in b/package/ck/Config.in
new file mode 100644
index 0000000000..273e58c398
--- /dev/null
+++ b/package/ck/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_CK_ARCH_SUPPORTS
+	bool
+	# ck needs the ARMv6K instructions
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && \
+		!BR2_ARM_CPU_ARMV7M && !BR2_arm1136j_s && !BR2_arm1136jf_s
+	default y if BR2_aarch64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
+	default y if BR2_sparc_v9
+	# ck needs at least an i586 (cmpxchg8b)
+	default y if BR2_i386 && !BR2_x86_i486
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_CK
+	bool "concurrency kit"
+	depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
+	help
+	  Concurrency primitives, safe memory reclamation mechanisms
+	  and non-blocking data structures for the research, design and
+	  implementation of high performance concurrent systems.
+
+	  https://github.com/concurrencykit/ck
diff --git a/package/ck/ck.hash b/package/ck/ck.hash
new file mode 100644
index 0000000000..ba99f24c59
--- /dev/null
+++ b/package/ck/ck.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  568ebe0bc1988a23843fce6426602e555b7840bf6714edcdf0ed530214977f1b  ck-0.7.2.tar.gz
+sha256  21a861f554f8f97047815e63ff5cbd57707b4c53dc1dd1b0f2dd43e6ca193464  LICENSE
diff --git a/package/ck/ck.mk b/package/ck/ck.mk
new file mode 100644
index 0000000000..28bc937eac
--- /dev/null
+++ b/package/ck/ck.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# ck
+#
+################################################################################
+
+CK_VERSION = 0.7.2
+CK_SITE = $(call github,concurrencykit,ck,$(CK_VERSION))
+CK_LICENSE = Apache-2.0
+CK_LICENSE_FILES = LICENSE
+
+CK_INSTALL_STAGING = YES
+
+# ck names of the target architecture: --platform sets the memory model
+# in ck_md.h, --profile selects build/ck.build.<profile>.
+CK_PLATFORM = $(if $(BR2_powerpc64le),ppc64le,$(BR2_ARCH))
+CK_PROFILE = $(strip \
+	$(if $(BR2_arm),arm) \
+	$(if $(BR2_aarch64),aarch64) \
+	$(if $(BR2_powerpc),ppc) \
+	$(if $(BR2_powerpc64)$(BR2_powerpc64le),ppc64) \
+	$(if $(BR2_s390x),s390x) \
+	$(if $(BR2_sparc_v9),sparcv9) \
+	$(if $(BR2_i386),x86) \
+	$(if $(BR2_x86_64),x86_64))
+
+# On 32-bit x86, the configure script adds -msse -msse2 unless told not to
+ifeq ($(BR2_i386):$(BR2_X86_CPU_HAS_SSE2),y:)
+CK_CONF_OPTS += --disable-sse
+endif
+
+CK_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+CK_LDFLAGS = $(TARGET_LDFLAGS)
+ifeq ($(BR2_STATIC_LIBS),)
+CK_CFLAGS += -fPIC
+CK_LDFLAGS += -Wl,-soname,libck.so.0 -shared -fPIC
+endif
+
+# The configure script runs a test program to find the compiler, which
+# does not work when cross-compiling. With --profile, it skips that
+# test, but it does not set the compiler and linker flags, nor the
+# libraries to build: set them here.
+define CK_CONFIGURE_CMDS
+	cd $(@D) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CC)" \
+		CFLAGS="$(CK_CFLAGS)" \
+		LDFLAGS="$(CK_LDFLAGS)" \
+		ALL_LIBS="$(if $(BR2_STATIC_LIBS),,libck.so) $(if $(BR2_SHARED_LIBS),,libck.a)" \
+		INSTALL_LIBS="$(if $(BR2_STATIC_LIBS),,install-so) $(if $(BR2_SHARED_LIBS),,install-lib)" \
+		PTHREAD_CFLAGS="-pthread" \
+		./configure \
+			--prefix=/usr \
+			--platform=$(CK_PLATFORM) \
+			--profile=$(CK_PROFILE) \
+			$(CK_CONF_OPTS)
+endef
+
+# AR is not set by the configure script
+define CK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) AR="$(TARGET_AR)"
+endef
+
+define CK_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define CK_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
