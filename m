Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A01606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 07:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DkbcTC4u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aXvmv4cY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0669F60642;
	Sat, 21 Nov 2026 07:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcVcTefwEc7b; Sat, 21 Nov 2026 07:42:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 184386065D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795246949;
	b=INoW3uQ2f6DwFKl4fGjaDLJBhQwo5WT+KpJuXuCM89sdlnhJ6RILNHasPGw259eC++wI
	 jJVz12j/zRwF0IqNoOHnlthsThVJ76v1ZyLel4XePsuKGynWZuczdCMPIDGLFo2JoUnpA
	 kQLiOsbKta0xDkuOTyYezy4fwAcGO2vhPF8fBuY6/qFRDfEATss+B8wY59QlhUVcEnzI4
	 vwqgNe1RDb1dQHe+azSIp3+vPJzN5D6UpuC4fHmBM2ukIFKcPW5umblznz/m/u5V9u7QD
	 qlSDcr/1tef2Mc5wmqhuvszDZG0bNHy2k57HWj6UJU3oyb2TwcGuUaXJcwSRtDj66Dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795246949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zcw0CawC3tHgrM8Lw9NZ0oic2KszldOLcBWUb2W/9BE=;
	b=cpVfWoFQww9wWKdZPzbdOgdgGvbOg82n8/3jxUhdhWkLtsL/d0ndqThVx5a3/j1gJo96
	 7GC6wqhC0iDPDzLmHwyWtWuP8uaoxWNOH9CbvJruOcOlYI3yYz4hKGKH+2bWW+Z1AOjBt
	 aefDPtvAUH2Z18QMIPhJx1YBdRdkmeh8Ro7YBhVX2EwWfrdf8aUAoCjn6e8WlzU7hPSuK
	 fnMhd0y5S8c3xPNIQbCE02uRa21H1Oohh9nV6oA/LSlYnl8XCD8uq2cMTDUyLf58Wf1Z3
	 ZUbcR5UHnm9rC8Z964JSV4pUtvOpQrT+DryY1mOgdVgG5NmiPTD22uX7kepq20uyLrg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795246949;
	bh=Zcw0CawC3tHgrM8Lw9NZ0oic2KszldOLcBWUb2W/9BE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DkbcTC4usPNLOYqq53N4jtMfQwQ75xTY9d/UfSm6vzLhkmo3fSe7e8aYOvSVja/E6
	 8o0Sbdgu2/s9U01laiQzvMZzBvoWcSi5KHc/BNC4bAxwpmP6dXg0dpPVmIZFcIuGFO
	 Afprmk5NUM9j/hKPRuQ7FP2wKbBXm1/d3GVPIgAfBVH/nGCGmmcJR/B56CSs61dxru
	 anzZ8W54YjwbOEIh8guxXJStzvYCDPaouo/iLH95IEbaQaTRGPHwyVKT+Z7ftg9BhK
	 LjLwwz9wU684gWX9vSXGLaimCtWKRQa3Tlf5zb9jnMFzQkPv5ZsQKymucMRztDjKZD
	 nlFhb/U8CgRZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184386065D;
	Sat, 21 Nov 2026 07:42:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D51D21C9
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 07:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA93A40098
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 07:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMVaSfqTA5jF for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 07:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 12DB640081
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aXvmv4cY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12DB640081
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795246943;
 bh=nX57qqjQfGx+KVN8QlkgsxCBZ/qJ3opVOM8iY1cPJL4=;
 h=From:To:Subject:Date:From;
 b=aXvmv4cYDba/Q94Nai9mZpQzheL3OKAfcuYVCxMEheFKH9ldAGaMjlmz2OQKzeH6n
 RXM33GWUFb6R2i0rUxmLpUIw2jBqfLnJY/DVy2t6mMA3QjomNBDDCRpdjsdSqQMRFy
 KvXoZz6SUlbK8XCoJVpWiKF9W7hylHf4/8DGZ60vmmVGaudEC+lD6YSHLxo7v92Pn+
 elVEDUEdupQv4i3gmjR0tRSe1VsxzSuPMEo83ydOj4HA8jBt7bwtChmg06H603IvQ9
 RUI+hNhS6mZZqQ5DNnJ0CxvoKmXfpybFvcn/n/EhRFHJJsc3qPPq3I+XDg/zHwNOS5
 qkXw/j4jOyfUQ==
X-KAS-Sym: v3:f51bdf72230551df:fmBr9yPQad5r8UxzShpjV0HQMcj7ktPLJRjU3KMqaFSnZ
 wU82z3dEU8vxwco1sxSYLcvlJYYed7/Uk/xArOVQoeDYS/bmYjn5w810T3qxGb2TwKAnCbZl6Bp
 MHwKepZTF6Z0JWc9QEdFa5Dja8q0/sn60Jfnd1P+v772YNo0W1QCEn5VKoI32ypBdGvaAAVXOZU
 cERyL7mNWstvS3Bsv9FS/NTJW6JVOIKGMiqS5bZOIDFykeR1933UUUCQPKUxCXT0XQTlmbrfPLB
 TA+Dhs54pNhBh2jBrWYLmFVskBlomI+sRIE1/xLDLJH0HDwOiIwkGNChqLXdprwk2dn19tcQ==:
 JOv0bSOb942TUVG1rEIEYISinXT0zC4DR5zu25EzcQJnQxRBIXsSPWDueuaj2UHSt9pnQ2dxe5u
 6dQN/3SpRduEg/8mYA5ZZrTo6wWzJZWLmd/vm6/ql/T59cBdvlWzAUjo66LfaN5kIPxZOsRaJFf
 gFp2idVHZ0ICGGSUQpg4HA+Av5Y43FOSSTQWIUABn4xuy7vpQd4Lkka/L6Y3JJo400D2BrtYjV5
 7sXo7d8ChE3p9BbmWcCNUKrXqyL/JlfsBgZIIWX2EQeaENCM+BsLGudM9UFHIQp7O87WO+owwRO
 2HTSIFHzhNvkgr6E2OiKPU31LDDvzF1/phWvc1cEjTldUhg4kE3VfqfcTni1YL4mr0nHwHIUp1p
 +z4MhGdnpv6+OBhfhG+z/VPw7kuybKJ0Hzn5ltUVmwnMp1RS6SigeOYNNGT2nypMJqRxlXMNihC
 YPQrmW4ijct4VZ52MG8ChxbAJfqVr45/Q5fUHEEBSxi4/p4ZIZFTogb02n6ZEn2TNvtNjiGtMD9
 UUE7QxRpFRn1HXX01TwDPM2HF/KaBT+AuaqQCXTmjgThsg6KHK+xqKtbdQZQDh1CphNIzR4Hjy6
 Otf/
Received: from fli4l.lan.fli4l (p54a1b235.dip0.t-ipconnect.de [84.161.178.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77E4AA4C010C
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 08:42:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60076)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xUfjq-00000000180-3zzE
 for buildroot@buildroot.org; Sat, 21 Nov 2026 07:42:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Nov 2026 08:42:23 +0100
Message-ID: <20261121074223.790556-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/opus: Use vcvtaq_s32_f32 with clang
 only
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See upstream discussion
https://gitlab.xiph.org/xiph/opus/-/work_items/2397
and first version of buildroot patch for discussion:
https://patchwork.buildroot.org/project/buildroot/patch/20260613215558.978962-1-mcdev@playlinux.net/

Fixes:
https://autobuild.buildroot.org/results/e7396609cb47827bef2a220cbe1f46167dbf7ec3/

The build error was introduced by upstream commit
https://gitlab.xiph.org/xiph/opus/-/commit/d4494e6ed7d564cbee3cfdfe41d0c0989c4345ff
which was first released in version 1.6 and bumped in buildroot by
commit 9e779d6e57add2e1a78addb02ab45fbdd6a457e0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-Use-vcvtaq_s32_f32-with-clang-only.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/opus/0001-Use-vcvtaq_s32_f32-with-clang-only.patch

diff --git a/package/opus/0001-Use-vcvtaq_s32_f32-with-clang-only.patch b/package/opus/0001-Use-vcvtaq_s32_f32-with-clang-only.patch
new file mode 100644
index 0000000000..a8faeafe7a
--- /dev/null
+++ b/package/opus/0001-Use-vcvtaq_s32_f32-with-clang-only.patch
@@ -0,0 +1,33 @@
+From 8b2a9c07506fdfed0eb5f66e60ace653e30540ca Mon Sep 17 00:00:00 2001
+From: Michele Comignano <mcdev@playlinux.net>
+Date: Tue, 16 Jun 2026 00:37:05 +0200
+Subject: [PATCH] Use vcvtaq_s32_f32 with clang only
+
+While intrinsics vcvtaq_s32_f32 is present according to ARM docs,
+gcc doesn't make it available.
+The fix, ensure its only used when compiling with clang which is
+known to propertly make it available.
+
+Upstream: https://gitlab.xiph.org/xiph/opus/-/merge_requests/193
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ celt/arm/mathops_arm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/celt/arm/mathops_arm.h b/celt/arm/mathops_arm.h
+index b1f91699..3be61b23 100644
+--- a/celt/arm/mathops_arm.h
++++ b/celt/arm/mathops_arm.h
+@@ -37,7 +37,7 @@
+ 
+ static inline int32x4_t vroundf(float32x4_t x)
+ {
+-#  if defined(__aarch64__) || (defined(__ARM_ARCH) && __ARM_ARCH >= 8)
++#  if defined(__aarch64__) || (defined(__ARM_ARCH) && __ARM_ARCH >= 8 && defined(__clang__))
+     return vcvtaq_s32_f32(x);
+ #  else
+     uint32x4_t sign = vandq_u32(vreinterpretq_u32_f32(x), vdupq_n_u32(0x80000000));
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
