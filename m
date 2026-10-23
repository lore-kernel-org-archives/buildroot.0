Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971A606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lXHEAYHr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JQ1trMkD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EECE80FFF;
	Fri, 23 Oct 2026 18:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTp48zqdSRye; Fri, 23 Oct 2026 18:19:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A82A5816D5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779550;
	b=sN3p4KC6RYrk4bD9HWJ+VPFfECP34Ie57/Riq8xFY1Q87iKtlC8VEaq2YmxaPCqf/0pJ
	 k1xEJqJaUdeQKQkBYqAq/RUiO2N9m0ETQURH+wU5c778yNl8S1J+DOQOsBB7nn/IIUVXm
	 lfnkspK42cd8AUqg0HdTH29sj1svInb1MyKpJmbZEYW6JqDmlOkkz2FG8kevKYcH8iCjl
	 gz2pDJXOABg6h0Buvt2hv+1aP4p+L1IRPJ5zcmn0kEJcsM/EuzEfjC7G50A8b9hw8l/ay
	 tnTXo/qZQxnj3DC4uSuMXWKzfsF3TtPGMuXONUBKNZyOSH3DISy5GVHTohXV8ESYRMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779550;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sx5DCd+HjtVwGMzQZQfKybTvoFxZ4tajnReCkf16eSg=;
	b=K7DlZhp1EFX8YxcU/gW0P9wuRNHYr3SGX8YTC2zSaBfCrZpeRxNXg9Q16jQ/dSc4qcWb
	 gnG/04b2TDOXdn7OmbCJyA5HTEkn+x4tt/1oE8jMGwUjh5nQw7pPJziyt0QeZshE2IAnl
	 5dE68WurxQUModhF4OtKy3Yja7z4r2+SQzr2UsCUFJiLlCsnf19/JtAVLVGYPa6ziPlqb
	 qdpstZlj1caxT0PkTomAWfYV7KLa73UO6vQTt/WDeAn1sHXYtpprF4QSFhcLTjLXnXh8W
	 6HrDd/YROr9clejrc6Ue5edg0L2b/Lj4BpBnD/B6L1g8kW2gj5XIr1FiVDw2p0F2Wlw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779550;
	bh=Sx5DCd+HjtVwGMzQZQfKybTvoFxZ4tajnReCkf16eSg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lXHEAYHrXgTQDs1YZeaP/rmy0lm64Wb36SnQFEwCTPPcCKQ/jHrjkq4MXukCrdeaj
	 LIIjg4TAKYclZR92KWOViRm0b0IOPxFB6F4DVRNfbHt3+QQFe/MmI8hNWNoy06wNkB
	 Axn5HfHUks6QcRjwXFK2xSrZB5ZbzE7xpeOsvsXFkAHKDJQ7s1hY5pK3nEj8lkpiyR
	 ZVI54GOVaKUCnTrSFOXpD0G5GBcak2u2oMes0r1xLRwN36lOsUO0waRsjYG5ikQAR9
	 AX/uic4fx2TLQj9qjeI4Xx/7s5TYjmVQCs54VPbQXGFwayHB7Wm16YzeXYXufcXx9z
	 PrzWz88MQEMOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A82A5816D5;
	Fri, 23 Oct 2026 18:19:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ADBB12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9873D40061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8daDEG5qfIX for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A6A2740059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779540;
 b=S279N13+Z9+7WAv5BkyKi30/3lErM//LYQodCEGs1OGo9aYOwMTTuh+X2v/srw36vuS1
 f8mX+5sQyg16JtoMTlXUlIdEV6k0LkzJUcqQzFlvOeSswBDqkI/YNFSVk0FQp2DZ5RLGs
 zR2TxoDqgK1iuzJyNTheFWQKNl3IqFYZeBmRAF9uR1Eo0tx9tij0VQ6bMlU4m5pXZoAZi
 G4seAJt/kSRdUItrlt0A/LAT8+/BsO9GADV/wA4hgBNYF14xyYfZh9t18vz6FTBNF72GY
 BbZdFHq/VRkK1vFh0kx+tCGqaEfjamIdoJZulpItqdlv6hEa0nbIMyZeW4Yz9XrgwNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779540;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=xWY9HfpY6gpooxpu8gqO8gVY0NhUkwTEsz3jcJK1rPA=;
 b=kH1DOjMaLcYvp6BqkQzZZ6xpbmYaJZZvOR18Zt0UqfwxxXO2yrtP/FSS+Qpl+5TTfYY3
 xpQ+Lb78UBYU/E09B34GbqltaZAp6jC7rCZIKdwk7lvwrgQp6ttUcqzeWw8hICT63N7TH
 2S2o+ewLdlHeRIqmJGPo6tnfnokp33s/7B/i+3xY6d9F0I5a9xG9ZJPs9JHYne7TviLJH
 eIzLfT3OIy7rP26EgaiCcE58I2a4OjcbckXcn6FrB8Ha43FxBEu3viBE+96Ze4uS89mM2
 Nl6mi5lpspWwe4NzZN8TtIzMCoARBzli53qciL0We8u92FEL9XainDOaeV6lCScKVjA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JQ1trMkD; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JQ1trMkD
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6A2740059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-843cf077f10so1216431a34.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779539; x=1793384339; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xWY9HfpY6gpooxpu8gqO8gVY0NhUkwTEsz3jcJK1rPA=;
 b=JQ1trMkDmrGUCaVrs10ehkwZ+L6lJA/aAxHZp4gqNg6MMh2zcacCazESWu0612cJyZ
 Lk14UCLehOnBP9Mg08QitQ1YHLezdIOOMB+2hY0HCvk49feNPMCpqG6jDWASu7mwX4fx
 wnAoOdtyPjIavJI773+7pDNUHFk1SvBqkUN6y9jOuj0vIyTZnw9P2B+8N82t984MdWxO
 HORJCJytW14pfgtQE9tjT855e0/IaRswjumCe8urk4qKfJFz7uBQ3I7rx+w+B1bI7Xsy
 51OQxM1dJCb0rx8k2FMOV0U22nN/ogpjusP+zsds4P3kMdoCywdiOsqFu2HyWa0v6NiK
 oC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779539; x=1793384339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xWY9HfpY6gpooxpu8gqO8gVY0NhUkwTEsz3jcJK1rPA=;
 b=Fd5d5NNP5Sr7hLOr3lFZg6wuc8/f8MvowtXhkTDMw1Xalu05U6+Whpe1Yzfqx8hJJd
 lMJvfDwQ+MsP0HZ011UUx/aej7AP+4p3wD5DYUJ+9VDFyp6KaSbRdecvK6GkRliBbzwk
 Dr5iB6Doa8LhSBwoLflJ5BHDaB1Iqk314Tz0LwPbPoT62I20/pkkSQZvvs3YwF0kQL4q
 /Wa2l73vKWkDqkse3GtgDMaiMPHveOm0PegCQzIy1atM1y4vb3NMKC6iNdhHFFgl5csa
 4Of4yhU8s7W81vqfg7aSSbnYxqLWDxLqmrV6p3q/cib6jVdnMo5N20aAywXBf3HokKKE
 DICA==
X-Gm-Message-State: AFq9FYJGUuMpADU9qbJ2lKYS5FD96SS7HV6ndJIGP4PuQ9v1MRRZDWKf
 uKXX0s74AKe9ypfYhqZLgcgtxajDoaPw6lgD4cCQKFxNbW4X+dewQ1wYsbA0T1Jo
X-Gm-Gg: AYBFou0QQbaxQ826CkhCEh4PqwsL4aKUpF9OlrCdPRO+P4sFL/lQGY/VCRGO5qbxQol
 NS/11yVCzzAD36Mn0AVnCN6KH6VsPxzvUOoRsHrYN7eCkDSA1L2GdIlQTPEilJzU44pAJzyC+hW
 O+OAfq8mxDoTjoPfe5YjfnymEqrjheM8U84JdRSokJ4/nDcqsbUciaa1nc6WeYJNylNiY8PoCmJ
 g995iimQKAMQNZQpYOgSaAfowUZNuvbHKOGYzjszaRTSOkOz8Uf+NZxDhPntw584ZjtwSrzUahf
 7IfMFAVLKZSHQhox0nNBHerfJjRE5npuADOl0GAN4BedDDcPjxq1UBquLKdBHwd1hC5juUZ8sBF
 amF2ECw2nQPrg5P0dvKxAjisX4snmyzOfHw3y7gKMXyM3R9Qu68orG8kwQOznFQCcufgCwtgDIn
 P3qwZdeAVHn06ZdlcEkF/BBOR5h0tBQIFeKkMb8ZWuMdbkixMXAYDEWSQt+oXWRhNgOPLmHCg+A
 tWwLHV3ggEAqLIGuTePthIBNUzuD9bySu/Mou/cL7uMTvWlSZBhLEb0kQ8FWloTiBt1/vnbmUlE
 7TiMeHyA4fd0GJMItujy9CAww0D4jrZJZIqd2BtneNtAlMg7giwSBLDi9u9/+cV7W/yndz7cw42
 GN4nkzlW888w2Uu50JzYH0AoZqrmThBO/XeVJEaxQJN4eHouVmFAYAPgJdJwBHFxQ3NGZ/2Yea6
 iL1jDhdz972kQvqLA17P6LFRiOdP5oqXWaueyhP0+JhORc
X-Received: by 2002:a05:6820:221a:b0:6f7:7a4a:9d6f with SMTP id
 006d021491bc7-70b889e20b9mr2112213eaf.47.1792779538994; 
 Fri, 23 Oct 2026 11:18:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:42 -0600
Message-ID: <20261023181818.920329-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sqlalchemy: bump to version 2.1.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 49c20184ea..3960b36888 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  f1e2f4edfa4fdca60ca9eba308cdf610  sqlalchemy-2.1.5.tar.gz
-sha256  0df76cf1ca680ad745bd378a6299a058611a8a784eeaeb4ed78ad4a0b7ce2003  sqlalchemy-2.1.5.tar.gz
+md5  e48a02203a8c156dda64d0f8f703e5e7  sqlalchemy-2.1.6.tar.gz
+sha256  499eae5c9051efe96cb9a73ec2fbde8ffa4186f102b9094ebab8fcc9d3b99f52  sqlalchemy-2.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index fd152963e9..57a82f1ca5 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.5
+PYTHON_SQLALCHEMY_VERSION = 2.1.6
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/08/bb/28e3106ee586e5b2f5ecf211eec1348055f0f926314b13fe23b9cffa9039
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/36/dc/9addbf490110b5727380059ee542ad8353bdcee45a37ba6a5e0976966ae0
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
