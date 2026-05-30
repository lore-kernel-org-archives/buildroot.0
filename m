Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB0CCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6853D6F5CB;
	Sat, 30 May 2026 17:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6rmWgm3xLpX; Sat, 30 May 2026 17:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A522F6F5BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780160861;
	bh=ntd6Lk+9qDbaeg7DXsS4XpSZ4tJl0prgJ09k40z/6tU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GuIT5LtUv5jcttYu1U3U8CQkF2rXkWzYJ8NyauFQllbKqcYDTbw5q2K7gDNlFRJbx
	 USbD0xrGYVr0TPZUbri6co0Qg69WiEknv6GourgjHLz9W0Eo95xoMZDxTEUIQBjyOT
	 KRFo7dpJNEpciSIW1alcLIT3NLPMWzD1beZScbbqNaRLWTeYYeOIJbFmuSByf6/HfQ
	 I8euFmSlSWhSNuaHjqI9TUcawcELfnOPjdu99zrhsfZVJZ+sLfufGBEO6s03Em6+Ay
	 PTSzBeibGxr2nVoFmUOrmwESQjAHduw3hijsEDJ7AeF9KkICpn+CpTtNV+96D8ylW2
	 eZvERWO7Qq3UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A522F6F5BC;
	Sat, 30 May 2026 17:07:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE7B8F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3D5C42E01
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmofCvLCMvD4 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD16742DFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD16742DFF
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD16742DFF
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:38 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-36b9033d230so1328907a91.1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780160858; x=1780765658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T306Wv+htIbc79h7MX/6DmhwNaEGnXwNNEzwTkHgaEE=;
 b=B1Sb9ncGFEhUrMIDAG4R6S0dDUEWdmTRLmLaAN4zzNqWQPwedJZYMkWq7q8EyCZuTK
 Je0gIY+4KuNUvWlt447CPDZPPmTKtqs7v75b2YcZQmPktCBDSgJrbbpuUjTQcmrRBAsl
 ILWEAbRccRGuFemh//DRvMzGEKQeUZyit9l+6zL2fcmfrrcigVyEsak56RG+KkoH++kz
 P+/1lBBEzAWvCG9CYHqP94+3vwBSlgTpb3R43kbmLH31EgJVhbjyWIoq7uREMV7paoGR
 /HYcJsG5/INL+cu6trFeyd6HwT/kgj9a4WVz0my6LWBBaEPMvIJtuZ7NZlA2ZhdtXz4M
 XsfQ==
X-Gm-Message-State: AOJu0YyEd0H6sWROPzJVbRDm3gU42p2TFQgL+SnEvpx6THsKyO+FQb0i
 TyXRSMQY7uc2O0nXexKOH6QpQhxIB5AhzeiId9B6+wBvlgavqq/4LTA/qB8nbveEFFg=
X-Gm-Gg: Acq92OELlAYsfvpmrGXxQyo/bv+hR61Cr0HfcSnFXcZYgEp4gy6bNp5Tqso7cxcDzjX
 T/2u5mZIF+r0d4/0lec9Ih+07fEhFz5YG8S0ehgP4HXAc8JvJeNKlSCzxAV+NjheNyEpunot9ZL
 ler1FTK23jAKmGg35LAtNCa8mrM1dFhhG+/WYJHtXpIyopzz8fOZUSwQ16kL4QAx/5BO9c55ySD
 81jirTCHSQMM0nM+T6IFxl/sFocsMG1/2hwr4B+UKyEy7IHEYYmlJYkyHv1BwbZIT640WJej73f
 yWVg3kFGBXMGNVcZ73baWLC7BHEHoD9R6N0ZPDFK7pmGc0eBLDwki4xjK1pFp/PxJywAnImOqAt
 PfAWsVQPGtoEr9DpIV5TQJkx6TYwSyxIwTydLgGpGmVol5BvXfBSoYb+/oSb3rGf1AQY/ssPOCF
 hx8E28Ls5frqxEW1Y2rCFYglKeXpT+cQouGAHdshIKSp5xk9opIvGhaM3rCXIaPfvgkDA=
X-Received: by 2002:a17:90a:e70c:b0:36d:633a:c7fc with SMTP id
 98e67ed59e1d1-36d633acf08mr2118261a91.10.1780160857975; 
 Sat, 30 May 2026 10:07:37 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11f0:fc06:1f55:1e4:b17b:8dd7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc10c8746sm4199985a91.0.2026.05.30.10.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:07:37 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 22:33:39 +0530
Message-ID: <20260530170343.19119-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780160858; x=1780765658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T306Wv+htIbc79h7MX/6DmhwNaEGnXwNNEzwTkHgaEE=;
 b=Gval7hOuUMwsTHcdA0tD1VpM7bpDyGppqIqC0bqOpjDpQ1WiUV2WZkbWr2lkumydl4
 eU3nwrl1SLVQTqVh0y34GHufwwFOafsDjCLVb/ewq0ujRo3zhuiLpejGsWDRbiuwyZ67
 O+EyhMSsD58M4imZqpELoPqr19SvwJV/Z4rEnHZQDAE//zeGFGhdNUoyTUPlqJi7g0Is
 ffKxMvpgBsrahtQ/cCq1BfFXvAl5qt+24UKqclXn05wUbjxyywQJ4FFv6W1utGTvmzHx
 EdoUFHyEoJI38i2sDKtRRGeP7B5ENP/QpTNFYyqQEYvaqa6OQzfc6T3XPPvCSJfnWdhY
 eVJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Gval7hOu
Subject: [Buildroot] [PATCH 0/2] package/libzlib: fix musl build failures
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

This series fixes two build failures in libzlib when cross-compiling
for musl-based toolchains:

1/2: HWCAP_S390_VX is not defined in musl's <sys/auxv.h>, breaking
     the s390x CRC32 vector extension build.

2/2: <errno.h> is not included when NO_STRERROR is defined, but
     errno/EAGAIN/EWOULDBLOCK are used unconditionally in gzread.c
     and gzwrite.c.

Both fixes have been submitted upstream:
  - https://github.com/madler/zlib/pull/1253
  - https://github.com/madler/zlib/pull/1254

Shubham Chakraborty (2):
  package/libzlib: fix build failure with musl on s390x
  package/libzlib: always include errno.h on non-Windows-CE platforms

 ...fix-build-failure-with-musl-on-s390x.patch | 42 +++++++++++++++++
 .../0002-gzguts-always-include-errno-h.patch  | 45 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 package/libzlib/0001-crc32_vx-fix-build-failure-with-musl-on-s390x.patch
 create mode 100644 package/libzlib/0002-gzguts-always-include-errno-h.patch

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
