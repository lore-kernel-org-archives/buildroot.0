Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392BE606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 06:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I0grnbF+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1932E607ED;
	Tue, 20 Oct 2026 06:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7IQCyQ9YOo1; Tue, 20 Oct 2026 06:44:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A3F460810
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792478661;
	b=jzAgmqOqPjzb2RENIHQywoasqpZ1GuldRs6d+auQSRPcYp7lFtlrxbA0KUGZl7U7ocZc
	 AZ/6Jp8GBQr02UpY+4UKvOLgMYs5etEGzHMUOImP511HjqZKEqsCPmmpTtyFFzlfQqa70
	 bbCMWfVjNQOtk/kplns0CGG5JQ/8vs3E7xKngouBuaPLamz49VqzTz6K9BCAG3p4Ftjad
	 D0t6H4zOstiJkMy0VM6PQGoY6JfgGqMw7MpWChbqoXkNWpiHW2XIJ2OShfNK2Yd7/ekDC
	 dXvLdP39XDdOnTvkJFW3apzEdk50s3NbqFRqzKjSbiYELkhMYHOr0hmqyMenH0dm7SA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792478661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cg5cQWDNc/UwQo315Q/8wX+Pwk5xbgikS3StelEphSw=;
	b=D8ISsaZdBsj6PZ+4mksUgu2qMBHcgict4+5Heu9CkAeiwJqN5Jlr45i1E+d2GL6qdQQD
	 R/YdRMGjKl0j6bHbtOXMu8FzxhOu3kTo/RhRDIHhvjakoUMRN+K/a/yjDivXOj4uoEn3c
	 qX0oQdM66YTV+7jNlqXtKQD+hnRno8SXEpkL9QfszxqJSPOw/ARM2eU9BUoVsymP0R7UE
	 sQR1FbdMzVVuw51eOJ7+oWWHZARPPDCV9MZusc5DlKjcEt1+iRQl1yuIjJqfx8JlWLmM8
	 F7fwwH5/r0YF++NQfziORie9sqvZ99G1iL/Tg8opSzF7kTZLCCMBjThFsL/tGr7dKRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792478661;
	bh=cg5cQWDNc/UwQo315Q/8wX+Pwk5xbgikS3StelEphSw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=I0grnbF+Q7KeEg4VJVu6tHWy0QwZ67VUiMLlDg3lFS4R+rw3YN90aLLAW1+a/VDqS
	 8518fhgjT2t2puF+9ltjvRomw3dugttWrQNVir82HlMA5B4x943z/l6oOAkZSoJcAw
	 R3GPo80ggWw/1wi5ljEUN9TnkZ3CCzpeNVE1hrHgrWaQ98ecJE/BubtIaZ121GvrVq
	 qwXGSFlTVtRR9xtyMtzmGUROGumhD/Xs0obcU9b/YTOD+Fyu44iu5eb9PGkvJj7xrP
	 nyVzFX7vJreKJWOzgOAMfTJZGDouYOBAk5OK6/cWQ1oWVBZt6ENQ4Sm0V6KAaJq6UZ
	 cADYeJCorGdhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A3F460810;
	Tue, 20 Oct 2026 06:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF61A23A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B157A607BE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYoXQY72QLZb for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 06:44:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8972B607EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792478654;
 b=kI2LBm1uuMh0lp77p9DknyhSKd3+iqM4DLgWRmMYf4pjkx0vnCyRQwlRm10Q4dVI7Fij
 Is4K99ca49VgCJBU5M0BBnoaD//7etJG82WsRxHqgblMaGgcYSgBI3sJ0pPIm8wr4TPp5
 +/hIcfs1o0IiemUUEIuP3PEgZF9SUqMqTee9OPUXVq0Uoez1CkDcfY4UNoPkz4a9JpJZQ
 DObZysTAUI3CzAVcuT5rNWF7cruvYGcA4glvcL3jKo1m29ADRHhOEoiO4/rLh41Nsbt7Q
 QfzzO9FMVzmtg8VTwmvaNuFUHltkACCn5WNu+BTXatHF4Zaa/OXFmFGzX0vnvqdB85A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792478654;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=WaosPqLmqMytBPsrY+eRn/XFvB8mBVBh0+MTeMGZDNA=;
 b=dHciV7PJIcgMt8XGmWNz8+/9a24omtcMaMxLtUwKyX8wmGkECK9qp+rtC8W1IL7eQGcS
 gQY6oXvtZ9v03uOSQzW1Wv2/e+PeEL3a6s4S8USzannwXz8O+4XoBnWHPN4Bjxp3ZKPC0
 oIgXKszx7d9oooC3sBIfNpzOeWuaQDSthUDoGnzKG65mU0BHBOCZB9VdadYlSnQf5slng
 zDssBSjb5WnoUe4CL0AG4lXk38O3TwO9Moq5P4CAvLqsSnM1pfN9alWp40LS9uXtNa3xl
 9GOfawrn4Jy6AwRvUPaqxcBZ1/MHsAGNU2+PtPDa8upRQJgN8ih8VWj89FlwbPSo8UA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LqsbVTCF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8972B607EA
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48dc202a60eso712410f8f.3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 23:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792478652; x=1793083452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WaosPqLmqMytBPsrY+eRn/XFvB8mBVBh0+MTeMGZDNA=;
 b=QgLhTB9j01CG9D/DAYmak7lhgZ+Kbf6KEq6o5xP3giUh0fGAc70sjT4/f0VU3T4lCW
 VRqdx+nu2H5RJQ2XG36BRyfiIAHrSippbOTAmyqiAGOV37lgTOKh9sluYpmzsJo3YWIv
 tq46yJ/drLZSX7YclgC8v0ce1OP0slHGfR9OHnWt4XAkgBKslhUnE9Ama4cUiL0nLL8Y
 28AxMPiGnsiL5DG6pj4l3x61WmxLdB7VfDToHGk9xZrs0t2RQFKuG8A+PirgXXlKmzR7
 03U6oM52wzyJq+uCUxLKaISKVQOEp8s7Xiu68LKZnA1qtrrHqfKkEEXOhLcpjfUe1CTG
 kVCw==
X-Gm-Message-State: AFq9FYLcXj+UouHspHboTACJE3dXH5xHTPZNjd5zJ9f7MZaL3jF/h88Z
 VKK/RRiPn7Fbdjn5YFWfXrF+xkIX/ipEpRbl8Cgdbmzg7gd04t/jMhEhRKJpu+uRD8l+YvetZmD
 p/wRg
X-Gm-Gg: AYBFou0lZ1wZI+NP7bWKQPiz//GiZNaM+tg9a2BCWq6UGWvjuMEOPsCN1HQ0TqfwhFz
 VdSVelNs6msD4KuWYXjIwzaSlJztEUXsSMv3o8qsCnxpwn+BSNICqDBSlVOAIvL+DYFLuXo3qsL
 1toOT1+C0b/tTpiI8PXAgtP+qU1DEzUxvjJhuIim1Pz9JzRva4ti9batM0tP3qFGiCrUs91OiuD
 ICzLsQ4h2g3TKpo4MDGY1ufLZLZL7zDVsFMmAzEqjuJyou60qA8hw4yuZRUIqp7JTS5fPVMTiRL
 x8DEYH+J1zAH5pxnx3/uIRxZt3NE5I3UdS3l+LiapGZK/CFBHkex8strNepMQGZ7ig9ia0kAh4R
 J6WBOOdFaBMRhLoyXzpGx1X40NrKrs33xzNdjAiR+wYjhjpd2g5d0jQKUzXJj2fsBKS0Ih2aEYJ
 zeRfVq1Eaooj/vmZPGVma/HwJmC3mprXyeV/Zcqpv8nLCSLcZgj6sQskjvmCteQBjGQOta/y0pm
 A==
X-Received: by 2002:a5d:414d:0:b0:487:219e:5e20 with SMTP id
 ffacd0b85a97d-48e07fa8ce2mr14476733f8f.51.1792478652443; 
 Mon, 19 Oct 2026 23:44:12 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d823cfcsm4013632f8f.39.2026.10.19.23.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 23:44:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:44:09 +0200
Message-ID: <20261020064409.179420-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020064409.179420-1-thomas.perale@mind.be>
References: <20261020064409.179420-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 3/3] package/python-numpy: fix meson
 configuration with LAPACK
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building numpy with the LAPACK package enabled (like when building
python-scipy) would result in the following error during configuration:

```
numpy/meson.build:203:49: ERROR: Could not get pkg-config variable
and no default provided for <PkgConfigDependency lapack: True None>
```

This is reproducible with the following defconfig:

cat >.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_NUMPY=y
BR2_PACKAGE_LAPACK=y
EOF
make oldefconfig
make python-numpy

The variable that triggered that error got assigned a default value in
upstream commit [1] which is available in python-numpy v2.0.0, which fix
this error.

This commit backport the part of the upstream commit that assign the
value by default.

[1] https://github.com/numpy/numpy/commit/34afbb97cc9915ad5976ddc869a539e897545722

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/17125191093
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...implement-BLAS-LAPACK-auto-detection.patch | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch

diff --git a/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch b/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch
new file mode 100644
index 0000000000..f7822ef852
--- /dev/null
+++ b/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch
@@ -0,0 +1,77 @@
+From 34afbb97cc9915ad5976ddc869a539e897545722 Mon Sep 17 00:00:00 2001
+From: Ralf Gommers <ralf.gommers@gmail.com>
+Date: Tue, 10 Oct 2023 00:27:02 +0200
+Subject: [PATCH] ENH: meson: implement BLAS/LAPACK auto-detection and many CI jobs [wheel build]
+
+This reimplements the auto-detection and many of the switches that
+`numpy.distutils` offered. Beyond that, it implements several new
+features:
+
+- Auto-detect the symbol suffix for ILP64 OpenBLAS (can be none or
+  `64_`)
+- MKL ILP64 support, threading control, and use of the layered library
+  model for MKL >=2023.0
+- FlexiBLAS support (LP64 and ILP64)
+- Support for the upcoming standard in Reference LAPACK for `_64` ILP64
+  symbol suffix convention.
+- A test suite for BLAS/LAPACK libraries, covering:
+
+    - OpenBLAS: LP64, ILP64 detected via pkg-config and with a "system
+                dependency" (i.e., custom code inside Meson)
+    - MKL: LP64, ILP64 (layered) and LP64 (SDL)
+    - Accelerate: LP64, ILP64 on macOS >=13.3
+    - FlexiBLAS: LP64, ILP64 on Fedora
+    - ATLAS (LP64, via pkg-config only)
+    - BLIS (LP64, via pkg-config only)
+    - plain libblas/liblapack (Netlib, LP64 only)
+
+The list of libraries that is tried with the default 'auto' setting
+excludes a couple of libraries, because they're either no longer
+developed (ATLAS), not mature (libflame), or can't be tested and
+may be re-added later (ArmPL, ssl2). Those libraries can still be
+quite easily used via pkg-config.
+
+The new CI jobs are running by default right now. Once things settle
+down, the plan is to disable them by default and allow triggering
+them via a `[blas ci]` command in the commit message (just like for
+wheel builds).
+
+Docs will be included in a separate PR with the pending rewrite of
+all the build/install docs. For now, the CI jobs and the
+`meson_options.txt` file serve as guidance for how to use this.
+
+Note that the test suite contains a few hacks, because of packaging
+bugs for MKL on PyPI (broken .pc files) and BLIS (missing .pc file in
+Debian).
+
+Upstream: https://github.com/numpy/numpy/commit/34afbb97cc9915ad5976ddc869a539e897545722
+[thomas: backport subset of upstream commit.
+  Only the part that fix the 2025.02.x scipy version LAPACK detection.
+
+ Fixes:
+    numpy/meson.build:203:49: ERROR: Could not get pkg-config variable
+    and no default provided for <PkgConfigDependency lapack: True None>
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ numpy/meson.build | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/numpy/meson.build b/numpy/meson.build
+--- a/numpy/meson.build
++++ b/numpy/meson.build
+@@ -198,10 +198,10 @@
+   if dep.found()
+     conf_data.set(name + '_VERSION', dep.version())
+     conf_data.set(name + '_TYPE_NAME', dep.type_name())
+-    conf_data.set(name + '_INCLUDEDIR', dep.get_variable('includedir'))
+-    conf_data.set(name + '_LIBDIR', dep.get_variable('libdir'))
+-    conf_data.set(name + '_OPENBLAS_CONFIG', dep.get_variable('openblas_config'))
+-    conf_data.set(name + '_PCFILEDIR', dep.get_variable('pcfiledir'))
++    conf_data.set(name + '_INCLUDEDIR', dep.get_variable('includedir', default_value: 'unknown'))
++    conf_data.set(name + '_LIBDIR', dep.get_variable('libdir', default_value: 'unknown'))
++    conf_data.set(name + '_OPENBLAS_CONFIG', dep.get_variable('openblas_config', default_value: 'unknown'))
++    conf_data.set(name + '_PCFILEDIR', dep.get_variable('pcfiledir', default_value: 'unknown'))
+   endif
+ endforeach
+ 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
