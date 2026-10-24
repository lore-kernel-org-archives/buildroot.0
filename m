Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6720C606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i6Ju4zps
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC51816E5;
	Sat, 24 Oct 2026 16:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXDhL87d2KZG; Sat, 24 Oct 2026 16:17:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3380F813B0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792858631;
	b=iUh6AwjDPCU74zsAMBOB65XWBXZ+bF2jfeisl3FlZZuLvB7lrn/ihiCl70fMR3eZokTp
	 QwZgccVIN0vUwioM/Flxd640Lz8mzySbW6IU1ykll+8WvFDiwViOw7bVqJlbZhJbEbIeh
	 iQctWA+yWS3boyoabEHeAwkxxfwEjHcGvxmn/vLABUkLHDIgWr4J15cf9ymhA+rkfv8Hs
	 cyGX1KsSPa4wRt02F2KILprtCqMPv6TIjPLBJSW3ZkwiD1yPAmJ9szfvB/OAl9XAtGs08
	 undujwTHpTw/fGOb83CI3DSWOFG7a8q7Tx8Q/IpiZ5/JCVia927XVdepJ8bs1mtjmKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792858631;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zkX2ZhyZS90M9OhATWyXMkBc3QRVEqWB9TLbbwWnu+g=;
	b=o5+H0ziHrDLdDQc4TPMyQMdynByNIMvbXDGFg5M1vwrIqK3kBTUjfgHvlnxEIqlBho04
	 RfP4NuWGdR6ORfQZdee5wysMYPM4vNXEnJIKqhwKUJn08mJJAsHMHjbnsCiHtFIxmitBT
	 56wn7gp68v/KxUj1+nrVNtGTx9Uu64y1wO5czJulTpsysqHFZemJNI+wSrS+Glfchx8tA
	 7AK6n+k4NvvCX8YmYojP2v5g/7IVoI1bRtUAhTnC5RqO0TrpbjtnCcBmRUAJrULqCURvl
	 uAfAf2tSEoFwKL4uLo4lYik7Hb4KC5+UJdSz4ZIEmWyCSY633hT15RbeHtMRJhxW+Vw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792858631;
	bh=zkX2ZhyZS90M9OhATWyXMkBc3QRVEqWB9TLbbwWnu+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i6Ju4zpsnv6kEMb9f9J0uZ9nCNJ2Y2ZP4Qak5kn07lhKEeKiChLmpnGl9pvf0SDum
	 4PnXCbiCo4c+ES3zFN+tnK7SnakPsXqMWkGd3Wn2ARnCzWEFxi04KX5j2g8yeXytrH
	 /3hUhlhSME1SM+ezuI4ijVDEEgen7nNbjs8+oezVRXREh9iKcnHC/iB+UaYbWCylGV
	 fkHohr7hbnGca3B3hWGfD+p8DegDhtqCvr0NTa+zRQI6TNKWPOGHxomomNhaxe4O6G
	 1XJyeM5V+GTmzK2fWn515+L53dGEoJfyEyIbtwflSrlv1E5REczHHhRGY7qOhVnSeo
	 iRcY9BrdXL68A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3380F813B0;
	Sat, 24 Oct 2026 16:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AB2B43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 16:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 806A6408B3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 16:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqdbSsiuzVju for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 16:17:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3C39A4089E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792858628;
 b=QcopIPxxjE1gQdtJXteT2ReCwnhn2rPMiApSvZ6L9QosK35zT0MP9QoYohXwF3jhDtaP
 n/pbHycBE3c4UgTVoM/dkJ+UPETw9IJ9MOXR1x3tQyR4KypoWczc8hHN1nfFsRe+i/Hhx
 Q2iCSgW+/Tnfpb2txIgAR4nS3FOOSmLBp3QdNHVZrR9lB4YqPd8RaZO2B+itc4UwFLZcu
 cTq6fIGPEiT8HQwGAlwu3wH/X20ru0cs1YDiretJJWEa0kJThBG/ILFQMwMB3j5e5GVsC
 MQeRf75XGNjjw2VypADPPxnhjxKAMdB3GPbvHblGTLoT+Pv+cBzI1YOvJ50XEMsTZ8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792858628;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=W1TDgPS+RONxoeL8f2OQrl8Jb6MbonkCez8j3NgmICo=;
 b=GxIRETiRice4yOEI2k6IhUn8zQNOinxrQlEHCFhFc06tFrYnNhHW9gQtslrcDYkweruz
 yUy2Sf5Qs5RDYeAZag7pmjtDE4tsmhRU4Gauneun7iDJ2JjzpKlPclU7xR1SuXmxZ84J6
 zdcuoZHUqMKa0b8ZclQ6H5vD8VQDjjm5J8OF604dAS9Is1fcme6TvSJOdVIzsUsnhf4hG
 0feV1XD6zWPsdX8jUu23YcocoyNPJ/OfhuVJ3NSU2NieFJPaek/Ne2jNZnfTOaDD9Na/j
 rFc5XwlVoTKT2MhfiUdM5bGsDsEjjWy2eAKgN9mc+V0hS2SdS6ymLkPSv+W5Ou54ByA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Tacgl8dO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C39A4089E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 16:17:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c411e139259so138071266b.2
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 09:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792858626; x=1793463426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W1TDgPS+RONxoeL8f2OQrl8Jb6MbonkCez8j3NgmICo=;
 b=2UxofVDJ/Ier5ThJCGTs6riq1I0Zp97MsCHfeDSgoFWQkEA+Et/dyE/5hPhFnwJ9u4
 iGA1IhQl3QZZCKwvCPIqfbXhO/+fyyzcDSgQ6B7fzX5kdMi9bu3xESh/GIxMpKZ1jcOM
 04Z5SRtyO9UShXGbrEwiU48VHrul0UsQsemvrELAy4H5bQGYwZCX5Fdy9KVMwik3aI5f
 WwFpPpnSYYybKDgDh0/Fn3ypXqL7QCmOK7vAQZvSjtz8Jv3Bxr6IHXSAy2qsJSkfHwh5
 nMa76WmgLekapX7RY8sYtFs3z8rk86bd4ej0bP69jkKHZktnIPQ565CiB9IgRtxn80nl
 dyuw==
X-Gm-Message-State: AFq9FYIt2/OZw8KozBeA/YwRxersdkYwaF0RDhanOPOF8/pqNNoCgg6T
 F/IF3fMOjDNxpMQ2EUTGxU6R/QhnI4I7YgIUuMOV7mt3t5CW2vf5vInnohUd0wot
X-Gm-Gg: AYBFou3HIXrUClJoEARZa8ZroCtpDmoidCntf3nn2NOUf3zvmW1UzOsubwkA0QnyZ06
 uFKbkHfXB3boME/8BR6oM2f5YiAUE/cvU85R3JlK4OMXmi1RSQToRWkQPY15in8R2PfHeRpBNvE
 mzTXadimpLJIebuCzfcWSQfoqkJ12yDZhglsV5yc550htSu9NbpR1WRZmyL7gdm/4UC1z98rq6t
 nuFTnaV2W2bdFJs8wwmDpKZXI2Y2lS+YKjeCxbHmE5oWPJDLVN049nW/3UOfWaQHaQ8JWCY2x4M
 IbIdMEST7QZXCw2oNMLpl5pAW6xMWjuAPe0AfxaAJ7XXY2umBkv1I8bCwD01VUoE3qLwvdNBnMA
 MsQTJhSRhEFho8pAdaiWO1oIGreJreVPjC8QUTGn7ons/kxHq9iQbDP+RwNyo0PKQ1dQdtAGr83
 bS2qdbpSVzJtW1GWnDsjDd0c6jqIv4v+AmJPCF7qctaMs0rqoogSJ0YTzRcXFeHfchuxudwepAZ
 vFanZRlnASW6K6Jsk2738532KP/T0IdSsVKuePzq/3aygjY7OEXh0d1vTyg53tACS+8u++p9Q25
 tzomy4MfnNaaLT9oOpubkkGosWMqc0o9uMYeJeiz6eGJBI9zGhy8srSQ
X-Received: by 2002:a17:907:94c2:b0:c40:80eb:c543 with SMTP id
 a640c23a62f3a-c46bdac305emr299150866b.4.1792858625322; 
 Sat, 24 Oct 2026 09:17:05 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd350c61sm106247366b.11.2026.10.24.09.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 09:17:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 18:17:04 +0200
Message-Id: <20261024161704.4144810-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ebtables: fix arm64 build with kernel
 headers >= 7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With kernel headers 7.3, ebtables fails to build on arm64:

  [...]/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?

Linux 7.3 changed arm64's asm/sigcontext.h to use the __u128 type from
linux/types.h. ebtables bundles an old copy of linux/types.h, lacking
__u128, which shadows the one from the kernel headers.

Backport the upstream commit dropping the bundled copy. ebtables only
needs __be16 and __be32 from it, which all supported kernel headers
provide.

This issue has been present since commit b216661a73f7
("{toolchain, linux-headers}: add support for 7.3 headers"), which made
7.3 the latest kernel headers version. It only affects master, no
release or maintenance branch has 7.3 headers.

Fixes: b216661a73f7b8e21290a1bc9033e7f9b5fb230e ("{toolchain, linux-headers}: add support for 7.3 headers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...e-drop-bundled-copy-of-linux-types.h.patch | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 package/ebtables/0002-include-drop-bundled-copy-of-linux-types.h.patch

diff --git a/package/ebtables/0002-include-drop-bundled-copy-of-linux-types.h.patch b/package/ebtables/0002-include-drop-bundled-copy-of-linux-types.h.patch
new file mode 100644
index 0000000000..7249f7b5dc
--- /dev/null
+++ b/package/ebtables/0002-include-drop-bundled-copy-of-linux-types.h.patch
@@ -0,0 +1,91 @@
+From 7ecae356e508b11e9239a0fd3a234ff5af560a40 Mon Sep 17 00:00:00 2001
+From: Sebastien Bacher <seb128@ubuntu.com>
+Date: Wed, 7 Oct 2026 12:39:13 +0200
+Subject: [PATCH] include: drop bundled copy of linux/types.h
+
+The bundled include/linux/types.h is a copy of the kernel UAPI header
+from v3.16. Since the build uses -I./include, it shadows the system
+<linux/types.h>.
+
+Recent kernel UAPI headers (v7.3) changed arm64's asm/sigcontext.h,
+included via <signal.h>, to use the __u128 type from linux/types.h:
+
+  -	__uint128_t vregs[32];
+  +	__u128 vregs[32];
+
+The stale copy lacks __u128, so the build fails on arm64:
+
+  /usr/include/aarch64-linux-gnu/asm/sigcontext.h:81:9: error: unknown
+  type name '__u128'; did you mean '__u32'?
+
+The system header provides everything the bundled copy did, so drop it.
+
+Link: https://bugs.launchpad.net/ubuntu/+source/ebtables/+bug/2169809
+Upstream: https://git.netfilter.org/ebtables/commit/?id=7ecae356e508b11e9239a0fd3a234ff5af560a40
+Signed-off-by: Sebastien Bacher <seb128@ubuntu.com>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+---
+ include/linux/types.h | 51 -------------------------------------------
+ 1 file changed, 51 deletions(-)
+ delete mode 100644 include/linux/types.h
+
+diff --git a/include/linux/types.h b/include/linux/types.h
+deleted file mode 100644
+index 23ea78f..0000000
+--- a/include/linux/types.h
++++ /dev/null
+@@ -1,51 +0,0 @@
+-#ifndef _LINUX_TYPES_H
+-#define _LINUX_TYPES_H
+-
+-#include <asm/types.h>
+-
+-#ifndef __ASSEMBLY__
+-
+-#include <linux/posix_types.h>
+-
+-
+-/*
+- * Below are truly Linux-specific types that should never collide with
+- * any application/library that wants linux/types.h.
+- */
+-
+-#ifdef __CHECKER__
+-#define __bitwise__ __attribute__((bitwise))
+-#else
+-#define __bitwise__
+-#endif
+-#ifdef __CHECK_ENDIAN__
+-#define __bitwise __bitwise__
+-#else
+-#define __bitwise
+-#endif
+-
+-typedef __u16 __bitwise __le16;
+-typedef __u16 __bitwise __be16;
+-typedef __u32 __bitwise __le32;
+-typedef __u32 __bitwise __be32;
+-typedef __u64 __bitwise __le64;
+-typedef __u64 __bitwise __be64;
+-
+-typedef __u16 __bitwise __sum16;
+-typedef __u32 __bitwise __wsum;
+-
+-/*
+- * aligned_u64 should be used in defining kernel<->userspace ABIs to avoid
+- * common 32/64-bit compat problems.
+- * 64-bit values align to 4-byte boundaries on x86_32 (and possibly other
+- * architectures) and to 8-byte boundaries on 64-bit architectures.  The new
+- * aligned_64 type enforces 8-byte alignment so that structs containing
+- * aligned_64 values have the same alignment on 32-bit and 64-bit architectures.
+- * No conversions are necessary between 32-bit user-space and a 64-bit kernel.
+- */
+-#define __aligned_u64 __u64 __attribute__((aligned(8)))
+-#define __aligned_be64 __be64 __attribute__((aligned(8)))
+-#define __aligned_le64 __le64 __attribute__((aligned(8)))
+-
+-#endif /*  __ASSEMBLY__ */
+-#endif /* _LINUX_TYPES_H */
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
