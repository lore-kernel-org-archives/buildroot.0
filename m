Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A9606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SEQNYcrJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D3360AC0;
	Fri,  6 Nov 2026 16:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xF6IOTcbBTNO; Fri,  6 Nov 2026 16:11:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0181960AC3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981498;
	b=baQ9dAlFBQM+Bfj1TVEkdlP+iBOipv1wkPi6H52REfFVP7JLkBcB0SxaUTwgXyhEZwhY
	 UBsmTeyepkdLPK9/Z/gdpeqKOGRg+HjW5r8Y7gV6d8pC0Pf5fNLypa28Ngm571c4wBXnQ
	 5JRjhVJzZb+2y7pJE3lVBfspVAGbNdxfUq4CzGFgjZQZa/a9Czwq1qlvxQCOZWo7gK4uE
	 66rPkwxzLZ5yW6YIzN5weRCwc1l70WcgGPhfzXJkE4muLscCHY+NeS71lXvJrldQ71uyL
	 d4PnyhaI/1sZe34KQJn86NOqVaV+hv3t3a6/m1VqieUX90ugIq3WgB6ffNzAwZV0YnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KxIp/vOBnlMHQeUNaqwv9VDhfyDihaaEuUUdQXhhKsw=;
	b=T3BDBt8YoRy/7/kFxCkjo6aZ754oYrOr94kxFHopmijNNHf38vxxOBQLpPdxBh7TGSSq
	 GveNHGd6YkKeFvvSrQMZ4caTfd8mtk848b6BVz0JotzqIwXl6tAFcz0M08uHmq0EXelxX
	 aHoeY4P9TSegm4tk6wrUvNxTO/FskYhB5OarAFspTIEOCl25iwrOO+s5W/GoIrFMudFyC
	 nbz1PxkNXxZaksJ1wy3Ayt4dOkfjfwv8Ps6yCt5+PJTArRj1L1IW9CBqOSOQB3lVOoyN5
	 MK6yJCZw8EcldK/thXV2lbxkpcCaK1u99Ey+uILHpcw5Ur0SqB/BhCQVoDsRdJmgf9A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981498;
	bh=KxIp/vOBnlMHQeUNaqwv9VDhfyDihaaEuUUdQXhhKsw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SEQNYcrJdUyPyXW5s3JKQzezti6+dE0s/p2UJcSCRE6qOCsanEZ9xczreajmjhi9I
	 6/IKVALhctRCEuCWorkBZFCXlSBvHvK6MOB4E6D7TW0irGkImpIZImsSEV+JYqLxIY
	 d0vZAke+Ll2LwAqUXpYYQAu5GnFb6Z/OB/PvuNQCqQC8tqWreRotyFCdNUOLaBwvOP
	 hvwbiXO1FhHTgaLHXNqVI+x/dxBuB9kqQV2WLx+WCVDVT0EXEW0/i1jRjn0L5BDIq3
	 FX2B8daAMsMt+qx4C31fkYR1vv6Odl0gsro9J3gf+52gnjRrmJxI0J4muDSTZSI//E
	 2f+Y3vMNdcjfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0181960AC3;
	Fri,  6 Nov 2026 16:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E7D64B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50592403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvzzMJgQas6b for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1B02B400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B02B400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so10196595e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981493; x=1794586293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iApXncHAjR+8ulIyy6jl4O6TSErCn0EIZlGMV7btvr4=;
 b=pqY4SCZIcG2CSW8akqDrD9ogH6PchazzSHJoG0oYH0q98r3zDKDLBZfS4Uiaiu0INZ
 scHdabcfkYOODw2a/DDzCqsfsvgpDwb3qZrap/a5nxPNimoVG1r2SqPRHuYE/R1+8U8n
 JAxV5CZxtNCGGRyBPUMStVrq1Kqkgpi9iaWNeu4BLzDh3PqU3ThlP8UPwKFe/UnLD+rj
 DOZGuSwBsB0oODg22G4451rj7rmM9kfr3CmJ3VKvirzmAl3xIpOYoQlLUW6TOk6oPwFz
 qm8/Hb1Fx/9enP7kWkRPemWScF6F6ceNdYc2c+QPo1LnfpXx7CKJY+Am6WPVHUIbC/U7
 y6qA==
X-Gm-Message-State: APuU4Z9eh3WleoLD3ro5QiqCdavNDnXXKXKW6C0d5e4VG7MDf+7jKwLT
 IOwW1JQyEvak0pt1f5Ev2xnlxKThQCzbHYTIdNW/htzzVFPK7Th9yWSaIWXuX6oUcKTF/plZ6er
 QUtnP6j0=
X-Gm-Gg: AYBFou1eLCAv9TRjTYNfg+wEv+nVGAfbcsC7F7ubBdtFIBRdbRj9dCTo5fYslogtWtS
 w5HqJbHou0b/cl17aTduVz/FAGyC3+P8VB2uLUDkLEX1aCx+fSYi81aIntsAPyWDKceSnMi2mee
 QOkem5F1PpBx2N+nauT8/mSccQ4qbWdfElyELYCS3/wUkLyHTpzKKhfTsErUMmcEjH2SuXUaX/n
 0SDKIwl6vKfqNyOvJ76cT+Gwk0q+5MOfcDTyGT3pUGgX92pWm5MZZd48yLF9fXXtaIInhPtlYOC
 lMpYaufGtV6mbFfW+ehA4Gcl0/RNF2c2AzbfRFFaILjhUJdIaZIscpW1T3jzIrWyHP2ZX2kxST7
 QcLeGbt9bdO5hzHjWV4ClpS1SyqoBsKStw+7WXm6pSlYrDP6XDrG8F8M2RGMmSigwaOAsiCafvs
 6F6hMnMzMtfONg+2HRzGbPlMFZIcXUHFFYcjxH4oKbPkfV6YhsrtG1nQnC82nnh2dQEuLkOA75w
 MH5ak/VEHCn+W2AvkWqou+FfwxuA96pSldfstcVa8arN7noPmNEur7gt9dxb4eCY8zgHCn0e40r
 TaGdpLbm6zylFFi7Kja2yHR3QSQanfnL
X-Received: by 2002:a05:600c:190d:b0:4a3:59c7:f226 with SMTP id
 5b1f17b1804b1-4b6de4a5d67mr55552575e9.6.1793981493426; 
 Fri, 06 Nov 2026 08:11:33 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6ed5b8159sm64067655e9.2.2026.11.06.08.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:33 -0800 (PST)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:29 +0100
Message-ID: <20261106161131.608139-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102120152.1902999-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.2.18
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
> See the release notes:
> - https://docs.djangoproject.com/en/5.2/releases/5.2.16/
> - https://docs.djangoproject.com/en/5.2/releases/5.2.17/
> - https://docs.djangoproject.com/en/5.2/releases/5.2.18/
> 
> This fixes the following vulnerabilities:
> - CVE-2026-48588: Potential exposure of private data via cached Set-Cookie
>                   response
> - CVE-2026-53877: Heap buffer over-read in GDALRaster
> - CVE-2026-53878: Header injection possibility since DomainNameValidator
>                   accepted newlines in input
> - CVE-2026-15307: Server-side file-write and request forgery via spatial
>                   lookups
> - CVE-2026-15337: Potential denial-of-service vulnerability in
>                   check_for_language()
> - CVE-2026-15830: Potential denial-of-service vulnerability via nested
>                   geometry collections
> - CVE-2026-15920: Potential cross-site scripting via URLField values in
>                   the admin
> - CVE-2026-77050: Potential denial-of-service vulnerability in
>                   get_supported_language_variant()
> - CVE-2026-84429: Potential denial-of-service vulnerability in HTTP header
>                   parsing
> - CVE-2026-87890: Potential request forgery via spatial lookup byte values
> - CVE-2026-87975: Privilege abuse in model formsets with editable primary
>                   keys
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 8121d67796..9bb445877f 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  9db6f4aaaf130e3f53a4c5255c1b1bcd  django-5.2.15.tar.gz
> -sha256  5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7  django-5.2.15.tar.gz
> +md5  37d9504be21272595b91c2aa3ef4904c  django-5.2.18.tar.gz
> +sha256  461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d  django-5.2.18.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index cae4542099..a94853c518 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.15
> +PYTHON_DJANGO_VERSION = 5.2.18
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
>  PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
