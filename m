Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F3E606A333
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KH37KJWC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=iLAVf7MO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68474811F5;
	Wed, 11 Nov 2026 09:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hyyVJ8W3J3S; Wed, 11 Nov 2026 09:26:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C5E7812D5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794389164;
	b=jCGOKjSoCUouYm7JZEk2i1uujsWIcTzYWeBakGTN85aA/pGdKX8byiNJygXO9R38wYSh
	 1foXHoxlcTVpo3kG0duyD3i4M1/jld+71DdiNpTfunA5VkS+TAvgGw1ireRjccAf9So0u
	 d0Gx94zfU30nHzG5zDFnaDw43bpbZlupvf9iKN+lniztARfgEm1udFjB7oGh3EGxmoGVB
	 p8Hjeeoo0HXskcxfzHTxk0H4NnJW0MtUMyagn9IT2DeZ2uGaalyUXMnpYvViFB0brtCg/
	 JkRL0ZdA1JYw4exOOXktbsJoqWJ1XqUIVDkomJrix07wtbHXeHjEHUFjX+yPgBEMReg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794389164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w+DERVRvcELnsVHVK0WbtGc84bWezUuioglCLWVrdL4=;
	b=IH1dBPkC6tvEvPGoQlkeaZF7X/t0YnqF7m7IlSR8s445Kjb2GspgEEMxD1aNTEgrIZIZ
	 sAddBHeK8Ibepdq5E/T8IIXZibMbIO9PXa2myFmiHDUev91J1lWRQc5fzDAneLjsUoXe3
	 sTq1uhkHNenVZT3KCmB0gb9L0PYGphYyfp/cWE+Yp6xx5vHIZIRba9m9OQYtQM73paaZ9
	 F4DTtLk+txhSLvQBJSp9g5ZGwJATB1zuwTbJR8wTWBEpXzRgyHnl53RCXRSA5oyj6d2Xj
	 swAI4E73drwWwMhz3HVej7wg4z0WJvCclmcPWJbyH321osAU6CD6Uz+pOTzjU3HfgcA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=iLAVf7MO;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794389164;
	bh=w+DERVRvcELnsVHVK0WbtGc84bWezUuioglCLWVrdL4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KH37KJWC2pE7vmWxwxupbO5l25Lm9/IV9an15kn9ASt0AcSHRUdFQyoxGkM4dL3b1
	 VyhfJSaldUrCJZf/0s8j47nAg6cBSJi7BxUJCzMoy3xtU/o9RY3v/vMSSw02go57Ej
	 tMKj4U374r2z5a45xadzBxRIl6lO848ltZ8CcmgdtVqLGcHkwGFDtSOtqWNpEB+86f
	 62GWAeA9NGRCQENXzzaG6zhSSZFqw1ueo2VHe74rR1/ZWh5WEfJj6URJjzV4oWowEV
	 DGgHM3vXA99cX9/Kl1WzbzCoycKOvT0yNuiPu5lQ3djS1lH5XMWWZqM69T9BMYWDQN
	 bpICoH4F8KHEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5E7812D5;
	Wed, 11 Nov 2026 09:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1188C731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 09:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02227812D5
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 09:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3S7x2Kn4Pzxn for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 09:26:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC87D811F5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=iLAVf7MO
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC87D811F5
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 09:25:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c4cac7a7d3cso418139766b.3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794389157; x=1794993957; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XZJ0t9NyRCrc1A5ZJSCpNlyjYMf29uwPDiyzSRkt0po=;
 b=iLAVf7MOC/ytImT9Pxp81HTMXunwYd0RjR4oOuo2VYSnruI/hxNtAwAaCKNDJRTVH1
 sSjnfKYfsiQ5RcJHGZGB1g9RVYGq/qr+QZ0nDQaAXMpcWSXzuXDXEE9jqhgkPoq65dwR
 VRf7lT4/8+qF/ELzRAR8MyTGgHJO82O7O+vWumX5jgGv1Z/Nva8aE77gdMWXbIwJs3+0
 c7XSiNZX5DGgVrvCS5qb0HYWWMSQhpo9M62JulinAnxLCqgDZyAHk0mupde/ze7apPp3
 5yIHTmF8suDkSDwT0OBJUIm57tgH1mc/MEGmvbpG9m9tM3JCaYw014yVZdc+LFzB7uWZ
 GkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794389157; x=1794993957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XZJ0t9NyRCrc1A5ZJSCpNlyjYMf29uwPDiyzSRkt0po=;
 b=DEpihpZqqv/fe0IgziZkHUbBU8v4oi1LmDhPbLBOMdTNcbKNWUz6HVBcuPrAdR2Av9
 K/7olO39MFi9nzHsOC5tgVmCkdxItx6ooWvomhE7E8Ke0yk3Lm1NYEnUOiXDVU//mWT7
 VpTBa7vT1idV1dYYQQLmBMQYuTAUpUUBDon/4k+SM3VFerXjRMasiNaFVZ6cDLUD367Y
 /U1v9AO8Tg+6Ynxkz0Xxp4F1hJUQHVzY4Tcr51rjItO0NmIPaqPKT0o3O1R7m1TE/pga
 rtO6IAWP+NUy9Q1ByOX3mfBIfpxHEmUTeIiVUxYH2zNGzqBc5NZ1Un7KDZKPBLSvxGpu
 dgZA==
X-Gm-Message-State: APuU4Z84PSBxNPh0cqHKAiZB27+PaOJTRS36RLmLS0S9bYOWird1d0eT
 GVkITE7/d9HfjifgI5ncDjEtvWU2LhwUEBdsgEFp4q8iIMgfH07mvS7wppD9Ag==
X-Gm-Gg: AYBFou17HXuLHbgoH1QrvnBA3OqcHeE8cFCZOhDjiZmgyumILDwlL7J2cTbTnD3IdQs
 QiM4HyGHU3o/1zYSkRWaCx41ekHmKCcELy9an44a4ye+cNtXdcQZOBSUx0AFXbTJAgP9PtaRr/f
 5HNiAprWoaV/6kLiBL63IcMVGmcZIzQKhBhBE3qXRHYRHghpLdLjgmfgKDNeF3tjbbg2XZObFVi
 TAfPeyrkmnlfcCcO4LMKJLxT3RSzMQWCKDGBpwd5gJGYS23sYikdwofw9D0UOjaCMs0QCiDq1Hp
 weovH8lkz02Ho/JTvntCv2EPzuJRwqRBpJHxf41kd7vOr3URTUK5PoChglDycsMO2eeHwOseRqO
 yuLidrCu4unR2VjK21z80PNE0FE8bhQQmjaJazEtCR2+JupvcjsX9flQCb57zCVXuOP9W8BmEoK
 2zF7d+810iCmOgln+xIZBFL7AqnDHYb4kuhJBk1nLblFxITAX1m19wO9LOVfqjEGXB+knxoN/3C
 xSS0CVVDUQz3ZLqKQVCh/r7qsgdoiaDitZqTbY6pqUMKDF5WZQwsXXeTQWsrrIPECzyLcL9ejMk
 Y6g/7FJspMnwWOFxgKxB912q2/FkCwwlpJ/Bouc7LiwUnK6CResIOaL/+76lojj5TScm3h2FUdY
 HMfpT0ALJZw==
X-Received: by 2002:a17:907:94c4:b0:c33:392f:7ca1 with SMTP id
 a640c23a62f3a-c5066aa886bmr125167966b.17.1794389156745; 
 Wed, 11 Nov 2026 01:25:56 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a3a6930sm217213666b.5.2026.11.11.01.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 01:25:56 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Nov 2026 10:25:55 +0100
Message-Id: <20261111092555.840672-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmad: bump to version 0.16.5
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The original libmad upstream has been dead since the 0.15.1b release in
2004. Switch to the fork maintained by the Tenacity project, which is
packaged by most distributions:

https://codeberg.org/tenacityteam/libmad

This fork uses CMake instead of autotools, so:
- convert the package to cmake-package;
- drop the hand-written mad.pc, as upstream installs its own;
- drop all patches: the MIPS and CVE-2017-8372/8373/8374 fixes are
  included upstream, and the configure.ac ones are no longer needed.
  The CVEs only apply to 0.15.1b, so the IGNORE_CVES entries go too.

Add two patches:
- a backport of upstream commit 9dd96b40c5ca ("CMake: case of AND
  test"), without which CMake fails to configure on 32-bit ARM:

    CMake Error at CMakeLists.txt:86 (if):
      if given arguments:
        "ASO" "and" "FALSE"
      Unknown arguments specified

- a pending upstream fix for the PowerPC detection, without which
  PowerPC falls back to the generic, less accurate, fixed-point math.

The CMake build only offers a speed vs. accuracy choice and the
architecture-specific optimizations, so:
- the "Default" optimization choice is removed, as CMake always
  selects speed or accuracy; speed is the new default, as upstream;
- the subband synthesis optimization option is removed, as it is
  implied by the speed optimization;
- the strict ISO/IEC interpretations option is removed.
Add legacy entries for these options.

The ARM assembly optimizations are disabled upstream, so the ASO option
no longer needs to depend on the CPU supporting the ARM instruction
set. The FPM_ARM inline assembly still needs ARM mode, so keep forcing
-marm on Thumb builds.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |   2 -
 Config.in.legacy                              |  23 +
 .../libmad/0001-CMake-case-of-AND-test.patch  |  32 +
 .../0001-mips-h-constraint-removal.patch      |  72 --
 ...CMake-Fix-PPC-Architecture-Detection.patch |  32 +
 .../0002-configure-ac-automake-foreign.patch  |  16 -
 .../0003-drop-GCC-fforce-mem-option.patch     |  18 -
 package/libmad/0004-md_size.patch             |  63 --
 package/libmad/0005-length-check.patch        | 821 ------------------
 package/libmad/Config.in                      |  24 +-
 package/libmad/libmad.hash                    |   5 +-
 package/libmad/libmad.mk                      |  41 +-
 package/libmad/mad.pc                         |  11 -
 13 files changed, 103 insertions(+), 1057 deletions(-)
 create mode 100644 package/libmad/0001-CMake-case-of-AND-test.patch
 delete mode 100644 package/libmad/0001-mips-h-constraint-removal.patch
 create mode 100644 package/libmad/0002-CMake-Fix-PPC-Architecture-Detection.patch
 delete mode 100644 package/libmad/0002-configure-ac-automake-foreign.patch
 delete mode 100644 package/libmad/0003-drop-GCC-fforce-mem-option.patch
 delete mode 100644 package/libmad/0004-md_size.patch
 delete mode 100644 package/libmad/0005-length-check.patch
 delete mode 100644 package/libmad/mad.pc

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c668db54..ead02d6e02 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -481,8 +481,6 @@ package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch li
 package/liblog4c-localtime/0005-Fix-C-support.patch lib_patch.Upstream
 package/libloki/0001-allow-to-install-to-a-specific-location-using-DESTDI.patch lib_patch.Upstream
 package/libloki/0002-use-ln-snf.patch lib_patch.Upstream
-package/libmad/0001-mips-h-constraint-removal.patch lib_patch.Sob lib_patch.Upstream
-package/libmad/0002-configure-ac-automake-foreign.patch lib_patch.Upstream
 package/libmng/0001-jpeg-9a.patch lib_patch.Upstream
 package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch lib_patch.Upstream
 package/libmpeg2/0001-altivec.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 0ee4d04751..9ef6e68310 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,29 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_LIBMAD_OPTIMIZATION_DEFAULT
+	bool "libmad balanced optimization option removed"
+	select BR2_LEGACY
+	help
+	  libmad, since its switch to the CMake build system, no
+	  longer supports a balanced optimization mode. Choose between
+	  optimizing for speed or for accuracy instead.
+
+config BR2_PACKAGE_LIBMAD_SSO
+	bool "libmad subband synthesis optimization option removed"
+	select BR2_LEGACY
+	help
+	  libmad, since its switch to the CMake build system, no
+	  longer offers a separate option for the subband synthesis
+	  optimization. It is enabled when optimizing for speed.
+
+config BR2_PACKAGE_LIBMAD_STRICT_ISO
+	bool "libmad strict ISO/IEC interpretations option removed"
+	select BR2_LEGACY
+	help
+	  libmad, since its switch to the CMake build system, no
+	  longer offers an option for strict ISO/IEC interpretations.
+
 config BR2_KERNEL_HEADERS_7_2
 	bool "kernel headers version 7.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/libmad/0001-CMake-case-of-AND-test.patch b/package/libmad/0001-CMake-case-of-AND-test.patch
new file mode 100644
index 0000000000..e01ef4b6da
--- /dev/null
+++ b/package/libmad/0001-CMake-case-of-AND-test.patch
@@ -0,0 +1,32 @@
+From 9dd96b40c5caf76fd1c6ef9dcc80ba330eb57a79 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Mon, 12 Oct 2026 12:50:15 +0200
+Subject: [PATCH] CMake: case of AND test
+
+Older cmake (3.17) reports an error:
+
+```
+CMake Error at CMakeLists.txt:86 (if):
+  if given arguments:
+    "ASO" "and" "FALSE"
+```
+
+Upstream: https://codeberg.org/tenacityteam/libmad/commit/9dd96b40c5caf76fd1c6ef9dcc80ba330eb57a79
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3c4bf9f..4655feb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -83,7 +83,7 @@ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "(x|i[3456])86")
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES ".*(arm|ARM).*")
+   message(STATUS "Using ARM fixed point math")
+   option (FPM_ARM "ARM fixed point math" ON)
+-  if(ASO and FALSE)
++  if(ASO AND FALSE)
+     enable_language(ASM)
+     list(APPEND MAD_CONFIG_DEFS ASO_INTERLEAVE1 ASO_IMDCT)
+     if (BUILD_SHARED_LIBS)
diff --git a/package/libmad/0001-mips-h-constraint-removal.patch b/package/libmad/0001-mips-h-constraint-removal.patch
deleted file mode 100644
index 095858717e..0000000000
--- a/package/libmad/0001-mips-h-constraint-removal.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-http://patchwork.openembedded.org/patch/921/
-
-diff -ur libmad-0.15.1b-orig/fixed.h libmad-0.15.1b/fixed.h
---- libmad-0.15.1b-orig/fixed.h	2004-02-17 12:32:03.000000000 +1030
-+++ libmad-0.15.1b/fixed.h	2009-08-05 10:46:30.000000000 +0930
-@@ -299,6 +299,23 @@
- 
- # elif defined(FPM_MIPS)
- 
-+/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
-+#if defined (__GNUC__) && defined (__GNUC_MINOR__)
-+#define __GNUC_PREREQ(maj, min) \
-+	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-+#else
-+#define __GNUC_PREREQ(maj, min)  0
-+#endif
-+
-+#if __GNUC_PREREQ(4,4)
-+  typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
-+# define MAD_F_MLX(hi, lo, x, y) \
-+   do { \
-+      u64_di_t __ll = (u64_di_t) (x) * (y); \
-+      hi = __ll >> 32; \
-+      lo = __ll; \
-+   } while (0) 
-+#else
- /*
-  * This MIPS version is fast and accurate; the disposition of the least
-  * significant bit depends on OPT_ACCURACY via mad_f_scale64().
-@@ -328,6 +345,7 @@
- 	 : "%r" ((x) >> 12), "r" ((y) >> 16))
- #  define MAD_F_MLZ(hi, lo)  ((mad_fixed_t) (lo))
- # endif
-+#endif /* __GNU_PREREQ(4,4) */
- 
- # if defined(OPT_SPEED)
- #  define mad_f_scale64(hi, lo)  \
-diff -ur libmad-0.15.1b-orig/mad.h libmad-0.15.1b/mad.h
---- libmad-0.15.1b-orig/mad.h	2004-02-17 13:25:44.000000000 +1030
-+++ libmad-0.15.1b/mad.h	2009-08-05 10:42:40.000000000 +0930
-@@ -344,6 +344,23 @@
- 
- # elif defined(FPM_MIPS)
- 
-+/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
-+#if defined (__GNUC__) && defined (__GNUC_MINOR__)
-+#define __GNUC_PREREQ(maj, min) \
-+	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-+#else
-+#define __GNUC_PREREQ(maj, min)  0
-+#endif
-+
-+#if __GNUC_PREREQ(4,4)
-+  typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
-+# define MAD_F_MLX(hi, lo, x, y) \
-+   do { \
-+      u64_di_t __ll = (u64_di_t) (x) * (y); \
-+      hi = __ll >> 32; \
-+      lo = __ll; \
-+   } while (0) 
-+#else
- /*
-  * This MIPS version is fast and accurate; the disposition of the least
-  * significant bit depends on OPT_ACCURACY via mad_f_scale64().
-@@ -373,6 +390,7 @@
- 	 : "%r" ((x) >> 12), "r" ((y) >> 16))
- #  define MAD_F_MLZ(hi, lo)  ((mad_fixed_t) (lo))
- # endif
-+#endif /* __GNU_PREREQ(4,4) */
- 
- # if defined(OPT_SPEED)
- #  define mad_f_scale64(hi, lo)  \
diff --git a/package/libmad/0002-CMake-Fix-PPC-Architecture-Detection.patch b/package/libmad/0002-CMake-Fix-PPC-Architecture-Detection.patch
new file mode 100644
index 0000000000..3004f58834
--- /dev/null
+++ b/package/libmad/0002-CMake-Fix-PPC-Architecture-Detection.patch
@@ -0,0 +1,32 @@
+From 755474a3a5bb32d50bfe5e36661ba022eec946a8 Mon Sep 17 00:00:00 2001
+From: Avery King <gperson@disroot.org>
+Date: Wed, 28 Oct 2026 08:03:47 -0700
+Subject: [PATCH] CMake: Fix PPC Architecture Detection
+
+Fix the regex for detecting PowerPC when determining which optimizations
+to enable.
+
+Reference-to: https://codeberg.org/tenacityteam/libmad/issues/44
+Upstream: https://codeberg.org/tenacityteam/libmad/pulls/45
+Signed-off-by: Avery King <gperson@disroot.org>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 02df386..c10310c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -100,7 +100,7 @@ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES ".*(mips|MIPS).*")
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES ".*(sparc|SPARC).*")
+   message(STATUS "Using SPARC fixed point math")
+   option(FPM_SPARC "SPARC fixed point math" ON)
+-elseif(CMAKE_SYSTEM_PROCESSOR MATCHES ".(ppc|PPC|powerpc).*")
++elseif(CMAKE_SYSTEM_PROCESSOR MATCHES ".*(ppc|PPC|powerpc).*")
+   message(STATUS "Using PowerPC fixed point math")
+   option(FPM_PPC "PowerPC fixed point math" ON)
+ else()
+-- 
+2.56.0
+
diff --git a/package/libmad/0002-configure-ac-automake-foreign.patch b/package/libmad/0002-configure-ac-automake-foreign.patch
deleted file mode 100644
index 828ad0c152..0000000000
--- a/package/libmad/0002-configure-ac-automake-foreign.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-configure.ac: don't require GNU-specific files when running automake
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -ur libmad-0.15.1b-orig/configure.ac libmad-0.15.1b/configure.ac
---- libmad-0.15.1b-orig/configure.ac	2019-01-17 21:24:52.259194527 +0100
-+++ libmad-0.15.1b/configure.ac	2019-01-17 21:25:32.779481058 +0100
-@@ -26,7 +26,7 @@
- 
- AC_CONFIG_SRCDIR([decoder.h])
- 
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- 
- AM_CONFIG_HEADER([config.h])
- 
diff --git a/package/libmad/0003-drop-GCC-fforce-mem-option.patch b/package/libmad/0003-drop-GCC-fforce-mem-option.patch
deleted file mode 100644
index 25b685efd0..0000000000
--- a/package/libmad/0003-drop-GCC-fforce-mem-option.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-configure.ac: drop GCC "-fforce-mem" option 
-
-As reported at [1], the option has been removed from version 4.3 of GCC.
-
-[1] https://ez.analog.com/dsp/software-and-development-tools/linux-blackfin/linux-bug-archive/w/documents/7460/5626-build-lib-mad-fail-at-option--fforce-mem-with-gcc-4-3
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: Dead
-
---- libmad-0.15.1b-orig/configure.ac	2024-07-02 14:26:40.657984791 +0200
-+++ libmad-0.15.1b/configure.ac	2024-07-02 14:27:07.098198997 +0200
-@@ -140,7 +140,6 @@
-     case "$optimize" in
- 	-O|"-O "*)
- 	    optimize="-O"
--	    optimize="$optimize -fforce-mem"
- 	    optimize="$optimize -fforce-addr"
- 	    : #x optimize="$optimize -finline-functions"
- 	    : #- optimize="$optimize -fstrength-reduce"
diff --git a/package/libmad/0004-md_size.patch b/package/libmad/0004-md_size.patch
deleted file mode 100644
index b2b3b99df2..0000000000
--- a/package/libmad/0004-md_size.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From: Kurt Roeckx <kurt@roeckx.be>
-Date: Sun, 28 Jan 2018 15:44:08 +0100
-Subject: Check the size of the main data
-
-The main data to decode a frame can come from the current frame and part of the
-previous frame, the so called bit reservoir. si.main_data_begin is the part of
-the previous frame we need for this frame. frame_space is the amount of main
-data that can be in this frame, and next_md_begin is the part of this frame that
-is going to be used for the next frame.
-
-The maximum amount of data from a previous frame that the format allows is 511
-bytes. The maximum frame size for the defined bitrates is at MPEG 2.5 layer 2
-at 320 kbit/s and 8 kHz sample rate which gives 72 * (320000 / 8000) + 1 = 2881.
-So those defines are not large enough:
- # define MAD_BUFFER_GUARD      8
- # define MAD_BUFFER_MDLEN      (511 + 2048 + MAD_BUFFER_GUARD)
-
-There is also support for a "free" bitrate which allows you to create any frame
-size, which can be larger than the buffer.
-
-Changing the defines is not an option since it's part of the ABI, so we check
-that the main data fits in the bufer.
-
-The previous frame data is stored in *stream->main_data and contains
-stream->md_len bytes. If stream->md_len is larger than the data we
-need from the previous frame (si.main_data_begin) it still wouldn't fit
-in the buffer, so just keep the data that we need.
-
-CVE: CVE-2017-8372
-CVE: CVE-2017-8373
-Upstream: http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.diff.gz
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
-
-Index: libmad-0.15.1b/layer3.c
-===================================================================
---- libmad-0.15.1b.orig/layer3.c
-+++ libmad-0.15.1b/layer3.c
-@@ -2608,6 +2608,11 @@ int mad_layer_III(struct mad_stream *str
-     next_md_begin = 0;
-
-   md_len = si.main_data_begin + frame_space - next_md_begin;
-+  if (md_len + MAD_BUFFER_GUARD > MAD_BUFFER_MDLEN) {
-+    stream->error = MAD_ERROR_LOSTSYNC;
-+    stream->sync = 0;
-+    return -1;
-+  }
-
-   frame_used = 0;
-
-@@ -2625,8 +2630,11 @@ int mad_layer_III(struct mad_stream *str
-       }
-     }
-     else {
--      mad_bit_init(&ptr,
--		   *stream->main_data + stream->md_len - si.main_data_begin);
-+      memmove(stream->main_data,
-+	*stream->main_data + stream->md_len - si.main_data_begin,
-+	si.main_data_begin);
-+      stream->md_len = si.main_data_begin;
-+      mad_bit_init(&ptr, *stream->main_data);
-
-       if (md_len > si.main_data_begin) {
- 	assert(stream->md_len + md_len -
diff --git a/package/libmad/0005-length-check.patch b/package/libmad/0005-length-check.patch
deleted file mode 100644
index 5c56849da7..0000000000
--- a/package/libmad/0005-length-check.patch
+++ /dev/null
@@ -1,821 +0,0 @@
-From: Kurt Roeckx <kurt@roeckx.be>
-Date: Sun, 28 Jan 2018 19:26:36 +0100
-Subject: Check the size before reading with mad_bit_read
-
-There are various cases where it attemps to read past the end of the buffer
-using mad_bit_read(). Most functions didn't even know the size of the buffer
-they were reading from.
-
-CVE: CVE-2017-8374
-Upstream: http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.diff.gz
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
-
-Index: libmad-0.15.1b/bit.c
-===================================================================
---- libmad-0.15.1b.orig/bit.c
-+++ libmad-0.15.1b/bit.c
-@@ -138,6 +138,9 @@ unsigned long mad_bit_read(struct mad_bi
- {
-   register unsigned long value;
- 
-+  if (len == 0)
-+    return 0;
-+
-   if (bitptr->left == CHAR_BIT)
-     bitptr->cache = *bitptr->byte;
- 
-Index: libmad-0.15.1b/frame.c
-===================================================================
---- libmad-0.15.1b.orig/frame.c
-+++ libmad-0.15.1b/frame.c
-@@ -120,11 +120,18 @@ static
- int decode_header(struct mad_header *header, struct mad_stream *stream)
- {
-   unsigned int index;
-+  struct mad_bitptr bufend_ptr;
- 
-   header->flags        = 0;
-   header->private_bits = 0;
- 
-+  mad_bit_init(&bufend_ptr, stream->bufend);
-+
-   /* header() */
-+  if (mad_bit_length(&stream->ptr, &bufend_ptr) < 32) {
-+    stream->error = MAD_ERROR_BUFLEN;
-+    return -1;
-+  }
- 
-   /* syncword */
-   mad_bit_skip(&stream->ptr, 11);
-@@ -225,8 +232,13 @@ int decode_header(struct mad_header *hea
-   /* error_check() */
- 
-   /* crc_check */
--  if (header->flags & MAD_FLAG_PROTECTION)
-+  if (header->flags & MAD_FLAG_PROTECTION) {
-+    if (mad_bit_length(&stream->ptr, &bufend_ptr) < 16) {
-+      stream->error = MAD_ERROR_BUFLEN;
-+      return -1;
-+    }
-     header->crc_target = mad_bit_read(&stream->ptr, 16);
-+  }
- 
-   return 0;
- }
-@@ -338,7 +350,7 @@ int mad_header_decode(struct mad_header
-       stream->error = MAD_ERROR_BUFLEN;
-       goto fail;
-     }
--    else if (!(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
-+    else if ((end - ptr >= 2) && !(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
-       /* mark point where frame sync word was expected */
-       stream->this_frame = ptr;
-       stream->next_frame = ptr + 1;
-@@ -361,6 +373,8 @@ int mad_header_decode(struct mad_header
-     ptr = mad_bit_nextbyte(&stream->ptr);
-   }
- 
-+  stream->error = MAD_ERROR_NONE;
-+
-   /* begin processing */
-   stream->this_frame = ptr;
-   stream->next_frame = ptr + 1;  /* possibly bogus sync word */
-@@ -413,7 +427,7 @@ int mad_header_decode(struct mad_header
-     /* check that a valid frame header follows this frame */
- 
-     ptr = stream->next_frame;
--    if (!(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
-+    if ((end - ptr >= 2) && !(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
-       ptr = stream->next_frame = stream->this_frame + 1;
-       goto sync;
-     }
-Index: libmad-0.15.1b/layer12.c
-===================================================================
---- libmad-0.15.1b.orig/layer12.c
-+++ libmad-0.15.1b/layer12.c
-@@ -72,10 +72,18 @@ mad_fixed_t const linear_table[14] = {
-  * DESCRIPTION:	decode one requantized Layer I sample from a bitstream
-  */
- static
--mad_fixed_t I_sample(struct mad_bitptr *ptr, unsigned int nb)
-+mad_fixed_t I_sample(struct mad_bitptr *ptr, unsigned int nb, struct mad_stream *stream)
- {
-   mad_fixed_t sample;
-+  struct mad_bitptr frameend_ptr;
- 
-+  mad_bit_init(&frameend_ptr, stream->next_frame);
-+
-+  if (mad_bit_length(ptr, &frameend_ptr) < nb) {
-+    stream->error = MAD_ERROR_LOSTSYNC;
-+    stream->sync = 0;
-+    return 0;
-+  }
-   sample = mad_bit_read(ptr, nb);
- 
-   /* invert most significant bit, extend sign, then scale to fixed format */
-@@ -106,6 +114,10 @@ int mad_layer_I(struct mad_stream *strea
-   struct mad_header *header = &frame->header;
-   unsigned int nch, bound, ch, s, sb, nb;
-   unsigned char allocation[2][32], scalefactor[2][32];
-+  struct mad_bitptr bufend_ptr, frameend_ptr;
-+
-+  mad_bit_init(&bufend_ptr, stream->bufend);
-+  mad_bit_init(&frameend_ptr, stream->next_frame);
- 
-   nch = MAD_NCHANNELS(header);
- 
-@@ -118,6 +130,11 @@ int mad_layer_I(struct mad_stream *strea
-   /* check CRC word */
- 
-   if (header->flags & MAD_FLAG_PROTECTION) {
-+    if (mad_bit_length(&stream->ptr, &bufend_ptr)
-+		< 4 * (bound * nch + (32 - bound))) {
-+      stream->error = MAD_ERROR_BADCRC;
-+      return -1;
-+    }
-     header->crc_check =
-       mad_bit_crc(stream->ptr, 4 * (bound * nch + (32 - bound)),
- 		  header->crc_check);
-@@ -133,6 +150,11 @@ int mad_layer_I(struct mad_stream *strea
- 
-   for (sb = 0; sb < bound; ++sb) {
-     for (ch = 0; ch < nch; ++ch) {
-+      if (mad_bit_length(&stream->ptr, &frameend_ptr) < 4) {
-+	stream->error = MAD_ERROR_LOSTSYNC;
-+	stream->sync = 0;
-+	return -1;
-+      }
-       nb = mad_bit_read(&stream->ptr, 4);
- 
-       if (nb == 15) {
-@@ -145,6 +167,11 @@ int mad_layer_I(struct mad_stream *strea
-   }
- 
-   for (sb = bound; sb < 32; ++sb) {
-+    if (mad_bit_length(&stream->ptr, &frameend_ptr) < 4) {
-+      stream->error = MAD_ERROR_LOSTSYNC;
-+      stream->sync = 0;
-+      return -1;
-+    }
-     nb = mad_bit_read(&stream->ptr, 4);
- 
-     if (nb == 15) {
-@@ -161,6 +188,11 @@ int mad_layer_I(struct mad_stream *strea
-   for (sb = 0; sb < 32; ++sb) {
-     for (ch = 0; ch < nch; ++ch) {
-       if (allocation[ch][sb]) {
-+        if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
-+	  stream->error = MAD_ERROR_LOSTSYNC;
-+	  stream->sync = 0;
-+	  return -1;
-+	}
- 	scalefactor[ch][sb] = mad_bit_read(&stream->ptr, 6);
- 
- # if defined(OPT_STRICT)
-@@ -185,8 +217,10 @@ int mad_layer_I(struct mad_stream *strea
-       for (ch = 0; ch < nch; ++ch) {
- 	nb = allocation[ch][sb];
- 	frame->sbsample[ch][s][sb] = nb ?
--	  mad_f_mul(I_sample(&stream->ptr, nb),
-+	  mad_f_mul(I_sample(&stream->ptr, nb, stream),
- 		    sf_table[scalefactor[ch][sb]]) : 0;
-+	if (stream->error != 0)
-+	  return -1;
-       }
-     }
- 
-@@ -194,7 +228,14 @@ int mad_layer_I(struct mad_stream *strea
-       if ((nb = allocation[0][sb])) {
- 	mad_fixed_t sample;
- 
--	sample = I_sample(&stream->ptr, nb);
-+	if (mad_bit_length(&stream->ptr, &frameend_ptr) < nb) {
-+	  stream->error = MAD_ERROR_LOSTSYNC;
-+	  stream->sync = 0;
-+          return -1;
-+	}
-+	sample = I_sample(&stream->ptr, nb, stream);
-+        if (stream->error != 0)
-+	  return -1;
- 
- 	for (ch = 0; ch < nch; ++ch) {
- 	  frame->sbsample[ch][s][sb] =
-@@ -280,13 +321,21 @@ struct quantclass {
- static
- void II_samples(struct mad_bitptr *ptr,
- 		struct quantclass const *quantclass,
--		mad_fixed_t output[3])
-+		mad_fixed_t output[3], struct mad_stream *stream)
- {
-   unsigned int nb, s, sample[3];
-+  struct mad_bitptr frameend_ptr;
-+
-+  mad_bit_init(&frameend_ptr, stream->next_frame);
- 
-   if ((nb = quantclass->group)) {
-     unsigned int c, nlevels;
- 
-+    if (mad_bit_length(ptr, &frameend_ptr) < quantclass->bits) {
-+      stream->error = MAD_ERROR_LOSTSYNC;
-+      stream->sync = 0;
-+      return;
-+    }
-     /* degrouping */
-     c = mad_bit_read(ptr, quantclass->bits);
-     nlevels = quantclass->nlevels;
-@@ -299,8 +348,14 @@ void II_samples(struct mad_bitptr *ptr,
-   else {
-     nb = quantclass->bits;
- 
--    for (s = 0; s < 3; ++s)
-+    for (s = 0; s < 3; ++s) {
-+      if (mad_bit_length(ptr, &frameend_ptr) < nb) {
-+	stream->error = MAD_ERROR_LOSTSYNC;
-+	stream->sync = 0;
-+	return;
-+      }
-       sample[s] = mad_bit_read(ptr, nb);
-+    }
-   }
- 
-   for (s = 0; s < 3; ++s) {
-@@ -336,6 +391,9 @@ int mad_layer_II(struct mad_stream *stre
-   unsigned char const *offsets;
-   unsigned char allocation[2][32], scfsi[2][32], scalefactor[2][32][3];
-   mad_fixed_t samples[3];
-+  struct mad_bitptr frameend_ptr;
-+
-+  mad_bit_init(&frameend_ptr, stream->next_frame);
- 
-   nch = MAD_NCHANNELS(header);
- 
-@@ -402,13 +460,24 @@ int mad_layer_II(struct mad_stream *stre
-   for (sb = 0; sb < bound; ++sb) {
-     nbal = bitalloc_table[offsets[sb]].nbal;
- 
--    for (ch = 0; ch < nch; ++ch)
-+    for (ch = 0; ch < nch; ++ch) {
-+      if (mad_bit_length(&stream->ptr, &frameend_ptr) < nbal) {
-+	stream->error = MAD_ERROR_LOSTSYNC;
-+	stream->sync = 0;
-+	return -1;
-+      }
-       allocation[ch][sb] = mad_bit_read(&stream->ptr, nbal);
-+    }
-   }
- 
-   for (sb = bound; sb < sblimit; ++sb) {
-     nbal = bitalloc_table[offsets[sb]].nbal;
- 
-+    if (mad_bit_length(&stream->ptr, &frameend_ptr) < nbal) {
-+      stream->error = MAD_ERROR_LOSTSYNC;
-+      stream->sync = 0;
-+      return -1;
-+    }
-     allocation[0][sb] =
-     allocation[1][sb] = mad_bit_read(&stream->ptr, nbal);
-   }
-@@ -417,8 +486,14 @@ int mad_layer_II(struct mad_stream *stre
- 
-   for (sb = 0; sb < sblimit; ++sb) {
-     for (ch = 0; ch < nch; ++ch) {
--      if (allocation[ch][sb])
-+      if (allocation[ch][sb]) {
-+	if (mad_bit_length(&stream->ptr, &frameend_ptr) < 2) {
-+	  stream->error = MAD_ERROR_LOSTSYNC;
-+	  stream->sync = 0;
-+	  return -1;
-+	}
- 	scfsi[ch][sb] = mad_bit_read(&stream->ptr, 2);
-+      }
-     }
-   }
- 
-@@ -441,6 +516,11 @@ int mad_layer_II(struct mad_stream *stre
-   for (sb = 0; sb < sblimit; ++sb) {
-     for (ch = 0; ch < nch; ++ch) {
-       if (allocation[ch][sb]) {
-+	if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
-+	  stream->error = MAD_ERROR_LOSTSYNC;
-+	  stream->sync = 0;
-+	  return -1;
-+	}
- 	scalefactor[ch][sb][0] = mad_bit_read(&stream->ptr, 6);
- 
- 	switch (scfsi[ch][sb]) {
-@@ -451,11 +531,21 @@ int mad_layer_II(struct mad_stream *stre
- 	  break;
- 
- 	case 0:
-+	  if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
-+	    stream->error = MAD_ERROR_LOSTSYNC;
-+	    stream->sync = 0;
-+	    return -1;
-+	  }
- 	  scalefactor[ch][sb][1] = mad_bit_read(&stream->ptr, 6);
- 	  /* fall through */
- 
- 	case 1:
- 	case 3:
-+	  if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
-+	    stream->error = MAD_ERROR_LOSTSYNC;
-+	    stream->sync = 0;
-+	    return -1;
-+	  }
- 	  scalefactor[ch][sb][2] = mad_bit_read(&stream->ptr, 6);
- 	}
- 
-@@ -487,7 +577,9 @@ int mad_layer_II(struct mad_stream *stre
- 	if ((index = allocation[ch][sb])) {
- 	  index = offset_table[bitalloc_table[offsets[sb]].offset][index - 1];
- 
--	  II_samples(&stream->ptr, &qc_table[index], samples);
-+	  II_samples(&stream->ptr, &qc_table[index], samples, stream);
-+	  if (stream->error != 0)
-+            return -1;
- 
- 	  for (s = 0; s < 3; ++s) {
- 	    frame->sbsample[ch][3 * gr + s][sb] =
-@@ -505,7 +597,9 @@ int mad_layer_II(struct mad_stream *stre
-       if ((index = allocation[0][sb])) {
- 	index = offset_table[bitalloc_table[offsets[sb]].offset][index - 1];
- 
--	II_samples(&stream->ptr, &qc_table[index], samples);
-+	II_samples(&stream->ptr, &qc_table[index], samples, stream);
-+	if (stream->error != 0)
-+          return -1;
- 
- 	for (ch = 0; ch < nch; ++ch) {
- 	  for (s = 0; s < 3; ++s) {
-Index: libmad-0.15.1b/layer3.c
-===================================================================
---- libmad-0.15.1b.orig/layer3.c
-+++ libmad-0.15.1b/layer3.c
-@@ -598,7 +598,8 @@ enum mad_error III_sideinfo(struct mad_b
- static
- unsigned int III_scalefactors_lsf(struct mad_bitptr *ptr,
- 				  struct channel *channel,
--				  struct channel *gr1ch, int mode_extension)
-+				  struct channel *gr1ch, int mode_extension,
-+				  unsigned int bits_left, unsigned int *part2_length)
- {
-   struct mad_bitptr start;
-   unsigned int scalefac_compress, index, slen[4], part, n, i;
-@@ -644,8 +645,12 @@ unsigned int III_scalefactors_lsf(struct
- 
-     n = 0;
-     for (part = 0; part < 4; ++part) {
--      for (i = 0; i < nsfb[part]; ++i)
-+      for (i = 0; i < nsfb[part]; ++i) {
-+	if (bits_left < slen[part])
-+	  return MAD_ERROR_BADSCFSI;
- 	channel->scalefac[n++] = mad_bit_read(ptr, slen[part]);
-+	bits_left -= slen[part];
-+      }
-     }
- 
-     while (n < 39)
-@@ -690,7 +695,10 @@ unsigned int III_scalefactors_lsf(struct
-       max = (1 << slen[part]) - 1;
- 
-       for (i = 0; i < nsfb[part]; ++i) {
-+	if (bits_left < slen[part])
-+	  return MAD_ERROR_BADSCFSI;
- 	is_pos = mad_bit_read(ptr, slen[part]);
-+	bits_left -= slen[part];
- 
- 	channel->scalefac[n] = is_pos;
- 	gr1ch->scalefac[n++] = (is_pos == max);
-@@ -703,7 +711,8 @@ unsigned int III_scalefactors_lsf(struct
-     }
-   }
- 
--  return mad_bit_length(&start, ptr);
-+  *part2_length = mad_bit_length(&start, ptr);
-+  return MAD_ERROR_NONE;
- }
- 
- /*
-@@ -712,7 +721,8 @@ unsigned int III_scalefactors_lsf(struct
-  */
- static
- unsigned int III_scalefactors(struct mad_bitptr *ptr, struct channel *channel,
--			      struct channel const *gr0ch, unsigned int scfsi)
-+			      struct channel const *gr0ch, unsigned int scfsi,
-+			      unsigned int bits_left, unsigned int *part2_length)
- {
-   struct mad_bitptr start;
-   unsigned int slen1, slen2, sfbi;
-@@ -728,12 +738,20 @@ unsigned int III_scalefactors(struct mad
-     sfbi = 0;
- 
-     nsfb = (channel->flags & mixed_block_flag) ? 8 + 3 * 3 : 6 * 3;
--    while (nsfb--)
-+    while (nsfb--) {
-+      if (bits_left < slen1)
-+	return MAD_ERROR_BADSCFSI;
-       channel->scalefac[sfbi++] = mad_bit_read(ptr, slen1);
-+      bits_left -= slen1;
-+    }
- 
-     nsfb = 6 * 3;
--    while (nsfb--)
-+    while (nsfb--) {
-+      if (bits_left < slen2)
-+	return MAD_ERROR_BADSCFSI;
-       channel->scalefac[sfbi++] = mad_bit_read(ptr, slen2);
-+      bits_left -= slen2;
-+    }
- 
-     nsfb = 1 * 3;
-     while (nsfb--)
-@@ -745,8 +763,12 @@ unsigned int III_scalefactors(struct mad
- 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
-     }
-     else {
--      for (sfbi = 0; sfbi < 6; ++sfbi)
-+      for (sfbi = 0; sfbi < 6; ++sfbi) {
-+	if (bits_left < slen1)
-+	  return MAD_ERROR_BADSCFSI;
- 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen1);
-+	bits_left -= slen1;
-+      }
-     }
- 
-     if (scfsi & 0x4) {
-@@ -754,8 +776,12 @@ unsigned int III_scalefactors(struct mad
- 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
-     }
-     else {
--      for (sfbi = 6; sfbi < 11; ++sfbi)
-+      for (sfbi = 6; sfbi < 11; ++sfbi) {
-+	if (bits_left < slen1)
-+	  return MAD_ERROR_BADSCFSI;
- 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen1);
-+	bits_left -= slen1;
-+      }
-     }
- 
-     if (scfsi & 0x2) {
-@@ -763,8 +789,12 @@ unsigned int III_scalefactors(struct mad
- 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
-     }
-     else {
--      for (sfbi = 11; sfbi < 16; ++sfbi)
-+      for (sfbi = 11; sfbi < 16; ++sfbi) {
-+	if (bits_left < slen2)
-+	  return MAD_ERROR_BADSCFSI;
- 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen2);
-+	bits_left -= slen2;
-+      }
-     }
- 
-     if (scfsi & 0x1) {
-@@ -772,14 +802,19 @@ unsigned int III_scalefactors(struct mad
- 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
-     }
-     else {
--      for (sfbi = 16; sfbi < 21; ++sfbi)
-+      for (sfbi = 16; sfbi < 21; ++sfbi) {
-+	if (bits_left < slen2)
-+	  return MAD_ERROR_BADSCFSI;
- 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen2);
-+	bits_left -= slen2;
-+      }
-     }
- 
-     channel->scalefac[21] = 0;
-   }
- 
--  return mad_bit_length(&start, ptr);
-+  *part2_length = mad_bit_length(&start, ptr);
-+  return MAD_ERROR_NONE;
- }
- 
- /*
-@@ -933,19 +968,17 @@ static
- enum mad_error III_huffdecode(struct mad_bitptr *ptr, mad_fixed_t xr[576],
- 			      struct channel *channel,
- 			      unsigned char const *sfbwidth,
--			      unsigned int part2_length)
-+			      signed int part3_length)
- {
-   signed int exponents[39], exp;
-   signed int const *expptr;
-   struct mad_bitptr peek;
--  signed int bits_left, cachesz;
-+  signed int bits_left, cachesz, fakebits;
-   register mad_fixed_t *xrptr;
-   mad_fixed_t const *sfbound;
-   register unsigned long bitcache;
- 
--  bits_left = (signed) channel->part2_3_length - (signed) part2_length;
--  if (bits_left < 0)
--    return MAD_ERROR_BADPART3LEN;
-+  bits_left = part3_length;
- 
-   III_exponents(channel, sfbwidth, exponents);
- 
-@@ -956,8 +989,12 @@ enum mad_error III_huffdecode(struct mad
-   cachesz  = mad_bit_bitsleft(&peek);
-   cachesz += ((32 - 1 - 24) + (24 - cachesz)) & ~7;
- 
-+  if (bits_left < cachesz) {
-+    cachesz = bits_left;
-+  }
-   bitcache   = mad_bit_read(&peek, cachesz);
-   bits_left -= cachesz;
-+  fakebits = 0;
- 
-   xrptr = &xr[0];
- 
-@@ -986,7 +1023,7 @@ enum mad_error III_huffdecode(struct mad
- 
-     big_values = channel->big_values;
- 
--    while (big_values-- && cachesz + bits_left > 0) {
-+    while (big_values-- && cachesz + bits_left - fakebits > 0) {
-       union huffpair const *pair;
-       unsigned int clumpsz, value;
-       register mad_fixed_t requantized;
-@@ -1023,10 +1060,19 @@ enum mad_error III_huffdecode(struct mad
- 	unsigned int bits;
- 
- 	bits       = ((32 - 1 - 21) + (21 - cachesz)) & ~7;
-+	if (bits_left < bits) {
-+	  bits = bits_left;
-+	}
- 	bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
- 	cachesz   += bits;
- 	bits_left -= bits;
-       }
-+      if (cachesz < 21) {
-+	unsigned int bits = 21 - cachesz;
-+	bitcache <<= bits;
-+	cachesz += bits;
-+	fakebits += bits;
-+      }
- 
-       /* hcod (0..19) */
- 
-@@ -1041,6 +1087,8 @@ enum mad_error III_huffdecode(struct mad
-       }
- 
-       cachesz -= pair->value.hlen;
-+      if (cachesz < fakebits)
-+	return MAD_ERROR_BADHUFFDATA;
- 
-       if (linbits) {
- 	/* x (0..14) */
-@@ -1054,10 +1102,15 @@ enum mad_error III_huffdecode(struct mad
- 
- 	case 15:
- 	  if (cachesz < linbits + 2) {
--	    bitcache   = (bitcache << 16) | mad_bit_read(&peek, 16);
--	    cachesz   += 16;
--	    bits_left -= 16;
-+	    unsigned int bits = 16;
-+	    if (bits_left < 16)
-+	      bits = bits_left;
-+	    bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
-+	    cachesz   += bits;
-+	    bits_left -= bits;
- 	  }
-+	  if (cachesz - fakebits < linbits)
-+	    return MAD_ERROR_BADHUFFDATA;
- 
- 	  value += MASK(bitcache, cachesz, linbits);
- 	  cachesz -= linbits;
-@@ -1074,6 +1127,8 @@ enum mad_error III_huffdecode(struct mad
- 	  }
- 
- 	x_final:
-+	  if (cachesz - fakebits < 1)
-+	    return MAD_ERROR_BADHUFFDATA;
- 	  xrptr[0] = MASK1BIT(bitcache, cachesz--) ?
- 	    -requantized : requantized;
- 	}
-@@ -1089,10 +1144,15 @@ enum mad_error III_huffdecode(struct mad
- 
- 	case 15:
- 	  if (cachesz < linbits + 1) {
--	    bitcache   = (bitcache << 16) | mad_bit_read(&peek, 16);
--	    cachesz   += 16;
--	    bits_left -= 16;
-+	    unsigned int bits = 16;
-+	    if (bits_left < 16)
-+	      bits = bits_left;
-+	    bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
-+	    cachesz   += bits;
-+	    bits_left -= bits;
- 	  }
-+	  if (cachesz - fakebits < linbits)
-+	    return MAD_ERROR_BADHUFFDATA;
- 
- 	  value += MASK(bitcache, cachesz, linbits);
- 	  cachesz -= linbits;
-@@ -1109,6 +1169,8 @@ enum mad_error III_huffdecode(struct mad
- 	  }
- 
- 	y_final:
-+	  if (cachesz - fakebits < 1)
-+	    return MAD_ERROR_BADHUFFDATA;
- 	  xrptr[1] = MASK1BIT(bitcache, cachesz--) ?
- 	    -requantized : requantized;
- 	}
-@@ -1128,6 +1190,8 @@ enum mad_error III_huffdecode(struct mad
- 	    requantized = reqcache[value] = III_requantize(value, exp);
- 	  }
- 
-+	  if (cachesz - fakebits < 1)
-+	    return MAD_ERROR_BADHUFFDATA;
- 	  xrptr[0] = MASK1BIT(bitcache, cachesz--) ?
- 	    -requantized : requantized;
- 	}
-@@ -1146,6 +1210,8 @@ enum mad_error III_huffdecode(struct mad
- 	    requantized = reqcache[value] = III_requantize(value, exp);
- 	  }
- 
-+	  if (cachesz - fakebits < 1)
-+	    return MAD_ERROR_BADHUFFDATA;
- 	  xrptr[1] = MASK1BIT(bitcache, cachesz--) ?
- 	    -requantized : requantized;
- 	}
-@@ -1155,9 +1221,6 @@ enum mad_error III_huffdecode(struct mad
-     }
-   }
- 
--  if (cachesz + bits_left < 0)
--    return MAD_ERROR_BADHUFFDATA;  /* big_values overrun */
--
-   /* count1 */
-   {
-     union huffquad const *table;
-@@ -1167,15 +1230,24 @@ enum mad_error III_huffdecode(struct mad
- 
-     requantized = III_requantize(1, exp);
- 
--    while (cachesz + bits_left > 0 && xrptr <= &xr[572]) {
-+    while (cachesz + bits_left - fakebits > 0 && xrptr <= &xr[572]) {
-       union huffquad const *quad;
- 
-       /* hcod (1..6) */
- 
-       if (cachesz < 10) {
--	bitcache   = (bitcache << 16) | mad_bit_read(&peek, 16);
--	cachesz   += 16;
--	bits_left -= 16;
-+	unsigned int bits = 16;
-+	if (bits_left < 16)
-+	  bits = bits_left;
-+	bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
-+	cachesz   += bits;
-+	bits_left -= bits;
-+      }
-+      if (cachesz < 10) {
-+	unsigned int bits = 10 - cachesz;
-+	bitcache <<= bits;
-+	cachesz += bits;
-+	fakebits += bits;
-       }
- 
-       quad = &table[MASK(bitcache, cachesz, 4)];
-@@ -1188,6 +1260,11 @@ enum mad_error III_huffdecode(struct mad
- 		      MASK(bitcache, cachesz, quad->ptr.bits)];
-       }
- 
-+      if (cachesz - fakebits < quad->value.hlen + quad->value.v
-+        + quad->value.w + quad->value.x + quad->value.y)
-+	/* We don't have enough bits to read one more entry, consider them
-+	 * stuffing bits. */
-+	break;
-       cachesz -= quad->value.hlen;
- 
-       if (xrptr == sfbound) {
-@@ -1236,22 +1313,8 @@ enum mad_error III_huffdecode(struct mad
- 
-       xrptr += 2;
-     }
--
--    if (cachesz + bits_left < 0) {
--# if 0 && defined(DEBUG)
--      fprintf(stderr, "huffman count1 overrun (%d bits)\n",
--	      -(cachesz + bits_left));
--# endif
--
--      /* technically the bitstream is misformatted, but apparently
--	 some encoders are just a bit sloppy with stuffing bits */
--
--      xrptr -= 4;
--    }
-   }
- 
--  assert(-bits_left <= MAD_BUFFER_GUARD * CHAR_BIT);
--
- # if 0 && defined(DEBUG)
-   if (bits_left < 0)
-     fprintf(stderr, "read %d bits too many\n", -bits_left);
-@@ -2348,10 +2411,11 @@ void III_freqinver(mad_fixed_t sample[18
-  */
- static
- enum mad_error III_decode(struct mad_bitptr *ptr, struct mad_frame *frame,
--			  struct sideinfo *si, unsigned int nch)
-+			  struct sideinfo *si, unsigned int nch, unsigned int md_len)
- {
-   struct mad_header *header = &frame->header;
-   unsigned int sfreqi, ngr, gr;
-+  int bits_left = md_len * CHAR_BIT;
- 
-   {
-     unsigned int sfreq;
-@@ -2383,6 +2447,7 @@ enum mad_error III_decode(struct mad_bit
-     for (ch = 0; ch < nch; ++ch) {
-       struct channel *channel = &granule->ch[ch];
-       unsigned int part2_length;
-+      unsigned int part3_length;
- 
-       sfbwidth[ch] = sfbwidth_table[sfreqi].l;
-       if (channel->block_type == 2) {
-@@ -2391,18 +2456,30 @@ enum mad_error III_decode(struct mad_bit
-       }
- 
-       if (header->flags & MAD_FLAG_LSF_EXT) {
--	part2_length = III_scalefactors_lsf(ptr, channel,
-+	error = III_scalefactors_lsf(ptr, channel,
- 					    ch == 0 ? 0 : &si->gr[1].ch[1],
--					    header->mode_extension);
-+					    header->mode_extension, bits_left, &part2_length);
-       }
-       else {
--	part2_length = III_scalefactors(ptr, channel, &si->gr[0].ch[ch],
--					gr == 0 ? 0 : si->scfsi[ch]);
-+	error = III_scalefactors(ptr, channel, &si->gr[0].ch[ch],
-+					gr == 0 ? 0 : si->scfsi[ch], bits_left, &part2_length);
-       }
-+      if (error)
-+        return error;
-+
-+      bits_left -= part2_length;
- 
--      error = III_huffdecode(ptr, xr[ch], channel, sfbwidth[ch], part2_length);
-+      if (part2_length > channel->part2_3_length)
-+        return MAD_ERROR_BADPART3LEN;
-+
-+      part3_length = channel->part2_3_length - part2_length;
-+      if (part3_length > bits_left)
-+        return MAD_ERROR_BADPART3LEN;
-+
-+      error = III_huffdecode(ptr, xr[ch], channel, sfbwidth[ch], part3_length);
-       if (error)
- 	return error;
-+      bits_left -= part3_length;
-     }
- 
-     /* joint stereo processing */
-@@ -2519,11 +2596,13 @@ int mad_layer_III(struct mad_stream *str
-   unsigned int nch, priv_bitlen, next_md_begin = 0;
-   unsigned int si_len, data_bitlen, md_len;
-   unsigned int frame_space, frame_used, frame_free;
--  struct mad_bitptr ptr;
-+  struct mad_bitptr ptr, bufend_ptr;
-   struct sideinfo si;
-   enum mad_error error;
-   int result = 0;
- 
-+  mad_bit_init(&bufend_ptr, stream->bufend);
-+
-   /* allocate Layer III dynamic structures */
- 
-   if (stream->main_data == 0) {
-@@ -2587,14 +2666,15 @@ int mad_layer_III(struct mad_stream *str
-     unsigned long header;
- 
-     mad_bit_init(&peek, stream->next_frame);
-+    if (mad_bit_length(&peek, &bufend_ptr) >= 57) {
-+      header = mad_bit_read(&peek, 32);
-+      if ((header & 0xffe60000L) /* syncword | layer */ == 0xffe20000L) {
-+        if (!(header & 0x00010000L))  /* protection_bit */
-+	  mad_bit_skip(&peek, 16);  /* crc_check */
- 
--    header = mad_bit_read(&peek, 32);
--    if ((header & 0xffe60000L) /* syncword | layer */ == 0xffe20000L) {
--      if (!(header & 0x00010000L))  /* protection_bit */
--	mad_bit_skip(&peek, 16);  /* crc_check */
--
--      next_md_begin =
--	mad_bit_read(&peek, (header & 0x00080000L) /* ID */ ? 9 : 8);
-+        next_md_begin =
-+	  mad_bit_read(&peek, (header & 0x00080000L) /* ID */ ? 9 : 8);
-+      }
-     }
- 
-     mad_bit_finish(&peek);
-@@ -2653,7 +2733,7 @@ int mad_layer_III(struct mad_stream *str
-   /* decode main_data */
- 
-   if (result == 0) {
--    error = III_decode(&ptr, frame, &si, nch);
-+    error = III_decode(&ptr, frame, &si, nch, md_len);
-     if (error) {
-       stream->error = error;
-       result = -1;
diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index 1d6bdd86e9..5a51b2ecff 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -5,23 +5,19 @@ config BR2_PACKAGE_LIBMAD
 	  performed with fixed-point integer arithmetic, making it ideal
 	  for systems without a floating-point unit.
 
-	  http://www.underbit.com/products/mad/
+	  https://codeberg.org/tenacityteam/libmad
 
 if BR2_PACKAGE_LIBMAD
 
 choice
 	prompt "Speed vs. accuracy"
-	default BR2_PACKAGE_LIBMAD_OPTIMIZATION_DEFAULT
-
-config BR2_PACKAGE_LIBMAD_OPTIMIZATION_DEFAULT
-	bool "Default"
-	help
-	  Keep optimizations balanced between speed and accuracy.
+	default BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED
 
 config BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED
 	bool "Optimize for speed over accuracy"
 	help
-	  Compromise accuracy for speed.
+	  Compromise accuracy for speed. This also enables the
+	  subband synthesis optimization.
 
 config BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY
 	bool "Optimize for accuracy over speed"
@@ -30,22 +26,10 @@ config BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY
 
 endchoice
 
-config BR2_PACKAGE_LIBMAD_SSO
-	bool "Subband synthesis optimization"
-	help
-	  Use the subband synthesis optimization, with reduced accuracy.
-
 config BR2_PACKAGE_LIBMAD_ASO
 	bool "Architecture-specific optimizations"
 	default y
-	# arm optimization needs classic arm instructions support
-	depends on !(BR2_arm && !BR2_ARM_CPU_HAS_ARM)
 	help
 	  Use certain architecture-specific optimizations.
 
-config BR2_PACKAGE_LIBMAD_STRICT_ISO
-	bool "Strict ISO/IEC interpretations"
-	help
-	  Use strict ISO/IEC interpretations.
-
 endif
diff --git a/package/libmad/libmad.hash b/package/libmad/libmad.hash
index 2be1a8a3a8..4fc5954b9d 100644
--- a/package/libmad/libmad.hash
+++ b/package/libmad/libmad.hash
@@ -1,6 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.dsc
-sha256  bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690  libmad_0.15.1b.orig.tar.gz
-sha256  dfeabd5d2398bf902660edc31f87ad40600f0aa732b946f864d8ee6bbf56a99c  libmad_0.15.1b-10.diff.gz
+# From https://codeberg.org/tenacityteam/libmad/releases/tag/0.16.5
+sha256  f401b2ccf49c26ad0c3a6ef0179b1cbbff2406338b0603bb2033e6dcaf706114  libmad-0.16.5.tar.gz
 
 # Hash for license file:
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index d69adcc1d5..ebbc2fb683 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -4,44 +4,23 @@
 #
 ################################################################################
 
-LIBMAD_VERSION = 0.15.1b
-LIBMAD_SOURCE = libmad_$(LIBMAD_VERSION).orig.tar.gz
-LIBMAD_SITE = \
-	http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad
+LIBMAD_VERSION = 0.16.5
+LIBMAD_SITE = https://codeberg.org/tenacityteam/libmad/releases/download/$(LIBMAD_VERSION)
 LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LICENSE = GPL-2.0+
 LIBMAD_LICENSE_FILES = COPYING
 
-# 0004-md_size.patch
-LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
-
-# 0005-length-check.patch
-LIBMAD_IGNORE_CVES += CVE-2017-8374
-
-# Force autoreconf to be able to use a more recent libtool script, that
-# is able to properly behave in the face of a missing C++ compiler.
-LIBMAD_AUTORECONF = YES
+LIBMAD_CONF_OPTS = \
+	-DEXAMPLE=OFF \
+	-DOPTIMIZE=$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),ACCURACY,SPEED) \
+	-DASO=$(if $(BR2_PACKAGE_LIBMAD_ASO),ON,OFF)
 
-# libmad has some assembly function that is not present in Thumb mode:
+# The ARM fixed-point math uses inline assembly instructions that are
+# not available in Thumb mode:
 # Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode
 # so, we deactivate Thumb mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-LIBMAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+LIBMAD_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
-define LIBMAD_INSTALL_STAGING_PC
-	$(INSTALL) -D package/libmad/mad.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
-endef
-
-LIBMAD_POST_INSTALL_STAGING_HOOKS += LIBMAD_INSTALL_STAGING_PC
-
-LIBMAD_CONF_OPTS = \
-	--disable-debugging \
-	$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED),--enable-speed) \
-	$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),--enable-accuracy) \
-	--$(if $(BR2_PACKAGE_LIBMAD_SSO),enable,disable)-sso \
-	--$(if $(BR2_PACKAGE_LIBMAD_ASO),enable,disable)-aso \
-	--$(if $(BR2_PACKAGE_LIBMAD_STRICT_ISO),enable,disable)-strict-iso
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
diff --git a/package/libmad/mad.pc b/package/libmad/mad.pc
deleted file mode 100644
index 14af388661..0000000000
--- a/package/libmad/mad.pc
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: mad
-Description: MPEG Audio Decoder
-Requires:
-Version: 0.15.1b
-Libs: -L${libdir} -lmad
-Cflags: -I${includedir}
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
