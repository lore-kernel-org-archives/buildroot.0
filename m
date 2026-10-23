Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A7606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E4tHTdvP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H8NVouGL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A495F80AC2;
	Fri, 23 Oct 2026 19:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIm-Vb2m1LBB; Fri, 23 Oct 2026 19:03:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B27780A86
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792782225;
	b=a2mZIhOQ8VKMNR1eyzkn+qM1taSqjSJfANym2qH/fCjMOy7fEuZp/VKxPJfuTgw/ed+4
	 kZoqNo08BtrDgniuI4lumxY/MAd13EnDgo5sZ0YUTyd8u6vwwwRO7DRWO7fIRyzxNNhsh
	 LflBDDOODLhnuQKniIlSQx0vaEjzD5maFq4DN+nRZp8dxOH3bHamtgkgavK62aJfEU9Up
	 SXMCj676PAVph/tnRdvmtFC5hJpPEGMZ8SsuHh+91xAWCAo/+y9AnvcMLwPRKg0RoRSNm
	 crybDDYjjq3WcUqXr3QZ1S7rx/Mq0+83UTv5CalxYZSEmYgzyvFQhAXSkJc0HKqnovQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792782225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=q0hHKXw4BFzIPTlXtkC1ls208ybG3PhkSqT/5NKX5eE=;
	b=eq69z5bgGOwUnOZ7jGcyOL22lM0rwMTnximULraUw61AsCtP78Ov/wdE5PeHrEhKNXgg
	 aHi4xrpR6LJPv8GE5/ZaaA0sex2YO0K54/NN1bIHjrmmgYavF/YM2UIDO8MTvUMwcViv/
	 STmFfm0HagKutWM9b3X1thML9wwCDO8GNNOHr9ExMIh5e6fB6umjKvcFpbfiaZ33WuBKE
	 gcdTtI6BMDpXyPAlmKC9m4CwImqJTA8fFFNbLqPuMQnPcCgJRhkMTnJBirJKfxvy1CQ3a
	 0LhqQFI3bjJMJT6UZrvfRDFnxzmRhhRWQ9FtB6xE5b5znmizf5GVf7dhZeT8uiA+09g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792782225;
	bh=q0hHKXw4BFzIPTlXtkC1ls208ybG3PhkSqT/5NKX5eE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=E4tHTdvPR69FmjfKJLksht3QBOfYv293kU2vpQbh2+ojkvG2JZNJrryYlUk3r+1PT
	 CHLYe0bqJT/eke69WWkYVjy3ycL9johOzynRmxvSlJpo5aCp9YSlV3wbuzM0Pao5IL
	 I2zWfx3VMVq8gsSF4mU1I7daXyrZthYYDr4MUjRYCztau5P/mSQvB76PH7op9496QQ
	 sk29FeibbQ65wcFCccTcr3t1NAqYZBsP6Ago6ceguk70ipX7Onvtm73dfcdfJ1D427
	 a8GOJ/0WVhTQQooDNRlS8E0TDA1+j+6l/ssbbXANwhmxC2n6SO6kKrEtuzHblOhhYu
	 sfb72DhIcIIqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B27780A86;
	Fri, 23 Oct 2026 19:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBFC79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DE7D4007C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mY_dQrXv2PtR for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:03:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 00CDB40061
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792782223;
 b=U+M9+akTy+TW+c6isLKM3Png9nCWC0W5wzyM+MS/HQLvy9tNEmRpFZc89i/BjiKkgYgt
 qStdly6pCvkXbYfuip2LEC/RcQjdKY5Nyw6HtTkaD2waHVqMxLBF6JpEqeSBbx6zXuyXS
 KPqohW060Kr+e1+VFqpBgwboKjTJJaqblACXoR4omqS7+EmdKusBNIL8i7Nqq+KijVAP4
 lNhw/V5fnJUzGJ5SMrSpIkAX8xsJad3X6OeAkYncLUmiL88qL+APr7+pneR0Z6o8Vgeqp
 SST3+cC+A6L9Jbml1lySIEOq2x1RLbG1A3FZ7aSy9M5Wh+ReTwJDjz55ez+9BSAuY3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792782223;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+Iii7Nk2WuG+/NJKSJO662AaQshriiGTGLcD0F2KDrg=;
 b=GBSZ4xfo8vrVCnircHe9NnZpwQstfJfnbT7+0Wf0/UsMYmec21ghDTHdJFj1yIn64pCm
 8x/JQdlHHCkMWOzklZhohMK4A6i54f48Fi/BONdX8C64o0PmdEreJRu9GQfvgOwqtA3P9
 LBX2IxFgnl/GQjUo7AofwpOISbH7FvqZ/6JC2VZ622HNIdLJpb1qOb2oD1kO8F/0t30lH
 SdxNgV0dbtY1sFWbiFNvP9jq7pnk35ViRMjAtMuW/ii5Wpm4fReCthjY8SpJi5MyfMZ7O
 9IDtTWDdwFnYiSd6LK3cmA4lyJzFVJjVgUZeOj8J/Imlz4s2hNdCjpQoKqlm0DAqaNw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H8NVouGL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=H8NVouGL
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00CDB40061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:03:42 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-843cf077f10so1261341a34.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792782221; x=1793387021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+Iii7Nk2WuG+/NJKSJO662AaQshriiGTGLcD0F2KDrg=;
 b=H8NVouGLIaz9R/vBimtibRx0V3kcpprTZVxMQnb9zUJggI49DMnqHrEU/YqzjDKSRn
 DLs/gJC0FmN8r8MTUJnN6bg7kMTEhwj2rZVVfBEIH/NHABaPvCvC0jjXB/tFDXfAZu8l
 K43TfWDx+PY0wW6ZHfMCrWiRG+3yKbCvvdxIbjzWxQCaFnARN1c9SAmmFqymZW//Lfbs
 b4nAol88Ix2nJS627Do6pBBodoxNVg0Ti1cb/MQgYS1SP5+iuU95LnbNczHerFY3S6/0
 EZ6h8BhEtz/0CskJXP6qiSOHEIB1ti1f4Nuzbibnv6Xuh03ko6vGXQQomQkIvHhiDxc+
 betg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792782221; x=1793387021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+Iii7Nk2WuG+/NJKSJO662AaQshriiGTGLcD0F2KDrg=;
 b=lehFh1BhPIeG+kFwn4lJPMVT0aBIACotj/V/lnWYTKh9ps9PSa0j7ROlZZlHx6/y7B
 Zmcy+pdz2XU0XIJzk7vWdY4gKMt0ap+7s25rO6RZAV5CIJagJ8Hn2rJyF7clZC0V7KU5
 JyKs5qyjGmvD8sNcXWf0MpPWB+4yAePPlDLjN2XZxcqbmF0lq6Ka1vO3jwXcLi6vHgtt
 2E6U01EDEv56nt/fiLBzh2yiSjrvMFeQgMX9BdvppeMQslco1eIBnIW4ae5VvmDa/TyE
 JscsTWGfS59moig5pWAGtu5RcawW8y5T3NHxr+FDHekUDyKocIUZGfn9EFhkdcnVRn3w
 dQNw==
X-Gm-Message-State: AFq9FYJbuHmyS+b3lGyW6uFS8RZO+5w47BHZSQZ++FoHTVh69Cx9Lxug
 eIfDP6qKlva+Ji8N7f3ham2sWWqp7s0CeIJKWcQiCw9pZozyDSvh8yIwMcyWq12A
X-Gm-Gg: AYBFou3R0cVuZfdDAeaMWu3vIEiFqp5+TM/3gBEoAhEN9p1Wv0St9KZrn9V+wjJtWJ+
 6H4xbbuQrf6zfWn+A2eCTZBQf2nmq67H+BBDfhvXzkMaAjycXKUqK1y6BFflNqpv/QsKfVL8nAt
 jlIk9DvF327WwbCiwTeXkYNiC+5/BmwOjNo3Ps+CzuPGaeOoRegMaaell9xx8dqesJmQjKCG9BV
 Gc/tGuyJ9WuVoRex2ESMa8gDUJnWYNbqOmaHzhUwXmVOUYKoOwD2x5+woUaMoBd0sUUg3J0xtkA
 /yAUBp8BuoQ1YOVsFblVi5qs/jnt06CzXDk4u9ODRYT6Akdp/6n9ycxNyw3rlNfWVb3NAT61iet
 7qtsViGBD+tkNcI7Pm9ez3bCwu84H77cGf0EUD64qBKyV00c2qj8V4f4nDXMu6lqFGvHY7EMJQI
 CN1bQ4LS1TpEaZ+yL5Dk8soriwJD1KNanV+xerY3OHr1ST1SN1Szek8LI6PX0+9QvD5P6SOf6fc
 k7Pg1OFRTc7lJyGB4mJRV+r7s+XAl72yaPR7aUCoropJbRK5tL4ABVtY6dodar8K74PxEXFeEqZ
 9TNKQHGGIPBcku70BmVQD1HPIQvIe8E1WNECpSHLpoTdA9VTUdyfZwElZ7C6Z/ERWVYv2LWi8Zv
 UjQa02GU7bFqELueDY0Usalc2HqYdP7dkks3Axy0X7t0yRz0JE45b8f6eZ0TVMYbNjKwIVMhZ/6
 2qURXbPOQCB0oNgD71r62Ymgru
X-Received: by 2002:a05:6830:2b11:b0:834:b015:aed2 with SMTP id
 46e09a7af769-850fda467b9mr232438a34.6.1792782221408; 
 Fri, 23 Oct 2026 12:03:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fb649402sm251127a34.14.2026.10.23.12.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 12:03:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 13:03:36 -0600
Message-ID: <20261023190337.969832-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-httpcore2: bump to version
 2.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httpcore2/python-httpcore2.hash | 4 ++--
 package/python-httpcore2/python-httpcore2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore2/python-httpcore2.hash b/package/python-httpcore2/python-httpcore2.hash
index c783f884c3..1c202dc6c5 100644
--- a/package/python-httpcore2/python-httpcore2.hash
+++ b/package/python-httpcore2/python-httpcore2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore2/json
-md5  a540e0f456af9e4abf944965a361ba1a  httpcore2-2.14.0.tar.gz
-sha256  4f57a1a8249fe6af589d935cfd456f1d13bbdcb0f0fc72af9142368fc94811d7  httpcore2-2.14.0.tar.gz
+md5  118785ac17d5a4d0b9122f998ee2f705  httpcore2-2.16.0.tar.gz
+sha256  c72cd0413563b17e1cd8354677dff887466f8ec2551679759e93126534428643  httpcore2-2.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4df125c807b0613501e943a5c92496dd11d2c16604ce396097a8dde396304d9  LICENSE.md
diff --git a/package/python-httpcore2/python-httpcore2.mk b/package/python-httpcore2/python-httpcore2.mk
index 048d582bdf..1f292424c0 100644
--- a/package/python-httpcore2/python-httpcore2.mk
+++ b/package/python-httpcore2/python-httpcore2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE2_VERSION = 2.14.0
+PYTHON_HTTPCORE2_VERSION = 2.16.0
 PYTHON_HTTPCORE2_SOURCE = httpcore2-$(PYTHON_HTTPCORE2_VERSION).tar.gz
-PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/30/ff/b53af1b49bb2cb5fa97c92215614b173ca5c1a99ded80e2d52f15a94fa6d
+PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/c0/61/afa9d6b7452f9eca73f73d45324eb0bb52f098fd5e6049bf6b8263be9b4e
 PYTHON_HTTPCORE2_SETUP_TYPE = hatch
 PYTHON_HTTPCORE2_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE2_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
