Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53B606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fNfHbXES;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LPowqrjS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8647560741;
	Mon, 19 Oct 2026 17:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 391ZlAVe90Xe; Mon, 19 Oct 2026 17:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 88E42606C5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430347;
	b=GM7Nt1STMuC8txpgQ+QW5UutjgKx/hhAabJzoNFlmhplVq0H6ZqFApr8/M82uMfDav7R
	 8kle/yvoK9A0uWfcsv2BKhk4sByqypj0iIXxFa2rmENg55grSs94nokF9+srrhvipRBNc
	 doZEBQqhazP+i7mgFs41i6oIRG70pFZufcRvlIYgh4ebypOwtoM9JWpYR0xV2++Z+BlvB
	 2wfMwtfIKuWmmzPjmz5XrHadnWhtr3wWD9MWRDKCcmYDmOYZDPXykvp0pm247ZEU6WxYN
	 C1lv03iKevyDcIOji9cRvWVjbKyNaVTtIXqNcXnp6npCpgR+p6J56gYS5qJDIK6yndQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430347;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pjt/h5cPSUnT7lx4HoNljqElcZUVAAjYQ8K6SnvZsUU=;
	b=U9dCIjWBG0Ax7Rf4ox7OJZ9l69KDmHD2T2/p7bvcOqz9LyOVVvqIInfSW/TqB4FnQMU1
	 onvoSefDpbQ461Gs98pDydLTsH6tW8l27I+9J8B5CHGp6Vveif9E7PRQP/onuKsgVMr6e
	 ZIRRKmYzgg3cL/cYN0i0IN7iVlppFA01dBFofG6ngSQRnkdR3e6yOqXCzXPXwoFIptFu+
	 fTeDudhkqwBx2FzKiCNMU2SFvOsPUnNr0F1PcsYGElwxpoWnxdik8p+milMrfdkCBM+83
	 Xc0NlxThGEBUlNg97yJwn8/ngFVN3nkATU7FNeDSCKKwYBC0j0XnoDkgCv2Q9e5j/Yw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LPowqrjS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430347;
	bh=pjt/h5cPSUnT7lx4HoNljqElcZUVAAjYQ8K6SnvZsUU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fNfHbXESOc5SB9wDAzo2kY+GXiysh0EWaDBWJAT4EwKPmgMN+eWgVe8RSMlajb90e
	 hSbkTfl9h/hVrF5cib7FcGj4n/uPEUhLGJW0UIu5JaPf3+5gzhqnifgSoTqIcX1Vce
	 A8nCgfrvF5t2XYGgNnZOJkEUDY8sdOkbZV0Nw83xM/b+pEy3J/GpW6m6AzFBhHRotV
	 QvdsuIchEq9cQPMSbbXPJriF2WUX0XJto+bOI9BZTVb3cskM2C66XDxJM/M0YokOjG
	 sZmT1Nv8wTJ6hsIuRqyRWQlzB2crn71i02c9NpZy/VFowa0rvTPViyH/y0Uz9RscMp
	 JFEi9kPw9ugow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E42606C5;
	Mon, 19 Oct 2026 17:19:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE9F91AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4803606C5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvzzntioIvBI for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C2A1D606E1
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430344;
 b=NXBwucWcWxJ7RwRzdmDnt+7reAYzUH9kS20R+h46qsuIE87+FSoDbaVbByh0mUraWFka
 BC5oUwAXkD9T797aikCvX7xK3pVQhauJBd78pxjIgqnpMMMzjkBfisSzLV05nijxXiVEa
 XEPa4IlGBPx9xvbgI54AWaHz/FVP1kADGgfWFWVU2Zt2thxdYsP0qvahWqd1bTxdSGSuo
 fYTZ/ESbITbFvxSXh0qHCScYF0sfbzEIhZo7E10rXfW1W3dLFNiBUTQ9zNz593Qdokop/
 OxLTLHw2IX3ptS+xGNZxCIj21Y3gvWhrz4R+NnfoOmWw+eHs5Zkd29VUHnud7KO2IyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430344;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=hLNf/9c9RyMufH7LwMHtIuHwo3bJrFXHEC7O4huSvkg=;
 b=kF+6bU0pe2AMGRgJtFt0BZc44l9ZFb7YJncu08Xh8HsYhlZRX1lM66gpXqeFmmfC6X28
 GYhWeKxh04Z6cvV5MGRPCVTD9meEI6isoGO5qnNxmBgfgUUZiAO1xPK2dM1aOXWeu+lna
 Q4wswbJr9L35V/ZE2ayvGpPw2dTveU5U1YkmzT0GNMqnhyKwGDW96WPbMv2Wgw6ALlmPg
 ytt0+WibfPW7nwoqgkIQ7qXl5HUEuEWuLr0VxuW6x0QT2AVBcO/YcsX8bzdyA2SgX7LDG
 /FpLnAIZLXo9Bklh04qhJ/FQ2C6q6Ytf8HRWtnsBaTtTeC21+u5ZIBP3K49TZ9xQcsA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LPowqrjS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LPowqrjS
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2A1D606E1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:03 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-51f2e9e6987so2068417b6e.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792430342; x=1793035142; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hLNf/9c9RyMufH7LwMHtIuHwo3bJrFXHEC7O4huSvkg=;
 b=LPowqrjSeq1rbFKmk6frdpDVxU4JK7+PaTaYI6LF/SU2Lyul6CpICVD06ExFUspU0B
 mH7MxiOGMRi9GTFAT+BBX9nH1heWInUgAdaop2NXHD1A1hb5mBgkQ1/y34l8EwG2aZ6u
 m7yZFvNSc0Au4V+XLQ98CkT0bWcvZLKiTmKObL7GE9ZR1uJR3mDKevD3qHDmV0UcuJ+D
 ltwffFT7a080RXjuxwjfv7eu+ag1ihvH2t0NpTY2DRTk3Z8aeZkrkbqBOtQz51BJF/nh
 nUZDyCedPXXIKxsJs/xvuE9sNVPKm1FUlZs/f5XtGZW8Oio5tkrfBxGGyGWCcepmubd5
 KIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430342; x=1793035142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hLNf/9c9RyMufH7LwMHtIuHwo3bJrFXHEC7O4huSvkg=;
 b=KXUMh/NufD5ku2WXNRPWJCJb2NQqGdl7BhUJvcXo6EQKjMS9itM9rFZuacwkLZBt4c
 k4yvMN1oLuGDr9yXglXRkE10rNgQueAKthxn8dgLG/Awevz2r6rD/devliNlvMVdelYg
 mBMR92nKYDeo4AOYRWRFEE05Neid6PoVwm3w7crothOlcCylxIfZyfmJfpZF+iTiqhor
 NwizO3Mryd4gkMnrS4VuokMeJfezWDZomMAULoakyFosp8wGzwgwogYjlW52vjOMUe9o
 O2RGWtvBv+dQzANqAXZ2MNaiR/T/2fXlkihlNVof/ffD3bhx5wNW8ANSA2P79LuUT1Qk
 8MYg==
X-Gm-Message-State: AFq9FYJbnRL6XGb9TiTqoOIkpnm8v/8MWuk7uyFUKB/TsQNCo80WkEm4
 Jj/8OoDj/PCarmtHoXHJBZ95bTA6HG6s9WMb5pLNYDfaPq6ZEVlkpoxbjobBcQ==
X-Gm-Gg: AYBFou33YLCDJt3XHbo59JJOzM3EXkYIcsHMjBphYcZSGtVz+pm1K64UizGNYqxd97V
 KXl53+IfppkCSwf+T2x5mL0uNz12PqCCwO7RMvZW7b/+Nc9F65NHomp/ISWZ/qv7IMS7KhsHR5S
 QYii/zlABPegZEUNSQUgqqt3+RanpA/PuZzFQ+SJiji9WBsOWCMuLx2Irz81qLcnTRffOU6YsaA
 O4osl8yeXzJCQs/AaeDoCmxUmetbOqJwniFM0mZQRFwerBZE+7GbxUe6carzcO6oBXvMKWa0VHR
 CX/0Ux58iNQS+2eRpJymKQNtHZGaiOrL9Qe1zikP+X/8+CXl1euZbnamvAzgxiL1l4hanz7Ao3y
 mTcIgDL/D6OQOp5TA1fLBwV5CVZz7vw/oqqAncMpklSYqyMPD4/TngcSMUvYW7ICEAeWrTPfRsU
 R8xGQsKnxzN5unpWFQmAs92f0uY/ZZpxGV5x6i3EQrSVB6oHaDU9V3LUspatHyK0pPqTM3I2Jn+
 8NcbPYzufD3Eo5A3HSRRAefU0c4ZXvo5QGkkDIjPdaa22MkB/CqwzFhLbK1ZCZkx2CpOVybwfge
 bXePi5w2LmzKNOE+2EDI/OTP9RPRRmwVnCsSJTV6FVla8njeLLDOr/WvJwMw6u5G0tzyyM9lyeE
 IaOb/FgeaoxEBXkubzrmho2mepNC3m+8zC3AP/BgeuQ==
X-Received: by 2002:a05:6808:3a0c:b0:4f1:a3ac:a637 with SMTP id
 5614622812f47-53cd4e5b0admr6040928b6e.27.1792430342277; 
 Mon, 19 Oct 2026 10:19:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5397b4ac6c6sm7335142b6e.14.2026.10.19.10.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 10:19:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 11:18:44 -0600
Message-ID: <20261019171854.734871-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-filelock: bump to version 4.2.4
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,
	SPF_HELO_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 63921db286..00df59252a 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  151e8b4a847a4098be9b1827c58de4be  filelock-4.2.2.tar.gz
-sha256  b29ff2ae9140bb17b3bc77c648dc4f010d9ac0955eccabff4f2b01dde859f787  filelock-4.2.2.tar.gz
+md5  1aa877c1879a998b938452a55215b5f8  filelock-4.2.4.tar.gz
+sha256  c6d8663535e1650ee430507b4ffbac7b464dd64b7647ea0112a9f406499d163d  filelock-4.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 8a7b59d93c..b95201a391 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.2
+PYTHON_FILELOCK_VERSION = 4.2.4
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d4/08/d8f81287742010e38daf3632380c8d80ede7b4df2716f8ca3d0a2b087d44
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d8/28/3893324bcadf8f89b1616637468d766af3f625008c0735bf704fdfa86617
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
