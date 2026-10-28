Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5595606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=orvLY/af;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=EuWApKGI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8518D807BE;
	Wed, 28 Oct 2026 11:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiJNB7zfvOEe; Wed, 28 Oct 2026 11:34:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 86BB1807E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793187271;
	b=ZBAol7Ar4a1mweSG4rjmnP3N7jfvzQ0cSCu8A8Sgi433p6CxN4KoRvuT9hHGuu6Wprre
	 fb5VrlPHcA9qL5E4nD5cXd6LXiip81+sgDM6BOaVh1knj7AcPu+GGz9JJSgX4U8lRl4aE
	 ixhk5hXJZHC+DUb68mkYMbz6MR4v3Zdu4tPWi1D9oO02E/d+dz7znptushcmNble2cBde
	 1JJas+4fsif5fsSRYJnjpin90IA5K2WWH5NXDJxU6nhUTa/7eC1BlrHT1xJYldRbay4VK
	 /cY6gnNs6N07cLt+xA1WiEkrjKQCU2wYWTHCAPAmJsEhKnu3Zy6OMk5dvMFLBoY6Etg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793187271;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8vnvKZh8DwLoZLAzQOnj7igarjW3exvS4ZYSK3uSK8A=;
	b=px2lnOIEbBsdWHFMNPdXj5/B9uwo/jhLR24eFIBU/auzUveSewwQ4RyiPnuJ8ZVaFTLd
	 zfKW9XdIr6JiBC07oRj9KLjgcH/Z2QEpnyQqgIz1fvWS5h0SWgq7eHGxG5Io2m4KeozB8
	 nBvABk3KXrwBXItY4Qb5n/01uHE5N9lJTO+S2PlVcQmxQnic/PYGCAu8CwXJTzKEKPPsf
	 qU+oARv3VDXrVPUiP1X7Up256BwYik9X2SZShbdS8ChQzdKWt5aC1mlpS0mhTL4+RD74/
	 odtX9b9H8moyyN4pGqwycIad4mwUULtbvR0H4ZKZ/LsvS2lHSUu+u5tryk+RuXuXq4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=EuWApKGI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793187271;
	bh=8vnvKZh8DwLoZLAzQOnj7igarjW3exvS4ZYSK3uSK8A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=orvLY/afHlNxaiuBqzj48VuPY2mS58p8VziIRg0lpeliXfWJ/OLUxYH4nZJUdkarg
	 0vEs8nibC7ASRo+9sGSjgvi/D/Yfz82Z8RSgdyp5DbDfWdUacnA/YDYuPTsF68VO8x
	 DDm2gkxOIwaGBhDkrPlU/q3+DKDJWoqAT3dXa0opHtHcFWnMEqi2Mt539nsxQcbCyr
	 AYvD2DD3LddJKkFS5iuGAxJWydaXPh14zD4oDcerc7eLiOx0iPRU/qlocbwrTcm/p2
	 I5BAeQkcmDM079ofaSMbe6MPLcd3wbbD2oXIwccB/iWGTrO5iK5L5IMYlGjOM+hl5W
	 LJZNWpU/pyU6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BB1807E1;
	Wed, 28 Oct 2026 11:34:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0534529
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 923C7807E1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHGKFOlbUwjg for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 11:34:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DD47806E8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793187268;
 b=DIbBgbaKkULZC4JpGFijXlodq+xG++XuziDpeMhlSpst3p9YqbmHwOKDcmytj/hAnElL
 9i8J47PfgCc7RaR9NMs9L7RZXZOx5OCvcrxgl3uIY/zsM62loo+SBz/vjfKT/djepE7Ak
 5jjZId6Du3UzqosdupcQPqhB3PTAHomaq6koJFvBH1wQ/u8yV1yW+AcfC5F7g0IwWQY8f
 uhT4J9oPPHWm4Y/5moVMlrCeVcXAGwuliANCHrU3I4K94SbCjwwhJEOjxpICet9KWJtof
 nIIaiAInNT1MYBBjuFeSRzYqSElhE8kX2ltKdFSGMEmSmdYzPhO3iQaqZZtLtnbSrcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793187268;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Tm7PRyPBVfXxU00zkUkbyS8w3Pz0y2uVGJC66fHEMXs=;
 b=ZmDDWn13c9rchdkbARoK3fZxHB8MX1/ttpPEpuLjq1crzyP/mEQ2sZG6Cs99W5oBhUXT
 UK4zVmLa+XYoBXApfoHXF+ZiLmygGuZw0aXIysTk8HVD2BHFGZncOfYxJ6npSNrI9T0C+
 8oDgexAwADNYDfvSJLzxsSHifbd1olLxPBdyfv5fsoKnl0m27F4PfQLroyba1QCUIdNlo
 W/P0BGp+iPYSh8efG98HKPnXlimN+ePkQSZMxrKCMFG8PFYF4JghXmyeW+NHcIvWB2FOx
 Me4ada7uK/2k1WmbDi8m2kvys+Mv1jjUiPXdC2WK0X9u/WWf/yygkE6NFEDJpBbdOiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=EuWApKGI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=EuWApKGI
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DD47806E8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:34:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c414e5d282eso108308766b.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793187265; x=1793792065; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Tm7PRyPBVfXxU00zkUkbyS8w3Pz0y2uVGJC66fHEMXs=;
 b=EuWApKGI+9JbSnNYWPvGwcVJEAurvDCwrHBQ5oBRoLnOJAaENpe9vxOc9vGbus2WX/
 MZvyG8nMzdv3Xe+dCwtaVwwWbk2KLSRNChYkaYSIgmKPlRvOfA3A7YS/YKQzm9DukUe+
 4k/RZjhM6tkpZQnejmVPuO8uLUICfK8NmU5a1ZjEFOw6EQPbI4RENaOO9P0hJn88YwOz
 lwG/qiIUSKaizV5GZ1UdCxDdCLauIk0oLJWBBHy8eLmIdN7SYY9jfsbS0Jy2fhHbMJzh
 8qEhO0Xos6dIKd+rEIp/6McrmmXbND7k0YXPWynDBjd5wa6k80fIEQ0rCLU2vD7cq+VD
 KTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793187265; x=1793792065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Tm7PRyPBVfXxU00zkUkbyS8w3Pz0y2uVGJC66fHEMXs=;
 b=HGLihdX/Dd2PHRZLyodlHhs6COYoqgZ7z1ANVCQQL+mnII/SAK1o/VBuHyYG9xSwEH
 xB3ml2mUqS0mTJYcVxPiYeqxtAc7HqMGURzgzqhltEiaxsGden+lMO3VJ3FDCNm3R2/J
 w+J57t5br/slX1lJ63ZkxvyXTyRdKqdpaZKPO/3n67o0/kKVA/WQxqT8Sw7Gj7u+w+dX
 PSAzdmwSUiJh0g4xwXXjdMFCfsKJWOVMJcg2T+eVnmQAezmPgRxYsMrcqZinb3y5eVyL
 rjQRRrv3PLGg7HIq6icpIbPGk74UCWGM4Gr8RsXRZq2cqgH+ldmnUIm1eCYLl8NL5T+3
 wMuw==
X-Gm-Message-State: AFq9FYLrlNG5LjxgIKzw+bfap+6fCfA3N5H9SG/TaRiR5YX7RE0pyltt
 WUK/JsQfZkhXzqxODGR93N9XFG6tDEfaftxh/YZSAZRylzlgA3CkOBIeFkdvTA==
X-Gm-Gg: AYBFou3Ut3I1k4SHlsIitjYTCDZ79sD+GJWHH3/qdtqEyLQn5ed2P30sdq0EvEz9DU0
 +Qm1F+Q9ZyJF+olS/rAlTX6LqbIUAXLM9MnPjWv4yspxgjTKkrgZbkL/3yQeqQwtOsrAEIxrduj
 wNMHMvErkdU/cP+z8XS/9YYRoB0qdXRT+tv7cTV46gTDVZ95NjJtDC4xgl0XQVD/rDeZHHBoC+0
 zYDkB7Il0cvqMdcSsR/2hHKxvo7YqdkBS+pX2e6g+pjR6eS2hfv8jhevxJx1gu/L2vAjdrhk8YI
 ELfDhtj3LPm29hFE21ecg2HJRe282JSSURDu/tQcEbf59n5ov+xI+6EZVB1vPeldBNXC/aM/9/B
 wYE6cDyXQO6wWJByFQi6JWgIfIoJDAMrovNpk+cV1mipRv9P3SIrGAwDYgmcqnApzi+jI9Iwp88
 AZoidqvJgQHBw3NVS4R0sh2ToZm+nVzr4m9TP+kynjNghcacHAAYlXLpVxZ8KMplNbQn5b93yCF
 Aie2K+Q9/e9N6Rcv2RL6Fd4MxJ0l8q57c+++rGgTybmlLNsttliIJqcO3al+I2UPaUWLHu/5SpB
 kMirIjKrpz8o/AvgXXi80yzg6w3KWVAkYJz8kPJP45wKMTFTX94L69KlDQj/jBh69Ap6rg+2yA1
 EEWWLn6ysEQ==
X-Received: by 2002:a17:906:eeca:b0:c31:be58:5dde with SMTP id
 a640c23a62f3a-c49be013f12mr163790166b.40.1793187264482; 
 Wed, 28 Oct 2026 04:34:24 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c2e9sm594591266b.58.2026.10.28.04.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:34:23 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 12:34:23 +0100
Message-Id: <20261028113423.3132059-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libical: fix build with toolchains
 without SSP
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 4.0.0, libical enables the OpenSSF compiler hardening
options, including -fstack-protector-strong, whenever
check_compiler_flag() succeeds. That check only compiles a test
program, but GCC also adds -lssp_nonshared -lssp when linking with
-fstack-protector-strong if the C library doesn't provide the stack
protector. With a toolchain without SSP support, the check therefore
succeeds but the link fails:

[ 50%] Linking C shared library ../../lib/libical.so
ld: cannot find -lssp_nonshared: No such file or directory
ld: cannot find -lssp: No such file or directory

Add a patch, submitted upstream, to also check the flag with
check_linker_flag() and only use it if linking with it works.

This issue has been present since commit 410b9c87c26d
("package/libical: bump to version 4.0.7"), which bumped libical from
3.0.20, which did not have the OpenSSF hardening options yet. It does
not affect any release yet.

Fixes:
https://autobuild.buildroot.org/results/36a8ce7ee6581bd24ec013d8564bc3214400faaa

Fixes: 410b9c87c26d5d5eaf44b2b2362452febf887b06 ("package/libical: bump to version 4.0.7")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...k-that-fstack-protector-strong-links.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/libical/0001-openssf-check-that-fstack-protector-strong-links.patch

diff --git a/package/libical/0001-openssf-check-that-fstack-protector-strong-links.patch b/package/libical/0001-openssf-check-that-fstack-protector-strong-links.patch
new file mode 100644
index 0000000000..03f085a052
--- /dev/null
+++ b/package/libical/0001-openssf-check-that-fstack-protector-strong-links.patch
@@ -0,0 +1,61 @@
+From 83314b5b234e8775e787aef0e6f713dc8b105ded Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 28 Oct 2026 06:07:44 +0100
+Subject: [PATCH] openssf - check that -fstack-protector-strong links
+
+check_compiler_flag() only compiles the test program with the given
+flag. However, GCC also adds -lssp_nonshared -lssp when linking with
+-fstack-protector-strong if the C library doesn't provide the stack
+protector itself, e.g. uClibc-ng built without SSP support. In that
+case the check succeeds, but linking libical fails:
+
+  ld: cannot find -lssp_nonshared: No such file or directory
+  ld: cannot find -lssp: No such file or directory
+
+All the checks following it fail as well, as their test programs are
+now linked with -fstack-protector-strong.
+
+Also check the flag with check_linker_flag(), so that it is only used
+if linking with it works.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://github.com/libical/libical/pull/1472
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ cmake/modules/openssf-c.cmake   | 4 +++-
+ cmake/modules/openssf-cpp.cmake | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/modules/openssf-c.cmake b/cmake/modules/openssf-c.cmake
+index 7f30d5b4..c701d078 100644
+--- a/cmake/modules/openssf-c.cmake
++++ b/cmake/modules/openssf-c.cmake
+@@ -89,7 +89,9 @@ if(C_SUPPORTS_FSTACK_CLASH_PROTECTION)
+   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstack-clash-protection")
+ endif()
+ check_compiler_flag(C "-fstack-protector-strong" C_SUPPORTS_FSTACK_PROTECTOR_STRONG)
+-if(C_SUPPORTS_FSTACK_PROTECTOR_STRONG)
++# the stack protector may need libssp at link time, which is not always available
++check_linker_flag(C "-fstack-protector-strong" C_LINKER_SUPPORTS_FSTACK_PROTECTOR_STRONG)
++if(C_SUPPORTS_FSTACK_PROTECTOR_STRONG AND C_LINKER_SUPPORTS_FSTACK_PROTECTOR_STRONG)
+   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstack-protector-strong")
+ endif()
+ check_compiler_flag(C "-fcf-protection=full" C_SUPPORTS_FCF_PROTECTION_FULL)
+diff --git a/cmake/modules/openssf-cpp.cmake b/cmake/modules/openssf-cpp.cmake
+index f6cc7975..c38dd6c8 100644
+--- a/cmake/modules/openssf-cpp.cmake
++++ b/cmake/modules/openssf-cpp.cmake
+@@ -89,7 +89,9 @@ if(CXX_SUPPORTS_FSTACK_CLASH_PROTECTION)
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-clash-protection")
+ endif()
+ check_compiler_flag(CXX "-fstack-protector-strong" CXX_SUPPORTS_FSTACK_PROTECTOR_STRONG)
+-if(CXX_SUPPORTS_FSTACK_PROTECTOR_STRONG)
++# the stack protector may need libssp at link time, which is not always available
++check_linker_flag(CXX "-fstack-protector-strong" CXX_LINKER_SUPPORTS_FSTACK_PROTECTOR_STRONG)
++if(CXX_SUPPORTS_FSTACK_PROTECTOR_STRONG AND CXX_LINKER_SUPPORTS_FSTACK_PROTECTOR_STRONG)
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector-strong")
+ endif()
+ check_compiler_flag(CXX "-fcf-protection=full" CXX_SUPPORTS_FCF_PROTECTION_FULL)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
