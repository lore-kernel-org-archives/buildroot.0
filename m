Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=prbelOS+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=STxkgAEa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5515140889;
	Sat, 24 Oct 2026 18:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZrnItBgz8Si; Sat, 24 Oct 2026 18:29:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3AD9640913
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866577;
	b=ehKBUSJ9VVv17L81Fsdz8mKSQg4jSc/KW0aweiDqE4xSBlLcKfdWozpZyaEVbr8T4ELI
	 mYad3YSO1sqhbzepXVbwlX2J1Y4etlAju7UMzoX5cLCX1uhyUKDt5RAMtft2WctjHjPJ9
	 syI0DxvhFylixMnjj8TZOVNTPlgKk4q/T6zE/MhpriL+jPAMHZEn6pGdPAVOH47wtO8zF
	 c2JMKMqlHQXKCj+gxLl4WxDt5P4yQ2fzS1usFkiQ8IqGbLUDo9WIq/1mLCTJxQXGYPc1M
	 AeylnEoa0rkX4QMqLmx3ugrL/YkKiK3CJNXh3COq5nD+K+BSyHTrJHI8m2SMewSIZUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dSLjTaNPrzUX5sJcEv+hCn59hIuERKSj/rt5XSKFy8g=;
	b=W6G31ywJ686B1dEBg+GP7F4xlhvEXF5/FGwev2ehwCQt66jwtxVjJmo0HoGPFoJ8bxxs
	 JiAmSW6fHOjHo0TQtLBsiOY8uEKkyNs2Y5ZeesMCJ/WP/D/+ykkMX0Itz4UjXzPrsJTmv
	 qf3FNTeve+pvbNwk9eqNdoizPIWhawhz3xuiqUuLpjwNSAXyeXoTw9Ev1I4m/7CTbSwWn
	 lhPM2EHF7vwn4Ct9jugQfAbVrrcL79KdkKzDnpwmL17QZsRoRZ+oO0uehN+WlZW/KJ4/N
	 SV15IXj6aGxsdab2EizTz1HdmLL9pmcqmArKAseuQABk4WOZOXM1VDBfk4ilOfZIT0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866577;
	bh=dSLjTaNPrzUX5sJcEv+hCn59hIuERKSj/rt5XSKFy8g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=prbelOS+15f7YzVWr3OFh22RezyKzuZwEmVymMavJbncWslj+cwqyTcj2XX5dlBvB
	 N2hi3o8tSBxF8Zkp/bwiXlftewXwRaKvce8XCayHkrlc+8qow3DN59EFjEZzXFPj48
	 JVPvQB9QaOfnQnYpLmd8TlsSocr/HT8D5KuSdcnwGWDCU5h9F6+eJC6nTUh5z80eZW
	 ZNZZ2itO0FCWiH+sLEqG/UdysgjIVWOs0CXyYXZ3oOdNrSug8KfDp1tq7UtrUIOGCO
	 vHPSiU9Al7IK3H3eotVG/fpRHKTdS+a/YSjFZst0B0rWsYPLxEA6D+B4YhxBquVepP
	 4/Qj5jeyMv8VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD9640913;
	Sat, 24 Oct 2026 18:29:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E2C0380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D34380A54
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZmZHk6wYaPn for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 982658098C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866569;
 b=cgyGHI73O4uT5JXGdi7EarOtB3b5VtTXQfUajWvludREV9lIL/PkLMuwEf+/HdMi1IRw
 oe5k+UrQytjPY8SjXedfyGFGP6pbwZEGDrfvCQ+fE8/btttF2w6Cq42sbyf1IUzPBdeSB
 keSBAHDPDjo1/MKmX6OZ2aDoxG+2KL/hNUHBK+67716H9+loo5aL7p6CckVH12HFFbTEC
 AQtbiAU7Xt/n+ow+qZnRzimJBmQGGZQ+lQrYdx/ujxDlMX1+ftvKHpEGzKgIMULWSCCMZ
 h/clEmblcOUf6q40Ojm6oWgj0x1ozALBbN3CYcjqPpYvL1AKF5Lq9PbX68zQyrNk2KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866569;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Ykx+9JaS9eAKynE/mmJmuqTx5lrM17/TUe6yet/VTzA=;
 b=HHU8XAbQeBGBIQ1V2KkusMntMPoEj9kVOF7VI12L87r/L2nUCPTt2W5ALtv+xzzxNEPK
 hpADYsXIX2E5UfoaSTyQBDsKgoahsUbyPAaRrJ7IfPDVLNwLfQKl5hQKHaUbb1fEACkFF
 ac2mHzA5QkeR4rMGF9/NpRoL5wDr2CScodh5jECkgIN6YPi/1j9++JgSZpoWf/vK6Kyaj
 habBnZWbyCWQqqInokP/EoWVhQ4pNYJFWnDD80ijUWTOCLsuuFjgWFcJ40zvZi7+NZIin
 X1K1ggt5x0PErzY4sL1NGT0xXLKtbkh86BJfmXl9CfWFwCoGziI+BQ0TFxKZ4I4zXJQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=STxkgAEa; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=STxkgAEa
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 982658098C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:29 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6de1fd5f572so923457eaf.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866568; x=1793471368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ykx+9JaS9eAKynE/mmJmuqTx5lrM17/TUe6yet/VTzA=;
 b=STxkgAEaGbsKJXjcnbhwTiBH/aV43Hb1gVsVHK3MaBaFS4aGlyYhT+tTLysY3pWq9S
 Mr/dqv7ZnMTBknN36cWLMs75mXCg3Izj11GAOILf6JLD3mH0bE6DNeiE3sZnX1+EU5k4
 3xUklvG1jIKeEYlSzx12GRQiA0TwheNY+O+v25PMqpB2MliSPuCV4K/cbF1OMefwgU6k
 VGLPBj3hHkf7WcSz4H6c/vwo0QT0DbhbIOh+gK/APx/3SYNcDePjKt9HLz5jLKFVyD3M
 i4Q8rp1yxpVttmLSI+Whq1YhDE7NWD3VOB8c3dDVdue/kNwYtrji4wFSzyT+/cosDavb
 Sf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866568; x=1793471368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ykx+9JaS9eAKynE/mmJmuqTx5lrM17/TUe6yet/VTzA=;
 b=QBVn2v5GEOeMAibK+U+A30AJUnr1IArxOCHfFM4S/YDZefarLz5VRAXI8xfXqoStT2
 0ksZTov2Kou3AK+HuuxumWc5wCwRsQMwaTHtl5jWhUn9IqLpSdJsp+eXZgv0OBbJw6h0
 Yo/RAmfg27fuRHZZ3B3tHD1gwU9xSdeZ3jtUW3ahVKVedY/rzq/A5Tc/2I8kF1mnAKZ1
 xl8dtr8wPT8NLP2NarJ/gm75JYvRp8ypP2q1+SCquSZ5iergEP/GCoE9C+yfhMZHh30T
 31f+hU/DntBpjgv3BD1enKJm4qOiLEVPYSTWCZQqy/uaVswMH3pqgN5j9AVTQF86xuU6
 1+Rw==
X-Gm-Message-State: AFq9FYJ0NTO2xMSMmbR3Yp6fMBTSVlopeKZf7mTwmiBm5yBOeIO9oih+
 o1L5Rla20BIphaqvwuwwi0vGnok2G6WmXRFbi+czIbCsp6C1Un9vSLMoidc/LfN2
X-Gm-Gg: AYBFou31Wq6m9+7r2flxQ5bEw7yWpoEPP4/xf3dLv4I5Vfzd5+f4xM/wIt6PBHOeBCT
 jFXFc4ZpODQJ2FprUuNd6VDG9X8L8QB+9WKQp6NevxMlaE9BaV66fb6rp1lK6pVil4RpchrfTQ2
 1YUPhoXc5tnktt3ZywuhNC/vKtQp2zG5xKW5wME7ht6ZZgDiobqldQXYBEeBiANu1N7PcOTc74+
 TiMlJtlVMHK4dj2m1ir1AHmUSEQhcMviVQrHISekUM0gufDHhuKdjA7t8v92f7awyMgKV8bTaOm
 jqygn2wXEeN7TGvtoTBuJh531GGrUfhaj+ksvwMd148kpud3Yx2UiIC3a3bmFdFEgr9wsOP+s/F
 oDkBUMCY7kb5iHEhIBgs7ic9L7gEAePnjeq/Afy7qhy5YWemBNWtTRBINu8SPXD+P9y+5af3EPk
 RgTiinWroQMSo9rkGyBNpMZGD+P6Nv3hkPljcERDSLHZO2kgBUGbuOIg7fXcd2y8QnHsVeRRM1L
 aj7Ip6szJQcY+btlsPQ8fJFywM7qIXfcK8hvFwJBa37vkvmVld2a+PVtgQT2LLgsj8hVqZuCj0b
 S+g9uVmF2wDJxo56x1+3RHKlwea5p7Mg/218cUbTc+sl2W+Pzur+ZF3TIkzbOPJGyqOoLpqx0OK
 X2dX0nvM2APu+gIWy2kEgQun1DQdVbsk4jXlu8LH91tityKLPAjC5ue63VLnTG0hCIvo0K6yM0e
 s11DX9Cp8oWEc06GsYFdncgS/N
X-Received: by 2002:a05:6820:1c89:b0:706:5b0b:4e80 with SMTP id
 006d021491bc7-70ba0dc8661mr1265262eaf.14.1792866568140; 
 Sat, 24 Oct 2026 11:29:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:29:03 -0600
Message-ID: <20261024182913.1957467-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-wtforms: bump to version 3.3.1
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
 Grzegorz Blach <grzegorz@blach.pl>
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
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index a74c49c395..48be774f62 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  171d1dd8e3d63d752b1cd5e9f567a093  wtforms-3.3.0.tar.gz
-sha256  efbc626b0b68d3bcb77822e0eceb995f56c5e9d0aeb4220b9dc2fc9f03e7e1ed  wtforms-3.3.0.tar.gz
+md5  8251238be8923c56314d24d133546aba  wtforms-3.3.1.tar.gz
+sha256  9d10ccb5740290c9ae6673522d87bcae3b669cf0cb4e4584aee229b4694af10c  wtforms-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 75ea618491..93b37acd76 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.3.0
+PYTHON_WTFORMS_VERSION = 3.3.1
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/c4/42/db38b45b7d791f608d7f1afbb9176dfef4a0dec415eb435b07cd44eb96cf
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/ef/5b/588dc20774f4cebeac23908a87e493f2f6fb2a4c54756675cd59afb8cc72
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
