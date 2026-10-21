Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061CC606A31F
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=el91P1iN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KMu1RRPN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB44F81E7D;
	Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPmYa8BytmTi; Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC59E81CA0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614868;
	b=doisAi775Two5tjZFffiARxGhORdRxyy+HnAr9s/AO3VKpMJ2W0Y1rvaFTBjHu2mlqJo
	 ncVDWRznwXyHGejY4yZ9I7BT8q0s6T3WvtpnFuT9JgxPy/batFIkHfmbb+5a2hbC7AW5j
	 uCDPfD6f8lCZRTi1BmaDdBSwbOKmazMgVXbwp1uYvui/1M+4Cy2g7+USq7kMpf4zZNxlm
	 P5ZXBGohETG/HccriRzvZKYLulfnSUpXH4BAq9WOQLpu9eal1eWeoF2h0W7agD8uYIDXn
	 vexHvakpLtn46G2OUHmsdfr37turBQIqmfwDhxWLerchErVbDMdlu8BMG6RNcbIcIcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=zpO/FiNkqlWUB7D2VkvvoYw1sVF+iBikuw/GrQhqYpI=;
	b=PKMxb+QXkEEsrxTvc/b4Of+LZXMOcNK8jT1so1ofdZlM0nNSFZh518R4BcIxMOhNlHhL
	 KRZk9Wdo8AEP3X3R7miqWMS9Sxx1uR0bdtK/nWvgHS1sQ0MvQaFb8QgryQO4VVhRYiRaT
	 BfxgbRg/iBGrCg98ZOc6WmmdlzL/RPxe5qyFUWaIEYM85bM6pEed5WnxEuC3IirZPQBhE
	 jl2PfbEqQkRDKcgyIyx1T4uQxQMH0M6jQnbNYE4OzNPkmKQkRjx9CeiCox/Y+vvnR2OLG
	 fWGTpMxwyp74hJi0DzA5xPzKxn+uVd6A4KGs8OVhY/Zim6CUhTei8jz03TJapASM2LQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KMu1RRPN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614867;
	bh=zpO/FiNkqlWUB7D2VkvvoYw1sVF+iBikuw/GrQhqYpI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=el91P1iNkWyloi37j0wBUsb6WhZHgr9ymEHRiwgJUya19j1MZRgV7AkK08OKXBmc7
	 PdEaYi6jvSDnBbYnElNUaAzkli7D+9kistlLq38OAAfve8HLZU3ylRVTVNdZhVjreD
	 ocdMGu4aefKNlvgwjkOTcdLN2P15ma3fFUT/IizxTUYgbPk9NYx7WaHgr9SKy+hHXJ
	 5bPkhBcWggQn8FJ/IvkLJVfYNInpNHBhjKxazorpzHVXIhDveiHQTdxNQ9qzcXrp5h
	 BsuiqrVDyRSec3u4aulv9lRDJgZrj6J5GpTZZfs1WIXLw2oA4B1FNpF0PXKt5G4YFV
	 Rbd624rzY4kJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC59E81CA0;
	Wed, 21 Oct 2026 20:34:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9D83A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D237C817D3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPSlbMrqWu6a for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C0BD817AB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614859;
 b=CeCnasNqmWtCFn/9L7erv8INxroWpcx++NumLhKkAkumQ7qcgkeAtJ5cNNsM/nNsevCC
 u+zqpVRQ/LbIfRI5Din6SeDOjZFV69mTLoRv8VH+JrkqwAqEK6KvxFVnq40jIZHxIHENb
 I1eDm40vP75+gef8MSLINoeSdoSwZ5wmwunVagtH/RyLOxYEn7LVnbIyvVeIi6PyrPpdU
 pUolsPBteTFep0M/49bgE+IEsB5g9IUaDvQY715c6FD07YB6iDbnCjALc35WcZViTV/da
 MALO7j5yqb8sdV0YEE05h12aUqXErDVCwHXcr343fOAW88lk2do7GGoyeyXb8dk6GeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614859;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=0UtSHjupbEhaIlOHm2WNjdo8VS0t8YfTsYSlPuwhFug=;
 b=Qr+zBZCX41F3YPS2GZn4gAL++52+T8Z9y3GLMAtbRK5SOQALvwHolv1EZjX30+cu/a2s
 lUD2AYzfDvxeWarIFA+QdG3WgPrurWT+94e2hekKvb4GTS8udoPcYBKR70DAlS9WRf7ps
 JxmqUOq4Sn2uBns5ZbTcCijNd5rrNPiNILELKiw03bnhG3aY+Dqmo1ohBw+BKOo+WQM4o
 uXXlwZR7xvGy6qg7dOwhhF6KFdPlRW5/r3JUfcjFHyDhPO4zOzejj0Xmi/cp0xUjqjahk
 IQtKv6QN78hEu8/jrUZm4SIgspRFaVbwGo6DOiBEbf9fO+VaKp4G7hiw3E7d0eiBhKw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KMu1RRPN; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KMu1RRPN
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0BD817AB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-843ea301d60so813112a34.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614858; x=1793219658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0UtSHjupbEhaIlOHm2WNjdo8VS0t8YfTsYSlPuwhFug=;
 b=KMu1RRPNfJS94Auyezl4+imxbYn3nHsoKez+lq9l3iNbijxJ0rMlBxD9ViTZ6xBM8W
 VorspA0mFtjlVysNtyP/yYHXqOi04XuRywX+RIvdJ2h/1vFU+8pFr9wmkHoyKYXLIwQq
 G1hI702ZrESej0e8uXSE7sy4/9TdXoblDpkD0dV960xdc3JlGW62P3hpWr0ylXw1noh0
 +a6hQarpF/hmDOFszHVDT8leX53jedzf4bzzGIPc1csnjCIVf4eWfoseUYZczJCMY9OX
 Y0bzd3BWl5JWKUz1XxUwz4L0y7LNdxpWgY/pbtGBc97QvVQSD/4mbDwxLw7SVzAwoPzT
 QLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614858; x=1793219658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0UtSHjupbEhaIlOHm2WNjdo8VS0t8YfTsYSlPuwhFug=;
 b=EdaNNR6isVO3MO9HcvFAJ7pZHqiRAJFuYwG/PphkCp8tHDZs0VtKid35eGiHfAyJXq
 xyFyvItuU8raGtXX8Xl3/aR04+PYCs19v4h8ehlgdl6v02VRlLMU7t+KUqHcvG+Hbn10
 SKRJ/YKNjgMMFGcavG+rsLLvyL5swEVXguf2JhihM0k9/BwSedh8TGHX8tXYg4GJVinP
 0e0Gq8NUDNcIm+MRFyzmOkVlRbuyj0AyXluxzw26Kczg+f7tjnbcFIPLZLL7Xxg61g+5
 Pn8Y7PntpdRFmfs32nSSLD9wiNKA4znsUHrB6Gr9gyeNP2Dc+2mHPBKR8qg3LOFts7D3
 B8BQ==
X-Gm-Message-State: AFq9FYKjZOboJSk96Zq8s4VWxWArSV33RaMnntW2sBfvJu9Cvga+NfyL
 BYTRV+NqC4VlbhBHyQIi8I8IidjxlLlDfbrrfFu76hclCotfTtRpDGvoaMwADg==
X-Gm-Gg: AYBFou2oA5ZZSkc+Vu/xxUjG2AC3SrdTzTXk3MpBWlbtczf3zxQHgBSSK1w8HDk1vhS
 GYK3+Ha0GBY/xyyS7cT1pQCX5JHwNSEODPU3HsAQiVWWpc7sbXhS6yfQvVb+taho+kbh63YSKDu
 G72vouYbotpeOYIv7iIffTAWx9E7b+YDB64wmCUg1fJKwb2cps2qj/ZdKxaKIQHoWPWJ4Xrk/DZ
 RXcjPwnljVqPo0/ixjD6C2UyF7rdUbeeh7NN7Evq2yxUPZe4TWvGPvkX8UUXEYiryeuzJZv5fuK
 Ks+uRGyVm3UZ9tpeod+IkJ0KOS5c/urunnPHkTKcsG/QZmRQJpWqKZPahgixQ4ptXuOvOKCruNB
 fhomYfD6Du+MUsf7UFR27NhR5WyVGqTpNEKvVRc5AQfle48kcl+EvTYVRit3vzlS31e9V5wHoXw
 c5h+LA6fh5TS1StjH0FNG2QXbBhR/KOBskJzn11h1ihUKLeGt0iGU9tHJCBw8w4LFb2eXOOpqOG
 alh06kPCABmKzLCz/7J8A3KFtZ8R3N+WcK7Xg6v9nPSIEwt4b1uoPiooITZaPjPeIqFpAbeHqcn
 /Fst1ad00En9aHaAvSJRsPBaTPi5PQ/ufGNkcZJydYiWRVnXDCZjb0nWm9BJWAfU7OQtzUhK42F
 45EO3Wn6SFeUCmuWiDREL4oJ8CizSFMQOaNKeDWWeiFk9pSiExBYb4qM+3s0Pg7BYrk5y+5Txps
 FgccGXAGCpbPvUcHDbYqqRrIg=
X-Received: by 2002:a05:6808:1645:b0:4f4:e649:b99d with SMTP id
 5614622812f47-5535af1c0edmr2356183b6e.52.1792614857826; 
 Wed, 21 Oct 2026 13:34:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:01 -0600
Message-ID: <20261021203410.3114473-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 07/16] package/python-pygments: add host
 variant
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
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Enable a host variant for host-python-rich, needed by the Typer
dependency of host-python-jaraco-text.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 1b14b56d8c..eb7d696f5e 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -14,3 +14,4 @@ PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
 PYTHON_PYGMENTS_SETUP_TYPE = hatch
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
