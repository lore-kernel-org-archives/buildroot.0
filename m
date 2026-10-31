Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3E606A32D
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KV0wk9LI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E6180E00;
	Sat, 31 Oct 2026 13:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5nQEUTAF_cz; Sat, 31 Oct 2026 13:45:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3774080E03
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793454316;
	b=PEON0Fta0ZxS26Dr5f5eMAsw4LK5vwN8+OHFsTCtHU0A6/YhmKyCxpKQUHsMYBgdRqu4
	 tCZcbjxGAitdTNADuhCryCrPqKxYmG2Dsayw83lx+g5DMOKXm7nMal9siBuA0x1n8RMHr
	 vBrysx/93lt0GK1onUFgZLUTOqqwDkFi/x2dtv5KA5ZguwoLKnyq4eXda3LqdBoxPKNk4
	 IgFac2sHEWq+JEyFhMzgpuAFW0VpuWdV1tgQmqWtgBs0JQO5xUQSMItlpFe1QQvO2yCyv
	 u2QkN4BdFNPsktScnRNKqqy6cxUrJTsr24vesIZCxbqEIvLdyNvK8AANDg17gf1Nebg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793454316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mWs2SeuMZYS28r18TtaCSENuBz0Jpu4w549fTeYiMcY=;
	b=WijjO3GzA+UtTT3snRW4N0JTV3Q5MtVHSX3bnSCxanRMB+Ismp4rvAefcQYOY33UpLNP
	 gw74tQrYhC91SaFY0aXoRvzUGg9dMAWC5d5N/LwSY1aCu6o/Xao6gXK9YL96E/oVPiphz
	 Ikhvdz8DyVUF1Z7OSq4z+aWXVz1rusi+Cc4NVCuzEo1iTvBy/Nw9DKwbGZdvt8Z0SLsZ0
	 mKL2wzvbLpIerW6GaKEF2wJoQLg2oyC7sI9QxE9fSi6wee98yArAUIf7rjblaX7S2UGoe
	 KtN2UT+GhOjAzCC6X+caWXwEDE77+SPsACrn0e/lcLi5RFps0uOHRMDQO9w6yA/HdXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793454316;
	bh=mWs2SeuMZYS28r18TtaCSENuBz0Jpu4w549fTeYiMcY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KV0wk9LIzuCjim/CURknbKmRZTvD7TMf9rjQ0kR+4gD0TueQV7X8ZpJBMNvlHzm15
	 IkZvDZYH5GFaK0VHkdz+8o1iE/0mhoBo2/4dwbTeJ5h3YmqpNAdhZFHMLwc4FbE4CO
	 veMHWzaebt2hxZgb69SUVzhTa0uAJR4UiTp/81vhDcMpryikvAesdjCX5GcZU04e9/
	 isvrcCi9n23mSBW+hZTTAlM5TqC21R5i4tL3VpP70OmZZuQqkYmuVwfaW3g3LriTuV
	 Fe7HYuDnDHw44DYrSpsfnUsvg7lfSVw1oJPLGTsVXWpLU0r9Z9o6JeC8CYOLl+KH1B
	 ZguhOKJZeAnvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3774080E03;
	Sat, 31 Oct 2026 13:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D80473
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 751436061B
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDXFuCrnxYIu for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 13:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A583960625
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793454314;
 b=BxVutqJSGiNgJQPQaYlxxxzmQAekRCg/JfcBYCQMbe/6gCaGDgggV+0m2WDW+AEdUczL
 CiAdFhzBeWQeBkv7nyoy7/r2LXoTJPN13zGBTUN936JXHiO8Cvw0UYKHt+m4uQXZ9eqzT
 hAAYX6FP4HRZLDFOLbn9czg17/BX1vqnYA7IapwrPjBuT9QEJilkj2d4/yzhUlk3iNFQK
 n5fDluVh7INTGGk1TwWUFVl7jA6qlYBDwCOET7hJVmdxFGMD8/Y6nNRhja6twU9z/ondd
 r5F9TIG57RdjR/fWu3dlYBuwPTKRJBxwfaczoCROWDUAykvVw4cU1kqojPb4xa4hhfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793454314;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bRsoxdcmn8vqkU/4+qM98+iodE49ORJpA+0erpjYThk=;
 b=S8m97aqw7TZeut/DHd/GyCaU6EEIqZBCoa3VYxY98yrTQIrSmBctfwQrmiWt1EQ4Nbgx
 BRD72oxXxNmyYD7enLd/lO7rra0Iupwf+Yn+L3l0+SegFu1/QOoo3YncY81GVkX63uLbw
 rcBMSEmZnYUm2SqSdGUSDiKUtwN15o/1AcSt4/v46JWMPh2732HbikKE7z/yLmSjEXJUk
 iVvd80YZcawJSwaONKGpRKNzUfUavCxLQ+qXg7wQSlj/N7XQY2A43PUSi+7jXpSLvCZqe
 wPtM517UaraAVzO42oN3kE5yfueBjYbKbNXyStJO5WIvA3sOTLy+NSJvexOhxijtaDg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fnYaDxrz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A583960625
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:45:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so12046825e9.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 06:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793454310; x=1794059110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bRsoxdcmn8vqkU/4+qM98+iodE49ORJpA+0erpjYThk=;
 b=KsxCFFppDWdjlz8h8A7q0zSYt9WbRvvi4QmmicxLwQy13aNndgS96MdMM9RdmRQ18I
 5mB3Ehdz9O6QTmGF/7LH6iFO34M4GB9p4Sx3b8gWNYuMgd9IXeJGZ+FNDe7VnFAP9HLl
 qmaD2d4JMBC5f409XeRperiYngE+NEPpwVpCH7yXKCqMSYy+pGjjL+LaiZOvsi2MP16u
 NLxJZKrPrNdbWU+Qo/jEZgdUkLiRTOnkSTgOoajybDJWXVdjwdDGkIE6ydR4+DT6mtbb
 17YoLLq+tl8hC1AxjwsLUEbmX4ezPPVmv47kJe9eNqASiFRwblXwIgtl2fDyr3ZH5g5R
 xIlA==
X-Gm-Message-State: AFq9FYJrWBpOQajlW/vbT4ll1PooqdhlnNkqEgOY3x33JvAMsfAO3jTe
 lGza6LYujHSaUXB1M4m12/5WqALkEV1DNAr23iSQREKAXi2oYPxf7ep4n84ebVJEl/G22R6ac3O
 IJGoz
X-Gm-Gg: AYBFou22z4ZZCN/nlbkMiiznvdFt+rIwz81+koWbym4dQfDuiDNftqjJJDo0aXz7T8J
 B48LXHEJCeR7aKdUY8r+u17n35kJ/yElWAJBt7xggKVb2g91bjg2EbDgMAZNIauaHQNASi/5/fA
 jOLPHBAlTOiR2SikKBqP9ABct5/wfXGEl9pHdo5nRll8HXhU6OyrDgH6VlpzoazRm/diB1iJPxg
 7XFzP3fYx6k/UzR1UrkAdJTuZvatwmzLHq5LWRq6Zvvy5dHRcrIcMh4BMHO4/oN16U6Nkh+5GMn
 9EdPfkPWmjkK2314vGREtSqr8zwkJZSwnh5mul+7vtbTFISuNcZf/pCJoqhY5lo8zGLlBDzIpU2
 GmvvkYaQ6eh3fB1uuo53OFA7sQLEms6cBpY9zf88sYy5dj2aiEfdvhAUJyHLu7sXkVjesG7BAGR
 GavvFyxM7El1d5BlNLf+Ai6VPfJnehk71HCbIdyi8clYySS4rUHcQhrYsw5ldd1GLYkbJTGDm+9
 tM9+zAXuCtS8VO4I2moofHh36RJeM5cJckhUIhD0YZ88B3XOYmKZ32UAblXYTGFpd5NpEzTE/A5
 BcLIOb9xjA8UFI9Zel+Ing==
X-Received: by 2002:a05:600c:628d:b0:4a1:e01e:1927 with SMTP id
 5b1f17b1804b1-4ac17d16a1bmr117811265e9.5.1793454310450; 
 Sat, 31 Oct 2026 06:45:10 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78a6bsm8783850f8f.27.2026.10.31.06.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 06:45:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>
Date: Sat, 31 Oct 2026 14:45:09 +0100
Message-ID: <20261031134509.1584908-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cpuinfo: don't support ARMv4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Fixes: ea1cc1af55 package/cpuinfo: new package
Fixes: https://autobuild.buildroot.org/results/f14/f14e4afacaa61021463c457def1cad3c81d35f29
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
