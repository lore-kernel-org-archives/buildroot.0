Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64541606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G80917XR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARpKKSvj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C03F607B3;
	Sat, 31 Oct 2026 17:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub8l16RZuPtb; Sat, 31 Oct 2026 17:21:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1942F60829
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467273;
	b=XOZODJDtq6RURSKq8S5RcNTLYCcA7SBge6TEpBSY5i/gXQdeOYsuK55WguRqXpjlFeeN
	 2fw7up/fNqSAcP9hdCc/DqNkrXLvPVQ9yDT07xS72UittIzU36rWw8A40Y7dBoWujPHTN
	 gsSiNBa0DiwqZukyI6VWXbWhVPobXSfjZHA8jZwaEfPwi58HE4YHfqnO2xbT4hhHWqffk
	 irDpXQubUceqOgMXPXpkmWaQdnb5xaDhTTlZbvIK6OCyz+Qx+oDOyhKaoXTPHxDR52N/P
	 0QmWuBwOGYHClgbL6Iz7/PFcFz+9FMqaT1hpPB/J5mX8b/1j8z4/JufrlITzni2ofTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DStBbOxUGtfhFOAbPswVDODkmaHQY86Ym3eYQfROwg8=;
	b=cJmJJp/fRcKfE2ApOGpsjBBGI3AkZrq3sHbKfl7LIY9P6tYStzDNVtNLRGWwLaJpTEKE
	 B+7Zx/rJIH5X26CeaAcRDxdbQXxUEpxahFXblr9zeGNnnbN7kwq+BkTOjtNNFefErE5kl
	 AlnDtj0Y7vPBBUJPFU89kVPyf3hOcdiK1ldBLUL8OTrs3gsks3mNlwkdPQqHoASK4Bux+
	 bORbhLhmCZUQKUWSy1Mct7h+7COMwFpARtaR+/HxkWvoRKJ3/JqOy2o6vydtKrN8GV9VR
	 JV+f0A3ZLHhAcw1H/TYzZfs7aAalVyp/bey7sqFjjc+rTeTp4AogYHC7LYUyn9fhVTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467273;
	bh=DStBbOxUGtfhFOAbPswVDODkmaHQY86Ym3eYQfROwg8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=G80917XRomAYpQg2U08avsKU8A48r3OQEUaLAxU9qXyndx/nwJcT2QBiw46wzYU6F
	 K0aAfaTmbspDirYIFBRYqq2i/5GvdASPKYzCbzdi8Mzp2VaAfL5tD6nv0uxFntNxD4
	 CXzrXP6/cyMvDytPuTQhixGD/fiDO9YOD2CTOcMFBk/FlLnOkBEWC7vQl2OnG4+Eab
	 y5jw0GyDMlWXVg4YvCGFfuDWN8taEkUhkUVz8r1k+sM6c4DcqUOMMVdHDyaSdJXU6/
	 qL8Kn93gwycZeqYJpOMvce5SbZJgxtgT0djoG2nMC63w4wixxg1viFJGhbscLP0UNg
	 lpo1g+u85wjKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1942F60829;
	Sat, 31 Oct 2026 17:21:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F1B24E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05C0440012
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7NcqRh9E_1k for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 22299401EC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467258;
 b=Fo9ZTuWF1raWOItIGh+Dht+PiAVyKjJRKtDwYtLlnpukYXljkSsu8kfirZGW4zDSkhEN
 AlLHMX2Psprd9szijLkOj3HQH8pnfpjXta5uhCwpXMdiaf35NiPd9zXWX8DsOPUNZANEx
 l8XlF6V4NYPoLdEVRwJkE3KtOZrvSU4UC606zAR6m5ChchKTqZs+M4KfwJiUUzkOBCrFA
 EgDIkl5p6iFjFTOlLBLZZJ+YnV1EehtTCaLgubrQ3pWsdW9Dvy44hYs4YSwYvnDxtO2Z8
 uMqC0sndZ1k385EeST/8IO9ZE9bRBFcH/SCQfZDFVApdHA+JAv3uk0MmX4RS7o5Ns5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467258;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=faH9jVooiRm2HoFgRf4ZzC1d6y6Cy7UH92t3MV+N9ic=;
 b=UOUG0/3CdjKsDDiFKz0xdNLK2m9LiIaO7nL6pvEGr0euufMVPzWnUaJg6fE5SMURgMKt
 G6UUz9wJZ7fZalJWYX2sE6el0NmzywzFs3x/YrmG2finUYeWu5GtNitWfeYVkEuqI9VAu
 3zgHqTLLJVTuRVvBxoybY2SaPHbgT/JpCLtJCQ3I0hBjErN1FxMbJuXqnMS1hiDgyYjKx
 W8YGKru5EHp7U/CtTOJkMvO2pR6KDUpLmzIJ1BHE7/ZGxcz5EOh6cKhwBZNbiCvewo4Sq
 JaEoRtgJXaBGAd3gTjKa9gfpXBhRaK/c6ffYCBD+Q0KEHln7u7B3q4ZpfpyEPeQOJ+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ARpKKSvj; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ARpKKSvj
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22299401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:57 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-703be215729so811907eaf.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467257; x=1794072057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=faH9jVooiRm2HoFgRf4ZzC1d6y6Cy7UH92t3MV+N9ic=;
 b=ARpKKSvjmtifDqxK/bDFUJnFSN23G8CDDgA+LTGnSzCqCf6FEqC1ZwT1v0hnRo6+C5
 R0VLplZvXH/OrEZ7Hzj6IOhPQjTdSefnE8u/k/4DI0kBkw6O598G7ls//Fw80bUqohmp
 PMWPdEQNFNmh9/+8h4SHo3gVJ8uj1qTbFXcjUIlvUEqYfejxw/prCqby0QsySvZpPocn
 9M37dmiqIdqV0yzuLTJYkVK3xwWS6cN4oyZdSIGIy/RC6WlQ53Rvf6rcWmSWMkZKggCg
 BFajVTxh260sGMYVRKovQeL/RQKjND2kVR0UB6eWzuzyRBcnOTVw5L/pWEOwXywv7A9s
 fUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467257; x=1794072057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=faH9jVooiRm2HoFgRf4ZzC1d6y6Cy7UH92t3MV+N9ic=;
 b=oDo1P5WPbRywcuxfUR11ZX7SW6ka1fb8iu2X5019VebY/x8FD7XqUwrabnJMkN6omx
 5IDmta0nKgE1KTJ6neH8Lya/m/n29mKKEhAVnfkZo+gdTm9wuNhmuix4Zz7xwrfVQjkh
 QVH3SiTiHHkaZ3FghZMOB04wqk9n4Q11PBk9nkbxFiTWJgsU8iaA1lzQ9kHKR/uL2REP
 Qpw7Hhhno7lDOM0PeVeQ/vxNeTBZt63/CPivGGO0DUT1dIkOMvTK5oYxCXJsD3R1hjG4
 yF8Aec2U3KwrUt+2w7jkjVX49epUOjahGOVjOge+wuYul/Asdd/tuETYqV47rToiYWHg
 tRNA==
X-Gm-Message-State: AFq9FYLGvQ2xg0Y2fpe66aLooXpzTLlOqLHR4YUMsysjJlfFf1hwZWF/
 fPiHUQ9i4rsxFbU2hXBcBhIRK1Crxmd1feBLtfew/8xgHmici1m+7bxTan3jsA==
X-Gm-Gg: AYBFou08Hb05AWKDtMhfpkUF6tMgADcji7TDIrHyH+KRNrQDmadxaCa+f4eTFL6A7+V
 2O2nuv4/baXkl6Z3LiJKeUOX3dAp6hzrdPmoSaSl+TSYMR1jEyFI0maJw8tff+IY/avZFOdvsnl
 SNCVjz5TZ91b1/Hi6bxyY3f12Pt82LTzhm9fsIFlT5hNgHr1rEdRb/BawDvfKwDOwKaRtXsBi5n
 BxDplFOZbtMyVgmvJDEbs1zQL5G+xV/x0gb6h3JZJhTtqCAhDc6Xe5HFTr0m5yk7rCUp0Nsa8bJ
 ZUymLdHG147TK+9rGZXKyG/FY26llnPMuJ62w4VCXaf6i7oagPcM0JBJV86xeCGC1pcTAymMmpn
 o+/va5PVIX13Aa05t4FuTshc0pZB4UVFQSK6co2KNrCJuYMNjKOaRADfV1H/zGKjEw64JP3SPbN
 d9BCMW9KFA9IU/pAY7mBjQ6QWJgvsaES2VKZhKCHT14XSeXcsxFAmIO5zT05/jgf9l9Or6Xpvy0
 p7awtuAuYbQHjAiEiyqsk8+XrXw8h0Ve7VPRxzunUgOe4fpRIpU+kg2VRshkTpZyNv+zQ+kfqQh
 WzqA+MsKxSo4xmrdeAd+eQqJUsIYINJDfDowVk4YQ2+A14hsAjtGcULSJX3X+wnbvT5Jb5JlFWR
 RMmdVajh/9OogFusHZiIpfdUHV1mtJPOND+IshH7mHhlmJPFINz8YVqkNqBtde2OP+BrsYRYPKH
 Aw4WvyOA7cqni2aQRt5bSlZdTvF2MirrLxi/ITTriCuX6mROIkmjHkzSfvwYO+hTBPE4GktIPKV
 w==
X-Received: by 2002:a05:6820:f02c:b0:700:371e:ee02 with SMTP id
 006d021491bc7-714f29f6a57mr3268515eaf.53.1793467256721; 
 Sat, 31 Oct 2026 10:20:56 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:49 -0600
Message-ID: <20261031172019.2683287-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pytz: bump to version 2026.6
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
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index f26bbd767e..9fd4edf598 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  f6fcc93492495d83d7bea567fdb1eab9  pytz-2026.5.tar.gz
-sha256  fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86  pytz-2026.5.tar.gz
+md5  1e4b17a2643acf32ba23b8b97005a493  pytz-2026.6.tar.gz
+sha256  3b0fc2727707663d6e517936f444fd8a8b240f1fc32f4bf7ee03274245945284  pytz-2026.6.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 4513fb6b73..7322185316 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2026.5
+PYTHON_PYTZ_VERSION = 2026.6
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/14/21/d83d6ef28c4c912c4bb4d1dcf591f7b8c6bde87b9c66f9f454677314e16d
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/f5/b0/168030b0bfcc334cf09fa3313afdb888d892c8a0027324683d1de0ec277e
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
