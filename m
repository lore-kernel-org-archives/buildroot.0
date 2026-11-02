Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB1606A329
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VfqjfBxs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbdHY0cK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D966160687;
	Mon,  2 Nov 2026 08:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4w_LIF1D7yn; Mon,  2 Nov 2026 08:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E9D2260757
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793609676;
	b=gjkV8PmTV1Gnvmb3vXHJj9Li20z5rqThj0XWehqGyfQDh55OfbwFT9mQqf6sSl58QMWL
	 wA5TulsfNlqMpG1Ze394FxD9vzNs1fhJEoQKm8D/aoY1jZzcsNYKYNHFm7X4SK6ErGxRT
	 SxaJkObpV/0LLCV9U0/qAtzaRu96tHXef6qLQrNX9PqyJmnHOXwn0IW8Y2FwweI5ttSY4
	 cVJCEB2tra3GLRVrFF95HoegACnMbY/0rEDpWS1eGu8gbMAZYY0ih5nuP7LUD5vuFcJVW
	 fiNI3YTkO2lG/tSL8FyTbSyPOcsgDMtN56FXUAJFKBvAprjFaBbVLreAQs42fvc/M2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793609676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=JIMw8AIA4830yCOspw7+GdD9VgNxvp3sVRTR1c6lrYQ=;
	b=ctllEFELalD0OPor3MoMPP2FRxUM+6tMF2G4fRC392NCT/DkwzxYQq6P2Ez0Qc0JllJm
	 55PLFO49XNbux6XGqWo7RTOu8zt/JDmGlo36gIAbd1Z8n7tp2uCS9JjRZhzp4NhNWKSgZ
	 UJIJFZRsmmK/ZQAoKFFKm4vJubu0cQCx+juVV++8cK9GTS/XLKhP9xiKFPmYyb36ybLuJ
	 DNTk5EPKqy2ZV+YwJzw9/NdmX4wmg7L6hsvqVGsY+F+7xesEG22HpCwoIwvH5THNSh/+s
	 acXXWdHRT46yqlJwUdT0p/LJh1kNRTI9g5gqYhgIkCPObUXZNUJbhRYSP0JpshyAPUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbdHY0cK;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793609676;
	bh=JIMw8AIA4830yCOspw7+GdD9VgNxvp3sVRTR1c6lrYQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VfqjfBxsXXmGbkbGLO6xr3oyIi0CujYnxv6lgONYGBfR6Nzgt07I9Y0jqc3oHWmQB
	 KvK5GOI01runLwJoaGr0E4O3iMW86SzRke4wXfSXquRhTKMB3oCXRR91yCtoU/7xCF
	 MqiirQp2yoE4pnU7kHTSwIpTilyJ9TV2rgYOzfza0Sqth+CrzcPFxoAeaqzuj2n5P5
	 fnLgIIF1GN4FGUo1KgvkaDoiCiwBU0hLkYVPS0/jT0jkRFvDft84J7h4xxvH7q7Wr8
	 qbru3uVdIBLSWu9ruyn+BHy3Y6PH7PBpl3fE0KAnnNQEGPcZ8aPuLiLmDUYPowcQt6
	 N4L+Ghic0XymA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9D2260757;
	Mon,  2 Nov 2026 08:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9D45356
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA44060757
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AM862siUnOXb for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 08:54:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C87F60687
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793609672;
 b=P9mMjWNcoOM/8AViaiGxG7qtir/ZnZSSX/MRc/DWEXrATAmEaHYAM8QhFzt6KDyPQqZ9
 BNRfLxPWzdJ3/hadw4whLPVwEaBnmPGniaBofetpkTqCiZLRtZnzeW2gUlNNShHkS2X+2
 3uGLUf4FgK5pqjNMOCK1jjg66Q2lMyuHXEwCUhga8scUv7r0EB1ZC7cUhF+6jSwaRlsAV
 ISxaNW+Ho6VSu+NorAqTVWh27K942NVKdAij0ZSBBDz41FEG/brdqi/qtpNkMhhGgFNpw
 /RrO5Qfy3J61Xo8yoPqJkkJOpmrGN4Mlp00fKVJ9xcQGU+5lEC12MXjN8szXWhAc1FA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793609672;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=c7rjXMzGXgJ4reHc5PKRJJ+gzYaWaOzQr1l6i42C4wk=;
 b=ZxTfaDbHHFZihjVpxCzyLfFY3IK8dJ32H9sk/OA3wKB81oyepgOHYibG0fsI6tWoRf0/
 Oa1w66v3YzlfXuAfZg0o9z5ud2oXJFPaXGC+2XlEtebBxQFvFjaYI2DGK7DV8ysMbuQjp
 y7YawozwT2FCProroF0Bh+CkekYoUGSKuxgdm9HzJ9F0F6spS2usbBnFwtuoO+dbStzx6
 nWjEVQ0NFK738QHUYjZbSYZH30ipoeW/RUk8pqpgITYqtn8Omp5z03FF682eaeP++Jzw8
 9M9OYrcdFR4N79LMvXYIXKkQJeOgJ8RknVpA56NC75PbAzU8eFzzcArBrU9/3JmOTfw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=TbdHY0cK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=TbdHY0cK
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C87F60687
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2431916f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 00:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793609669; x=1794214469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c7rjXMzGXgJ4reHc5PKRJJ+gzYaWaOzQr1l6i42C4wk=;
 b=TbdHY0cKwfZx2tLZohfbptJNo6qA+FNxdPuTxCAK5LAn2RoSQnwfZPNUyM9rSINSvm
 hc4VrIP6rRoczer6EfolW2iiK7aoYNx6DMOqWDLPEhFjx4RW6Ax+wgLq4bKaSMptlbo4
 LFi7nrM+x1EHZP9BOTh4Z+y9gD+fqh8bcKvBUQb2sMfVpTSyoqk7XvQ7BIKZwLfMeG8M
 vt0I6zmQi/ZHlWCbNUng03LW2vWlROunTcA/ND3uDoKdjyuuKWjeajz2jqGvHfvb5KRV
 bu4+pNGfDZhvudePANhF6H8ZjzW3TPm6uEY33lAu7OuUaVvd5y6ty16vnjZearDNYfcC
 u8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793609669; x=1794214469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c7rjXMzGXgJ4reHc5PKRJJ+gzYaWaOzQr1l6i42C4wk=;
 b=ZUzv6PeZKKEmX6Br9PL1ZDd70dORg1OJKEIaetPlgzf0hPXZFMJstMsK81fXiFjKJG
 LJimX4N+JG82/fNszK7IwbYmK4DSxBukaSclGfAGqCNyNKhMrGilEA9khgxKzia7SLrQ
 qhZ+v+wcog8H6OU6F/1yR7Z9JJSNrAqaJwFMTsJu+cT1QhQVPfBhmd6wdoko1/Y0LyJi
 cAE7FmNG6vJmGIXmoFWremFbya6dbgGdGo8t+xoEzwiw0CMfmrbzI5kAJym+2c7an6tt
 coen0v9Ce6BtzF2bOhdyGmDFaf/dG1IHsN51K+3gkW0+Zai1HmWk7SVG1lo9vYR+Zyx3
 no+A==
X-Gm-Message-State: APuU4Z+rV/3q0a7rX8dt1senDxj7fH4bR6GRWMWxbcSJMGvAw0709fqf
 u/9F4V2abhvSmuxpGuvgFe0bqSWSk7K9iH5ztTkn9+693djmbPK3/HPKFAmKtQ==
X-Gm-Gg: AYBFou0ql6O1yFfJ0oPNCIwuZiSfQ/MzO9d2UyyIKk5IJ4MO4P5kQbtKH5j99hsmy/7
 8U+2q9ZtK4ufXAVbRbjMI/Z7ZvB6P4S/gRyu04iBll0F2moN7BO9Mxl+pHbUCnjItSmOZGqQCif
 +9XkhuR6AnRZAZmBwZWIAIzY5mEyYCJzy3QWJJReXAMw7XhBZ4S+Kbv4IOkSmbe/jYh2s8EncTC
 sz6V4aIS6kDGjgzqD7gjMLxcYmVElgFs31HPNY8l/4DORgLU/DLOsF+A8/QvtHYiA25p0p/9Foa
 EsBiKhfM/wwBnnfj/Gn97nujdajuCu+G3HFhoIc2FtaxAhwqPvMSBu/Zp42hNJg/YFBXM1twf7j
 zLbynhhrpiGY+p9QgLS5LbkBIYRHio1wMS+WWi0xk6gnqiBuJioTCZSZ7dNGwJ1t3sFgljPXX70
 m6QxFwUnh46zvtm4N5zUucKppxg3wUmCzmpy7UkHKKbxp1f1KHTU+n5H+N03Eaifgfquc/OU4ba
 BOAMZ4075wzbSySw0SlFj2HBGBwGOpwRy3h5IsbRoWXuJy4m1TvD5FGP9HdznWIjyhtO+GO/a9R
 M5kLANzh/t9kaQ3A4ZJ7AuBoYxp6OxwS1xRsHCAc7loPOFbn504pyQ==
X-Received: by 2002:a5d:4391:0:b0:487:219e:5e20 with SMTP id
 ffacd0b85a97d-48e6e529631mr15464782f8f.51.1793609669021; 
 Mon, 02 Nov 2026 00:54:29 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba53d7sm24041304f8f.53.2026.11.02.00.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:54:28 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 09:54:24 +0100
Message-Id: <20261102085425.2117520-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102085425.2117520-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
 <20261102085425.2117520-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/falcosecurity-libs: bump to
 version 0.21.0
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
- fix the access_ok() configure test on riscv64, where access_ok()
  needs a pointer, otherwise the kernel module fails to build

sysdig 0.29.3 can't be built with this version, it is bumped to 0.41.4,
which needs falcosecurity-libs 0.21.0, in the following commit.

Release notes:
https://github.com/falcosecurity/libs/releases/tag/0.21.0

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - add patch 0003, fixing the kernel module build on riscv64 [Thomas]
  - leave the sysdig lua dependency to the sysdig bump [Thomas]
  - also update the sysdig Config.in comment, previously done by
    mistake in the uthash patch
---
 .checkpackageignore                           |  1 -
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 -------
 ...-pass-ARCH-and-CROSS_COMPILE-to-the-.patch | 38 +++++++
 ...ver-replace-removed-task_euid-helper.patch | 33 +++++++
 ...gure-pass-a-user-pointer-to-access_o.patch | 43 ++++++++
 package/falcosecurity-libs/Config.in          | 39 ++++----
 .../falcosecurity-libs.hash                   |  4 +-
 .../falcosecurity-libs/falcosecurity-libs.mk  | 98 +++++++++----------
 package/sysdig/Config.in                      | 21 ++--
 9 files changed, 193 insertions(+), 118 deletions(-)
 delete mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
 create mode 100644 package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch
 create mode 100644 package/falcosecurity-libs/0003-fix-driver-configure-pass-a-user-pointer-to-access_o.patch

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
diff --git a/package/falcosecurity-libs/0003-fix-driver-configure-pass-a-user-pointer-to-access_o.patch b/package/falcosecurity-libs/0003-fix-driver-configure-pass-a-user-pointer-to-access_o.patch
new file mode 100644
index 0000000000..2b94c5ef15
--- /dev/null
+++ b/package/falcosecurity-libs/0003-fix-driver-configure-pass-a-user-pointer-to-access_o.patch
@@ -0,0 +1,43 @@
+From cfe62adc9e8430e79f13f4174fb1b40b35e8c2db Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Mon, 2 Nov 2026 09:41:35 +0100
+Subject: [PATCH] fix(driver/configure): pass a user pointer to access_ok in
+ ACCESS_OK_2
+
+The ACCESS_OK_2 configure module calls access_ok(0, 0), passing an int
+as address. On riscv, access_ok() uses untagged_addr(), which casts the
+address back to its type before passing it to __access_ok(), which
+takes a const void __user pointer, so the test fails to build with
+recent compilers, where -Wint-conversion is an error:
+
+  arch/riscv/include/asm/uaccess.h:31:30: error: passing argument 1 of '__access_ok' makes pointer from integer without a cast [-Wint-conversion]
+
+HAS_ACCESS_OK_2 is then not set, and the kernel module fails to build,
+calling access_ok() with 3 arguments:
+
+  ppm_events.c:91:54: error: macro 'access_ok' passed 3 arguments, but takes just 2
+
+Pass a NULL user pointer instead.
+
+Upstream: not submitted yet
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ driver/configure/ACCESS_OK_2/test.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/driver/configure/ACCESS_OK_2/test.c b/driver/configure/ACCESS_OK_2/test.c
+index baf908e..d6048be 100644
+--- a/driver/configure/ACCESS_OK_2/test.c
++++ b/driver/configure/ACCESS_OK_2/test.c
+@@ -19,7 +19,7 @@ MODULE_LICENSE("GPL");
+ MODULE_AUTHOR("the Falco authors");
+ 
+ static int access_ok_init(void) {
+-	access_ok(0, 0);
++	access_ok((const void __user *)NULL, 0);
+ 	return 0;
+ }
+ 
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
index 73ac03e240..2c72431d94 100644
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
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # falcosecurity-libs
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # falcosecurity-libs
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # falcosecurity-libs
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # falcosecurity-libs
 	select BR2_PACKAGE_FALCOSECURITY_LIBS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
@@ -24,13 +23,11 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
-	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+comment "sysdig needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
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
