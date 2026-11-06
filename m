Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0DE606A33B
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GD3erDFm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB812818EC;
	Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Emp0ZCQWOPJd; Fri,  6 Nov 2026 16:09:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 07112818A1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981378;
	b=EjIB8k3k+tXN+OmgofdfgZPXHPWZjztfpdqmfpIYLcEfBGLIZA4Y4J9+8liYnWxXg7Mk
	 mLwNyGSXMnsWuxhzUM36SHTirkBAPmTjR8OIiOaZ8Ffi7ZZTt7z6Wl4K3mhDw9FCSWviU
	 A6dHL7UJNw9K1Efp2hQPsrY4IGK/iR7odwVHpyqgZjf3KLFgI9917oe1spLvtVR9xw9++
	 rsYUdtOdsx8RIbyNYhsJf8sKDV2/k5tt2NRmouXc2JBJLpN9rUMnZ0CPFDUS9dJkoH2R7
	 JKYMKZGwODF19wT1+R1VnfzxGUVz0y8hdeqF2zOXFh9VjVcQpzBkQ0cWWTOD6jBfDKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981378;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Np1+6yrPgfRgH7/sBTF5iv+DLnT4wpgBAogvQzWRbWQ=;
	b=WmAzxThSD8gZ65h+AeSnypR6w18deDMKgVRldlzYCWjZroHg866uSqu88Rs5K3TLGTw2
	 1Qc7pwcOwxI9dg+KhKGlgkLJ3rWQjw0SKaUmso8Eg5qMmszfJc/22TcWuU5f/B6osYyC/
	 G03LxJSKBitamPrOyj26HT/H7hgnhrfY9ID79Bu4oxTnk6ZUw58sQolPXWy7UeFcszVVU
	 UxjO8NNKLkHD6kydE2/SMMNpatnldqBAjX+7r4fXx0LcUQ6+YP8zt4g0VItYtCWpBzeF1
	 2tdaZYl2xtX1G0qWUEEl9TBDOY5l7uu9d8NfiKJ+IMkzMDso/3zPREOGa66JyC+nnXQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981378;
	bh=Np1+6yrPgfRgH7/sBTF5iv+DLnT4wpgBAogvQzWRbWQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GD3erDFmBvjCEKQ19FL0OtFKcSamc994LKgPVGVh/qr7po+moa5plWbnzavVy/F6B
	 gMoNqwccGlLxXMOjTsoPVNT8RVFHP4jslO3cPxBqBKX4YzslEvrxRphTe67xwD04e7
	 6poA3cjZYgilUQdVfDPnqYp2p7wgtlzcygO5nUOIUyV5DbsbbdGkQ0QCFhqfy8jGvq
	 FZGZhW9ZBj+OdzUS5p0YrQ7lWLxZ1y0gtqaKrfe6FqJCzJ8H72b9AWNeG4dzL0UKu3
	 CZKPvHkCFHAUc0L8RXVxVV343YtgYAAUa9UBVrb0/XHcewyS81ESYobWbHAiag+03j
	 GV+y+7FvWo/5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07112818A1;
	Fri,  6 Nov 2026 16:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0F94B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F392F403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1a-0aEcbpuk for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E3B14400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3B14400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so6549015e9.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981335; x=1794586135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mFTJfXmNQkKcw1n60jLrmFtjgbwKo84E4EZXyM7zDBk=;
 b=uLJVpzCBLrzBgeHs6O8DmYG2E8miVjS/3syRmjhIqaq9QkQz6fD3i3ml/m5qOVw9AE
 ri+i8Pgtigt4WhwF0AzwXxvFlxiYh7QrgYBE7GQjBuzfhywhFBUEnCedwiHh9RYXvgok
 nDw2kHBLeQJEV41xJsTQAxIb1GHCrlM31RJOnbnxWkAgWXLjtwVzWLppobOwMcFja0N8
 vr2AyZebkBRpMabEZc3ybXbem+Bx7LBduNgW2ifT1r2JHFu1h8iCec6rPIsIijZmidhA
 oxK6B1UH8FxT/dsgO/7CE7cmZQZRAYPJve8PE0eHiIfIcgvqfDPU0en75a25P9l5Gfx7
 ATyw==
X-Gm-Message-State: APuU4Z/ouQMFIUIqLGLrL1xfWmlXek5+ZLIsEsSHRRG2vywbE4qkCNZt
 gwkfELedjQvPcRBKfUq8Iz/HprmKDLOgFoQDIb+RJZt9JVEKQzFYeD4GHGW4ASzfm0TRI4SM5w+
 uljvKQvY=
X-Gm-Gg: AYBFou3j4joEwaOm+XLtWSs5/3q0XxDjrOVZr6UzpVMVrGLIoc8Gd/EZucff38lRtqb
 2TSZfgSRiSJ8de5EQnvShnyY1h+6C7tPHrhsfePIR21dNF9pXvWYKc70kNCbe+lcT2xE7Gpk9Ok
 AI+z/yrm/4HnTxqiHvXBQUkCSX6bZ0+RxaEMZ1zQRkloN2Yxh7ETNqOsBASbUiY/EOvyKcHLFQy
 9aWTDSlLlvMeDIiQICDCpRLrK7Q0a1KFsSVoTfhB6sEpofVBa0kc7kFzwCzRK9AonrI2kEszwyl
 Fvhg7lknwZHGhL0qnqSLTHwXhARIMd2QkiNgBLBEM6gDzntK6YjXY0HKmCPy3DLolKHy61FunGc
 zZvtNimkNT11frolgkE0h5KbnBf0+Xf5UkBBmMLSXoyqugt1vawvd7y82E3iGY5h7QGFRjFHcg+
 kxlh4CQbmJY9rJeftJAoYvwRyEZCRdy9c9A0B9YtoolULr4bV/FAcy3Ngjcnzr323M4leN3oHuO
 Bo7Mi6sdlCF770Cr2GxpXUFO5yFMXyUbP5mm2PAWYDlpU1vDX2Ao/8uOrsSaTvTweTpcyiX8pdU
 IJsikvbflcbtnYqm
X-Received: by 2002:a05:600c:1910:b0:4a1:7e76:d02f with SMTP id
 5b1f17b1804b1-4b6de4a6b88mr51196785e9.14.1793981335467; 
 Fri, 06 Nov 2026 08:08:55 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4932901d9c9sm3402349f8f.59.2026.11.06.08.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:08:54 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:08:51 +0100
Message-ID: <20261106160853.606854-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004201853.915471-3-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-platformdirs: bump to
 version 4.12.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-platformdirs/python-platformdirs.hash | 4 ++--
>  package/python-platformdirs/python-platformdirs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
> index a237667ad8..7f7590a6c8 100644
> --- a/package/python-platformdirs/python-platformdirs.hash
> +++ b/package/python-platformdirs/python-platformdirs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/platformdirs/json
> -md5  9d6b65f596852735dcdcb3109127d454  platformdirs-4.12.2.tar.gz
> -sha256  eab5f70271a490ef74618bb314fbb86e3c7e82fa3b9c922c2ea0e0a1a155d329  platformdirs-4.12.2.tar.gz
> +md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
> +sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
> diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
> index d3463254f4..9610dccc64 100644
> --- a/package/python-platformdirs/python-platformdirs.mk
> +++ b/package/python-platformdirs/python-platformdirs.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PLATFORMDIRS_VERSION = 4.12.2
> +PYTHON_PLATFORMDIRS_VERSION = 4.12.3
>  PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
> -PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/17/c8/721b3855fe457da514fe249247d404b9b39c5d16532278f70ebaa6acf18b
> +PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
>  PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
>  PYTHON_PLATFORMDIRS_LICENSE = MIT
>  PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
