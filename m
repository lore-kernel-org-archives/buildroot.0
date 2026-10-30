Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF94606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=axfICs13;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bjD4aek1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE60812A9;
	Fri, 30 Oct 2026 15:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Rqx-S8D9Mej; Fri, 30 Oct 2026 15:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0796D8129B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373894;
	b=lUZJ3BHiNPDA+AXUuODyPTnmwky0ObyZCBh2mkV1T/YvmCSnYL9HS7spmvO18T3O+ICU
	 K5fW4ZqVNWNaseUzjI/ztCysqTqsYeyTfPxWkGMrVYb3YuIn8+pU7D4omVVCjuu4Yvcky
	 fwU3REIveuRymWH2N1VaArpY71m6eO+qeKlmOQtl7EMOgjSzp4hDGoWazQ+2ksnjNLMbT
	 P8Uj6h0Xo4nOeH4iEaEap0II3e57L/WgEB+NAujuGCccpl6QzRteh1EWf31aYoxl3UXrl
	 OPO1VqcCnVFWyQVeMm78+lwflNRVYiStNjBZARIo+CwfER6iR4DoCH62HvzBTpH1zVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=j2UQSeWn1+iqGRajl479BJn4BL58RBPKqLV37G55/pI=;
	b=sk9zZt1zasL1LkKfbd1aXvNgA2e40SbQeT9v1QEGl0hJNyZSsPjZmDzFmoetr2e7jm8q
	 uH5nYmkEauRvtRpdClcZo74kMutF6uZR7RvkjW56bI9duq8WQPmUU6BHUbfJWxEIK9O2a
	 yMbjbOvu0NzpkiFAW+Fk22/wtgEIXVHdn86ZJzleUo47G0+ucYeTNnwj52dWqKztSLtsF
	 K8qD+IV6W8W9/NHqmz2ww/eAzZrx/4v0Wcr4f4cvP9gQOYymwxo3GFjzbT490LJSOL7lk
	 3KBUQu8sMQQYJVQY5xcOlLrJwnSIQRYongGMBXSGvwtdUBiHU9QUjLPSmNEnshfLlOw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373894;
	bh=j2UQSeWn1+iqGRajl479BJn4BL58RBPKqLV37G55/pI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axfICs139f377cHwelAAx0eUAiwGee88ruKipgmcqXWUZF99OT6DG3PQKef50FvPu
	 MtY6sgHDQjHyZGDj9pP7RlT/QE1cNEIMMT0j+oj29KEHBxnM2V/Zzi/1eKdk4gxESf
	 PNjJ3AvssDsdpWyszUIXQn80j+Lb+VVw2KWdw/Z0lCuvHrVd2Lf6LkNTvqXev//I1G
	 6/J5XoW0QPcguFg3+eXeIMhlEHvgqdPSLth1toFzDCAE0EARblXhjT0Ieok4WC0deb
	 /Wp72jwfLmNJLuuQCmE8ND411PN+PdGzRPEQ1qYY+KETswrjGBh6S3NmlWVddUa6g5
	 0hGN1vTiycuqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0796D8129B;
	Fri, 30 Oct 2026 15:24:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CFDD362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9783B6087F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugcVt1qM3Z0e for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B0BF060A90
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373885;
 b=CQEJ/1KKCffVfimYVig4fLG9idgjWQiscfKFB3252SYYhsouDKBFQv0gLXJxXCXsNq20
 KDI5Dwhj/uuD0LQswhw3e3p+bf0QRPIOP1JidkOVC0u3CPKPg7je9KBZDgMI4DCPjq6sD
 mwQBCjRiKG+nsG3Saq9RKaZQsdSgrCv9ZngJJpIIOVGvZJIEZPl/d3H3/wKKYoDhxy1AC
 gM+8Um4j2NmdzPTrpUPycjyi73XcIa03m9TPw5ILiFp2nFhlgzuL7IERIFnfEUVurpBUZ
 1DWJ7/wbUOsEy8Jk5uSBhOKphSEtmPIsB2/KDNYPsnlXlCufuNdQjHt17KOhpwklPzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373885;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9WYSK88G3YRvM85vu9cWB+ic6rOtt6vas0+yiutmQtk=;
 b=V1pR0xgrga5rjyIozzU6kk6ULGNhNGDCrmqFON+zWc+gVvLqIrlmW28L3YwLD3IBK3Cg
 Ghi0h9VhzeTiVevlq1jcof0y3t1AyyYxQapl2uWxdbKVZplnNgIEWPaBusm12fG2ReriX
 en6vaJcFh1OUiMfXcJ9BNqhEvdvJLkjvsr0jtpXFAWjCUiJaJI5mjAY8eRP9flf9/+ccq
 MGKIf92Pe4fwcaKx8y/X8oQL9Q8feP3lg11c73QsV+2e/SIXAuuHJ96YKJLYJXAw8PO4z
 B+UOhQ+qEA5PRAGyUMRe//YPvxGncrXnPl5e9zOKbZoncde6ZKA1g40YxqarGdqlthA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=bjD4aek1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=bjD4aek1
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0BF060A90
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so881476f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373882; x=1793978682; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9WYSK88G3YRvM85vu9cWB+ic6rOtt6vas0+yiutmQtk=;
 b=bjD4aek1RFM5BN3TPaf7ahdlMRafPtUpq6d/8NE/qj88WW9GXkj6mpXKXo+gmP31HZ
 TTQw0g5PT2Lhqe0QZFbXufGYVyVoK+z4KLOPPrPw9zwveJT69sM0WPRr11JLbW1xtYlV
 ae1oWFyKkZ87UVwyhqtW963zeMLoB7updz7MghegoYQPgixn0+BBlae6Wegw8Ex9ZciP
 zZWal+Z9AKLGFdIX8FAiF8AUssob28Y4FSF15CuOqCofdQ9fUM5Wch2RS5V+QDruexo0
 w5uxLzKoyHork0PK+tNF9uykGCNOXu3YVMzeu4J1H4AKvu258YToJITDv/az5gpXwIXc
 d0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373882; x=1793978682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9WYSK88G3YRvM85vu9cWB+ic6rOtt6vas0+yiutmQtk=;
 b=c+WtAAI3eCixhwz1RBYopZdqVh9sFPr55YRQSf2EsE4LtnjNrmhSRg0DGVm9lg/JHL
 kkvS3zIfAHTQU3pQQvLhYK6LGdWvQ42Dz/4nTZGM1DcDLHV8Yq4QNKGB5xAIuPPJtdw7
 WOCzwlDYlaE5isCJtuJAZb4LRkbsxVI3N4LmRs4FRcwc6nGCQ5EjpfITIvtEgEod7dQD
 nWjfj8aAKQYu0xQ6OR8rDM6KAQU6ICylOGCc+3RTJ1pE7hI67O13GcCMn6fmMknu5EbJ
 m/bGexDzIQNE8XakaAJjnhIKI5cXH+b4d2HCS2s4mr5rwB5yePgu/OyFfdtoJCGB0XVZ
 wRGg==
X-Gm-Message-State: AFq9FYKBuqB2O3ZSEdm/hEtldUDyo5+ZF3QKoTCZ+zcrQUQjgAw7LHfI
 M66zUjNVGlY2s5P4lhz7C/A+tKj2/+71Vnje335e52UqZQwvN7Ky4eZ0cZcjhA==
X-Gm-Gg: AYBFou2GrZili3C/A/Sn7DX/5W+2KiAITMchCdyqdDZ8+xjai3TYbC3jej+74Z+XwPO
 PXqz2JpQMfZL4v1c738FxNXYv0FaVfoSaCA/Mhk1tzzHxESxXzU6D1HX5X/aaHKVu3f4IVNsMhi
 9rHKIQchXSDLqCM+NdNP8UYv28NrmxkXd0LbIWkzaRNR6aaOUIBNfX+L4JVi3OiENoqGlLlBErA
 WuJTfOSHeSsmyuef+afEc1NtNY4nqiJRGbJLBlxHBI7l2lYk1jiGZ1eQ262C5Z7iSZ9LNTGzb1Y
 Wle9uaDslS5hLKRbLATmpMLDwihtXdLVh+2MRIIu8lRnZ2tuid86uNNmLlyvWvlnO6Y9HBCZR78
 zSi36GI7orDUsmix1o55YUU0p6bKuznjW7YUOF2g+ojyXPZpk1odELlqZMHU54o37hXPNo7xwQn
 w1WRWbDsBKCsZUJ4KmXxsilGHaVhJjAiqpP2Y9sziZlhBqQ66/+kL7cErABdsAMZeCgBAYm3dpc
 3w8v6MBoFncnFLaoMXjV9WTbC3SeUdruF9OvzvJdCyUVKadv83MtnhTUb1z/tGkdSHTRYi+io0p
 GNNqvBgAB2VgEwERNmuCQb4ivzDpSEloZXbuT02E1yBug32NNSboKlo=
X-Received: by 2002:adf:fa81:0:b0:48e:2114:8ab9 with SMTP id
 ffacd0b85a97d-48e6e4f578bmr4927552f8f.31.1793373882179; 
 Fri, 30 Oct 2026 08:24:42 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:41 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:29 +0100
Message-Id: <20261030152434.3738285-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/9] package/falcosecurity-libs: bump to version
 0.21.0
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

falcosecurity-libs is now a cmake package building and installing
libscap and libsinsp as shared libraries, with all the bundled
dependencies disabled. The pkg-config files are fixed up in staging, as
they contain absolute staging paths.

The dependencies changed accordingly:
- grpc, protobuf, c-ares, libcurl, openssl, jq, libb64, gtest,
  elfutils and lua are not needed anymore
- re2 and uthash are new dependencies
The glibc dependency is replaced by the one of tbb, which also supports
musl.
The new dependencies are propagated to sysdig.

Only the kernel module driver is built: to keep the build small, the
eBPF engine (needing elfutils) and the gVisor engine (needing protobuf,
x86_64 only) are disabled, and can be enabled in a following patch. The
modern eBPF probe would also need clang and bpftool.

The kernel module is now built from the sources and Makefile prepared by
the driver CMakeLists.txt, instead of generating driver_config.h by
hand, which hard-coded the driver API and schema versions to 1.0.0. The
kernel module needs CONFIG_IPV6.

falcosecurity-libs now only supports 64-bit architectures (x86_64,
aarch64, s390x, riscv64, ppc64le and loongarch64), as the syscall tables
only exist for them.

Patches:
- 0001 is dropped, as grpc is not used anymore
- pass ARCH and CROSS_COMPILE to the configure modules used to detect
  the kernel features, otherwise they are built for the build machine
  and the kernel module build fails
- backport the upstream fix for Linux 7.3

sysdig 0.29.3 can't be built with this version, it is bumped to 0.41.4,
which needs falcosecurity-libs 0.21.0, in the following commit.

Release notes:
https://github.com/falcosecurity/libs/releases/tag/0.21.0

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 -------
 ...-pass-ARCH-and-CROSS_COMPILE-to-the-.patch | 38 +++++++
 ...ver-replace-removed-task_euid-helper.patch | 33 +++++++
 package/falcosecurity-libs/Config.in          | 39 ++++----
 .../falcosecurity-libs.hash                   |  4 +-
 .../falcosecurity-libs/falcosecurity-libs.mk  | 98 +++++++++----------
 package/sysdig/Config.in                      | 21 ++--
 8 files changed, 150 insertions(+), 118 deletions(-)
 delete mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
 create mode 100644 package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..662d454f29 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -310,7 +310,6 @@ package/exim/0003-Skip-version-check-and-symlink-installation.patch lib_patch.Up
 package/exim/S86exim lib_sysv.Indent lib_sysv.Variables
 package/fail2ban/S60fail2ban Shellcheck lib_sysv.Variables
 package/fakedate/fakedate Shellcheck
-package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch lib_patch.Upstream
 package/fbgrab/0001-fix-static-build.patch lib_patch.Upstream
 package/fbset/0001-Fix-musl-compile.patch lib_patch.Upstream
 package/fbterm/0001-fbio.cpp-improxy.cpp-fbterm.cpp-fix-musl-compile.patch lib_patch.Upstream
diff --git a/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
deleted file mode 100644
index 6141d8ef72..0000000000
--- a/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2e8a50cd4975df3ab60ee07c9675831cd5ad397f Mon Sep 17 00:00:00 2001
-From: Francis Laniel <flaniel@linux.microsoft.com>
-Date: Tue, 12 Apr 2022 19:54:11 +0100
-Subject: [PATCH] cmake: Permit setting GRPC_CPP_PLUGIN.
-
-This patch enables users to set GRPC_CPP_PLUGIN while calling cmake with:
-cmake -DGRPC_CPP_PLUGIN=/path
-
-Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
----
- cmake/modules/grpc.cmake | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/modules/grpc.cmake b/cmake/modules/grpc.cmake
-index e5fd16b8..9d8f5934 100644
---- a/cmake/modules/grpc.cmake
-+++ b/cmake/modules/grpc.cmake
-@@ -12,9 +12,11 @@ elseif(NOT USE_BUNDLED_GRPC)
- 		set(GRPCPP_LIB gRPC::grpc++)
- 
- 		# gRPC C++ plugin
--		get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
- 		if(NOT GRPC_CPP_PLUGIN)
--			message(FATAL_ERROR "System grpc_cpp_plugin not found")
-+			get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
-+			if(NOT GRPC_CPP_PLUGIN)
-+				message(FATAL_ERROR "System grpc_cpp_plugin not found")
-+			endif()
- 		endif()
- 
- 		# gRPC include dir + properly handle grpc{++,pp}
--- 
-2.25.1
-
diff --git a/package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch b/package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
new file mode 100644
index 0000000000..13b68d5569
--- /dev/null
+++ b/package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
@@ -0,0 +1,38 @@
+From fef2154ea3ce5e95af90bf35f7f062762362a3a9 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Fri, 30 Oct 2026 14:18:02 +0100
+Subject: [PATCH] driver: configure: pass ARCH and CROSS_COMPILE to the
+ configure modules
+
+The configure modules are built with an empty environment, so when
+cross-compiling the kernel module, ARCH and CROSS_COMPILE are lost and
+the configure modules are built for the build machine architecture,
+which fails, also making the 0__SANITY check fail.
+
+Pass ARCH and CROSS_COMPILE as well, only if they are set: an empty ARCH
+in the environment would prevent the kernel Makefile from setting it.
+
+Upstream: https://github.com/falcosecurity/libs/pull/3153
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ driver/configure/Makefile.inc.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/driver/configure/Makefile.inc.in b/driver/configure/Makefile.inc.in
+index af4b1f5..54c852f 100644
+--- a/driver/configure/Makefile.inc.in
++++ b/driver/configure/Makefile.inc.in
+@@ -3,7 +3,9 @@ MODULE_MAKEFILE_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
+ # Run the module build.sh (wrapper for make) script with an empty environment,
+ # but pass PATH, KERNELDIR and eventually (if set) CC and KBUILD_MODPOST_WARN.
+ # The latter ones are used by driverkit build templates.
+-HAS_@CONFIGURE_MODULE@ := $(shell env -i CC="$(CC)" KBUILD_MODPOST_WARN="$(KBUILD_MODPOST_WARN)" PATH="$(PATH)" KERNELDIR="$(KERNELDIR)" sh $(MODULE_MAKEFILE_DIR)/build.sh ; echo $$?)
++# ARCH and CROSS_COMPILE, used when cross-compiling, are only passed if set, as
++# an empty ARCH would prevent the kernel Makefile from setting it.
++HAS_@CONFIGURE_MODULE@ := $(shell env -i CC="$(CC)" $(if $(ARCH),ARCH="$(ARCH)") $(if $(CROSS_COMPILE),CROSS_COMPILE="$(CROSS_COMPILE)") KBUILD_MODPOST_WARN="$(KBUILD_MODPOST_WARN)" PATH="$(PATH)" KERNELDIR="$(KERNELDIR)" sh $(MODULE_MAKEFILE_DIR)/build.sh ; echo $$?)
+ 
+ ifeq ($(HAS_@CONFIGURE_MODULE@),0)
+ $(info [configure-kmod] Setting HAS_@CONFIGURE_MODULE@ flag)
+-- 
+2.34.1
+
diff --git a/package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch b/package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch
new file mode 100644
index 0000000000..179dd6f047
--- /dev/null
+++ b/package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch
@@ -0,0 +1,33 @@
+From e85e268edef7fa6155ffb186f068f5c512fdf5b5 Mon Sep 17 00:00:00 2001
+From: Leonardo Grasso <me@leonardograsso.com>
+Date: Mon, 7 Sep 2026 09:20:30 +0200
+Subject: [PATCH] fix(driver): replace removed task_euid helper
+
+Linux 7.3 removes task_euid(), breaking the kernel module build on architectures that capture sched_process_fork.
+
+Use task_cred_xxx(child, euid), matching the removed macro expansion and preserving the existing credential lookup and RCU protection. The helper is also available on older supported kernels.
+
+Signed-off-by: Leonardo Grasso <me@leonardograsso.com>
+Upstream: https://github.com/falcosecurity/libs/commit/fd77846d4920bfea2211ac229d3b2a814d4835da
+[Angelo: backport to 0.21.0]
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ driver/ppm_fillers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/driver/ppm_fillers.c b/driver/ppm_fillers.c
+index 7abc11d..f385a09 100644
+--- a/driver/ppm_fillers.c
++++ b/driver/ppm_fillers.c
+@@ -8001,7 +8001,7 @@ int f_sched_prog_fork(struct event_filler_arguments *args) {
+ 	long swap = 0;
+ 	int available = STR_STORAGE_SIZE;
+ 	uint32_t flags = 0;
+-	uint32_t euid = task_euid(child).val;
++	uint32_t euid = task_cred_xxx(child, euid).val;
+ 	uint32_t egid = child->cred->egid.val;
+ 	struct pid_namespace *pidns = task_active_pid_ns(child);
+ 	uint64_t pidns_init_start_time = 0;
+-- 
+2.34.1
+
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 66ee55f101..c73b92d78f 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -1,27 +1,28 @@
+config BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_loongarch64
+	default y if BR2_powerpc64le
+	default y if BR2_riscv && BR2_ARCH_IS_64
+	default y if BR2_s390x
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
+
 config BR2_PACKAGE_FALCOSECURITY_LIBS
 	bool
-	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
-	depends on BR2_USE_WCHAR # grpc -> libabseil-cpp
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # re2 -> libabseil-cpp
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # grpc -> libabseil-cpp
-	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
-	depends on !BR2_STATIC_LIBS # protobuf, tbb
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
-	depends on BR2_TOOLCHAIN_USES_GLIBC # tbb
-	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
-	select BR2_PACKAGE_C_ARES
-	select BR2_PACKAGE_ELFUTILS
-	select BR2_PACKAGE_GRPC
-	select BR2_PACKAGE_GTEST
-	select BR2_PACKAGE_JQ
+	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, re2, tbb, valijson
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # re2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # re2, tbb
+	depends on !BR2_STATIC_LIBS # re2, tbb
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # tbb
 	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_LIBB64
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_RE2
 	select BR2_PACKAGE_TBB
+	select BR2_PACKAGE_UTHASH
 	select BR2_PACKAGE_VALIJSON
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash b/package/falcosecurity-libs/falcosecurity-libs.hash
index 2e239ca2fe..89b2100c32 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.hash
+++ b/package/falcosecurity-libs/falcosecurity-libs.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  80903bc57b7f9c5f24298ecf1531cf66ef571681b4bd1e05f6e4db704ffb380b  falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a.tar.gz
+sha256  9e977001dd42586df42a5dc7e7a948c297124865a233402e44bdec68839d322a  falcosecurity-libs-0.21.0.tar.gz
 sha256  21ec9433a87459b3477faf542bacec419dc03af841309eac35edeffe481cf10b  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
-sha256  f17d3f2c2d565a74a7d5bf96f880c43701e141897e8dff0c8aa13e5d07aaf226  driver/MIT.txt
+sha256  e852b60bd201c42bf7bb5a53129bdb90de033bf254e740ea8ba1cf92d096caf5  driver/MIT.txt
diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index 3783b8421b..28de5c0c9d 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -4,31 +4,62 @@
 #
 ################################################################################
 
-FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
+FALCOSECURITY_LIBS_VERSION = 0.21.0
 FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
+FALCOSECURITY_LIBS_INSTALL_STAGING = YES
+FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
 
 FALCOSECURITY_LIBS_DEPENDENCIES = \
-	c-ares \
-	elfutils \
-	grpc \
-	gtest \
-	host-grpc \
-	host-protobuf \
-	jq \
 	jsoncpp \
-	libb64 \
-	libcurl \
-	luainterpreter \
-	openssl \
-	protobuf \
+	re2 \
 	tbb \
+	uthash \
 	valijson \
 	zlib
 
 FALCOSECURITY_LIBS_DRIVER_NAME = scap
-FALCOSECURITY_LIBS_MODULE_SUBDIRS = driver
+
+# The version can't be computed from git, as we build from a tarball.
+FALCOSECURITY_LIBS_CONF_OPTS = \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DFALCOSECURITY_LIBS_VERSION=$(FALCOSECURITY_LIBS_VERSION) \
+	-DCREATE_TEST_TARGETS=OFF \
+	-DBUILD_LIBSCAP_EXAMPLES=OFF \
+	-DBUILD_LIBSINSP_EXAMPLES=OFF
+
+# Only the kernel module driver is built. To keep the build small, the
+# eBPF engine, which needs elfutils, and the gVisor engine, only
+# available on x86_64, which needs protobuf, are disabled: they can be
+# enabled in a following patch. The modern eBPF probe would also need
+# clang and bpftool to be built.
+FALCOSECURITY_LIBS_CONF_OPTS += \
+	-DENABLE_ENGINE_BPF=OFF \
+	-DBUILD_LIBSCAP_MODERN_BPF=OFF \
+	-DBUILD_LIBSCAP_GVISOR=OFF
+
+# The driver CMakeLists.txt only prepares the kernel module sources and
+# Makefile in the driver/src build directory, which are then built with
+# the kernel-module infrastructure.
+FALCOSECURITY_LIBS_CONF_OPTS += \
+	-DUSE_BUNDLED_DRIVER=ON \
+	-DBUILD_DRIVER=OFF \
+	-DENABLE_DKMS=OFF \
+	-DDRIVER_VERSION=$(FALCOSECURITY_LIBS_VERSION) \
+	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME)
+
+# The pkg-config files define the prefix relative to their location and
+# contain the absolute paths of the dependencies in staging, which
+# pkg-config would all prefix with the sysroot again.
+define FALCOSECURITY_LIBS_FIX_PKGCONFIG
+	$(SED) 's%^prefix=.*%prefix=/usr%;s%$(STAGING_DIR)%%g' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libscap.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libsinsp.pc
+endef
+FALCOSECURITY_LIBS_POST_INSTALL_STAGING_HOOKS += FALCOSECURITY_LIBS_FIX_PKGCONFIG
+
+FALCOSECURITY_LIBS_MODULE_SUBDIRS = buildroot-build/driver/src
 FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
 
 # falcosecurity-libs module needs these two kernel options to be set:
@@ -37,46 +68,13 @@ FALCOSECURITY_LIBS_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
 # https://github.com/draios/sysdig/wiki/How-to-Install-Sysdig-from-the-Source-Code#linux-and-osx
 # CONFIG_FTRACE and CONFIG_SCHED_TRACER selects CONFIG_GENERIC_TRACER which in
 # turns select CONFIG_TRACING which in turns select CONFIG_TRACEPOINTS
+# The module also unconditionally uses the IPv6 socket structures.
 define FALCOSECURITY_LIBS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SCHED_TRACER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_SYSCALL_TRACEPOINTS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 endef
 
-# falcosecurity-libs creates the module Makefile from a template, which contains
-# a single place-holder, KBUILD_FLAGS, which is only replaced with debug flags,
-# which we don't care about here.
-# So, just replace the place-holder with the only meaningful value: nothing.
-# For the DRIVER_NAME, we set it to FALCOSECURITY_LIBS_DRIVER_NAME.
-# So, when sysdig will be run, it will automatically load
-# FALCOSECURITY_LIBS_DRIVER_NAME.ko.
-# We also need to do the same process for driver_config.h.in.
-# PPM_API_CURRENT_VERSION_* were take from driver/API_VERSION and
-# PPM_SCHEMA_CURRENT_VERSION_* from driver/SCHEMA_VERSION.
-# For the others, it was taken by inspecting
-# falcosecurity-libs/*/CMakeLists.txt, which normally creates these
-# files, but doesn't work well with the kernel-module infrastructure.
-define FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
-	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
-	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
-	$(SED) 's/@DRIVER_NAME@/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/Makefile
-
-	$(INSTALL) -m 0644 $(@D)/driver/driver_config.h.in $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_API_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${DRIVER_VERSION}//;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${DRIVER_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${DRIVER_DEVICE_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
-	$(SED) 's/\$${GIT_COMMIT}/0.1.1dev/;' $(@D)/driver/driver_config.h
-endef
-FALCOSECURITY_LIBS_POST_PATCH_HOOKS += FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
-
-# Userspace components are not built and installed, because it this
-# package is intended to be included as source in another build.
-
 $(eval $(kernel-module))
-$(eval $(generic-package))
+$(eval $(cmake-package))
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 038a9734aa..3c96bda73e 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,16 +1,15 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
-	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # falcosecurity-libs
-	depends on BR2_USE_WCHAR # falcosecurity-libs -> libabseil-cpp
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
+	depends on BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # falcosecurity-libs, ncurses
 	depends on BR2_LINUX_KERNEL # falcosecurity-libs
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # falcosecurity-libs -> grpc -> libabseil-cpp
+	depends on BR2_INSTALL_LIBSTDCPP # falcosecurity-libs
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # falcosecurity-libs
 	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
 	depends on !BR2_STATIC_LIBS # falcosecurity-libs
-	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
-	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # falcosecurity-libs
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # falcosecurity-libs
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # falcosecurity-libs
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # falcosecurity-libs
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # chisels
 	select BR2_PACKAGE_FALCOSECURITY_LIBS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
@@ -25,12 +24,10 @@ config BR2_PACKAGE_SYSDIG
 	  https://github.com/draios/sysdig/wiki
 
 comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
-	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR \
 		|| BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_USES_GLIBC \
+		|| BR2_TOOLCHAIN_USES_UCLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
