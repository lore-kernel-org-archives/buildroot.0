Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B557CA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 21:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15AEF40663;
	Sun,  4 Oct 2026 21:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HgvA9VM12w9; Sun,  4 Oct 2026 21:42:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3EF8F40619
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791150122;
	b=dd/ygb4dcngHYrDz5nOXIBbLvVQcsefuwKQJtLJOesrQy5AQJHiWHdYKYoxyq7DkmHkr
	 /whKP0m6dreHP+YX7Nk9lxYmbOxtWHpxm6HZVak1WMiapiCVyC25GWcIZAE4qsTrHggJ3
	 ePKl2+UnQ0xMH/d02erqrBtx0PM2e3ufBeksjzMHlPHmvDBqJistRm9HZYgT5vqSPWVBE
	 jc/Szna8YxdTn5V1GP5hTAsuRhA6LND5H52bd+AoDHZouX/1UOBnImxs9w8p0KA8blP7B
	 RpZL9Noj3Zzq3wfeXG6IgAQHhxzERibC4qfV7iCSEg+ywUCiumHHUFpymQeYMb3oPTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791150122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hbdp+DlnIwra//LEUdng+wRrqdeXvYmH+ZL1eDfFXfg=;
	b=fR8Occdcl8jRH627uxIX9ESckPu4AO85L4+Ux/b5aM+JEdlSnk6jQ/Dgz8QUJI+W1eBA
	 YXvwH+a/1W7SdsGHP1Sz/pULqS13jeZmWkjXew68Twtk8te38ve/lRneg/ZF+FNGkcu63
	 myBGt5BK4EFeuBwn68pya05WBUYxOJAtEK5vRGGxgpvpwjz0KsIOU9wZ/qK0d+/NI4WYb
	 kt/qj3F2I/Wx0QkaF8i9jyJt3TZWN7beAQOS0lleKm85RDhNG2qgou61kGif7YCB/O4DZ
	 VP7XseMfM80hEmkQPEKEwFeerjZ5lBHNt5Zj46aDKUJAmC2iTJ8ETcmukG/66ssswmA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791150122;
	bh=hbdp+DlnIwra//LEUdng+wRrqdeXvYmH+ZL1eDfFXfg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HqnwKM2wW4FxotFMMLGAkKiCG+tO97KLnYC5TQkJGRqGRiMa1o9VvUThglguZcGAC
	 9T6q/fMRd50w+J9RyJR2iiJC/Latci5Qp5CfAx5CmiZddIR+ATfdagOkV/ZLfC5cUK
	 RjDsLylXOq0u7boPJ1Sugy+HP81FJPHO5PFESR3ra7t/nPT2WYJJrI2mvMAAc1MsQl
	 UwEdqrxgrnepf+w/cV5C8mvaC11UJKr7iUl7oUzhSOMlIPTE3DnutpqZ9CZemvrvOm
	 xdolLfPYLGjHsc1QHWl7Sb8weNQ3yySo5enKvgJyvM2wxcZZ+VayiCEikvoJw6Ecck
	 R8C5dTvjfejSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF8F40619;
	Sun,  4 Oct 2026 21:42:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 210162E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0767F40004
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TrI2-CvFmh9 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 21:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 169FF40075
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791150120;
 b=Q9jPJsY7p/1shNIJSIYYrDmDyJlw5eeaYScVlzEZUjkQH3Xme0u3OIukJWphO+E4A/Gs
 0DalTivXt8kEtz9o1j+GgG15FOnkWhSFnIB/0+5MCW9+lm8Yi0Kem0ibaTK9ZB/eLm4Nw
 SFE6nEJ8HODAmMAG0O3UOdnwvhvzHrn9YOzZCcRm1xvx8hJr7AcDy1FVZO9LapcEGhnh4
 f3l6xW8q3oFggDcWI/uDlT3oTGXlPmgjY/koJ5F8MP5IqY2BGFb5Pbsqd+voNYGMh2ljL
 TPb0XtH8/+e32bgkj5jWn9oV0AG2ToSNlssW7ycnQdO+csNryf7vnARwMaM77zCQ8kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791150120;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3qBqdE4ys+myEDb2Mz55iKZyNB1iQnFCSn8xubLU6Pk=;
 b=W+F99Om6zO2gwc8JSE200JCrxIPZPJg2mr++YSGxwUalvEpvuj0Hy972eyUJ8px1aUxR
 y7ihOOEdEIh48k14z2GNlpD4gQ3mPQ35gmh+T17q1yngIHcnQkp5SHiKYAI9pSrh1iJ6V
 YSt/F3W4Wh4xPkt97kDi1TzjVHfIkpiG1ZEppHlkK1DNaY6dH3vqU4tFQgqVAl/V84oYS
 ROCg/gbQLS8NPF+sqWi45HHxiPgOOs+p+W6lTDd7CJHn47H/joEKgv5eIDrqJVIN+TfRG
 FmuoRW3f8lLJo5TOGKdW0fqhJ+akq9BEXqegoCE30NDybTOu/63eYZ0ao2TyPFMZLhg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SfVzgjxB; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SfVzgjxB
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 169FF40075
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:41:59 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-7f4f0c89e34so1488839a34.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791150118; x=1791754918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3qBqdE4ys+myEDb2Mz55iKZyNB1iQnFCSn8xubLU6Pk=;
 b=SfVzgjxBNnLaxdJXpjfpbTSde0KDh1ll54bfGpYe69hgyPKKAsaX0AgHOpY6zxOBkV
 EgJ1RsolFDDYeDaslyRGq0ckmPX+QajkKpkavm4tY66opFvKc+MQFZVsWr8vmPdZ/Gn3
 3RPrFQTe4Brl7D8HT4UFw2n9001B+y9ntMCypIowpm1TjXE/Gl5xGitFQwzptkFNPFtm
 5h25FszHZZFQn3W51Te6GpfqIH/kWgf55OBnjXslrKeyFk+8VlTrS4sjPWeBVabz8eoh
 kxLJAYcq7Podhn9OXDqussP+EG6h1PkoSLGAqvNzpkIZKnJBfIpI7tzZsF4mDA+KiZAv
 6sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791150118; x=1791754918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3qBqdE4ys+myEDb2Mz55iKZyNB1iQnFCSn8xubLU6Pk=;
 b=a1nTCwRpjVcOsqJBcSWQDgmI07/lSrQzzAxEYseZL0F6BkE8Sp1UGCDCVOijz7P087
 aUaRD+EaqVrlXopHH733jKRl4R/OQ31ApTqS5ExREwW1/s6U4BnjDMz09w2abKADcA+c
 ylAmrTmkjrGnRWTi3Dld6HD404CtxuwMow/vNq8G4QvPJbDSaDYvseQo5QbCyb1q7wWF
 tvWA7o7q3EjYu7J58xE1xsi4K7SB413BOzkylj6SQtCv5TVJJbxaoyZpUUDclMJY42+H
 sYFxUfqP+djCTT9Gb+5GiuiaRVLWM2lWr9uCvIpJbtT/5K+KQeLDEwcMBHvVzchHxoGN
 OL5A==
X-Gm-Message-State: AFuF++mfPMlmOgMiHRQuLviKCkTC2HQ+iMLrTi2B9c3fDn55p+ZVXrYV
 64OWkT27lZOiWOE8J6BcCIPSySdHCdAenbdbpv8FPlWdnLjYHNmOdNQL3YmE5g==
X-Gm-Gg: AYBFou1wgcW1hok8+ViwhDg1f7mcqRsGHDgPaBxnbrKIJBQF7JN1v9Xh3RJo9vCgkM3
 mtj+r9K/AxMBTWqME/wrHA7ZxXkB7d+o4NR10K4QS9aJz7jYkZtsIKbxSGLNUufTLklTshLwRrE
 mE6sRdECvp67TltZ67BY60hRIxdVhchX40vPdvDpRG5Gc1ypWKj4zOh0JEISffFrEYtNn5XeW2t
 f25OR295mVBDLDg1WFnnzRqRhbZDJrgWFujl2zd5cGDrKKIBZD2l4latXXU/mQg9gcEzxmg/sN/
 kQuCl9jbfN+cQXOTHWt+IoZ+BYmiGzauuAozvwsl3QY72vtE0ZJ58N7xiuEAX2vu7vUbU77Lw4h
 XDVkNUCct8AYsDn2TeMjBvgtrrG9beEbcyJl3uC/Mt7jm721VWTWUfhfVfKWsa2BNUB5HV7/9oc
 Lwp9WzZKTruFOdMG1Q3BJZ7fQ6uG4LvqxAIN8abUpZ+igfPZ1hh2EkOHVvBtuWEc2fytvesZlh0
 Sxn49fKeiJSfBTlJeCYAxpufl7zvkP/Px/yif/kdQNXjxOWDx0KHGDdCV3RaipQynVzFN+VYFu4
 o6vUg8xa3V9JOoVnfkAkym3q2AFoYS1qovE1Y2qTivH+ck3A9Mn0wROtl/n0T7v7Mt7jUYMkDPm
 1JVFIXjKcpvAoeyyk/DuuTPBLutucSJzlvv4cG7IZ6ok=
X-Received: by 2002:a05:6830:67e8:b0:805:cd51:568a with SMTP id
 46e09a7af769-8227f99b4a4mr10708009a34.2.1791150118265; 
 Sun, 04 Oct 2026 14:41:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-822792a1b6bsm9673770a34.5.2026.10.04.14.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 14:41:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 15:41:54 -0600
Message-ID: <20261004214154.1053602-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.24.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index af67a1639a..f0b9a052ca 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  c54ba32585587dd47087a8cf8032d72b  pycryptodomex-3.23.0.tar.gz
-sha256  71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da  pycryptodomex-3.23.0.tar.gz
+md5  f8298c5255a43e033703f758fc7c688e  pycryptodomex-3.24.0.tar.gz
+sha256  0428f19f13452c6b89bbaf2c530f84f369873811dfa77f0cee0da4f40fb0474f  pycryptodomex-3.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 9b367227c8..72f91b0c9a 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.23.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.24.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/c9/85/e24bf90972a30b0fcd16c73009add1d7d7cd9140c2498a68252028899e41
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/4c/25/214ea825a9031f5af2c8b2506ee16701a2560d4712165dd00098dd527bcb
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
