Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04032606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cAbwumFC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pwMPExGU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D415060A57;
	Fri, 23 Oct 2026 18:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIFg1Wh-YosJ; Fri, 23 Oct 2026 18:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA0F560608
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779548;
	b=CyGJ4kWCBu/GGm3hdr1qPbD7/YvsCPACa7NlUdzUJk/J7CiItv0lXNiADnkPimZQCsww
	 ueAqPUNi1AamkfNwYXmRkhK1f7dMKwbvX9HQQAbf0kWweFI7Ni/tpkakWg6KIekyE3k9/
	 2U43y9VIi3mKnyJClSwPuu5BJkOXBXQywOSYU1sWrbmFAGraCuTqppIZ5lu+SQe7cG7rw
	 T1GF9w+h7h8pIPhhjIQ+f5ziYorpVST/NpLNCfsBFs5O0SfhGqpl+lOxBVvLS6T1b6jQn
	 3q97N88p5ewTwpp7umJXd6SOvpOPhTeWOOnz5P5+j+B+dHCGU1KuLZ/vaCVQZS6v2fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779548;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pJx6IoT2wXgvTjGHqwcN72v+x8TIzqQPSlp6MgVGF0Q=;
	b=J/wjqx8p4jM78bdmwiiPf1+ji90RSY2juUiT5VEUlpVXfEL1eozefKra7w9vvb6bjQrX
	 yo7EY8LA3iowUtSpLTE/stNlveXQEQCG7wuCzYgEll7VS5uAvkchO7uBsG8fjXXwDJf+Y
	 juAao0eOeV/EWsczH72r8b8n2E5zY3uQKPOLTHJbetJD14oTaEZM36l3Mch3uSJlU5a1K
	 jm1WAp9e5zo6VGby2C/M+WTvjRVPZQFyIY/GKLcnI2cicPHyS9gTXvjyyEneHQNoqIFDD
	 6Qyx1aktWeVHHcyFFONHiOw1nWnfCQVt+RZ0RzM5ZJnuU1HqwqKmhHQ7tqnwer/VsgA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779548;
	bh=pJx6IoT2wXgvTjGHqwcN72v+x8TIzqQPSlp6MgVGF0Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cAbwumFCLvzlTaVFAgugqbkBjbRqBqwzlvS4NdEp50ph4jE9+Kvp0KiKHj5B0iupm
	 +gOK8gepU4mZSyO2aZLUn3wt5CAM9NwwoOeTKPJWFTuYbu7d1ic9Wmm0MB3S5RtBIW
	 34ZnowAseLyYUdX1PPEiXgti5bixiSJ8WBXsPVeQtRWEBvioJnBF8nnXoL8n+Nx+i4
	 1c9Ju6LoOkPAe5D1C7SIg6Oqdog9gQptcogX45ozCrwQJBCsj/Kfo3GgfcBPnrLiNN
	 EGHtXHAZBsMVif4My8nveyO2bOuUz67cnn3wv+DLeMiCeW0hfKPSIXgpr4Zzi5izm2
	 PIpPHFezZ/gEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA0F560608;
	Fri, 23 Oct 2026 18:19:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57FAD12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E48240059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm0GLAkqZHIQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5E6784007C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779537;
 b=Q461+wnPEj1I1RPEuCb2NE5F3o+6kDZlDqk6xVnqu/DM4I+PZCKNMx9s7Qfgujw4TENu
 R2NnMVUm9KsSxfKSRpBeGuGTWC9jQKVYS8IpXvtnDTHkHFJMyIUNP1k/fwn3yDblVF9lb
 GmM+jAEGjFX7u41G6Q2tfpp4DXV17I1zAJo5vNd3ZhZJl7yZfqxZayoeQeYObQU6cnkFD
 ZIpicTkYm7AIiUGtOfbpTgaAMWiH2kkBLfkIQD/vKEV1BYHTuq+v+x9RkYE4Ub+hvNtPG
 SA3mBXyC7ZymRKQqiDXFhDZZNvuKN2HdpWwBXTwpDv1N8qrypIh9UyoLSkfZpLxMcrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779537;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=70Mam7rF2F9lfqq17xZKNu8Db/4wUKdGTtPtq6ZdWn0=;
 b=fCMLnM1c0ehw8AUfGr+Ehvjb+3TBvf6Lj9dzdwx4H74qC+S8X+Iy3aYiPw5y4D0J8x7k
 oUN6mekaBrs/XdHCgZFjW2v+iCOozalsxK2aQ9lKnAc1TYVE3NHluDx1rSNB1JF7JugUn
 6oWT5ITE0bZcS2UjpCZ1fgIpGytej/RnOa4mOKdjpJpc2rz4SUBUmknCm/uET/3BGjAQt
 EkPQPP2x2HmsVzWThvt176sF7KTFEmggfBlVv4nVBVf93CBaKd81pSJGk4aALSOmzsnn3
 V+7ZFIg95vMSrwRqLHUphhlaXH4UOCwVRs06v8+6JGT7IgnU9HlObMP/YF/y3yN1UqA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pwMPExGU; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pwMPExGU
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E6784007C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:56 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-70b81484c32so643552eaf.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779536; x=1793384336; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=70Mam7rF2F9lfqq17xZKNu8Db/4wUKdGTtPtq6ZdWn0=;
 b=pwMPExGUsimSpBTa9POXUvi2uuTBWct7EqVfDh38qM32GltYUJKRUYh/SXYiD90pJh
 qT7MDAiscTDMg1YRLVOTLJA5v92SqY7KBYnDRuybhW8OXvpHRnEdFKsneJGG1rTBkGGd
 JaT3oANo9TCJv3lu5+Dzp4PL384UJXl6cVw8xWoLnlAES4ldndfmxSefiQGaqMcorcDL
 MbnNVVnQ4mTnhrAOwBbmzGSlHUcUuR9jK/ac49Y4F/Ha0gQ6dXYc0jgT/a6R5iQDvsom
 60E7ZiFxtQhErgkyJH3AJACK+Xewz/t3SjzwIYDoxXUAv2TWbkGUle7Ip4rPXq7Mdvwd
 S+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779536; x=1793384336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=70Mam7rF2F9lfqq17xZKNu8Db/4wUKdGTtPtq6ZdWn0=;
 b=bkin/ocX34jSflZLliqG179S66BM7XNdeZcUUI6cqvozySTet0W8smaEFB/qUy9CSz
 CvrKc1BZ/xiN7u+cw3/q+/KPcVa+1byZv1QZn79E/JQW0rIKKIt/wWrWJUWOY4+h8kJ1
 Yf4LGuc68myqqMFw7XdDnDJRM5IPcNh9c05w8oD6227iVs6mUQA/I8OCdaz1BfY52UPJ
 Z3zxrYUxTl/Ts3dwcMyxKuucOAa7E0aZBbFu7OpJlF2o657QWRUWtB5iZe9oc6iSZX6E
 ia0PHRkzcHuKAKX7AYDaS344MStA05Y2jJ2yK2/R1TtQi2gdBKStsCOf/ABigecAQaDy
 cEQA==
X-Gm-Message-State: AFq9FYJsAeod1LAuDlCPRNkG438CCMLaD83zf57m+NW4LN479Q/ZsM5e
 oYMUX41k4PFpD4PNNaRbkUGzOSSlzvdnAw/kCTItbbuNXFATbp87mFzAnjv243cK
X-Gm-Gg: AYBFou2olY/Ibbpeahm2GXJgvV5th5qdaNQRrh0W5JfYHIH1+2VdE9r7IrX8aQlNlNj
 4tMFU4e6MSxuBQxzIl8WIlhbjlgGLxuecFABf96CxpoX2wLpB2I5D5hQWWdUIWMf2at8p97MP3D
 X+a5frOo8xwC7ga8KcvBV3yMkMELrParKCrpd7oMLdlK52U01Dv12+ai1dTi3R/zGmk+Uexm40m
 Cdul8xgdfnlT/GAACLMaix6Nm7zYKXxDf9PfoiLvpTBfgUnCT5F7sRTX4bsJyORTa94/ijCWYIf
 S1xZdXG3s+3aAPWx4GbSkm3W/8z1w6itHFndR8DIGeOcZAAv+s2eG7BUfokPVYw7XjxeeeI26gD
 850cxthDEQAcThG3Rr77N7I9pNhGe7yRBVkuidMEtOdlvB5g+X7mnSRgy2GRPEz5aWK+IMhvXRG
 w1P7TAqiic0D6AuGE5wFJxo1xb7zOTwq8pIFRHsuHRuZ6tZvUE5LTBv4Kz4MweseUYFgAIHmK+N
 AXUMBs+w/NKN6STWLNl7Rdtn0rw+phEYYb4ukFoP7C0FNk8k3lQD+YTsDNUfctWy/0oPjRctT18
 P69xRSxv0wGgYmdxwiUvNdEkISluRQfhO1gCbie986yQfBqUJ9Wnx3cLkl+FDaNJ79LrNU0sKFg
 F7Y4W7oGJhHgNCJizADYCbH8UHhgJX9rcjAPjlpmmPtFbekPCRsR+p6p34jH6LVpSjrgSxURvC0
 o+XKeMkNfHYN4Rxb/59T22cLw=
X-Received: by 2002:a05:6820:198d:b0:70a:d839:2b39 with SMTP id
 006d021491bc7-70b8884dbd5mr2236118eaf.3.1792779535919; 
 Fri, 23 Oct 2026 11:18:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:40 -0600
Message-ID: <20261023181818.920329-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-snappy: bump to version 0.7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
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
 package/python-snappy/python-snappy.hash | 4 ++--
 package/python-snappy/python-snappy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index 2f40b6c531..d91c1eb89a 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5  04a4e58b0a932403bb285900e67c778d  python_snappy-0.7.2.tar.gz
-sha256  04bf182f9d9f67b7a846dae2f1df36180ceeee8d3380e4b6799deff5272c4978  python_snappy-0.7.2.tar.gz
+md5  78b6ad51849e18546f340ef0e1e49b33  python_snappy-0.7.3.tar.gz
+sha256  40216c1badfb2d38ac781ecb162a1d0ec40f8ee9747e610bcfefdfa79486cee3  python_snappy-0.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index 1b4b043f63..6e56609360 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.7.2
+PYTHON_SNAPPY_VERSION = 0.7.3
 PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/39/66/9185fbb6605ba92716d9f77fbb13c97eb671cd13c3ad56bd154016fbf08b
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
