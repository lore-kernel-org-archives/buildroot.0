Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AB2606A320
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HF0N/mn1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B3dYPyCJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B4F810E6;
	Wed, 21 Oct 2026 06:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KaP_wmOpNz2; Wed, 21 Oct 2026 06:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BFE05810DD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792563572;
	b=sQ7I7tv/r9g9Olp+5dWhXjCk60WAfXZLA0qxpNlbCMCDGsdEZiyMYMwJQssCwiD+POOl
	 /JZwTFPg1EJkqh1CbWx0iFbtY4LuT3hWIJPXUAkPA8Ase1gI8iLeLKUTqJFASKXG4p8Bx
	 uXXbbVriIAzvWPfR+n9XWxE5cS12vzj2tt2WMsTjgb8DmLQ7z+qlOClkrWLlMFCyqxuU4
	 4ulXhRi3cbYE0pC3gQZxUfCqDRW62V1UDHEOCQ/GQsJFR9Y3IdQ3mG7lBCzoxktbK7SK/
	 LigtL88s3gy+erkLYwWwoOw1WjypILXDBOAg/ZJVdIE4wy5tj0OKKeIW5nQiOe0k5Dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792563572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qdUu1szpQekOZsfJ9CcT9YSdrlIWQWHNda84NHrxk9o=;
	b=jR+b82qWTFa2+l2yxMFcBYIqag9+0MCMfwbVepvJHi7UtTbAidullR2VU4ztZ872pFDY
	 AcsU3JaPxODTAowpY7OeZaB8+xOCj2aVUanoKfEC0kmfrYM+9IdsqciUxbDTgzcnqgmzL
	 4fspvIFEP+J0VZHotW5ELGbdkd0o0viD5hTXlOb0EyBtaf4TduMEPGb8nm+FapmYg/Y+b
	 eXTUkjAv4g9urSnB/Ae2nf+QnKoxChwSo/FoVkBAV9Y038eBKxGXmg44zYO/n/M4qVeRB
	 KNWBfQimTfT84g5f+MgZ32rlnvRNxrBH9dZLPuvAKIEjViWscJJSUIn6QnRynjX2Oew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792563572;
	bh=qdUu1szpQekOZsfJ9CcT9YSdrlIWQWHNda84NHrxk9o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HF0N/mn1PBJnFuUzqQMuy8j1WT9jFGrah4Hq3X/CRjW0Kt8PQe30PQ/7GI8Ijcocp
	 4saQVbxZxw2K2PSux6oxlYveY6IJEr7f0aGhCMDMwxPsBPeBxX2XFq+XpzJJF7Cc2R
	 cbyGpgs8v9aWfQP8efEUMuJbR7x7jB7ygpj9yCRO4UBDDu7//lWN43qb5t5D8KIJQj
	 HCd4yLnpkScSNQtBWP9MXAfaBPC1h4UBhRw6VcuPb8x903e/vOWNaCPKrVOVVQGbEb
	 5dV0b4QsnNvVRTeISmTHbKCsYYeMdXrjuh4dBeoHx+0wO9v2klXYcIwtMDCj9TcYGL
	 C9VdE9gb5btNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFE05810DD;
	Wed, 21 Oct 2026 06:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7785F3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 06:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DB4B400F8
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 06:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqItKLfKcK68 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 06:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3617D40060
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792563570;
 b=dSkc7gDPKVcWMFz+67H7uGVn4JGbPED/W0nwngbubOARuuXcxulCnOvlal3r+Zvnij/h
 GjYczAi4ILkuLeMW280ToxqWIki64V/bpmosEuWRgZ/cpT58v1+5U+v7D9RELPz0o8b/M
 W4sW0f9dWBmcnv6qX6TYH9vG90fAAwKeOV4Grp4aGlwwAxRingdfx67Zyf6lnYh3yh2QB
 hFQaU5CIDUtGI1j4V8fYcgt04676RcNWkoqwYrxdnBAOJBMZppTzPVkG6dO8e67JvHm3P
 +JUJjechjvqBzCbm6B4UYndoWF0SyGM3vZKeD1o78TXUmSapUzpnUuSoz4Xl0wnapkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792563570;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=cFsFu/CkqrNU5r8+rimtKAKMyVPzugybzYp6WNT3pfY=;
 b=Ao9JFGgZZNS+2U0m4z8O0whHGL5Jv0208aDIAqbTbZdzzbrEyby15nPFnhoI5F9QMCR9
 klZjEq/OwgFQAwxlq0iIsjgbADAC9xI1ntG6FokaGDHMCwLoWpOQTokQWJA4hpUxbg9WE
 3FBI9xo2JwUL6s8H3Gfait3USEZPxMg3bGG0yZmuRUeOczeF27qQVIS+RzjRxDlHFuMif
 JCC/wKVvpJVR8QX7nlvrOxibHv81+b1kkPx1upyQSBYrycmx6HiiLqphgu267fB1nO8pl
 MswORmHv67rqZPQzgzjwQ9DQfwCTs+Wvn4aoYmMgKZLrm+d8d0dE2prvcsrBo1fXbug==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=B3dYPyCJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=B3dYPyCJ
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3617D40060
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 06:19:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso2168545e9.3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792563566; x=1793168366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cFsFu/CkqrNU5r8+rimtKAKMyVPzugybzYp6WNT3pfY=;
 b=B3dYPyCJw31FyblCJbegfoxR1l6vYZZs3AJ7H8pfyi8b8f8hkKXeq7mX5aKZE8J82x
 4o0NB7sWH1ttbK0weaY5GwElSig1oxAJe+dYzwsKpa2di5zjpDIad30k5NXE2XFFQy6T
 oO1PMxastkyrWxyvF7B+We+73QYXhpKG1tbm51mp7yKbPn52EMfcxwRc5li8LcMLONtK
 YqrXYov9d7TxyvkbyIIIC5dpFgQbvuFYm0f2diq/Zz1ra5KmIh1EtURxyfb4eNvOMH5x
 orwFwKpKK89OUgJTcIagF7nXx5D/zGOZKPGhWoj9D81OBpU+uWtV4iRkeHVWdlikltv4
 ebmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792563566; x=1793168366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cFsFu/CkqrNU5r8+rimtKAKMyVPzugybzYp6WNT3pfY=;
 b=1MufX3ztHFIW0y06kKfy73C1MZ6SdqkmJjUL5SiM4XChTurfEXFz9JGgBmwkawFb7S
 kEnbExAhnHonO4BDXT/i/AnRsYlkZ/DgGz6SWUU4p5qLVBJZvx1/7xTqilRXWo28/RFj
 prAW5/rYRurJMWvQSsYOOmiGcCUNLxiGTeWdd1CQhhjFewIN/odUQsjA2LdQV28+AKxX
 2Rik9NUPMhPljKde2AROTOK668tzHbdIJbuWrDHdiylBXqkC0EBjnGxFXTYN6np91GFR
 P7A++Y9H/ruQYVO69K/g6vu7A1DK+ZkbIEX5yPPsDUBvumi1gbB5ntSwG7CoyIZTHx47
 dRuA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhpyQvDv8iqV3TQZkwm0gjizKKn/QW3zBgQoaEj5AM0gRrX10jUVd6iX5d69pwi/xQpe6biqnXV8c=@buildroot.org
X-Gm-Message-State: AFq9FYIyiKANOE3iPZfZIEqFpJ2PN/uKpAa38NPdT/a6xCcKwFPSGsnF
 8uaU25Q+rCc1D6OqQXt8S8tCgOjWYKK2RCQXnDTcDyWWLMs/JA+Nz4+NeaSqkvPd7Uc=
X-Gm-Gg: AYBFou15JR10iXAVhGareF0ZqQZOoEfeTIetLUW+oyTO5fSuN+8aH5HPj4C/+GrFwEq
 AlFzNzqDqk/1hNK3jaSA4TnrYOhmM6Jx7s3NarVRCwDNbOIh8DgoMJs79OiwksIZh3H45gbaBkA
 uDoXYHe68GEbmcwLWNb17PearBmn8nsDoOLzPqTa356Lzz9DRyQsQZ/KoYa3HHpLTR1823Zi+cY
 EcujTihL5T10d3Vb+QFAgT6VVLh01QYe9kEhIodmaNU1OiHtYDckpfXNYesybbMIt9xjVTD6lVp
 CYGLGBv1JwK2MEr0/OuX4s004amx7iUiKZAOWG/sle5OP/API0J+83bdy6UUnv1CWRlp26qe5wo
 NCwzA5DzS6rPvoYRkTjXQcdy3AVtLLoRmPliFVysi2PlDQgv1vy3u7jVXqMcicoKLBGBPfVnTLG
 RJerPW3kbvFExAi7meWM81Pdn6qjN8CtxwPO3+/IdjzINg0QoDQ985kgvtSX3y/6Pzc+0weVcly
 f5kgLj2bTrQONogz+Z+pNkqM9dOFFDx7xyVv1vHbjcGVljSV/pBMV/s02YKwLYCQqWeGJy11yU3
 TkZ/G4UPkPCC9oX3zsRACQUzHXPO/w==
X-Received: by 2002:a05:600c:310b:b0:4a1:e7c2:9f48 with SMTP id
 5b1f17b1804b1-4a1fdaef8c6mr18373695e9.10.1792563565821; 
 Tue, 20 Oct 2026 23:19:25 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2ca3597sm125682305e9.2.2026.10.20.23.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 23:19:25 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Wed, 21 Oct 2026 09:19:20 +0300
Message-ID: <20261021061921.7401-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atZQYQamSfa5wqAN@windsurf>
References: <atZQYQamSfa5wqAN@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/2] package/python-snappy: bump version
 to 0.7.2
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 8:17 PM, Thomas Petazzoni wrote:
>On Fri, Oct 16, 2026 at 03:32:58PM +0300, Flaviu Nistor wrote:
>
>> -PYTHON_SNAPPY_VERSION = 0.6.1
>> -PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>> +PYTHON_SNAPPY_VERSION = 0.7.2
>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
>> +PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
>> -PYTHON_SNAPPY_DEPENDENCIES = snappy
>> +PYTHON_SNAPPY_DEPENDENCIES = host-python-cramjam python-cramjam
>
>It's a bit annoying to pull in host-python-cramjam for no other reason
>than making the dependency check happy. So instead I've changed to use:

Indeed it is annoying and does not make a lot of sense. I could not
find a workaround for the build error, so thank you for your solution.
I did not think of it, but it is nice to learn something now.

Best regards,
Flaviu Nistor
>
>PYTHON_SNAPPY_BUILD_OPTS = --skip-dependency-check
>
>and drop the two dependencies. python-cramjam becomes a pure runtime
>dependency. Verified by running your test in PATCH 2/2.
>
>Applied with this change (and a reworded commit log), thanks!
>
>Thomas
>-- 
>Thomas Petazzoni, co-owner and CEO, Bootlin
>Embedded Linux and Kernel engineering and training
>https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
