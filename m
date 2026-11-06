Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FsOkKOwx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcdgE8BK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290FF60A9C;
	Fri,  6 Nov 2026 21:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bT8Vvxge47R; Fri,  6 Nov 2026 21:49:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 50FCE608CA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794001771;
	b=o2nekV16pGWnq1wAmeTBRd3NwxfnH3mYU6Mi0G/N7gZEcW3DqxRW5/P2ekqyA1H2C4bF
	 e5R+WmpMglw9XlIK7gJAj9NG/Gef9hzVSkrFP7GXutodJmFTJCf2ITMZNWQCOPZx+v7nT
	 5zvtuiO/d2Wlkuq1LRBtb4AsQgxU2ht947yX3UXWoniDRLC8TV+Awe3jrfjdTjLfeq8Zk
	 7uHbjo64Fne5ZeCPtlDN9dSpGTA8DASdKFuCU3FzEFcbQw+XKOzR9e2aPn1zPFT/e1cBc
	 jK0F7bAcflCadA4iCXHjWttk7IlJfpNc4BIqmo2M2pbLcu+jwXc+NI58RpUYOeKgUQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794001771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DgZrgDAwJn0yYhd2saGxbvNZ/rLTCz31DueCYxKImpI=;
	b=HGVlf0YIdA7rg698z5FkdSdhkzyfEaRnLiIF/UKuf9WAMPC6K0+naHejp7fGMH69W2pO
	 FlUddOMbrkjaundb9SJf2mVG0s5nAqiYM2QfqfIzza7im2jWQ8DkQz7UOcwXrMKYvRDYo
	 aX2wi8aX5YDOTqSy+zav5L7reWZuo8LB5ykZWKaHN5ciDUPdeHyB8S1zx7ZBYzoQHn0eq
	 ypRJOMb7XLKwBza66/S0fwQZXhjXSsAb+TcvenNO5hWrmLE1zHpN55M9FK8AjlOh2L0ra
	 m4dIa6hJQiZzUnFjuhC9v+8TJsWdd0DmnQWv5m2TEVD4zF+tfFLm3xOlixFt2Z0OP1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794001771;
	bh=DgZrgDAwJn0yYhd2saGxbvNZ/rLTCz31DueCYxKImpI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FsOkKOwx6Rww2jQHRwspYiZsPkLdXJrchzSDHZh0sl+dq7SscQjMKX8FlFwgH0F/6
	 Pgqubyn5Lpi52WXE8BPVr3dlxsHugniUVU4jU1+Gye5ZYshv2v5nBclnk/+LNqjGKF
	 CrJTA2p7JDRxjM2OzpG3pBF/NKC3FL90G4KL34ABmca6XiS5OMdEKBSQnnNoE2hUOw
	 VpvI+2+vQhJB4PqUtFJTgXNwzvsKV7vGMO1cYfan7OEbguzQ9xRb0yzSzucuJjPGUu
	 Sg/l0Nn1qWECDa8ZMu2P/9bNSVXcopLUcqpZn8S4OciXZVcnevMrFMzw29/HBrGWep
	 xdKXh5UF6ukZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50FCE608CA;
	Fri,  6 Nov 2026 21:49:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6756331F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BE2F812CA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKKHw6Va_0rV for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:49:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 654B3812C6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=GcdgE8BK
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 654B3812C6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:49:27 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7f84a55cc06so771059a34.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794001767; x=1794606567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PLrmn6lvoSBgvtHlKgMWw3ypv+Mtc3Jk/dAhFQ8lTdE=;
 b=GcdgE8BKxz2fNOwPizskVBra/seL/pjIhj/rq0EDBfhuih/hx7JSacqiB/8PoXiYlW
 vWRIke6kNsaqXPT4kTdU0zC7o4uNq/eT0ovE6+2BLYpc29bUKhMY+tIIK1g1P745qOpy
 uUkIslY0MnN1EpieFv+pHKR2laVdRibEjF+BYVTVrBrPVInPUmxlfZuyjfUZieh+CdVT
 BuO8A9F2Ac5hxp9xbFcqidGkDqOSI1CgFdtUo/KlcyzzofdPdzKCPhamP/ynW1tZ/Emx
 OK86P6vJ7c3p4QzH5QVuanG8oQdFa62l4mM30Y2AZYOFdwdkQDR2ES5ryb+B3VwPwGuP
 gafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794001767; x=1794606567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PLrmn6lvoSBgvtHlKgMWw3ypv+Mtc3Jk/dAhFQ8lTdE=;
 b=cNOa9aTI+Cvo/cyMSn/oGlNHZstAopHdAmriGGGFDTvXROB8vU0w92F6rFwaEdA7sJ
 ohASLJXa0I5mSZQgVWyVfp85duDloiRaA4MviQc7fGez5vWAGl7wCvGG4lYovZiHaUwO
 wqCQipL4nqL9JRXjrM29wPwK8P8t9LJ/GSvhxtg+a5QQO4tcARMMQKdcCEEpTGlDRK22
 HW/wCYm7MfwOTOCtDJDP51BYR8s6Hs/2UkyKjfA6vFqGCbUq2lPILlOMZ7MAcCxljNy0
 7alz3T0yXJto9Lr+aDtDIfYd4i5Ad6VEVE+YOHN8YKQnR0hmlqSfg4nbRNi7ej6ONgoO
 2qjg==
X-Gm-Message-State: APuU4Z9MfD37DQo2ESIYeIiVRvRL9gVcM8CT2++oWj4W5753lpO0pwBn
 BBlmK2T/X+XRlF4t5f+IlBEWeOxHHi2AcPywmGqIYbmsxvWsRChQGtrAe1wu3A==
X-Gm-Gg: AYBFou3oep6D47ioink7qqG8dUYUaSxcJ9BWTU54kLWQOZRTu12tE5qOXtTuaI6gWbD
 5WIkJzxMsI9+y7vt1ydLrMmL9RRC0r8vR02GMxyHmU+tAl5+EXgDNdrYeAc5ip45v26pDVNJiDV
 yIlRNuq6s6UljREKs1yhXHECbU05bl6fPpin+yTIeUlsIRDlPVLb2qqaW6RDjiYfeKwhP87zRUW
 SxDlPLSbAo24Ue4fOXOWpQgStMIrwf6rTnzSKtFnd2eDluJSplGeXOVtXZPfmK+YvlnNXiHY0pc
 EvC1UIFssEmweGm7mwQcwBGMq0Uiy3menzTseMxITa06YFzjwSi7tsfV64zjSLKYEDnQxwlDWjO
 jnTBNhpNw8mXx1QmIsRl4BfMNAXi7H6Ta2S93PyhkZgUVsr61lrC6i35So2UyoiCaVry/0rsRN2
 3L3rmkLHgTXk1auVArHNkL8LaPNR2VuaGro2eGmxhpDFq1/OS6dFpLzmMz3a2YNRuaqOoevhAmo
 S5vNCHBmavz8F8DIk910ETnd5LE/XMzn1mlDbLKblF47erJwnSxfR87Fq15f/+U3np4ykQCcTco
 u99x92AfKb3LBeqd6YMeaQ/q3MQ8ZROdsXAval3xWFZqaxcB2GK7E/+XpEaNquB9cQOoNSd2aQJ
 lZcyESEnjNzleQY7UKUyF8Wb/fFaM7F1J9XDH2OAXHG7dX/TIM8r+a43IB5jceitvJMuuYok3xx
 42vD9YHcqw5/589ovcuXES/rKHT6mC5VGu55EPq+RVr1CCrZUe9o+fNtu6LKX3SneYK7q0nR5xx
 Q==
X-Received: by 2002:a05:6830:6809:b0:84e:4a6e:5ce6 with SMTP id
 46e09a7af769-85f1d033295mr3993978a34.17.1794001762137; 
 Fri, 06 Nov 2026 13:49:22 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1dd1d7d9sm2897951a34.17.2026.11.06.13.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:49:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:49:13 -0700
Message-ID: <20261106214913.2687317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2026.11.7
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
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 6c762af95a..15b6be7949 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  118d130c65d0c98c7dc183433362ce75  regex-2026.9.29.tar.gz
-sha256  8b5fcc4771732191b2b7d1dd68d8f0353f47f8d90b6150f6dce58bf1112442cb  regex-2026.9.29.tar.gz
+md5  808b0decf8105ed89a5863dd3fbcb966  regex-2026.11.7.tar.gz
+sha256  8eedab0d8ac69b0602628bc59ab559d09007ff3bcd92aa740e62b10315403007  regex-2026.11.7.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 713f81a306..d82fb551c8 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.9.29
+PYTHON_REGEX_VERSION = 2026.11.7
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/fc/f2/af1da9d3ceed77bfcdce40427d49ba0be94e4fe84245e3bfef68c10e75b6
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/f1/54/e3bf7a314a5e5d0bab5455cfcfc7634ca136fc8b249a7c15c829e88b00f2
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
