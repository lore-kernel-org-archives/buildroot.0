Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5882606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I9zAF3K1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=J4r2ezmX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F02C607CE;
	Tue, 24 Nov 2026 10:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMiIHE-w41oR; Tue, 24 Nov 2026 10:41:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A378607E0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795516895;
	b=kPYCqkNYond7Pq+D1xsiuHADaYrFNzQBqnzbNOEh6DGOah9Et7CVYpuyQee7MzsCvT8D
	 sNRhVu27CwK2VPzS+gZmgzlm8zb3MJ/NaEeAkz31Vf6KCL0WcMb80UTjfWCyLy8S9mGA9
	 25qpobPJJIIwuxr6ZfhRP7TT2OOcL5KhqBsZtoQRndWmo8HyAB/cm4etPUAQtDtg3Vd3m
	 6rna5iq9V8LheOH814Um2wZFCpf+pTtE1cysjUaYT7sj9GMp7M3S7RI62X6ieX8btyV7P
	 wIThNwUyV0z4/CWK0GpnDdKScjeHL7z6Xlf6ihipzNzGWjF/OPbWnov8SlB3XD2foLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795516895;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c8HKJneYRnL3+L8Ehi8AB1qXbUZ9LuGxhKYu1NhLJy0=;
	b=dEccq/3OiegAdHZdl4U6XXXYA3etDAcr26OkeK1K1ZN0YsIHgDqXjHCJdkZ/WYhjtJib
	 m95Uw9CbGF+xSz4IBicXVicMlur5pbeGia81uWZKJO9qDIkha/X5rlG8/HH/BTUIXTFH1
	 JWyFoV1Y17w2BAuras71WOEDIj+9nnkdvwkEORbnallME5LhG2/VZAkmPUQra8+Umyhh4
	 +65y0Z8voXP1NY1tGzso88HzmmO1AE1KoI4oN2EbILrLDGglkbGXdOAiHI6//dL2KuI7P
	 H1OpR4boToJc0uERrNSxeMzXNGsPv9zt5a112TLeMuBa2T+RTt3Ptvi/hMiufblXPiw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795516895;
	bh=c8HKJneYRnL3+L8Ehi8AB1qXbUZ9LuGxhKYu1NhLJy0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=I9zAF3K1TKmDVVWSflQLcwlbAGSdPbTxZWn4U0VdjiK60y4DTHoRIzoAuO+yVPi3Q
	 La3hwFG8LpdJrvsDW9wBYy5ZPgLTBhE7fGDGvkFN5FxgiEy8n2BgeETc+rmAUi/CyG
	 SUYVFsMyF3J7c60ijox1fuAQLSlqbpEZb2XJAorB2aXXLOj12OQxtx9R8f1TbxRD9x
	 fGGHqxM7xogCFSPvvhl54YG7M4mE138igIQAqrUBdt4nlbln/gSFHdzR0gR3/MyvW+
	 6KnBKWDXU38l+cr4Om2VXhh94vEXlyQ4a1telfkYd4B11dmaSRm5Y4Fg+WX9GkOfnm
	 YBAtUlwogLp3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A378607E0;
	Tue, 24 Nov 2026 10:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC55A1AB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCE8F80F79
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqUpfoGrEHxs for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 10:41:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 43B0880F52
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=J4r2ezmX
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43B0880F52
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 10:41:31 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6baa6f27904so2916008a12.0
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 02:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1795516890; x=1796121690; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RMb/pXcQL6SEbn374ht0jDygQkJn2K5n9HjjQi36df8=;
 b=J4r2ezmX06D6VmGajqYUzPNspOcX1yrAGYImBYjzmM8xF1xDD3YuUAvnlrG4RTiSQ9
 DH5hCnnFpghPxnn9U0gx/B+Qd6cKz+iakcQ4RT4w8rSCPWRw9G7ml4IdYtSn5SoMbnf6
 ukIcdfRI2wn6q10SrRJF8GONBb2wUwEPxZxtAxy0SyATAxE4B0bmGlpYu+j27lmVy+BR
 A53IC8Q5iAwKFPAOmIQb1EgKZD8Ci18KwN9z1Aii5PVWrldBfzmqyZ4FT2p7BQEQgbta
 SYpYc6MUgpswYtxGnOYWxQbwRvcvpljaCR9/DrDlqWJQ26Pr97FMpsrzop8TrdzfKaV/
 SmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795516890; x=1796121690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RMb/pXcQL6SEbn374ht0jDygQkJn2K5n9HjjQi36df8=;
 b=w/2gH/Zxs3kaFwn6G/+N5jVvfuZ8J4O8iLVoSpGONjAzJKZQ93yyLJBLrUVMDA/9Xg
 6B42xCwcqqgRYTIbsyWs3AH/5NvjIQ7vijFlc5QlwGafYGq4jlVGUIGX5bRna5z6Phx2
 8Ym3RDdE+vMS9O1Al5/oBjaEC8sD8e19oVjN4xjG3csLUwO/YJH5SOXTPZor0H6dG+E4
 px1O6HW4pfMZIs91zHASMQ9AghvMxHg2GWLY8krSbX5LuktLMh2tJ+eY97sdzwWBc0Ze
 /O0KfUGvOoHnPUJ3wdQaOOtnrseJpuiQ7xMZAZGxHkvmM8oknLC7JBMkS154VtUOUAQ6
 tLGA==
X-Gm-Message-State: APuU4Z8AjtgsNfgbW480ymUDtpg0kugl3W8CH48J6rr1ywQobE/o9mno
 ZiFzYtEZC6wtyX1ZDW/qQ2JxIss6ym+wIGVCbKOwfjnBPiGk4bxLuJ+mAU1PUQ==
X-Gm-Gg: AZFdTZewZVBS8TglA4HmuTffViSpxJT4+Y9VTp2yVpvTXHQ3WPWiz1PcF54M6dIBRE6
 +Lu28C1Dng7kSi0BeCRDi+tCT6q5gd9XhdOgOV90oi6+SuG7Bpjp8Hrz8pvzPd7RModxYORL8vi
 1CSP6iyoJlAxuisOwM8rLkNQ4oJODY7TCs+BDVy5u2xbYe5DasNoo33cK6wpg/z2JdiiVVzjB7M
 VDD9n9xRzS9U5LrM3ZmHsm6QX6tp8WeOlumoR1SijSLMouiuVbnEeoZJLeNOjJFdLaj2W9F/vQw
 D3isj0/0qon3TlVdiCk+fvdrgqRSh8ao3Zp+amR+HBATrzbJpOrVvfU80deZs5hOf3U/YhzorM0
 f4ibm5p3iq8I8Y0TIW7JAEln8SxE4UIPJPNzs0fdSAlACo4ZjP5akoIQmRsUdU/PYsRDeNMoSpW
 mVPBmA7lFJOAelZYmtTzE8w891UNVwlkLhxi1HVZI2s6aBE5uYzFfkVaIyPdmYtm3W0Fv1iUAIX
 WCfQ8pk4LDqRc6nU0CqcuERJoiNG7MYKX8k+ou9pYPFBX+NXzJOLcyAW9rQMCtSGQwDjd4xE2us
 RbWUZ/krSrPoBpur4lX9eGpdDbIBUM8ra55fmW1n5xKhfqU04/psTIBhQvVHSNagEfEIBMy8kXV
 WVPdtsVSl
X-Received: by 2002:a05:6402:2484:b0:6b7:221c:beb with SMTP id
 4fb4d7f45d1cf-6ba37ac6648mr10890894a12.0.1795516889720; 
 Tue, 24 Nov 2026 02:41:29 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba370cbf42sm6553357a12.7.2026.11.24.02.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 02:41:29 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Nov 2026 11:41:28 +0100
Message-Id: <20261124104128.840156-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next] package/openmpi: bump to version 5.0.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
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

Open MPI 4.1.8, the last release of the 4.1 series (January 2025),
fails to build on 32-bit targets with GCC >= 14. In the internal copy
of PMIx (and the ORTE rtc/hwloc component), find_hole() passes a
size_t pointer to use_hole(), which takes an unsigned long pointer:

hwloc/hwloc.c:641:47: error: passing argument 3 of 'use_hole' from incompatible pointer type [-Wincompatible-pointer-types]

Fixing that is not worth it: the build then fails in ROMIO, where on
32-bit targets MPI_Offset is a 4-byte long while ROMIO's ADIO_Offset
is an 8-byte long long. That is a real ABI mismatch, not only a type
warning:

mpi-io/get_posn.c:55:33: error: passing argument 2 of 'ADIOI_Get_position' from incompatible pointer type [-Wincompatible-pointer-types]
note: expected 'ADIO_Offset *' {aka 'long long int *'} but argument is of type 'MPI_Offset *' {aka 'long int *'}

Upstream no longer builds or tests 32-bit configurations and dropped
32-bit support altogether in the 5.0 series, whose configure script
fails when sizeof(void *) is 4 [1].

So bump to the current 5.0.x release and make the package depend on a
64-bit architecture, excluding the MIPS n32 ABI, which has 32-bit
pointers. This also covers the previous exclusion of 32-bit SPARC,
and makes the MIPS32 Fortran cache file unused, so drop it.

Other changes:
- use the bundled copies of hwloc, libevent, PMIx and PRRTE
  explicitly, so the result doesn't depend on which Buildroot
  packages are enabled
- drop --without-ime: the IME check no longer adds -I/usr/local/include
  to CPPFLAGS when IME is not found
- LICENSE hash changed due to updated copyright years and holders,
  and the addition of the MPICH copyright notice for ROMIO

Release notes:
https://docs.open-mpi.org/en/v5.0.x/release-notes/changelog/v5.0.x.html

[1] https://github.com/open-mpi/ompi/issues/11248

The 32-bit build failure has been present since commit 366e7f1ecb4
("package/openmpi: bump to version 4.0.0"), which introduced this
code; it became a build error with GCC 14, which makes
-Wincompatible-pointer-types an error by default.

Fixes:
https://autobuild.buildroot.org/results/7ef87e57a460c1ea2ffb4fde6c142d25b6dce5a9
https://autobuild.buildroot.org/results/c2683f563e1b85339dfca6338cceb9696d17ae6f
https://autobuild.buildroot.org/results/69cf754b3e383aae40a38d437db48b32baf726ee
https://autobuild.buildroot.org/results/2c846c82b7dd6d005bc3985ae318e72fc822bb18

Fixes: 366e7f1ecb4343ef8b18aef2a11c49055cc89abe ("package/openmpi: bump to version 4.0.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/openmpi/Config.in                    | 11 +++--
 package/openmpi/openmpi-mips32-fortran.cache | 52 --------------------
 package/openmpi/openmpi.hash                 | 10 ++--
 package/openmpi/openmpi.mk                   | 21 ++++----
 4 files changed, 22 insertions(+), 72 deletions(-)
 delete mode 100644 package/openmpi/openmpi-mips32-fortran.cache

diff --git a/package/openmpi/Config.in b/package/openmpi/Config.in
index e64eb81c3e..911ccaa594 100644
--- a/package/openmpi/Config.in
+++ b/package/openmpi/Config.in
@@ -1,7 +1,12 @@
+config BR2_PACKAGE_OPENMPI_ARCH_SUPPORTS
+	bool
+	# Open MPI >= 5.0 no longer supports 32-bit builds
+	default y if BR2_ARCH_IS_64 && !BR2_MIPS_NABI32
+
 comment "openmpi needs a toolchain w/ dynamic library, NPTL, wchar, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_sparc
+	depends on BR2_PACKAGE_OPENMPI_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
 
@@ -13,9 +18,7 @@ config BR2_PACKAGE_OPENMPI
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	# from the configure script: "Sparc v8 target is not supported
-	# in this release of Open MPI"
-	depends on !BR2_sparc
+	depends on BR2_PACKAGE_OPENMPI_ARCH_SUPPORTS
 	help
 	  A High Performance Message Passing Library.
 
diff --git a/package/openmpi/openmpi-mips32-fortran.cache b/package/openmpi/openmpi-mips32-fortran.cache
deleted file mode 100644
index 36f9f02bb8..0000000000
--- a/package/openmpi/openmpi-mips32-fortran.cache
+++ /dev/null
@@ -1,52 +0,0 @@
-ompi_cv_fortran_sizeof_CHARACTER=1
-ompi_cv_fortran_sizeof_LOGICAL=4
-ompi_cv_fortran_sizeof_LOGICALp1=1
-ompi_cv_fortran_sizeof_LOGICALp2=2
-ompi_cv_fortran_sizeof_LOGICALp4=4
-ompi_cv_fortran_sizeof_LOGICALp8=8
-ompi_cv_fortran_sizeof_INTEGER=4
-ompi_cv_fortran_sizeof_INTEGERp1=1
-ompi_cv_fortran_sizeof_INTEGERp2=2
-ompi_cv_fortran_sizeof_INTEGERp4=4
-ompi_cv_fortran_sizeof_INTEGERp8=8
-ompi_cv_fortran_sizeof_REAL=4
-ompi_cv_fortran_sizeof_REALp4=4
-ompi_cv_fortran_sizeof_REALp8=8
-ompi_cv_fortran_sizeof_DOUBLE_PRECISION=8
-ompi_cv_fortran_sizeof_COMPLEX=8
-ompi_cv_fortran_sizeof_COMPLEXp8=8
-ompi_cv_fortran_sizeof_COMPLEXp16=16
-ompi_cv_fortran_sizeof_DOUBLE_COMPLEX=16
-ompi_cv_fortran_alignment_CHARACTER=1
-ompi_cv_fortran_alignment_LOGICAL=4
-ompi_cv_fortran_alignment_LOGICALp1=1
-ompi_cv_fortran_alignment_LOGICALp2=2
-ompi_cv_fortran_alignment_LOGICALp4=4
-ompi_cv_fortran_alignment_LOGICALp8=8
-ompi_cv_fortran_alignment_INTEGER=4
-ompi_cv_fortran_alignment_INTEGERp1=1
-ompi_cv_fortran_alignment_INTEGERp2=2
-ompi_cv_fortran_alignment_INTEGERp4=4
-ompi_cv_fortran_alignment_INTEGERp8=8
-ompi_cv_fortran_alignment_REAL=4
-ompi_cv_fortran_alignment_REALp4=4
-ompi_cv_fortran_alignment_REALp8=8
-ompi_cv_fortran_alignment_DOUBLE_PRECISION=8
-ompi_cv_fortran_alignment_COMPLEX=4
-ompi_cv_fortran_alignment_COMPLEXp8=4
-ompi_cv_fortran_alignment_COMPLEXp16=8
-ompi_cv_fortran_alignment_DOUBLE_COMPLEX=8
-ompi_cv_fortran_kind_value_C_SIGNED_CHAR=1
-ompi_cv_fortran_kind_value_C_SHORT=2
-ompi_cv_fortran_kind_value_C_INT=4
-ompi_cv_fortran_kind_value_C_INT16_T=2
-ompi_cv_fortran_kind_value_C_INT32_T=4
-ompi_cv_fortran_kind_value_C_INT64_T=8
-ompi_cv_fortran_kind_value_C_LONG_LONG=8
-ompi_cv_fortran_kind_value_C_FLOAT=4
-ompi_cv_fortran_kind_value_C_FLOAT_COMPLEX=4
-ompi_cv_fortran_kind_value_C_DOUBLE=8
-ompi_cv_fortran_kind_value_C_DOUBLE_COMPLEX=8
-ompi_cv_fortran_true_value=1
-ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
-ompi_cv_fortran_alignment_type_test_mpi_handle_=4
diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 78c60b2bf1..3207316ae7 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
-# From: https://www.open-mpi.org/software/ompi/v4.1/
-md5  72e95168a62a5b951da9afe4f48b0be9  openmpi-4.1.8.tar.bz2
-sha1  821df691e2c37ecc40b2784237cfdfda734bf13a  openmpi-4.1.8.tar.bz2
-sha256  466f68e3132a1dc02710cc2011fafced8336d98359fa2dae4dddcfd5719f12a9  openmpi-4.1.8.tar.bz2
+# From: https://www.open-mpi.org/software/ompi/v5.0/
+md5  284035e88115c3da0f9812ce1141232f  openmpi-5.0.11.tar.bz2
+sha1  02fa478148ebe764013bcc118930681952b89a31  openmpi-5.0.11.tar.bz2
+sha256  e668a3c4acd50c41dc204c8a6dd98a611e0f26af89cf677577fa9be8a2698003  openmpi-5.0.11.tar.bz2
 # Locally computed
-sha256  2db71de9577ebfe15c186605844c470dcecd3717f4ef0118c9440d801c0f58f8  LICENSE
+sha256  634751c4e5423ed5de79e3bff2782c79292c6987ad6d9b72e1f7ad05f05bb16f  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index eab87b5987..72b8436e7e 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -4,29 +4,28 @@
 #
 ################################################################################
 
-OPENMPI_VERSION_MAJOR = 4.1
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).8
+OPENMPI_VERSION_MAJOR = 5.0
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).11
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
 OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
 
-# The macro searching for IME (Infinite Memory Engine) filesystem
-# brings "-I/usr/local/include" in the CPPFLAGS, even if not
-# found. This makes the configuration fail. See:
-# https://github.com/open-mpi/ompi/blob/v4.1.5/config/ompi_check_ime.m4#L35
-# Disable explicitly to avoid the issue.
-OPENMPI_CONF_OPTS = --without-ime
+# Use the bundled copies of hwloc, libevent, PMIx and PRRTE, so that
+# the result doesn't depend on which Buildroot packages are enabled.
+OPENMPI_CONF_OPTS = \
+	--with-hwloc=internal \
+	--with-libevent=internal \
+	--with-pmix=internal \
+	--with-prrte=internal
 
 # Enabling Fortran support requires pre-seeding the configure script
 # with various values that cannot be guessed, so we provide cache
 # files for various architectures.
 
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-ifeq ($(BR2_mips)$(BR2_mipsel),y)
-OPENMPI_FORTRAN_CONF_CACHE = package/openmpi/openmpi-mips32-fortran.cache
-else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+ifeq ($(BR2_mips64)$(BR2_mips64el),y)
 OPENMPI_FORTRAN_CONF_CACHE = package/openmpi/openmpi-mips64-fortran.cache
 endif
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
