Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C0606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SG1m3h21;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KM4Rpfi5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ABEF406EE;
	Sat, 24 Oct 2026 19:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kz6_k_sDCYMP; Sat, 24 Oct 2026 19:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 435ED406F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792869014;
	b=NU//5P3gN7bqiGYJd6uRV0Vi6bZOS3hS7C6c7pExenoHh6XEZbB60F6XjQfnFE0jmwPU
	 za9Wca2CJtCeJZuouzZzoDskCmrIMhiVNzLCsiqh7PZFoUkpyuT5q5p6RqPF1NE1MKXUY
	 qoJMPapNGX2X750PQAZ8s8dQhoVyTp8gXyTlSqpavYiDd4gFUknR/2crvYBp7dCbKeKhJ
	 DO+auGdcdOq9ASjgfSTZzlPqepWWMAmfKV9zRDeRhysdS8BWSWVgVTB2JZxWXOnD1xK0V
	 ZCSyvmZeQyytGMLBkmj0nF5KBJoVemwvKLZ7ABSRC1jtP7VK1FmoGXP3fq61+tw5T9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792869014;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nOhsob1jS6BBG+S+LVHvdRLIU7fOJIYmI95hB4uxMek=;
	b=RKkHJ9uebzHKEcxuYBwXKQ9PLsQ2d9F4u024cSTb1SlzEYvQd/l/crlk7LicXV/dzQt7
	 PMHiAevf53P9QwoQM/DBO8BpvNm3zZlKbs7rtiSurGwORccYM4TNjScXEV/H7SNwH4+Yd
	 2luvhKQayIMJNr2WY9s7FlYomWyEaIkqBd3uc1PBN7N4whmfe/f1t5zjPceYrX8y92NPE
	 g8hcSe4UzHNjHtONsOfCmKM27lbNzMw+1VzcTa2JI/YojazoedoS2tcjmsykujk0TFUf5
	 /GGd2wq34XfT2wc2+ZqmMjZbEg1ZFp2Hy5nMZozJbxDVrPe3UkesDktwbA4D3cLozwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792869014;
	bh=nOhsob1jS6BBG+S+LVHvdRLIU7fOJIYmI95hB4uxMek=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SG1m3h210E53y97eKMvINMWPJEL5iexhnnYKi+f4aWxCaKUe2a7wdlBF+hxRd1FfX
	 RRbgtyEsvPMhfOqXqudhnJPc6j4a40bu4tx6Y9L5Vca32Ov8pdKDGb/9EjcT78oh+e
	 FMVuTFoOuMZ87Ys9em9TOo5a4uLWcVHKMp7WTYYvHvPxKrONqblKVJ7EHK/pxYhlhg
	 4KB1rUOQUh0Fp78KLu7YlnHlsNKk0ykQ2imCfnIU4ssvlcmAhM0HVtH2p7677xF4dh
	 Q6YjPIhvXsoAFjNdLSCsaO/03nFAZyiHseXV9Af/jb40jQe/+lz7btMEFrQzdGorZg
	 LCkSDi9OKP7eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 435ED406F0;
	Sat, 24 Oct 2026 19:10:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71C423D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6340D6060E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuFwnuufIb1f for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:10:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A3C93605FC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792869011;
 b=Jh3mHxZ/mYO0IEP/vllGaQb6vzxffHJC1PFf4hBbvHhQIAcejiOuul+0me6OmvIrgBU9
 0A4VCqGwZPVqgELJ7X+HFXiS9k+/ExfzA7B2AeWd/jmDYQ3v8FiO9aKkzpdEp75BxF/+w
 1Y4fQiWoF/QrExJ0cJpJAnJY1035WmvIZy9vogsaWOauIbE83igzja5L0fLW5Jir1m+ro
 fs0wqB8ANG5XDAcnIqv3cS3wdN9xP2lTM+ejjU5l/+rRfxJB4Bvqg6H7ggoEFT/lwwNZB
 Qj45tLUa51mfifKGumtnFB8vFULhzLEaDj9qORrFg2h4b5n7rLw7X2nlErp2HHdglcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792869011;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=UiRDPhqvZo020mlPYFx6B2r8ant4Vf8rxW2g4RGU8Nw=;
 b=KvR46piQQqMSYMIoDvuKIbZstTCEFFbLpq1a/dAoq0grAsdt334bUeRjKgxXtq6TcdPm
 vWGpIxPTxA4pwOI3oRECCqZX8NyTxEKEnbgyI377D6aynSho2lgtDOKpZq3IxtIHj9nLV
 4S5X5DlmBzeXUV4Z1HdF+sWnjYcgfJQUmBxWHNNDkVHMGefHCHxJxhhVWtGWib1FyiRdI
 aDIvb7WLSV0dvio3h0mQCkHi/QlUz6/qVK4EPWgZezujsZ7HmOkDJYFjU+/XCXNcN7YOI
 Xp6tce8YfVDElX4/5ytxhKM6nxr0YAlbv+ESK9PAGRySXKChHDzcuKnrEh/5CxTnkRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KM4Rpfi5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KM4Rpfi5
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3C93605FC
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:10:11 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6de1fd5f572so933221eaf.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792869010; x=1793473810; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UiRDPhqvZo020mlPYFx6B2r8ant4Vf8rxW2g4RGU8Nw=;
 b=KM4Rpfi5qZbnnMulvZuw0mqn2BGRrtEp0liZ9t2DmqHh6PLq6GL1ZV1qkrQLKDRfx5
 uVteRC+HZtagiTSiJXmTFDvMxcYinxGtl9bJ+JZwUF3hvTBC7N9kRC1H/NJmO1j/wymA
 17MrJIvU9UFsY6nYfkOm2sDYpUrJJCz8jICEjrZaoSQ5ATmlcCZoOCA4azPdNhxjYZ3Q
 +4+9Su8lJDrAF+iaxC+mh6ifPVqQHMtPk9ubKw8yR6zo1SZWavE5qc7v0idriI4S/4pa
 YL8yFH0ItuoBHd9k2Ze7p2qFSVKY/NGC68IHtSSDZN26QrSugoClDwYIom2gUYEYsJNj
 FH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792869010; x=1793473810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UiRDPhqvZo020mlPYFx6B2r8ant4Vf8rxW2g4RGU8Nw=;
 b=e8sNG+zr8JOhU0JIjwU4zjNOUwQsyLUyZF4BpcEGhcVF3AT9JsA5J1/uAZYsCQf3vt
 vuv2Hlr+YF1QhGqQvUoquB1ZY9T44Syq5TXNWbo9iLApJ45wP7oyfI4KCYJYy/FhN0Jh
 dOKzE6ozYJjD4ijRNvJZyLIkpXnFjh+K/k6KSOi+N2M5D8KEgmrq0oWvRKetH2mP1Iz8
 I07/y8PWFMGV6J4K04iPonQtjYsAMn8V5DsckL1EX1En7rG1fgeNEVJi4h3m+b0Ux/fd
 KjXVdTcO5vUDzayClqUN6x1yThQzXLaDkrBCIf+u4M4PGXDkT0K6Ul8svITr6klhkezS
 Q4Dw==
X-Gm-Message-State: AFq9FYIophsWfjNZcr8MnUay6HcomsAtMx9JYMsX+juFT/PcfzBL1Mbg
 GH3HXmfO7dfMhX/a8QF+SLaWezuZEV8/FUGaTo7sdWfovB0D720yLksEJlpv7sYH
X-Gm-Gg: AYBFou3Nsg0FIWmKdaZ9KfNUJNiKxI5m0lTXh2+6dCJkOfXjGHn2Xxid8PCst64Mmqv
 +8p8lSdhJvfTfZaeYpQmkggy4mxA6ziBeFuPWvAwQZZ8ycHkKNfnSo9zC6hOg+sLWKE6VFIDUJe
 CEIto48twNtuyoaYg17LZH4g5K2ZY/u8007+qDFEPw8iOaRN94itDfQ0d6Ho4Yy5D6HFUYejAAf
 VcGrnPA5xsUg+RA8B30uZ+vE00Vme8QXIHFfsc3HnLCIsHxUwA6ER4+qnWpnTaDncfzUgKp2B5F
 7PbJV0Ln+RnjRrI3gEz3lgIx2bv51ip+XvWLz6iU4H/jGIwb1XqMjCL9jwy0HFXAVJMsJU/peCH
 d0BBKegk0O1g7jWMTHbBjp5pheIDK/2LtkZzEV4bdv0miQqjl4QyLHEB2pgWwWP8v7LrS+3T15+
 FwZY4gNBH9QI8uLnDr/3qCj663r9MBKjbJ1zfaeWaSZVYjDH7r/Rx7sQWj5zCw9NFh395ODyOHt
 KcbqzhqJPY82LO4GZuuZ6NjvNTXzR2wFTlv3hWG5jWSbWHZT/dUfN/Kqcv5e+Nzp30JJ6AHNmOA
 To6nXNmgjqQj5n25jDaAqTEkvmugVHJ/vAnDoS7gInyb9GOvZ4A8CukbUqXKjOtAQ43vV+TRCLm
 hAncSG3OLQB289mbCFtIwE5ueWxhqR7fTsJxW5pa8cHF8XOnCPbk7eWORKt7+HrUcxVbZu7qFUw
 ydQ0Rnz1s74HI2TW+4jqyF9Cc=
X-Received: by 2002:a05:6870:798a:b0:49c:8cd1:d293 with SMTP id
 586e51a60fabf-4a83f1d994bmr1894559fac.1.1792869010291; 
 Sat, 24 Oct 2026 12:10:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a8430e8823sm1576922fac.6.2026.10.24.12.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:10:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:10:07 -0600
Message-ID: <20261024191007.2101371-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version 3.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>
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

Refresh the STAGING_DIR patch for upstream import and helper changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-pybind11-commands.py-support-STAGING_DIR.patch  | 9 +++++----
 package/python-pybind/python-pybind.hash                 | 2 +-
 package/python-pybind/python-pybind.mk                   | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
index 255c484099..83892f1ddd 100644
--- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
+++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
@@ -13,6 +13,7 @@ the current directory, if it is set.
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Upstream-Status: N/A, Buildroot specific
 Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  pybind11/commands.py | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -21,16 +22,16 @@ diff --git a/pybind11/commands.py b/pybind11/commands.py
 index a29c8ca..de8a27c 100644
 --- a/pybind11/commands.py
 +++ b/pybind11/commands.py
-@@ -2,7 +2,8 @@ from __future__ import annotations
- 
- import os
+@@ -4,7 +4,8 @@ import os
+ import re
+ import sys
  
 -DIR = os.path.abspath(os.path.dirname(__file__))
 +DIR = os.environ.get('STAGING_DIR') or \
 +    os.path.abspath(os.path.dirname(__file__))
  
+ # shlex/sysconfig are imported lazily below to keep `import pybind11` light
  
- def get_include(user: bool = False) -> str:  # noqa: ARG001
 -- 
 2.31.1
 
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 1a54a89da0..b7f8025544 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  741633da746b7c738bb71f1854f957b9da660bcd2dce68d71949037f0969d0ca  python-pybind-3.0.1.tar.gz
+sha256  ef712655692a2e9bf7bb7874c022564a45f91d847ddee987e720cd9e28849665  python-pybind-3.1.0.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index cdafc9d4c0..4d3cde98a1 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 3.0.1
+PYTHON_PYBIND_VERSION = 3.1.0
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
