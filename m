Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E1606A325
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZCVnubrB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=FLrdIf8d
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 677F9605CB;
	Tue, 10 Nov 2026 14:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNsdTRdkHSnS; Tue, 10 Nov 2026 14:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 715926080C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794319719;
	b=UEe1iX1lYkkeXajhqtEPIz8H6JXKLfQTJ8AiZFdb1ziVQGFhQQUkp581+JtHWiKCrwwB
	 GLoIulQp1D9FPVdarJZIUpgIUlrc0F0MBIPO4H0EFtvksLU6ROiTbTNCvHiTCBxrqFG/1
	 xnqnWB6+zc21ubyQS6Yoh3cfWvcVKnqaog+vf09haNdrCLAlE0wzDgoWBJX4i3vI30IAT
	 onPLw/v6yhBEVI2Go+cvhXGf9PsQZYr0KcOS3qsMXkJvRWON8eHF8OhKsv4h7u02hKxlH
	 jrJAEIzWrT7GewlYjr3rErmodp3fFAJK6m6BVOJ4wuDKDB9V0mKO7Zpr9/mvVxxt93w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794319719;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4JxEl4lHo3rNSF64UL1Lx8ofxUFcsosEyEPwk+NHRz4=;
	b=Xpj6lh7uuLemUiVvUiSOrZEZlRjegT/ApzCpV5h2rFqZbqzgMxihv7a2uobvFpE3Suec
	 nUvN5NNG6ax3gJiCQ9QiRWPE3KFSiQlSRULYvg7c/vXILzWO93NvAxfuhAHsyrtKyDi8Y
	 +zUccLwMcHfc++AkpfQT3Jj5mz9M+uN2GMlpa9mPMHGZYg71pIWUmjiCdEn2x0y/yHL1a
	 eAZV5DW7nL7OkkjQSfpUpEIpqfMmE4+g1Jd8I518p4B5i9CCO3kHOs09290stHiF0IbUy
	 IYGwrDZB3p5gMSogwSHMxivvDpw67pNxe4mgOdZ3COIwlUbJEM8Gpy1h29PWZ6jtaIg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=FLrdIf8d;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794319719;
	bh=4JxEl4lHo3rNSF64UL1Lx8ofxUFcsosEyEPwk+NHRz4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZCVnubrBP/DdJE4uSLAGDe9K0gDfnJ8zUJiHI5ZD/WltxXONNtlxz1jUNKRFEaz4O
	 t/jsJ33HtPJtVpqry2l3iVV3elXbt2jf/SYoIzi5uH/hjzi7J6/bxHmPBKmQyO1/R3
	 ANzIPIeiq/BxM5hf8HaIMbAq44ZT4+r8RJfiBD3mOP6ci+0J/miwSi5lHQgNbZMVcO
	 oroEiFZv5rUFIQA5ayF3mxxu3Y8iaSkCxWugS00im4XpcfdGpJgG+79OEk9PpPoMCs
	 rh0oYcWzXBrLybDfVUl+ArmT30suG2Xqw03zlYWtcaOxwokOBMh6pDEW8TnKcDo2He
	 Eq1k7dMKyjpqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 715926080C;
	Tue, 10 Nov 2026 14:08:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C0861A6
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 14:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1B116080C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 14:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGjWDjFp5Zek for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 14:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CD314608DB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=FLrdIf8d
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD314608DB
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 14:08:36 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6b633ddfad6so2708767a12.3
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794319714; x=1794924514; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=glA0KneZCNzGbBo0GZR4GkPMQe9QQj+wpxsLXIncdeU=;
 b=FLrdIf8dVN4MSLG4jdmx2dFGPFFtWWFLMstckqbof/Ff68LiSbcYL7q8dfSL6XGryg
 qzEUxxJcQWcEJRwOI2R2LX0+oSzgCZ/iDNbeBKp6xjknP9j68o898tA0uAHhV86bKTEq
 IkpplJUxtoJebDcalo6K8ulStSPbs3VWYrcooi0nl5bUodiaZPKXFNZT+ZkqAKH78sZG
 X2tqiZasf3pV9JyxSalPcUOtCbJyfMUCadVa3xXSiBxMIOJSI26nae4W6dw/UGZau/j9
 KBpNd1wyv/ls0MyJhhnUOmUGdyGLyDvhW0OOqDbpRQq3a/BR9nSGzWOjpH3flXCuDPmu
 FK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794319714; x=1794924514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=glA0KneZCNzGbBo0GZR4GkPMQe9QQj+wpxsLXIncdeU=;
 b=p1mAirAdxTpTaz22UUtDKGAqgt+633PDPbXx35NL0DqkwDH5En/OVpVbMI4eysZ7jD
 OU4DvwbBKRpkVSwvOuIxTEgW+LyiTloap24DPBSmPCs1xa/mbnRhUXYDyETgOq24/CMh
 udiOnkgUdf11aIO1EFCMLqbNgI/B8szQn/7h70ThAp/ZOSUh0q+9jggIWSgxR4gsV+Sl
 9J/iCQAwLTPdN+nMxpZoDF/LRfXeOTeeCLfcnPxLYLmhzcPt4mg5E0RjSUpM8eoEIrhM
 6ycUjX78jviQm6z4FfU7qrH3IXK6HvKbfoSBK2ZSb0q3nL4DLT3+I/YnAHM8KYvZCh6c
 5p6Q==
X-Gm-Message-State: APuU4Z9BQt9vfjrDZxiVQCmf/8QPcSw8UdUdpuWCd1VfFIBdRGAyD5ls
 a+tSC08g2S4JkYzVtDsUPEFG9Ge8CUVKYdYYVhGXhOE7moDCFWo9altj7SvbMw==
X-Gm-Gg: AYBFou15tjsRUGPm9nx/ahEXkEqgCxHmDtLDWbEFn0d1ftLjvXRD1XQiNmCv50R8bYk
 tWdFskBA1CNiTmXnez9/WrPn5AjinpSJG0hmjyjB6M8j0UrhqGO5lxrLAHKSsBScDjP1GrwmbjP
 fSRJrnWanM+iNTR3SYiKCnihuOlNXTfdTj5/AjWO0jMaOZ2y1pWi2/pgQZOW1NTNYIxInQznTxR
 38G8fclrNU2AiUyzH3NM29Xn4mrb+10+PIEUMhy+6mjcdiDUQAGoVxfww3bQrpxBHHOFZRH5U+X
 FbY3WEPlxi1XJzTcsARX5e6cCRw8JYj1C1EAaYKpTbch1jTxK+K6yIUVFMHPcdNwnAhFtBjn+BL
 krfk5vMIGVWPUusmW6Fpl3Eei6rH9QOKXyGwon3ZNL0mo0jzG2aUmPVHR+McpjyINxpeIvnMJew
 j9LVouu4IBbsS6jDgtwdeI/eTluJ+qQNzZg4REeH23WyJKkGaNOcqgtAui4s8Epx6X9MBgYFHKV
 FaPDzPHxwxFEJgOO08PvTUM3Ur5Z8iViQRpU+OpG6MBL4KFuTiw/n//qSj64F3RzcWFKD2jMPLK
 UcTUvVvpL0HPlsrGleSgjczy4vD+tMfULpDBJUyXxv44WvlMN0hze/ZlMiD3QlcfPW/veaFVogb
 Z60duzlVe
X-Received: by 2002:aa7:d58e:0:b0:6b3:cc4e:7c50 with SMTP id
 4fb4d7f45d1cf-6b756ae8473mr1602816a12.32.1794319714106; 
 Tue, 10 Nov 2026 06:08:34 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b757823737sm1173351a12.3.2026.11.10.06.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 06:08:31 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Nov 2026 15:08:30 +0100
Message-Id: <20261110140830.3359501-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pru-software-support: download from git
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ash Charles <ashcharles@gmail.com>
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

git.ti.com no longer serves cgit snapshots. Downloading the tarball
now fails with HTTP 400 and the message:

  Unsupported snapshot format: pru-software-support-package-v6.0.1.tar.gz

All other archive formats fail the same way, and the tag page no longer
offers any download links. The package is currently only fetched thanks
to the copy on sources.buildroot.net.

Fetch the v6.0.1 tag from the git repository instead, which is still
available. The contents of the generated tarball are identical to the
previous snapshot tarball. Only its hash changes. The license file
is unchanged.

As this is a change on the TI server side, all maintained branches
(2025.02.x and later) use the same snapshot URL and are affected.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index c9af9fe25c..3fee6d84ae 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  cba9e0bca3abc0041cf7ce6a30af9de440b325cf8c9bcc826485d2f837cb4cf2  pru-software-support-package-v6.0.1.tar.gz
+sha256  a8a217fecffea91224be38fa64fb5eb0985ba0aa87b2869a27cd2780f1e370da  pru-software-support-v6.0.1-git4.tar.gz
 sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index d0259c5f80..de49ab0421 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 6.0.1
-PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
-PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
+PRU_SOFTWARE_SUPPORT_VERSION = v6.0.1
+PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/git/pru-software-support-package/pru-software-support-package.git
+PRU_SOFTWARE_SUPPORT_SITE_METHOD = git
 PRU_SOFTWARE_SUPPORT_LICENSE = BSD-3-Clause, Public Domain
 PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v6.1-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
