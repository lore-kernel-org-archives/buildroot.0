Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C34606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lcYFHbVs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkTZTDMn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA61B8111A;
	Thu, 26 Nov 2026 11:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaZWHGQhcvJw; Thu, 26 Nov 2026 11:41:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0721B8108C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795693303;
	b=tU4z4gkp4pfiM17yGFlDUIncVmrpfJBArMg8nu2hDXm0cLjZx4Dcld6tsyiBLv9c4GbL
	 HLFyVrzQsnNuQIf2Psbyw3ANwlIYIJG0V30YnyppGStFMI+WG9ToQCTaN6Eu9BDU8c7uQ
	 mI8PAdJsiLybqNeDp1LK7xY5n/rAAzkx9Ep7vv6Z1pFiEaPDJ95cqXzK1KatsJ+N52H+p
	 gnbqle8UfUuWECqZ5i75ny7YcsuzSQJgIuLwSbDQCQB+8VNNANRC6BDG6CnZduc340gMS
	 2/V44okeqZWCsCH1z4VlG1wUtzuUFxzYVs2AOfcJEhzoBcZtwaV9t2lebq0AtPBPcuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795693303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yQ/P+Qly20CmoChiwZae5L3gqg6eSiXz+y3/wLnvcFg=;
	b=K1R2WLW3uGnOBN/rBjaMZOFZ+iizlSgQtPXorVZREeKVV7grYpJo5/XoRPfcRLw+twPq
	 B+4p632OmhrhpMnecoo7ZnxiikzXn7k4rR7R0LPRPkXYr2rxvf0+YzQK/qaestOa0/NzN
	 SJD3H7+tEqlGR9NLe7vrWAu6m9A/IYiJCw++pBqQBbk6ucoKKkvulWXjI5m25OrIjXRDr
	 MIKB2JqDQUvKRe5ohlRcCnkOsZLNfcJ5k2czWo1TNK9YfkKz+VZD5MZA3/wHxiyCKJBai
	 NyPgp2O0PlcXemeJ48F4D5Q+ZptAdT3lpEkfp1qgdVtXpjr6A2Fi/FW9Duf0FUF3iVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795693303;
	bh=yQ/P+Qly20CmoChiwZae5L3gqg6eSiXz+y3/wLnvcFg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lcYFHbVsJw0xvFdZ1K8iomDue4oeHnj6mzSXu5uNQpumhFdfMY4lotpbCfgx6O6YI
	 i3msNBxElRbJ1L1ZmmOkok5wi7NaXbPyeJ3UE+DoacWDzp+ziTU8tnHHUeR6ViqyI0
	 8BYefjWdQ+pNYKDLT9mJgLewyZXE6NHJ0Nk1KxhpbaojIHP2p8qFTCLYQTaQxOz6Nj
	 75jd/qnfbEDyksBuen++nxe0pme/VIYiZT/so7n2RIhAv8qMrqOcW5HYDJe6atlQpK
	 dMgaxoF5VRuJaF/NNcPl52u5qNK5291JLWaWdKIsv/IrFjxu2AgUtPlyRpgXTrFdhX
	 VeiXEZccfpmkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0721B8108C;
	Thu, 26 Nov 2026 11:41:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 658A843
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5764F4028D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u341F5xCt-Nk for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 11:41:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 776DF401CD
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132b; helo=mail-dy1-x132b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=YkTZTDMn
Received: from mail-dy1-x132b.google.com (mail-dy1-x132b.google.com
 [IPv6:2607:f8b0:4864:20::132b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 776DF401CD
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:41:41 +0000 (UTC)
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-3863db981d4so9741878eec.0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 03:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795693300; x=1796298100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bKbAVfz1h7LJsY6l2rbkZ9yqzyNGmFD7Oh4jlk1bC14=;
 b=YkTZTDMnOQJV3+gXk4ba4ynZXzUo7pCQ3HbCFkQmEMTZcMCbXzJLgygCm/iB+Z7pib
 wTbFlsLLTCF0WMgmL8n31GmfWofOwXSwKi5ANYM0UCVNiod+w5TDYAf/Yc+cxjs0yzJ1
 ATlpLCc6As5yjRAOd0Qoe62TYZKTnenHV151AbyQuurS3DWb8Bcu6rFtpDFgGPm6ZHUQ
 UgCQg7Q0Nlf7yEk5kcgNpnZU6AEdkl97tT2Ex0bu7RxdOHo6mDpIS8lkJIuXAl/V/+5Q
 M0HJCZ+4yhOrA4hRXRw2hOgGvDWDg+ShUcWqT9yOJ0FwRNRBN+5YKYSu8WkzaFfl7wLi
 90gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795693300; x=1796298100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bKbAVfz1h7LJsY6l2rbkZ9yqzyNGmFD7Oh4jlk1bC14=;
 b=0K9RhAN9FAQ73vEm8j3J2G0Cdm/w2dNZz6QQ9Tz65OfKJDbio6W+9mQWflV2w/D8Gm
 KqY9PTR38MN09sA/tmF2IjgGI7Am6bSBsRd/fxvsQp5uT3fAJfNwupsDJec7MtpuWNS+
 upn2rgCyDwJsFoebz1pNODNyr4XjVG9SLVc0Au3ZjGCzcZGsgsq2Ej1EKLWp7CdFFffd
 gy8f50UaPFjv5LqO3UJrvrhLcl1BvhWGi7r3crwIfQwTXNal4RgrfIxQ8/te4/LALj4A
 vCi7Zg9OYEvvXebaoUUd+DU979+cPdttTQLUfpKDzOn1rn77crFxgbsENK/SWVkzm7sK
 tFVw==
X-Gm-Message-State: APuU4Z+FLJuKuT8et6uFxN79iFMCCXzkYMdfWaeXGxPOyOI3W9rLpoMo
 lp2QDOBW6lewXVepTA5yr+BtDX0Ah0/aICpZj8fuTKEslb/zfe0ifN8Gp4Jm8g==
X-Gm-Gg: AZFdTZfXtVMmkuVM2p45hHIDtFbq6y1YHe2xWCHl9jnL+i+BlXD7agIISnOSJKfGYdM
 OL3ogfAHz5fQbNAfCWlNGTM2zLK+8JCQI8lBUEb96YtAOONq0DaMGzK0IL9Ao1Ezuz0pftnMW2p
 d0+ZAjzJZAtYBFL9MW3g0t1JBrrlyI/b8fqLcHBnxNlLLLHb9YVmRUI89Uxo1n295ICo9ST7vP4
 IhCb22FP9ChvPYVm2x2kjOjf2s0lMuYPE5ffpiV04QprK8BarxYCo5v8Pn/qZ4blOV3DAEUgTNd
 u/jIXd7uMFvVHV5KX9VahLJ9UKjh3tNGV4k5cCDHd7A1PoZIYP593WxxZhMyB1600ARPCAT9AiJ
 k8E40tnbW5Lsxg5A3DS6ME5owDFGN8RyvcXiWGz0iHMPWoolLlZPJeDXWsDC950+aZRQGU4iANk
 Kc+H1S3PLUfVnt/GeZtDeNv9P2xbht0TjK/1hZzFpBynvUI4MtFR9A1mOsfUIQgZdu+SCUXf+wE
 YJcAtzgQS1MnKXhffhQrRuedUDJ+ZWCnln1PHJEfMBR5KTSoYCFYGGiqZaFlmebe/5IR26shSL1
 5jJGZZRyK6RAhZeiLk1SdgMbAu3gpCckvNUbsWX6ydxJKQ16L2wFEX+xpdpBUpBL
X-Received: by 2002:a05:7300:1c1b:b0:386:9d31:2d18 with SMTP id
 5a478bee46e88-3869d313208mr15548371eec.0.1795693300340; 
 Thu, 26 Nov 2026 03:41:40 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e4:2045:e80e:4a6e:5538:6cfb:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385666e99fdsm76497752eec.5.2026.11.26.03.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 03:41:39 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Nov 2026 17:11:09 +0530
Message-ID: <20261126114110.667721-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bash-completion: bump to version 2.18.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/scop/bash-completion/blob/2.18.0/CHANGELOG.md

Tested using:
 utils/test-pkg -c /tmp/bash-completion.config -p bash-completion
 (Result: 6 builds, 1 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/bash-completion/bash-completion.hash | 2 +-
 package/bash-completion/bash-completion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
index 294ab65a2b..11ba4558b2 100644
--- a/package/bash-completion/bash-completion.hash
+++ b/package/bash-completion/bash-completion.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58  bash-completion-2.17.0.tar.xz
+sha256  88bcf85124f77f74f2f2f8bcd16ac4382d807a827ede742a64940c7116aea33f  bash-completion-2.18.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index fd046de8ae..bf6166a9b0 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_COMPLETION_VERSION = 2.17.0
+BASH_COMPLETION_VERSION = 2.18.0
 BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
 BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
