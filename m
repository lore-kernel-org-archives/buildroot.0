Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE00D606A329
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=senp1RmK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3gNoaUF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1002405DF;
	Mon,  2 Nov 2026 18:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecpURePUZpyc; Mon,  2 Nov 2026 18:13:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C4445405A9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793643231;
	b=MOF1cTSiDbAKpu97pWnFiv9bjgUnpOVph92XGkLTSh0WMpYjJaQByRhgqrdfLe48YxDv
	 QJs/S61UeY1QN72v071iH9AlIUhsXF87VnN5b1++iPxIdvtabZGuDljM+ybKK45FQewsj
	 SHAlTTV3AplBNG0Gx/4TTnEoEBQyv21QECw/zMHEP9vcEZJnREw6KiVrLn8MFihWTgMcp
	 9Zrt/JgKBd2yvwpuyFvjpmyTvNXyf4VrzCydo+vdf7yzbjdVl96PAdePZKHUeLp7fB88i
	 GLbW38OriwvRM7a6q7XVEathadcgAWUpxC57lNyCy4r1Bic4p7SqpVL0cweWeMn8whw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793643231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JDv7Us/uS573xi82iROZsPAe7+3cz1DQP81EDIgNvo0=;
	b=FJs+3gKtBBdV8wtA3SV/hzrri+HUbL5TIGfJLfRgCuMK8iYKbGbftidIxInL2X+zPWMJ
	 q1Ne3J2feluMBoNneb77TPTufykxcOUNlJkI/dsZQz8LSpgM8nBiX5v76IPUdudxRYohY
	 gQkhv/jv1hJlQQKH+PzFXlBFrGEqCN9eLZUMQeQz0MGyTIrvoCfd9Cem2ZICtHof5heuU
	 ZlaPg+7fro8lB+Oo6MOPFtaWpYnxu81yP43lu645Xzy5W6zUeWqJOAW0okP+3GjP8mwnx
	 GrYuJ2e0qGmsQPa0koh6qAz5FsmzBdqfUoJHgmlVZPc3YFwMJ+LzqNqjTTMhwfWO+LA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793643231;
	bh=JDv7Us/uS573xi82iROZsPAe7+3cz1DQP81EDIgNvo0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=senp1RmKDYpltznR6lt5DWEU4mTo1VuxPBd3z57yr2QnDF+SUa1Yq6ctqYyGY+/gM
	 8VizxGhwEXdOB4eRvUWgnna8SnHihq3UIsavy3eyTMGsmpH1xdZKAj0t+8Lx/vfvBz
	 cAoBmz/Ml+gyC7J/BQE3KPGxclGJG0IsPcgAXt+CrjoGUmb9wfFn2nzmYwEVTsjw2L
	 8eyelqiADNxvcaNgPDNOmCUz6u+MSu+a2U6apB51RxIRKXyi/vW26wjbPl6kgHADHe
	 yEftUIRNUJ4BM4a7vY6amp9Xa6ue4N1OTQLekmJn2On2boznurDD0edX+qsmnFf2/k
	 L9AYcI+gIoNMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4445405A9;
	Mon,  2 Nov 2026 18:13:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 436DA120
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 291FF400E9
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7-1TbOBzLse for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 18:13:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2E4834007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793643229;
 b=p/7XhzNG3Vf74+iWyGzM8lfrVPNu98jbBwWoOC9Cwn3XfIta+vsxuwml5Py4a32J0+uS
 9MIbNnMgSaEe1CnCL8ErZIFW/ak+TQNHliXTv4QWs8pRgeBTXe53JrpKWO6Bfh+UiOl/B
 2zu4TlV3ORl3SFmzOwmH9n9QbkTn7Owtabbu8Zfh/giEffzvCeBfg1/5n56J2OsoNkABj
 Bp6MTflxfgmKRadm2R6YrH+jrr2uWABCNFPkV7C80nJmEPSHCrzoMc903pQ3Ed4muhcad
 Brux4awB18RPtXMFjW/sxdotGp/f4pzQICqrWkhwJUGmcw3upduGf/1uA5z3nvdZN4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793643229;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=oWnMF/1A/ewSB2vnmLycU1surI9U1h07rOPXArhTF+s=;
 b=buul6esLJuOcQFNlW9bjw2V8dVMSRod6KG+ekkf57przGZ2Nwgi7OmWe0HLkdrR03o4o
 Mv46glPeEB8zCJZOlx0XJMDcQxxv1Cburh/wW8/EkhNuLxGVQD+2VUsL86Ar1xaNY4jbk
 A6JyHf7FB7Rr7QOp71Mezh18ZPQzSOlfOwso7gtTWZx2Jt4E67mzjpaS0/3ur/oQmmLV/
 mM0PqPHAqnkPHBZJtSsrcGg4O5j8ovL/XNLWesj3d3KuBJvZaODBv6KcBuxUp5b++r5KL
 kFuRSzOW3csnK7yRVbOXpvgCSf+INuuT9jnsuM/AZYLFZudhM9PjUuzDILvQ1IxTZUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=t3gNoaUF; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=t3gNoaUF
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E4834007E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:47 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-53656465d1dso1950228b6e.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 10:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793643227; x=1794248027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oWnMF/1A/ewSB2vnmLycU1surI9U1h07rOPXArhTF+s=;
 b=t3gNoaUF5Qd0GgHRcn4dkTwoRu3oik4DeylJIdm3kDTng9CpuQDIDGMvyWCSXQjvta
 nMs/fIKkW+pQ6Eex4rAdhrhhxmGXOyd0YrgurVRuTPWkHVoEkGzV9EevxaJk9uJw7shM
 pSUgH/dCRpj5mTAtESmNZNnT1+idc6z69O3VssaTsA/owcC14uPWdDOhmXfhh31qj0cU
 z5xvWZS6BV0Dc5b3F/GMVQyD35cltCoxOz1hSKsv78MZrpCI0YTiX1GAjui+pLysabQo
 8D8m4u1ZokOyk6r9UnsGUpYw3EL7qrH0BF3PdYmkuxMMzT5qzN4oo2ImSuS2LU2zlmBA
 4o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793643227; x=1794248027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oWnMF/1A/ewSB2vnmLycU1surI9U1h07rOPXArhTF+s=;
 b=Gysn91pxrCeZ/fYFW0tLpWNnve72AdCAH26+t/Sy0vBFPXM9CKUFJnoHuLJQeLTVCn
 2/WtrNtxNOSDmczycWT3N5qGCd+QOTbGsN2Qm4rvIDrJLR9t0BW6j4AaBZBMLIR+NaLu
 qE+biIYCcLermnQuajkCAzWhoN6VhToBK9h2BJEo/4GCV1vkuwnW02vGNCQSyE+oJ8jB
 i5gIGacJkdsP5YPvZ4RyQkQ7kIYT6fPFH6FkYykwlBJVQLVuGN+f08miEN7E3A0CeGMQ
 HKa3sw5UjbWxrYqaba2Qhhss5c8gVIhSJ1cpwCaO8DMiZSya8sZy2trjDi6LXpCkVia2
 p2OQ==
X-Gm-Message-State: AFq9FYKt2wkk/ETUYZYQIspWbFQFz8FpAIbFH6lZkhNegvk2IqTQcW7j
 p+AkRSW4QqgRk/t/nNbSEZ7PmbpRe/iKjGlRjXtcaY3DEn//cKLjIifwELbA1w==
X-Gm-Gg: AYBFou1wHZgQ8uAzg3n+zNTKj7Vbz6D57iHXo3Wep1FZKRoYU+Vg4wkw6bsyPImbqz5
 /6EJXF/C3VK4PiFwHr9lWAWWFK9z2pxgd1nJdh3eZHs39/sLKU8rS1WK6C4dRubyniQdoaAV9PY
 rzkxco4eiJg2YDBR9qxMYk7ohhAjMw4Q1T4op5WyQUWdqjLIFPQ8P4m/X95J9LYFg9c35GOldGw
 rkGe3bfkq/LiGr5oyKK/c+r/7n+1Utp+cMTPrGb3eEjWFWih8u3fWJSYDTu1A6cgLvAGNyVrKja
 rSunnvE0OIcnP7thOd0pVwjfKyjk1W0WTCWVoctB4xup9vXOcQblv9nCAJ9M2wNrXnHd/q78PNd
 U84inyJVEWdLxGvC4tNT7TySE+lFUyoLEpxKXK+V0YD+anm7P1vggww6TSTSRKxpxsrHPKbCvkL
 X27WuLfcwaToQa+WxFJyJzfHtpOGRmM7dATTQgx5AQsbXne7A7qIH1bGQQcR0HwGby7N2R2Qka/
 pRIwodP4gGpoY1RMsvUQoEqzXG1NghnhiEOgEMtZh/sAwUuMo9qgDFSHIfnElkqmqCLYJHJJHrz
 zaj+VlwIkk3XxGzR9YXmcojwF0+M1VesUCPg72xW3kHZNdWTIv7XMgTzbk3xeXOinVIx9MIQO9O
 YJwjyEGzFnFwnepkYdTRSleBQWlQzmT3v9gs9vYmTvWBsUpENTYWb1D0AJBXzaMlO2piESNTypU
 oVpr5O6uUwQjznxCOaQZr2Idk72iTHivHOIy//WP9G+SGUzqq1gvYR6ofUxZo1WB7CzAMaqACmV
 SYPgbXRxV5ObX9SoQnvzDA=
X-Received: by 2002:a05:6808:6509:b0:543:50ad:baae with SMTP id
 5614622812f47-5640de7b4efmr6752020b6e.63.1793643226580; 
 Mon, 02 Nov 2026 10:13:46 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fd95562sm8445016b6e.4.2026.11.02.10.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 10:13:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:13:32 -0700
Message-ID: <20261102181345.3238554-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cachetools: bump to version 7.2.8
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
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 23d9a832b6..125da449ba 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  37a3116e73ac0870c9e58bea5bc0aae9  cachetools-7.2.7.tar.gz
-sha256  e2154c809ce9e1247120258c36821467597b5663d44c3255a9790785f23c2b1e  cachetools-7.2.7.tar.gz
+md5  07b2d6da1fe4690c42c2580076ac0cbc  cachetools-7.2.8.tar.gz
+sha256  3f9b146b2160975da273e7c23ec882f3996b65df608150d52083c07de0682075  cachetools-7.2.8.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 6f75963bc3..e059b3f9d6 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.7
+PYTHON_CACHETOOLS_VERSION = 7.2.8
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/40/3a/bce69b9ecf4658dcd3599abe5122a9031386f8f94bd85c6525fca9109db7
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/93/6f/faa5e0606769105e70e0478031a8f9a6b729e329f42ce2462585c6d9aa52
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
