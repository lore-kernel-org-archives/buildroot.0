Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEB8606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gBIv4mRT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eOXJ/vw0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E4D60A47;
	Fri, 23 Oct 2026 18:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sK-wwxmnq9GQ; Fri, 23 Oct 2026 18:18:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B58F60608
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779531;
	b=bPqrKFhCZNAYLaRF3mF9h3+pOlGaFirkdSH6pKohOlKJJhRR2+f/vwNIqJW4wFFElDKZ
	 RyacyOWD/9BeJG5KACJ79EdxjtAsQC9XMw3a62IO8NzGNEqqto+a5wg7NhY/wVKGJufSo
	 UpQD2DL4vkB27egQdRt6PQh1HHtY4iZVBhekVwJSA8bLSKbju4uxvdQwaIAIIhabsVOq/
	 2ufzodnh6qYliYv0BLrlpMGKz3e637Bh4toxQIPCieG8zs0CC6415bCjqTzD0gzxLiHlV
	 uENbp2S5fVjiCdaUTYkgij0ScG7WOla5K1nKE0cvo/lFAk8t7x4K59HwVb7vOcaMl/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779531;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FMFDw9sVzSP1He2ryzRrUhU46qJRwuJL37mNRKxg6tg=;
	b=c2IealSX5JfpmWLl/fJWpfJm7KAC4p8H2sDtwncLqho3KEc3e7idDq0Z2Bq/4GbAzJgx
	 /EY5waVZKNZdUjGtNhmuqMIoh1WsydOUcm7y6eMYrWK8TC4611IJzwriIca7h55xuMdrt
	 +zf4I6TKvqQaGH1FrQDPT6Mswkg6FEGPs8Ywoz+Bp7SD8ug31+7aSjVAUpW4iqiwmScnv
	 gdSP3oPcgmL1scsR4bQlCTsfCmd46PZS8qlEFq7GNROIIYvJLPUh1mnpET77fZLOdRjUS
	 qV+ZQ2QdXfSi7aFfEjS6xJb5MQRqAZEJLobGjxAdKvUmIdn1emJRZMeSGAMrfWJnGrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="eOXJ/vw0";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779531;
	bh=FMFDw9sVzSP1He2ryzRrUhU46qJRwuJL37mNRKxg6tg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gBIv4mRTrs62qyXpV3f3rmK4ySvUSTTGt2GR3YO8yJ+eXcUn4hdd6yXG96W+ReCwu
	 vZbzdNaV3yHys67AsKwUyzhOp+3EzTrt6Ob3uBdr9QnGgQVFKjqbpE6G7/555wnZnS
	 cLB9nzgx7WgPHbASuEyuF6ZQXJFchh8Qvm8oXmSdrfh3tcGJb6dS1o6hjVS5MAAIzI
	 YCas9RZJgC0HcIwL9FrXfV9MTfbHhtwVsV5RIyj3sp2V6NgdEHI8LJ7K6Iko65FLl9
	 RcAT9PTxSalbnTD2JcZYz6Ap+N82+YTmb48SOtVAXsJsYpQ/1lATW/g91oPgn+Ucze
	 ovcmGVyuKJEaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B58F60608;
	Fri, 23 Oct 2026 18:18:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09581235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF771608E6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHJHeh-JUeEn for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0138460809
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779523;
 b=ikoRp0ny6ISU1HTxbXAtlv+KwhIKGnSm6UOSUtuttyU3zhOC4il64nUGIImd7HRSBXC1
 01uPrtQSLsJ0B/plnWgrsGwuKF0RtyEVHs2q1TNFXIy1Bn+bYhX2uHMriXkTgaxJRJSgj
 wESf7h+mgjuQOIPTo0Hm8U+HYnXSL7bPdHbjJM4HySEBdK3DeKVnbJjAztzJjds2js3qV
 XecN7VcgJQLdDKACrmgyNLHG6pN2Igb+r4r01H2tDLG8qAcBMvLenXNsAXAtExFXsm0Cb
 faYqYKzreIpGOaLxcoNLKwYXY3Et608d9eEg/R+22ZZM0qYlsmstmgWHxqNfIEDr58g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779523;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=V9Zh49QL7aDg2cQtndruuPt34CWV2VS6fvVtw1DDoOs=;
 b=erF2rX4npjVjbzTtCM9JJDKLPxGXnyW+6eBsj8cK9zbh3fFESlcmvmGXnqy5pTpdLs98
 +R7l0LkrNmsWA5I9xim0LALzml4/YX9pVmh4PL3yaiJ/WuhOVtFGSoR30S5SIxdMuymGp
 RrdJXMbXYnGEeALBHqObJ8UcuGGlS5jZifJ0S+7j514Bx1duEOag0ZZ42N34jE/JdE5fl
 lkC5zDKl8GYqNXXu6B0XZ/DcMKDV4oArPs2e6LNv3gnKGT33sjEcpKZMj1x8POwfOgBfs
 Zb0umMrhmSG9eLDYSa1g7oQS3vx/7j8KwXOCuVPKXWQ7LpzTdttjfQKmqikcYjpVhTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="eOXJ/vw0"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eOXJ/vw0
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0138460809
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:42 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-6ddef424972so677189eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779521; x=1793384321; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=V9Zh49QL7aDg2cQtndruuPt34CWV2VS6fvVtw1DDoOs=;
 b=eOXJ/vw0kyTvA6kTX6lsic9xCU1zTOKTV9nC4v3QfSY+s5LSMWrefpsKLb8vu2h+Gj
 QFdtOWPJSxv8hBRhVKzhgQYqsyVHTNmOGCY4p/ZwUqSAUi01A8hKkWfThebIc6u7mn3u
 imz4a1/jEAmRIwSqhk5Hy54n7gtW/z/GCkYQmv/CaKALRsg+3zKsCT3tOjJYUX/QZjRV
 YKDap9gTCbccsYN3x3raeyoqGX+O83L9I+aO4SKHXWao1Cq9hVB5AtPo2tZXspNaeG7M
 jCndu7CjH+Rq2wfsZFqsUKq7/ixWw7RtEdbPhY21K6z73MoXw3ZpQKc5dpscCr8qO4b6
 WWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779521; x=1793384321;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V9Zh49QL7aDg2cQtndruuPt34CWV2VS6fvVtw1DDoOs=;
 b=BeiF2PgiWIbmTBWbSbtctQfaF76DpK19fCDvIsVJWQix7U+6XO1jE9U3m7mW32eDt9
 0bVMiD4ZHQOvFrhzmnM8eyxnGB9LLZYlZNCaheSRUrivJ0YByyAlL08v4km7xrfdgXnf
 /eKHftIturDCfNaAdAksCLqkwT57ZAuJVhjvipgTU65VhbyrTgcSp65iCZ6C5f3s+c1Z
 e+7gzxmFc1YFmktEgOF77bv3kkxv8oFCZu8vNh5qvNpPMt1sMDr2stssTXQF2EnGQOgc
 BLnsxGJ9Rqtg4J7JDAEzu6f7XDbu0pLnF7tMyax09bR1hI8HsbpUb7EsJMl1rQvuIlBR
 apFw==
X-Gm-Message-State: AFq9FYL0rmrUOc8IzHLheoHGBu1C2yjBB3IfHgJ0MAT+XeAk5jk6rPkf
 e1RtLx5q4z2ddcpE1C7ZciF9oW80BbV7OymgnmzQ7y9Fcr4rUZIVZ9rl1jKcog==
X-Gm-Gg: AYBFou3YXR4hEn7jS23vHgoztdwks40lJfs3rIC+P26s6rofzQDlan7o3o6uNmJS+6q
 /zfv83qj2j29wVID2wSLyUU7GQSgUtafEV3L2uD/zFmGeRFrZEcNFmPhhNwk9NAvZoXiRSihZPj
 Lpc4/YhFPzcoN6vCfBse24mjJIPpAMq81kykrMu5iU+GQV2BgEpepdPcw0BbW/uR3JDcv6P4HAY
 CRA77HQYcTtM4z5lqlhEAUaQQtnTOxEXcOprS1kWG3Are5m1C9A/NNBQOtZX4b41fo0yIR/K0d0
 w/JKlKRUO2oZOH2/6JSpLaES/OSru3tZRJBxZPqHaAcA/rneRqq/iZQs9cwzdlMSe8VQcFj+Y5A
 hWfknC3Aqb5eNPi6b9Qw0T9t9iN0tKsuG2efpj51iiytFwbxh1zAo/mB6DvXmKJhP/uCZ02fOgi
 fo44FDga7mntyUn9QNrthlt1Mu2enoWGlhMop467iTmp4u222uAyjMsSmOZ2AGJC/3AwlRY/lBO
 JTOn2s19BnIFFk9Zd/UKtImXA5LBJVaUwwVEWV/gEdxE8rrbJ9obVapSqq0loNONMimJtYBn1GZ
 4l+jwlCvsx2MqhlkrOwGJV3RzzI+Z3r5EeXKEGgdUg3N6YwQ9xjhtyTxGXvpdPDhyZhchqtrtLX
 K9f/TGeNwPjbc/mXUs/7vLAXHYruuxRT4yr90w7jvqS1o+fu/yIQQE4OG7a69GNroTm9kqYvG+c
 Az2SPylFTCh6WTjhW37FDWbvg=
X-Received: by 2002:a05:6820:450b:b0:707:f580:6345 with SMTP id
 006d021491bc7-70b889d4ac3mr1939967eaf.30.1792779521491; 
 Fri, 23 Oct 2026 11:18:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:31 -0600
Message-ID: <20261023181818.920329-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-marshmallow-sqlalchemy: bump to
 version 1.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
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
 .../python-marshmallow-sqlalchemy.hash                        | 4 ++--
 .../python-marshmallow-sqlalchemy.mk                          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 1d1385026a..d1b76cb274 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  ad62daa42396557252047d43e69227bd  marshmallow_sqlalchemy-1.5.0.tar.gz
-sha256  e51192c204770645a2fab0d72f44f8789272eef75951f84b1608d6b4b0bfe0e6  marshmallow_sqlalchemy-1.5.0.tar.gz
+md5  654d6871e29a2a9ac80793df6171217e  marshmallow_sqlalchemy-1.6.0.tar.gz
+sha256  adebc7e36a7ec5662de93b00b850b50e36f4e8fe67ccf6e9e8e5ff42a78b1696  marshmallow_sqlalchemy-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 15715d9006..db391d8d65 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.5.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.6.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/ee/fe/247c297809e64116f766716632adbc3f4cd06f376f56dc15bb92f170d247
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/a1/6d/097b9792559b6eef8c6c130d659be0ed8c9fe65b14ad4c425f6cfbc6e90c
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
