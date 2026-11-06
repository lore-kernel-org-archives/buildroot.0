Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1BE606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=J5TjqIis;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkpHNNfY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D81FE608FB;
	Fri,  6 Nov 2026 19:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZcYIyuhBJJD; Fri,  6 Nov 2026 19:16:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E8F65608A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992584;
	b=LlMNwifLsq6Cmefob7p7wyIhc3AS0C+byBf3l8VKtWxvZDE6YTY95/p/qskQprlbVvQi
	 S6+JMdDnD4Esf60rKOtt1iimk9s0V1VPP3KHHN13roASvWifS8pcCN/HFSHO1ylrpoKP9
	 FuHy1+jP8EY8YYKlq3S0XLBEhLikabT9S2qVra6SxFCrt9qNwpjtJLRnziJEzcFfXQX5e
	 Bitjh5rVst7xdeAZ2Ig8XxkHUKSk9m/S4fqSh4ffVTrqM9kbG6+X4YEhN1KteCjEHooKs
	 FryNChCGwtLmKnXsQIEvJSC8N8vnV2rkhGxBhFc7MJN0LBA76E8bC7I1X6EylVyC2AA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992584;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wd5JLfSo8EXjkfcyTdEtJs48yIM8u5/cgE2VHLMH2rA=;
	b=TNg/q/9RiXxR0GGkZrHqA3B9xCTNT3HnV6Aeu7wOSt/+RsvhRUL+0Fcp+FdcGPpWYXe0
	 QyyvQyvExeWuNwf02HPPJfhxMIzL+AHT6fZhutGv+YC1VDXHLcPaTehJsptKd2ccahCS3
	 tb5LvQPa5lkpBndb2L4oz7odOtAFQEb7WsnbowvIw9Go0wpm/ZAiPrICoKZyOfch40Nu0
	 k7kzv69SZPSuKEWtSb0DuFa5N4N8DvKOl1HFGQGM1vD8PGePAMC7bPhfU45QpmLRN46Rv
	 O07UUMHMIYgValaBkQznHvpzaCDZcWOvUiXb9kDt7M2iREqD2A29d8dNh7z2fw1nChQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992584;
	bh=wd5JLfSo8EXjkfcyTdEtJs48yIM8u5/cgE2VHLMH2rA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=J5TjqIisfl91AU97dwczFeZlJ2N5OVJNLlI8zWJMImdGD+Bo8tonZaq6DK28pIVzf
	 Zsi97Gimh+6ttEeyUzHiCqA30cncsa2T3yjC07AGBGxwtPw+VsOj789OeNCoss+5v9
	 Sox5eLqgOU51/YFSOn58bXyym5y++RRoJS89OPLGymDHfxsouFKBVlwjqkPNd+bIA1
	 IfgQAL83et8UXEijSlSwxtllpxo7XZdBEK3VfHRw+Sm2FYMOC1HAy12Br16Cr4SfcU
	 NQ9V7VxcXLTYrJGnK2HXNdJA977MBuOS9RyywKxN7O05WSAher5/uVnh2qR3Jpxtyi
	 BHARms0oN+1RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F65608A5;
	Fri,  6 Nov 2026 19:16:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A420362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49B1F407C4
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZeOTS7ntI-0 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 60D86404C8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=hkpHNNfY
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60D86404C8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:18 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-702fd86d674so641491eaf.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992577; x=1794597377; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KmYpcKA1aaRvIApS2Z8+qHDAZowXx6JSFOm/QDc2F9I=;
 b=hkpHNNfYbbepfrJOXO+etI0y8AxspT05cvsLVXv9XEQjvVxDxVWZy5a0WkgwqEvHLp
 sleRtWbkXmBTpFqKFxZilImFHEIKbNIiBPmGu6DCkyIw/W6lBgw7zwL2K8s1sYz0tWh7
 GyVT2wX0Ba+xoeHT3RtfB8n+eYESB9g6wcL5QmepuRH2x2haOTfXERnxyaoO/A0iIMQm
 4NWfVAcbmiaGZb+MckAxJJhoOKO73scJVBO2XWx8DYxmhfXKS5vuOc6mKsX3S8E7h+hZ
 Cf9tJ+GRAyAEKsAlfDiagezLCMMmiPlJZihnk0eZF3QLsf/yn4CLME+Nfuk1PhGnXbeH
 D5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992577; x=1794597377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KmYpcKA1aaRvIApS2Z8+qHDAZowXx6JSFOm/QDc2F9I=;
 b=BkctowiOHNNoe6duLlovSl5JmpZNuENSjQ0/oKHfkOpGRfvKcv72QyKFJcYLWPLarZ
 e4gz3P67ObIywZbHNCMCtx40fRwL+PmW4yl71yaT8PAAbsCrvH03fs4tm67CzlhR4chJ
 LKH4yXuD8FBcx+7oq8GhuHkVXIX/w4SRNpz+Rn5/VzhdXEFqmsCABvQlwgpgRNzb12Q8
 x8u++LWeN/0GmPZ7qHm+nkMlMDe7tnowuIC3AhflMJBgwhmEN2hcUGb3/lYavVfP4xro
 WqtVXT9svGUafEkWoV12tSSMW71GL2Z/udE8dPZhC8Mcr3rx5BVMtOlROh5f9htQ8Q3V
 X8ig==
X-Gm-Message-State: APuU4Z8bkFNsy72AzVp/bRk7H6csSZlPdgcQ89JfNrturkCzE+N9yI/f
 rRqvvoU7uIt9bLVc3yII0H27eIabPtJsTTYSLP27eivon8EoYWlQyz+VRTVo4A==
X-Gm-Gg: AYBFou3Aj4b7LeubjSKXT/eOlhSQ49wOmaseL2CMTMxkgtzV/x3gvwnL/Z+IiBLLbKt
 S8tc2XpsxAsJEdq3ibBUzlNnkr8kLapruO9/tKnWzGSUF1Af1a7pLW9AKjSBnwj2SWziwUk4ETU
 Obj0ED3FAJLxszJOZJZnMizIalReQ7q53PFoiksCaP17M00riEPtFZnbA7qrY63qowIY8lI5FWr
 vV/KF1sfCAv+qmTlCnH0i4wJInCtPk4P6t3zCHPvniEv0smPtA/S5q27s3VMaZuH4OwuEJY27UT
 PWMDx1e6IvWyhRoxDG7EcH+ANaHSig/gKrtqqlk7J4cbgU7xR2kv+s3EYwhRDflyE1FQONU5NgB
 7+k8rzjYfef9gYwwO+kXY5mYyS6GlqRErPg65N5rUCDtuEIgdFCI65nbKnhDsOhobbPus718+sf
 33KKKg1sr4hdWmW/MfJert/zikiFg0hmzwGryM6O5CDXxzuSS9NGcRBwu+K6tSku1N6obKYeWFR
 YFu3Z/WHY5YvzkxMKduqQCWjYyMifuhEL9WdFYLQHfGRArq56JLsbsvqocoZtUcFQHk57eephQ0
 /cScf+7ChPJrWBiZzJjXXDElhY44TXqs3Xa3uf7W+Fn1tGbJBqEDVKDP6ejQvFkQYk0cY9abdxM
 ReAXFeG1+yrFtsXumgLztXBewPhI9hnwRsKpU2gpFGIBixzU4OAoGcFwv4JBOO1IkB81JAjG2uY
 lT8U7/dFuZ2dhZx4xpwC5jPtAJT/p4DMp8oe7Dc/mS+HvrzeUnO+38dkAa+i8u5e/1jc+5rlYJs
 Q==
X-Received: by 2002:a05:6820:2383:b0:703:acdd:d16c with SMTP id
 006d021491bc7-716e78ed8cdmr1950169eaf.39.1793992577039; 
 Fri, 06 Nov 2026 11:16:17 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:45 -0700
Message-ID: <20261106191536.2120153-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pip: bump to version 26.3
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
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 445953d08c..22ca316b38 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  399f3e6053dd52028d2b60384332cea9  pip-26.2.2.tar.gz
-sha256  3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f  pip-26.2.2.tar.gz
+md5  329592944207f872a94cb63da2b978f0  pip-26.3.tar.gz
+sha256  6c36ae7da8695be67e3cd9f7d87919667ced53f57ce2ede75d89b5912ed2bc4c  pip-26.3.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index a2efaf4918..5a11915ada 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.2.2
+PYTHON_PIP_VERSION = 26.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fa/e8/0842d757e483e895e670f655084cfe8b8c72580c6769a76b30b2789a0608
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/53/c7/f8d9e2e0e7c1ed8a22a10eeb3b5bf7860bc07d8446c7a978a882c5c8214b
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
