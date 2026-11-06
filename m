Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA6C606D819
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BmxoMQZc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA8D860A7B;
	Fri,  6 Nov 2026 16:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQ6DDBoHGJj3; Fri,  6 Nov 2026 16:10:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B3A860AAC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981449;
	b=iTFZf7irkmcGu8dPgALKpRx3dXaaWgXROi3fPFNR5ixPEhtiP6l3BKbmMggeclKry68E
	 xw/fDCYzeJC+MmbJwWATrC5wc4Rstdv9/2Tu1Wn/ElWf4eP+Zl16FljFxHgGkhWFm7mNP
	 w2EJUSyQnFZRQBUuZko0iwZqnbcS3GFZsdNY8wgLV9011KCxYyOwE1V7D+tsw384a1XVf
	 +BGIfV4mvNqtocUjcTBTE0VacHOCWra7m4ZDwVrn6FLkHPyoh6h/I3JWsU7zUVwYGVR0V
	 t1iklvL/p1vHf39Ht/ZOGo6o1E3ONaDTkfJj+xFI5v0nCWT1S6s7Q1jTT6N2V3naJlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981449;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qNazUG3wwRriwS9cEV2Msc4rxt2Ikvwt8zcPF4beklU=;
	b=UH+xEqSkf8c4hXltptKT2bCLd6+qVQoHKJatISpV7NdiZ0knQvZydXDseGGzKOhWjvBA
	 MhH87INy52OoR01JBholW0n+fKhKh9JtvqhxTWtfBBfJBnT0h0QiSv2byXFU1Mp5d+Rvq
	 bDogBH3LIHOQ1PrHMbZU0e/s1tRRskSynCPLoGcJOlHFabgJ1i+loDGWyw4PKugZSpyBN
	 FQBs+7sZe4LtdRGx5y43PGVZ2PiXRN0s3HkGgyRuZPg8KsfNKj6MyoIqTOsNet3mP5K4o
	 oyWSOEdPwJ8FX0vTDqy6j5TF19T0mwvJmUBF2NMHEmR3OFxR/DR4rp+5YbF/LTAPXfA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981449;
	bh=qNazUG3wwRriwS9cEV2Msc4rxt2Ikvwt8zcPF4beklU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BmxoMQZcRhngbGxV0u8zEv9PrnjFHZnjkaAROkkrC73tMe/FSv4+BLgQYjIvbGETU
	 vdJdIlK1VTiITadxlgJz6mZx18p5p40ZLAjfXQs8xIle75e58e691BtuBT5YrHf1Q6
	 KItCoRxqxToojHt9ZkBkfOjm9BEgYnF8FO7fnkIdjdMHZynlmS/SN3ZQX+R2C9EtC6
	 PwE+X4sI3Acn7hNGZag8VA0cibyBlWPc4W0MS3fIWfI0QdhA0SLzj0P3H3IYrU4OWa
	 PaYa4jXHYE0Pov0mad36b0HMhrq39R0mBmdTsQ4DXU8iw9Sbl4lMNWZbSN/kHmvJet
	 J9abBkPO/NcDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3A860AAC;
	Fri,  6 Nov 2026 16:10:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C16C4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6876281E41
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5uM0vZjHNPO for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B6B2817A7
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B6B2817A7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso622202f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981443; x=1794586243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8uyz8LfRtyKProMBfdJsx93rcjD+RVWz42Krqod6mFQ=;
 b=D3MWDakZvV0Y7Bn+6qg/bRqypSxSwfsLV5HN6zIWYFz0hcaINKaEtGC2TEClHRgLgI
 Or6VyPJRxurvG6reRgueM69YbbnzkoKY2ludhtDn80EQedNpgwlPoA6Ku6ZzEEt7DnP/
 CLetciutIpJfAQWUXlBb88yJsV5uyFDZ3B994IoiLx3lSvN6xgo9bfizRyuquK1ayeFd
 HPgiWueaxKi89guIdcVMFJ+MQjH6XBbE6xCe18VyZMb3hWZtT8eX/0Fl/qOrjjA79z0S
 QiB8/r8vXaV2eQXijmJFWuCuM2BO838RV20XKSFS0VtWiqs1997eUJGRDm5S4qo2N1RZ
 N7LA==
X-Gm-Message-State: APuU4Z+Zfzdv9pups9NVzD4LcGxbUN2NKbMG158gdPX+JbMudxzypddq
 GfegxKK0FsVvE2eYnxamc7s985Oil7/C7RD1r0WZK8hcR7LItID5yCPepBh5CS0OQIStwyyKd2w
 uYDrf06s=
X-Gm-Gg: AYBFou1xi2NKXMYk/vXa+hDuk35pFmqEuvIaFCPSp+i/qreQ8zSKzYxw1PM1vC+wGdO
 14Hqt5QytEpTYwa0Qlv542t1UFUwLs+CKCUlXTQIUcT87ofI5gvd7cfk5f8Snwxzek0Jgy38zsf
 A9YLq+EGw61YCZHPGLq90n2ar4IfqzaNnPjot5Q1OBoVCU4IpznPoXu99oBguA9EGggiK8b8JqI
 Sj+lm33V2CfzTGBiPD6yWebfDBRY2fvGmYxRDj7/nlHD/XVMTRhdeSCc2kpEoLvPW4dgvszkty/
 qqiz5zrGPqoSkPI258n4Gq3bnZa7NN84dI2DtaeA3MZHMkU4mKR/4f+pU+myZd3nk4q1hDthaiw
 9hKRXFRW5TPvbIP/opzyL3bOmHbhMtGdjmR3igAGBmIg8pvOMPGX+3sC4j4xR0jsTeF6/foz/s5
 opOB4UTczgU3N85ft9ZWVbfViKL1YJVTI0eusMer9kmV/3EhDTqApwE8p6j+IH4e0eZ1M3MNTUU
 eztzmofBDOP4qKVvHtrTY+LgaKel9jeB320Dq4WJptLHOBGWtuWpf0uY5GaB+bu5FIwFbtBV3El
 kaXW63kX/lgjhAZBtyQWeqRvMT/2NaI=
X-Received: by 2002:a05:6000:2082:b0:48a:fbcf:6f43 with SMTP id
 ffacd0b85a97d-49277f89034mr6057595f8f.54.1793981443135; 
 Fri, 06 Nov 2026 08:10:43 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d770248esm4640270f8f.42.2026.11.06.08.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:42 -0800 (PST)
To: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:39 +0100
Message-ID: <20261106161041.607758-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030152434.3738285-2-angelo.compagnucci@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/9] package/webrtc-audio-processing: fix
 build with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> webrtc/rtc_base/system/file_wrapper.h uses int64_t without including
> <stdint.h>. With glibc it is defined anyway, as <stdlib.h>, included by
> the C++ <string> header, includes <sys/types.h>, but not with musl:
> 
>   ../webrtc/rtc_base/system/file_wrapper.h:86:21: error: 'int64_t' has not been declared
> 
> Backport the upstream fix adding the missing include.
> 
> This was not noticed before, as webrtc-audio-processing selects
> libabseil-cpp, which was not available on musl.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...-file_wrapper.h-Fix-build-with-GCC13.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch
> 
> diff --git a/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch b/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch
> new file mode 100644
> index 0000000000..deecb8e3c6
> --- /dev/null
> +++ b/package/webrtc-audio-processing/0002-file_wrapper.h-Fix-build-with-GCC13.patch
> @@ -0,0 +1,30 @@
> +From 9a202fb8c218223d24dfbbe6130053c68111e97a Mon Sep 17 00:00:00 2001
> +From: "L. E. Segovia" <amy@centricular.com>
> +Date: Sat, 23 Mar 2024 16:34:50 -0300
> +Subject: [PATCH] file_wrapper.h: Fix build with GCC13
> +
> +It is a missed instance of cdec109331de34958a892a1418d67806b171b862 (!31).
> +
> +Fixes #32
> +
> +Upstream: https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/commit/9a202fb8c218223d24dfbbe6130053c68111e97a
> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +---
> + webrtc/rtc_base/system/file_wrapper.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/webrtc/rtc_base/system/file_wrapper.h b/webrtc/rtc_base/system/file_wrapper.h
> +index 42c463c..bfd8fcd 100644
> +--- a/webrtc/rtc_base/system/file_wrapper.h
> ++++ b/webrtc/rtc_base/system/file_wrapper.h
> +@@ -13,6 +13,7 @@
> + 
> + #include <stddef.h>
> + #include <stdio.h>
> ++#include <stdint.h>
> + 
> + #include <string>
> + 
> +-- 
> +GitLab
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
