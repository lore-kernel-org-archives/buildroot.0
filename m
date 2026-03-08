Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E5F5513C
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 10:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C8C5817E4;
	Sun,  8 Mar 2026 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B42mnwuN8c0a; Sun,  8 Mar 2026 10:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE3A581865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772965969;
	bh=xTeQOl5v5a8HxSvzHSCDQmU+mqc3hxA27PDArTo3+m4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ztht8NXyWNeOAMFwPV0zcaykMdk/TeSquClKM7/ArBROOPcKrr1QmbUG1akPA28r8
	 16CCQorOJrIQBpyWHL28i6bbSVc1lp8SYLdFIe+CNZrubOcH06pHS1fWUfndyMFO2M
	 I0cnjDR1lf9IeIIhpv4L5gMlCYDYkETb8TXbxQxoz/NTtq+kMBmDdkWj/hjCSqKK9W
	 c/1fe9cw0BncxuZQRUQ4ReDJMtD7i+ObWkEl9WmLwmaIeeXRKuZjGuwgLlgtoCl0Rq
	 K6xmW5RTPzPYQ3bG9O6V91OhQ7FtxiLnR6H8TYyDywn1KiRp9rsE49dCZA0DG3HYmL
	 5kViAHKwD7sIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3A581865;
	Sun,  8 Mar 2026 10:32:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F5E7158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA19D61032
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf5It9HEiGZo for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 10:32:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 319E961030
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 319E961030
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 319E961030
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:32:48 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82990763921so3078312b3a.1
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772965967; x=1773570767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+VbCcVFbmtTuMOXC8wHepnW8W0ZKLWeCTJF7o7W9XIE=;
 b=DvF6TZ4qKmKsSxzFqLIRwg0Syz90Wb8FaqvYQrOwgoTxf/dj/k/IkFZxtBLY5XwQpf
 bW5TC2rOAV84B1QsmEQ7eVJeHzeLTYAcSTGVioPLq0QAu6auU4humBhDPz2Wd2zLRYmZ
 XXvsUqsBN6tIJisHAQIxCz62fg9TiXuXNhohjMf403hPSrX/DgMLe4PKiwniNMy2Il1w
 dKSDDttu9PYxhEws6H53P8AFy0AgIK3YnPqiq+c/aUHLFa9iJafa/WMBkAC2uWhyCTzU
 cduzZyQWVEDGDt5cbSHxAWDDWUaVkk/actr712+pNFPFwnUFS3aUZM13zBRDV0Rrw261
 8Prg==
X-Gm-Message-State: AOJu0Ywq66FFnuTdPlm+SqBdHgFT+h+m+6Q4bDRkTa+g6MnL8gpxcNr1
 lLcqzWcb04IA8V6wrvlk5i88Mz1Qkt2+JB8qo9m7vbtQu1+fMspPMlCmfMXmpQ==
X-Gm-Gg: ATEYQzyjIGd8rhq+eyQEZw3dV85szhg7k1Jhlls6PvrNwXAejq2jUgPhJUGPVpHlwMc
 x+ZoYD4owaxyOFSW5DMhlY6cv4iA4qCdeJHCopEGapiuYVWc4lp8ilIUuPX5dQm3mWpQaDOCCv3
 6h4xPz4kA18SXPJlme5MaSAE9H+T0yH32BY8tZroKqXxmkSBm8bh2j6lri10Myd860uUxmOCixD
 wWKFfMkhXcnV5SiaUKfgGrVrDEMcEqunvIrMJ0m9jXQJrrqK1eSCViZCvVUNBVFHJHZ6fiW+gVl
 8ojCgE+SN7+CZVhxyhisQkTjTZy6/odwuAyiEvETnlY5hSkQLUpmp38sLj5+VxOO5kfKg3Zlvza
 55ljJ1LcpBzHaPZgAEfKXoVBhZ56k74Y+7jMMd3TotywFMHMix5EQp2FnENXsm2Bgh5UL9ACah0
 GYdKtazP81iw4rYS1uHzLrPsfeYYhWXyxszbA=
X-Received: by 2002:a05:6a00:a215:b0:829:7d31:dd9a with SMTP id
 d2e1a72fcca58-829a30c1fc3mr6967011b3a.51.1772965967129; 
 Sun, 08 Mar 2026 03:32:47 -0700 (PDT)
Received: from fedora ([2409:40e5:116b:3332:bcdc:5bdf:dbca:b2ec])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a48a3b74sm8750504b3a.45.2026.03.08.03.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 03:32:46 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  8 Mar 2026 16:02:13 +0530
Message-ID: <20260308103213.1117775-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308103213.1117775-1-chakrabortyshubham66@gmail.com>
References: <20260308103213.1117775-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772965967; x=1773570767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VbCcVFbmtTuMOXC8wHepnW8W0ZKLWeCTJF7o7W9XIE=;
 b=mntTs/ily+tJxeUBgd+QlwmV0ic4X/stMbkJ5kT3YxRiimCmNyBdKQ/LrtshmpNM0u
 Zbtc+N1nc3c+PVGlee7qgk67D54SVZQE4mq1YYXKT2MYpM6JFCNxkLAPuj2cvhGp2czZ
 7TGw67r98wpxDCLz9zktWdiRVPpJjFG2e/rQZn9eWeqtVDlYkKHhlS8QJUVkGXAQgO1b
 sblxPdWcHtdtSBhE/VQLpnckhqHD8YBN0+/Vepq/uWMm+bjC0TmwOC9wvwykJFHEY3B/
 cEVW1lowbV2sSaryDORsSr4OXrj39VjfFtp8MKlbWeneZtFp7YMQO+HyoPGHTUoeFWSY
 fJfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mntTs/il
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself as maintainer of
 package/which
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 835be1f6a3..f3ae83e53c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3058,6 +3058,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:      Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:      package/which
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
