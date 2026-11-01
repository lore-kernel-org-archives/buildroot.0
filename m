Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A903606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SIb1HXjI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 430116071C;
	Sun,  1 Nov 2026 17:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aul-QSB_O0tp; Sun,  1 Nov 2026 17:15:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5908C6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553355;
	b=Ir9Bd+PxARtBXkDXnEoGyB7ARJjrXOuRWMg6NpXxtDGZPiT/xmxqyem4ZsD2KvUNgYZa
	 ci6vwKhxCBtcR4zePIp/uEsenMS+LZ6C2Xahkav7yBmIwapC/jrFdiSFZUfh2OfnfaH4T
	 BPqufamX+waGXJNB/VK+MsFJAgUOSuvbbd0KoK7plTkFhoF/UInXSu49ZWSY0yw9SIvWs
	 DJv7+S1z5+5adfJ7ZoTCLV1dE2f6jAv7wsqH+SUqayUVtelgPcuho0sb5OfMUisRiZ0pp
	 UQHa5C8VN3TyuI9HrUJ0aHc7hOHFZ5T0q3SuBh6hts7heeVjrmoxIuKEEVwLijrE8IQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553355;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c3HVmNYC8bpMuqzw5As7zud7YLQ2Q9X8cEFstQ3ZR8k=;
	b=iFeuS5b449bfBAQkLnHWW4tV5EYAcsx9Pde/GLTZjHpsfLdsTqZLRxuwR/gLdTcG4zAp
	 KhAeYcUYPVXSFBNQvjWp8RYjihtCrGG45Zo1NGqAsXHWiMllSM2w9GGQeTSFs/OmfX0Cw
	 RTjA5jxfgMvwptaZhYWwE2+VnTC7bjeuQj13/YSmdq+lWN20GLu0ChJoCVg73VmbXRPlc
	 Wtxcfr6N3GBfF/R8PoNpPf6XHSrdqCGoGKvuhZhcpjcWklQZa9pZC3lccccqfrfSpqv/x
	 uUMUHCxNdqkwSKbYTJGEhqzriBM96uWP4vBzg/HR5H3rB8F60B2cmvVroiB5HEjViPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553355;
	bh=c3HVmNYC8bpMuqzw5As7zud7YLQ2Q9X8cEFstQ3ZR8k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SIb1HXjIHasYvrEvbBwgemEwYny2m1ZcWIpn3VB1z/6L665x0cBeQJZqWnb8K6BXx
	 EYy2T2MsouxpU/Vx3LnWeKQt/r8XBmv+u7NOHXk4w/jwMBMhitrlj72+zIdpU/AxbD
	 ksEDwgsnmtH2nGWykCpIO862YE/zAQFmr7ICmezDZ8LF+6PMmQ36GM9LI7KJTauWMs
	 C55f8q+EluYct/AZQMLMivC9t+QH3g329HDdWsMX4XyvQo4JDyx49OrXFrQa8S2kVF
	 pnZWb4nVxkAts/l+6cF/cSjVcsKCqPQ+0ycEB1VRwJ+M2jKKw7fR+fYWqzgoOEpPGV
	 gJIGXGFHgvdww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5908C6061B;
	Sun,  1 Nov 2026 17:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 216E63A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 130CD80C23
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RE455k5KFwK4 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 52E4A80BEA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553353;
 b=qHuid7ZVxgF61Hq/iBoqmRE813MVNzA1Ej9EfrqqnguCZMDl5SzXPA1oU+aFMcTizx6U
 3t3q5ZVwoa/Ck4G20AxZ1jHwAJHQlmyt/iXqZ+ISRwYHnqa/PvTv7xM/qkl6sS+2r/ONy
 06HThn52cKLEOG2AWjGJ2DmHlBHyY4aNL/PcsmLqPWy575OTWXkKc9QhL/JsTZcpvKVAn
 Wf73l5f4xx2y3RaSrpdbrFDx0iI5pnW/SJIJ8ivYb0rkmDHclQMkFmFcFD6g+8Pjv/sUv
 467gfm6tb0kIU0m+bBCzCKWO+eqHsL6ep/qqfWQ7x+IQYJJvDYmR8aRv81ZiU2li4Hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553353;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5weZWlP+oLPZM4nnnuVqIcd6woXimAnsj/Up0/4w8+o=;
 b=qyUaDPd7Rv4x3K6HII36s8HCjbTh13CMugPTM5rYviMZUWCzKctYIrIsDyRJbSdTjy3R
 BWbG/RssNJmD5BLUzf2fCHWfl+EK9Xrqa/9I3UG05TFN3sbZG31Pq0NLr8S2QRW1Ejgqs
 Fr3RUnIGwGIazaEIA4dBRz9lxUGNAC6phMfsXj6E5ZjTaNFPyR+CRHDg3UCzNMl/20Ri7
 PC8mda063S4pDB+UQplQF+g5FgK87n+T84b/7L5E1oy5va7Wvu/Oo0nqmw+YwJ3LMRR8G
 CmqTvHtnn+BGYvVEOG33x7C3jB6CzSnESdnHw+qtDJLUzcku1ae256tPTMfS6iUzfCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E4A80BEA
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:15:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 083539D500; Sun,  1 Nov 2026 17:14:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:07:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20e04161a3d5255a349d964b2eef98df3454c7e9
X-Git-Newrev: ccdd1ca4aac11d913f10eb071d7c15d5fbede9a4
X-Patchwork-Hint: ignore
Message-Id: <20261101171424.083539D500@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpuinfo: don't support ARMv4
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ccdd1ca4aac11d913f10eb071d7c15d5fbede9a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
