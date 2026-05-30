Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72EDCD6E4C
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B098513E;
	Sat, 30 May 2026 17:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFn3TAH7D_Pf; Sat, 30 May 2026 17:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C868514C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780160865;
	bh=MZeWtO6LcD1Grixq1SR1IWtK6apfPR6hcFU6WCMPMEs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2CdKJm1uh7/uTajpEyjbR3ZV3sCNpiefz6zK7JHCD3Qa8nMDT9GqoV1I2nikxVkJ
	 vJDL73IdFcT+LtPYPVbmG/rVDDUvtKNYcA+7OD/WzxjJQ6CFdgOjhlpQe6tYLo8Jfl
	 dkAAXjQdypbNs7DXyEk40j1XVQ630pSuzm1eLCS6rOjE7+FwUg7GOHGVBai5sWQmPo
	 R/JfIwSKR09rqqzm4yox6CTr6yf4lhkpA8tSuv13qxAZVR5x0K1WKN+fozG7paRC5E
	 uB2Z/INNJTu5N8T6NziYWbmHM4Gv0pAu5taLf9axBNkF/58DKOP28XHb6idqfns7Zz
	 3fx82V/YZTtJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C868514C;
	Sat, 30 May 2026 17:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD56BD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9328A40072
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCVyVzT7Nm9G for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:07:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B28C840064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B28C840064
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B28C840064
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:43 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-36d6bb38b44so306363a91.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780160863; x=1780765663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sB27A0Yc+aNmCKIResQsWe0e3F0z8sZZzfNiLYBX610=;
 b=NCU/2Bt/0V7tqQ2JVWeeZct9lB6KvIgKPC4nBEDbBMz6MLSzOBkEYnCQNuZicmkwx9
 RIDMwRIdL23ckWQjv2MF0zjj2+FhebzQms9uHeZs6OnXM7QtcvcK8xj6ANe9GujsmHJS
 H3yp7itp29oNY+q77G7CL8LVr3L+dCb73NcNHcy7WqdY4POrvp7nKhI+wU3GIiOIa1bw
 aTqa29PWnKlq+10DNh4JxTERm1j9MWctX7t4Fkzk3F4/tGrSVqdAoq15LD85gEOj1ULi
 mNrJ+SKSvQbXVqWUaKm8t5YVNurt7U++MDoorOpk1i7RZCC/OQrGLRwyB8u9K1uT5cRu
 DqeA==
X-Gm-Message-State: AOJu0YwN11FlX3KE/rqJm+XemsV+iLDw7lwRmiJ07cxy1akkt7S0FVnW
 xINgHrkaWyVD3MvyPmk33Ag2fTwV77bazhOGn0xBR5WB2HoMPm2NlsYq9o9kzq33gM0=
X-Gm-Gg: Acq92OHWwZsVN005lyfxZlFSSVNbfW9Rp0SYoGMH4mMtw1W5EAH+pjiZ2/i00Y+ixDd
 O/qPh+dw9lnsSChU5biSYA/DIMpps5dLFKg/ZCr/+0tjkqYMb2nfsXrbWeaeGrAIiX6ikTIoQui
 67OTTYoEVddZHLxLeF9LseGzq7MAP4dxZeXX0tODvrQiHF9dfRA/yQmcHP0BxA5E7cNTFNtBPKs
 JMgZpNFaOVMl7XhHJqfhUlPhnwE9xqa+bMc84DTeGpSfzEtx8/RNbbnAIk0NaEtCgz+moKyo3Xa
 3wzpl4vDx/zyOKo8bfozWYGod+4FqJVSvGPMqD146Z84oFtkK43ZK8FCdxkWXO0zZpnEQZtRQJw
 zujmWKql4jqCurT0vFt+IMLBnVzhHLw9M8U3HajVxthUFOAzO9rqjDBjhscLnhjuVkXb/Ontzf2
 mN1drHllI5YopuzX0ybiItmE4FH5nbjM2rVwWxWM8pda3XfFaVdGG02RJcLDCZBP/N57I=
X-Received: by 2002:a17:90b:5212:b0:36b:af1e:9b20 with SMTP id
 98e67ed59e1d1-36c50214e23mr4791624a91.22.1780160862930; 
 Sat, 30 May 2026 10:07:42 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11f0:fc06:1f55:1e4:b17b:8dd7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc10c8746sm4199985a91.0.2026.05.30.10.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:07:42 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 22:33:40 +0530
Message-ID: <20260530170343.19119-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530170343.19119-1-chakrabortyshubham66@gmail.com>
References: <20260530170343.19119-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780160863; x=1780765663; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sB27A0Yc+aNmCKIResQsWe0e3F0z8sZZzfNiLYBX610=;
 b=GgLTr0Lpl+2Mosx6Yxrbp2wZw9ltU9MWPoE+mHUHPmxxe7EeyLKdI6ZUupBoJOfRC0
 +gBKbyCuRtSLDGUsrFQy9meZyxzb5atzIe263+ybWuAEsqo8ZO2HiP/UPU4AZ2zpE9Jq
 O2jfD8OlraCCeMsjj5mryF4A7x+827OmoV1hZOdm54EIkI2eiGMckW3/35m+PoN+lBeY
 DOJAK0Grus1mLvzKRjfoEIQ9GfFmLtyc+IfbxHD/XVchT9ijyJpVbZ8qJJq9PkXOA5HX
 XF5lFGZmN9uF7XHKxWgM0SvtGnywDqqAZFO4kBtlwk8vCF9XHE5q+D2/7IZy90zK2+GV
 NSbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GgLTr0Lp
Subject: [Buildroot] [PATCH 1/2] package/libzlib: fix build failure with
 musl on s390x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On musl libc, HWCAP_S390_VX is not defined in <sys/auxv.h>,
causing a compilation failure in contrib/crc32vx/crc32_vx.c
when cross-compiling for s390x.

Add a patch to define HWCAP_S390_VX to its standard Linux ABI
value (1UL << 11) when not provided by the system headers.

Upstream: https://github.com/madler/zlib/pull/1253
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...fix-build-failure-with-musl-on-s390x.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libzlib/0001-crc32_vx-fix-build-failure-with-musl-on-s390x.patch

diff --git a/package/libzlib/0001-crc32_vx-fix-build-failure-with-musl-on-s390x.patch b/package/libzlib/0001-crc32_vx-fix-build-failure-with-musl-on-s390x.patch
new file mode 100644
index 0000000000..fc0ec69ceb
--- /dev/null
+++ b/package/libzlib/0001-crc32_vx-fix-build-failure-with-musl-on-s390x.patch
@@ -0,0 +1,42 @@
+From 31caaf5d4e688f7de15fc6914ebd1af032fdc348 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sat, 30 May 2026 21:40:46 +0530
+Subject: [PATCH] crc32_vx: fix build failure with musl on s390x
+
+On musl libc, the HWCAP_S390_VX constant is not defined in
+<sys/auxv.h>, unlike glibc which provides it. This leads to a
+compilation failure when cross-compiling for s390x with musl
+(discovered during Buildroot builds):
+
+  contrib/crc32vx/crc32_vx.c: In function 's390_crc32_setup':
+  crc32_vx.c:242:17: error: 'HWCAP_S390_VX' undeclared (first use
+  in this function); did you mean 'HWCAP_S390_VXRS'?
+
+Define HWCAP_S390_VX to its standard Linux ABI value of 2048
+(1UL << 11) if it is not already provided by the system headers,
+allowing the build to succeed under musl libc.
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Upstream: https://github.com/madler/zlib/pull/1253
+---
+ contrib/crc32vx/crc32_vx.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/contrib/crc32vx/crc32_vx.c b/contrib/crc32vx/crc32_vx.c
+index e718e34..6b852e9 100644
+--- a/contrib/crc32vx/crc32_vx.c
++++ b/contrib/crc32vx/crc32_vx.c
+@@ -20,6 +20,10 @@
+ #include <vecintrin.h>
+ #include <sys/auxv.h>
+ 
++#ifndef HWCAP_S390_VX
++#  define HWCAP_S390_VX (1UL << 11)
++#endif
++
+ #ifdef __clang__
+ #  if ((__clang_major__ == 18) || (__clang_major__ == 19 && (__clang_minor__ < 1 || (__clang_minor__ == 1 && __clang_patchlevel__ < 2))))
+ # error crc32_vx optimizations are broken due to compiler bug in Clang versions: 18.0.0 <= clang_version < 19.1.2. \
+-- 
+2.54.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
