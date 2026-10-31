Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ofOFvvce;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vp4cu6BJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EE960806;
	Sat, 31 Oct 2026 17:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tA-Ljo4Md-W; Sat, 31 Oct 2026 17:21:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 627536080F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467264;
	b=bLpT8xcNnuZFKAgehQ1j5WIUa2jj1/ENYfib1NGhXhjYRCGvWQ9ZjQSn/LuOEVc9xkJs
	 oh7Bc3zwkOz1bRZEfPJuDt2J+NiFDy9CEsT00NOsO8hk/erPVxUf6qHVWmVLtZTqIzzB2
	 IPY8G301bc6UK4aiS5WhYRfgfmb8Vey5YAsSHbvTCCJT1vIlgOaJBqLRbEB/R3p5TLh27
	 fLAk+terqrN3gO11kyNkSBE4XORGIXou+0KYY3fM+Xyr9k8ZGZZvmri6jHBMmTRznvW3q
	 akiyTPbb7FotPlTp2XChhEA2Ytor7+8ag9nOjRBfHKx6wVD72qiKEkXWkZ5APws7nyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UrkjLJth8/lH0MxaQYvFHpQIGX428jV4rkTHGmhveNg=;
	b=dDY4Cncd2GPLT0KnXWQ4iSu9X69tmpHEWyyFkqlmAlCbkJ/GvpRZtd/so1ezZLwoyAdK
	 3nwCcmEn7iMN/zhrwfdymkpiBbT3zd+6rniEBotzKcnfulRMdtzWcWozWpvKJYwRFBYA2
	 YISqw1HBNXK/7tn7FyR51n6c5Py3W/sL57DVAXUppW0ezOgA7UYUoaOFMSccGHZLCBJGZ
	 MCxsVaJvz/AA3Ad9zElNE12ru+agu5BTq8pCpzAUHLzNoOv/wj6sNgUxYxgS/L5tyNNVX
	 AsbkygfGBd1DqmIoskuQoCOVfBrxBjg/7xSlllc4JxEqeK4sVxVxJelOVGUONxZ5jDA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467264;
	bh=UrkjLJth8/lH0MxaQYvFHpQIGX428jV4rkTHGmhveNg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ofOFvvceI4CI1menpRz76y4Gs0ZT91aWilXC5Jl0eYl/FIeHrUdY+9IAFkqEuDVjs
	 72mbVWaFuY34sU9GIqbU4dzGrVlgG7aLF8v4VPIqkzCMn3i+r1nKg4GvZgoIPvpKKB
	 YtRgMJj2n57j9Np5A+0SDbW4Xr2MR/sq3IGv2tyhlhZBikThi2jfBbUzkM5ZXL0Y88
	 l/zuMxoUOj7i8cY7ijw5ZEVzRZzxBHTxAnkDLHrRFF+xGQPduIyM33zzJD64hcr1qD
	 P1mgDPOyRgJSLkXEWLjqbpcVMDXF1CJfHpc/IiNeFdEfz2IcVO/huv5ewutSgOGyw2
	 0ECPUYZSskpwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 627536080F;
	Sat, 31 Oct 2026 17:21:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26E89411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 187FA4036E
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqkHmB6ERoY2 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 437C6401EC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467250;
 b=YPEIbkztf5WUsAmsGHyPaMiIcx+lMQDrZHeou+em6JCTBHXi/t1xfwbcmtkP9e2wpe6w
 TEh6sWkRHJR8IlQ7MPNKXtqv3Y/plKL0kkCvdv1WgBacPDf34at2WLdOX8bRK2ocK3Xk8
 bjPX9U+dulRnFtEpNTVXrRA7jUt5vvd/FHCMn0XR/vwXpMy8qRBMZVcdkBnMoLeL2f7PV
 WEmFE08+PrFxn3ycJP1MLM7xM8VqTLI2ZWBsALlO2BBVnZdnZMKsObCyba9VGY1LPLTLL
 c2cpA12jgSXKyeZvvva9QPUL8IMF9rHnOEjnwFFKeQRrHnrHqNstPX2qw4ddXhPeIeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467250;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/ZlvTfxArKSdtsJ5f/0qfhG5Q6iYb2LKp4PnuXUWyXo=;
 b=c6LQc02aNZicvdyHWQGapQK5r+M5DXMIgSiii3IkNYxdWtw8WS5uSBO2HVVuRXWUXENo
 M+zKix+6C+Wy7LaQ0t7rGh5blVqC6C6rlciDzQ5pvyYXrhmstsx61R6EDNaH2MwaYd3nG
 yS+prrKg/OIJXVw6ZEiRLGSuSCk+YCg9jnuDYp5Mlbw7D+5hsyrPH4zojW8m6r/UUYXZ2
 fKbfb/P7WUAKSmwxlUfRmE5CV4bUz4haA6UVobcfSg/Ip25wWCG5Tbc+uilzi9/HgE5IR
 VVH960cZDWJe3S7EChae3chaWM4CC6A87Wsw95QgtIufpUEi1wI2Wru4FOirLEVrrzQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Vp4cu6BJ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Vp4cu6BJ
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 437C6401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:50 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-825b40f8a26so777855a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467249; x=1794072049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/ZlvTfxArKSdtsJ5f/0qfhG5Q6iYb2LKp4PnuXUWyXo=;
 b=Vp4cu6BJH17SxF5W2+r7lSq4xy902UcIk6HpsEHZErcxYBe+zAot58LqUKKD9Wk4pM
 7hX+5sHxxPFoxCrAGjlCkhROtidq3jhOdYoWxV4vPbXTlsTq9X1a/eYd7okPtlo7CHIV
 qBzCDVFZCDv0WFimJwSYF9w+mWaTBOWQ8d+KZA+3ZJ9cgxHQtjsOB9nW/LcV/UhgoI7t
 e05vTcwH53pRMtC8O2RDN62WAguLinkBJUFCCtBvA5Us3K0fHTGb6VhSf3J5P//agfaf
 fkJZ8b0PgSQmQlCqqpYA+ea9+9m/85RCtRF/Mb1OwKzUA8Fh12jbyIQm1ZEmdLubNKiD
 JLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467249; x=1794072049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/ZlvTfxArKSdtsJ5f/0qfhG5Q6iYb2LKp4PnuXUWyXo=;
 b=K+vHJ8KwZvjJobDLnKyDScKtY/yYBx9sDhZi10NrfP3rEmMDKj1Rq1J6Q6OBXP6hEj
 AFI3V0pxdktQGJ2sd9QI3f1NiYwcTnknGbGeKlKfspSBBXe6kGgf3x0AoklFIHQf+33P
 4sBpHu337j5zK+qn/eHs7EFPlzVyzCKw8HQC+twERga4rB6pAomOfBpqT7LsyPXmVkD2
 Dm+CjVZqX+E8nNW7KMT+zkOL5s6UGKABZEosqWnhM4VOogkNbkggHWI8fobRL0/JiB1U
 h8BQPmrGIVaiMX85ZEllDtM0S+7KJAeEKtJ/py/kYlpgi/mt0zFdvpfT/lC/0UXvXUnD
 M2FQ==
X-Gm-Message-State: AFq9FYIjAfgMF3E/GhjVU+Bwb1q/iXeXF55AkRZa9fucillkM8qqekWF
 e1q7VAsheyXuKs5Or8rI/hG4gQlzaPPBfis93uUyaoNiO8/1pWrcutnMWGg2Ow==
X-Gm-Gg: AYBFou0DaFUQbzDBdJ3mMojJp1110P9IMQzysJS70xn1lulRMR/330ql/rKmcV7NE82
 X9kdBbNZgWFPwV4xL+8kbqVseoIdFzvc0+UVEAMuTTuWHqVdqTEjlwIAyja7ocH/l6Slw5EH2FP
 qQHbJxGL84OABOKwdtfAXYj921nZGWyVeMUk5PZMdtu0TUW6KTm9shMbVwKC1a3XPUiTL9EZ8Bp
 yo7LaaWuKSEdr4w1epAWnZ8C8AI3ykczszOgUCLCONWLC/1ow7l6vdulSjlcEmIu4jI6NVOzCw2
 JOFMtxdM4KkK+QMCauZ1lBDxB4nZrIpg1EHib56lnrbbU9mEH2/2ysykXsFAbTPP3X8Gv6Qkpa+
 sgrk75zLRQONW9yrXNH6FdFkb2MyMxiCCFi98zZE1ra3K7S2F0fRO/UEZaYLOp9CrYxY04E8qFw
 Qy1kx+hgX6AiPjDyr9qgsQClLxG9gACMGD0YFxtJIgWVKvx/fo/aaVppFf0CbtlNwYH7YBHlqaI
 St/oGwcMyVYh1pnwKHIENjTDp2UlWIo8uwXxUPjDPtKphpaJx5T3RWmXZyhdVxJs411IDNnSL23
 FfrwMIM+buEAv1j1/+iYmgsdGYp0ySxQj7kJMRXQbJg+COXoBehSeRMf1GsLi7PIojBpIVlmBmQ
 5wi95H4P57EwEXZ5bQDrP77AJofsg+ivnMb/JgoXrjbCC9rp+mNW9oJMs6SlfCPLbmbCSE1E6Vm
 Pc29OymrSjZrpDPj9Jht55q/V9fVbUwhbAeQJ4KKDeekvv6vQQZTjKigf9NiNw+ug+YtZi8uD9c
 w==
X-Received: by 2002:a05:6830:3e03:b0:85a:e0c5:dc60 with SMTP id
 46e09a7af769-85d365ac6f8mr4417253a34.16.1793467249132; 
 Sat, 31 Oct 2026 10:20:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:45 -0600
Message-ID: <20261031172019.2683287-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pydantic-settings: bump to
 version 2.16.2
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 4ed74fb707..2cec53fc8f 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  c31750bce5209a37412ce332e0b31975  pydantic_settings-2.16.1.tar.gz
-sha256  aff602a1886338c2df3d1e958e2193a8dc33cec75b91f202e83fd98484b4b0da  pydantic_settings-2.16.1.tar.gz
+md5  67010dabd98141ee3ed3173baf9e2bf8  pydantic_settings-2.16.2.tar.gz
+sha256  3dc08ffabed2bbd5dc2dd55ead7b78b4e4c5cd776aecd04310db5f1224caaf46  pydantic_settings-2.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 1d5766dffd..c35db1d675 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.2
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/05/ca/7817b4bf0c4b15c6a6ab8cdf4cb96c268335a8ca2f525de93b6ebe4c7d28
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/d0/31/21d21e0e38a8f5f7a7f0cde22820117b6d17d6bc36f348129527f915d7f4
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
