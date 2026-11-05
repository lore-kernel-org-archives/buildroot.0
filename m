Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C21606BFB1
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g4gPqkcx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7838167A;
	Fri,  6 Nov 2026 16:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ld4CM9ug_Rx1; Fri,  6 Nov 2026 16:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6D4F681758
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981359;
	b=oXlBS8uziQ1vcIN57UAjqVRhwDBfwInHwTmIb9+3XN7AxQ7CxAoU/YhWGtfCfNV0SBV1
	 m37Mkp8Cy/Ay1TH7lvFZmDKX8Bz//wwmL+j3kpfddx9mCrK28RQxZiWSFB7d1aOuaTJDq
	 sdG/bygYeAGFJb2ap2EN2WwlIzOlfYImAF5Rz5MBIEcrVugAuNVFKslTztoWZIYEQHVzR
	 SDktF0sJVvWPSJLRvMfcAovm7MKGOCpTo5kLi6WhHDnalFrNJ7VHeEEFpm0Co81JNYTx8
	 b+9NMe8YwVr5UYM2KmLdoyA+Zx0s6sRAUR8vmSM+dzVdSM8V0yQknHcReUX4qUKQ3Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=f4OdGlYZETIpGDaydRVHrEV11pqmPuPG2btvZL/mtTk=;
	b=bTG1enClsqrvmjSZVROBU7BPzG0sew2IbzCcFgUDoYoe7FTK/nfuw/HPGhgEb3CrFd4P
	 0NqkdmrA0VS4qc9yN+POpqSDFnG0fawpB4NnVLvrvgpqr/f5SjnpTBcYnAjAJGj+GceRD
	 ooEIR5tJV6aUUvtEuq4ZW39wF7CzBZLcEbarLz2KOBn6sshttE106/9yjelDNVYuMeEHQ
	 uGAI8jUAEQOuzZc84SQ2Uv9hzKLQTKKeBQilWvQ8zpNJdtHgprXzpgVczEnz1cfK0REun
	 eOzPjaBMEy+8AhS27vRVYBFg38ysOtC835cDVIwX2SAVHs3pP8tjZ95thQaQ/Qelsqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981359;
	bh=f4OdGlYZETIpGDaydRVHrEV11pqmPuPG2btvZL/mtTk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g4gPqkcxzATb5VeJ4/mHw59NNrnlZUk1X86bafeWqAjqPUHPjt1h+PdrVxguLauGo
	 wTNKBD8IMXssT2GTg3O3l6BxgSDCNcQULvlFHhgXuRy7EM8RlfVJpAWGeHApwMAYpP
	 X7jOlpNLFIZMNZLoQvL9WszB5u0kBxPAk98Xvs6WkaCvJ9H4mLSL5CwS4O5A13FR5T
	 W5w6v2FprZ6scqWHQgwB2ZUlq/8tyLk7GNADZbm8Ha2oTM5q9asWUwcd/9h2+wZ+37
	 f3Ac+xk18izR4bS2AOGEWlp8DpaDDm1puXibJKJLVtYHgRIHIOoh3GGBVlKbn9RVLN
	 lkX1MCYcJxeoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D4F681758;
	Fri,  6 Nov 2026 16:09:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CD89AFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADE640917
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDPfm2u6lWTU for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C3BD140911
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3BD140911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEEE79E0B0; Fri,  6 Nov 2026 16:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f3723d838f87bcb46124e0e5615350343c66b05d
X-Git-Newrev: 7bffbc901b93c0e69de2cc6fb83b6793ea2fc78f
X-Patchwork-Hint: ignore
Message-Id: <20261106160709.EEEE79E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/cpuinfo: don't
 support ARMv4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6230163297309955222=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6230163297309955222==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bffbc901b93c0e69de2cc6fb83b6793ea2fc78f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Building the package cpuinfo with an ARMv4 architecture would result in
the following error message:

```
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: CMakeFiles/cpuinfo.dir/src/init.c.o: in function `cpuinfo_initialize':
init.c:(.text+0x28): undefined reference to `cpuinfo_arm_linux_init'
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: libcpuinfo.so: hidden symbol `cpuinfo_arm_linux_init' isn't defined
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: final link failed: bad value
```

This can be reproduced with the following defconfig:

```
BR2_arm=y
BR2_fa526=y
BR2_PACKAGE_CPUINFO=y
```

As stated in the README of the upstream project [1] only ARMv5 and later
CPU are supported. This commit then exclude ARMv4 from the supported
architecture.

[1] https://github.com/pytorch/cpuinfo/blob/main/README.md#supported-environments

Fixes: ea1cc1af55 ("package/cpuinfo: new package")
Fixes: https://autobuild.buildroot.org/results/f14/f14e4afacaa61021463c457def1cad3c81d35f29
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ccdd1ca4aac11d913f10eb071d7c15d5fbede9a4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/cpuinfo/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
index 64477c2bd7..4aecf2e060 100644
--- a/package/cpuinfo/Config.in
+++ b/package/cpuinfo/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
-	default y if BR2_arm
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
 	default y if BR2_i386
 	default y if BR2_x86_64
 

--===============6230163297309955222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6230163297309955222==--
