Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFB606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A1TXJBl8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0F9Ede0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CB38130B;
	Fri,  6 Nov 2026 19:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96UoYja4hUc5; Fri,  6 Nov 2026 19:16:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 12FE6812D8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992563;
	b=fTH2p6Qs32Wb2QcG/G821lnXXVMK1W08wXit23BLI/AmSgdtujN7Vv3o1j2O+dCQBQM3
	 iyQD+7kOGc5OEmrrsEf9Nn0PHc9o66yR2p2cwvsKjBOpfLIiX0yNdUwBK9wfsR9b1V1fh
	 Lpi90BRTycdmJFWHTDZSdqq+Q9GyRI+fss7UiONBKuyOOO/RF37uqa9RdMpaUJX6Zpdbx
	 HzS137hcpwclXluAo9Tb3whoqZ6yO6tH6jKmIlvemhZ5s03kV/vimTm5ASAzgS/Iw1JSX
	 JJeMYaPkLS5GPoURUPx5CK/1F8INJZesbX+9FVfKb/cuwBDpsjwnfxGfEtyCAi7xEzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3QQsR83fmn5hshOiiUuZqXr9BnyxIfhvdYl1Kahcz7k=;
	b=Cu+WhwIv06MY+LQtIFlXFLSZeCnkgfWHN05FxfMF3Bk2+do7Cj3T8DZ6khSsV4GWTa7h
	 EDQj+QrKerZMSsDLbjnAW5wMzpJyW322CCZedIw69C/XhaVRKwq0KUzzAIJ9oP2STDWis
	 hccBAMnqIaHkTegAz3ZpVRBxP4xT/K1AxJCPQfIhYQAF1vQTE3tgJs8+e0LWdqazFXxa4
	 yMmGuUYcJQ7yl8VI6kvQHQgTrkeSUSF9IKI9SEl9nU++xulGjPa0LeLOq4aGjoZZRC2uj
	 MreXkR3PnjhyN92qgWlhjHIsuY/uiW6J4JYR5f8n/0T+klnsSh4bvP3+FmIUhfOWUTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992563;
	bh=3QQsR83fmn5hshOiiUuZqXr9BnyxIfhvdYl1Kahcz7k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=A1TXJBl8A9fMhPRfPyHZAOAxXpSas1c6hZw8suG0TQm/NNpD1jJ30nngKciWU6rY4
	 sTIWk3yz7qZ1PJ0uBsARTcCjLLZZt559Mow6Z8bN0jaHLBQkib5Lmn6rcHD9EteObV
	 VYx8SnKt0iVblaNL+HFfTYSpzeORuLCmDar76mOFNcH/jeRx4eH/vSkZM5AD0wKjRE
	 G3Xt9dgDjf8rvLip1kn1PQ5ltm2M5oTrGNOHM8MuFQNEPZB1U9BAAhZRhxBEcLC5af
	 MT+vIrVscZV1gUlRbes8GkIsi7Jo8Sh6npwp8c/H7tmCtZBMGBpYqyF68VAqH+lmPQ
	 6sDyR5QwP5PFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FE6812D8;
	Fri,  6 Nov 2026 19:16:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D07FC362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D31403FF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YszH_bogpPK for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:15:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D0834400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=J0F9Ede0
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0834400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:58 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6deb848ddd7so678886eaf.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992557; x=1794597357; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZKtaq072pDCQkH2Q01hAMXJU//Lx2XthvRaTjNuotyc=;
 b=J0F9Ede0ChTPZGNj/Eo1VjRnRzgCrVjgaQOGSOG4BDepiZWySla2VdM84wuhJlhSAr
 8BCc3LoAmq8ti6iUqxmb6pyncUFEGH1893epxuaaTsmW/sz/nA8V9IrSw5xtjIfThpeE
 Yk3FaFifUPjEVnjIAIryWo6K/QfSNco9cKJ7Omx8bGjugAxtPc38WnZUomcSeNNX/u2d
 7gD9d4pXIR0eRkEy+wdb3m2dWb1Gr46wxh9HOgDORDLpw5pSAmcv9GoP4V8924vCb7uO
 zfuMYN90CCY0XlLGGUfiH7q4oKiD5pn8rpHzsY/pBMcJk8CW6ArKyJIY398ryeOqmoZF
 kiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992557; x=1794597357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZKtaq072pDCQkH2Q01hAMXJU//Lx2XthvRaTjNuotyc=;
 b=HgloLQN2MfYKyVPzT0JR3bnbbIM0U7/4F92O+V8lUNoRxaxtmG80P4gafPPvyz6ATb
 EIKwJAEMPJysJjHRguv8tmphsUXbKIEAumgjBMFzI/+sbqYbCOleoogQod4g46LwENme
 NdCwsL8EZvXymP5pIoL+A0cM9CV6WEeOJmDpbPgq0tC4qtZxwKvVQzAgMksiaUXwyX51
 QufBDmQqktT6Flw+G38k/o66/kfNiciwilOKdBYjL/j72VvyR8s6fJlktbTcZ/An03pE
 gWOiC57EN33hYe1cF5jrmIptZPUdAVvv+ZKsElfBXoiv892eNDibGdx5BjuTMVLkojBX
 iKeA==
X-Gm-Message-State: APuU4Z8RIQHoXF8VSV6hBuBpnOIDz4XRABgSP86z8f2glBDfU8+zmRFK
 3Da4bdY/0DyqzJXFUJoZTBzAriLBx6JzoGKv7eiMZP2Iqnz6Iu+TuYDauGbnsA==
X-Gm-Gg: AYBFou1EJkBp0Tz/pBT0feiCG5KrsXSK7KSsw4sNccxOUOLuCHnoSVtSdiSSeT/rpSF
 GzPhlQV3d8n6Zi2Cn7H0QtTNsufvd9Hv0UE0y9Z6l3OZgEoUACDp2FR66CbDGuibU97c9Dc/5Iz
 FZ7VsvLwZ4Iz/mRQuzAe35uoHjLfTf7L0w5JyBDxjhgJg2zrJvKDU0BVG0rMFSovIR2zKsyGwRF
 bqxxzj+Enl5mB0c1Yahe4WpnvXmQABZ0UxhXlW6sJawb4munh69Fq+SmFVE769qstyn8WkS5Qwa
 QY2uotuzf+v0r6j/F/zcFaDXtm5x7gQ7AE9XUCs/6MajnqdXaNPawHlK++ubwAj0OrLaykIYLvd
 XGDCYFzdqxdCX884ibgIFwWB/vtB9lLSN/QR18b6YJGLzTodGNIBnNa9O+32wUb4hUQ24IjgNdM
 0+bCab5nD/hh+kxpOReH7S9IRCD5lITpKNrJ7vELJcKz32D7qoAt31vVPowPpiA5X+L+LBCqoHG
 pJJ3jLLsqsfFwHXSSw9lbBn4Te+xKzpc5uqCFMxwK9Rp13RZiz8JdCvtYZUGupSIU0uqmgb5fE3
 OPV9H/xOzPjFUUrbyl7Nr17Q3JB2zOkw6nXzgD6uEwF2PmVYBX1089wQlRMwBPmKrcJCSK5ntRR
 D1mUzkUhlgLgGxr1IenakVBdacz5CJ6JvJH6hqIggT7Scz/yy8qQYunMPLIBcnhd2hvDa9ZftTD
 tzoMaOkDCVlYZC513CrlxFCRE3Sm+jsL8tQ8ULEkHupoyCMH2e0pH0x/lwb6aisTMie6DPdhCQn
 g==
X-Received: by 2002:a05:6820:4481:b0:716:db9f:682c with SMTP id
 006d021491bc7-716e7983243mr1964297eaf.69.1793992557444; 
 Fri, 06 Nov 2026 11:15:57 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:33 -0700
Message-ID: <20261106191536.2120153-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cython: bump to version 3.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index f4495dd076..5637514ca7 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  df8ac911bb3c6af48fb0158160e5b029  cython-3.3.0.tar.gz
-sha256  eed0d93fbca7087f143b42c34b05a825849bdf17f101572c2105acfa49aa88b8  cython-3.3.0.tar.gz
+md5  9e5b3106f42ced6d0d8b22e66e796bfe  cython-3.3.1.tar.gz
+sha256  e0e45989e821bef6aa9ae15c7d583ab5e055f7406c4b3624e49e06d24e90375a  cython-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 587949c17a..6ff967d1b1 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.3.0
+PYTHON_CYTHON_VERSION = 3.3.1
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/a9/d8/4981ef716ad0e3ff0d3ef383aefc6b03c4a88dee33b272bf8e0d833001ca
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/99/ca/18e324972e5cac914816fdd7bb03e19a455b90039c277a538f7781b50c85
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
