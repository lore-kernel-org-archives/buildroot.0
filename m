Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C403606A338
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MVTKtxXJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C0181AAD;
	Fri,  6 Nov 2026 16:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1re0rk0HisjE; Fri,  6 Nov 2026 16:11:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B3FC81B53
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981501;
	b=KdHMP1A4fEl6RoawIeLlpPo6Qbkzls+qXLloKA1tSwKrJHSjkw7urfbcLZA1y0InjE7e
	 /RX/6c5JSsYa03a9eqx6i7TGHIY1n1LJgJ3y0jp9xcaKAxcedwEvM+Yim8clzawNtnV44
	 A63nBnu2bqbmBVWrrr31DngeenmJQ5+hsDB5jOhdCA8s3OJGRfzNrIq6hYJBjqAz/lWeF
	 TWlZcL+qa4M+ZpIEHXD4YGEE4VmHhMtqM0jHBwrGgSNOHtkC6gi9ECnkyHxl7kSRbGQaJ
	 1ckydyJRB9LDp2o6SPJ8FXgcC1ZE00sCA6RfWYhcfh5z4LrH+w/DL4zklvy2ynr7GFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3vvzBe3/n2KKIQccP+CbT7x3K/bUyUYhhhl+YV0kD/I=;
	b=CUXWt0xvm1gY4Z/Ve/6QnzuX1PK6Eedp73o1Dk6ftAyC4AyoKnU5dp7jjcfOFimmPvwv
	 nOpXo+WfBcWtngbHNGhIZ85IjK888m6H2AxDbvYBvn1UpRP0Qwjwu+9KYXRrEqaFZxzUf
	 3dmqMFfkFF7ufExxKlJCibXdy0kKOX9XfKXdP5hfYiIxxBygR4KpmZrG7Z9AVYwGnz5h0
	 oZo2J8NOGk5Slhz5dAJuzU5vgJ90eT2IoYyhKSTGfs+vN4aM0D2HNP9/UDGbL4PHk5rj5
	 7xGUOuxj0yye8mNTvyQpnsggnaBCzF6i3dul5RiaZoJHi8yjf88ck9ggRC7kE2PTjig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981501;
	bh=3vvzBe3/n2KKIQccP+CbT7x3K/bUyUYhhhl+YV0kD/I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MVTKtxXJA/IURCOpdEyQf7yekLqE6hW15QSfzHXvH9euWIL8rsG10aaCdhdasRb1V
	 4uIIUuiWcq5T32hbe3IFBMvebnf4B5PFwUcuRKHR5u1g4QMKon72hTlexiEZeZoTJ9
	 1HxXzF6Lx2zUH0SdFLrBDc7O77HMnQLWJ+oiD9izrH8l8hDAJiT33RH70u6w4OiIb4
	 xAM/caOHEjhY4/Fx6lLlF04wrWhYOvmXAuziaMywPuDjtFV3RrOW3bZeMAMN1AoihN
	 B9JY+AsG5PENE+cvLFXn1Sx7pHLCIKDlPlaKxjb8O/BLYjCeVsZ9+grgsryEFk1gHe
	 pQlIxbkE4MupQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B3FC81B53;
	Fri,  6 Nov 2026 16:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 270672E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24CC7403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4MpJDGdLj6F for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 043E8400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 043E8400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so676808f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981497; x=1794586297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xVubq3V+7Nq/zBuKI6dIen8z74GDZRVdwqa/JF9VNC8=;
 b=uKYhRNHpvUWbz6PiymjNm4clMIWQpqrdGDpR3EGwiJW+dM/XfdljAfrGh66uVzL0v/
 h63sfsJZWrHlzdQ/lFSme3k6LvjWpVMDStxf6wGOiDJiABlSRyAXOscgIKMFYQEp4uUI
 L9Ut1fXG8s/VIwCrt8NDTGluCAZlKa7hKnmz302iVoIAD6ipYCg/sV+T4ENs2ocZT2TL
 Ujyh+iJym9u46ac4zTRbhD4jHeiQoEtXakTJR/tF4VxxXLbNBSCM0JCF2qB86o/+grCm
 wNwWOnX9HFzS7rYM93W+3uKa4zr+ldrw9zGb4UtiuSOlWuRi4N0rTohqIldZJVsHYnQB
 eDJw==
X-Gm-Message-State: APuU4Z+vefsMrNfopFbvz2ttGaz2NFN5rAD4oJcKBROnmDGVGdHfVvGl
 HnzprmanpC5runnDLdK+7BPCFNegMNZU8Y+ZNIMbGLoKaQ1hQ7pq8t0j4GIKxt9ghYKi5xIkWMh
 M9ysab6c=
X-Gm-Gg: AYBFou0cLQBETTwcvMgzxWNQyrtzbEI+G838nw15ruSCAVyy8D0tr+EVhy8Sqb2cMvv
 Nltd4HsoXWkwrbokMY4V+h+YxVUy01mHxU9GRk6bxoyprA+ovy1OhqpvkuKDYU788r9wJeIzP4A
 Lt6nNf1k5/E4Xsh0flJzcVdD3a5FN+CGFYObLNO6c8bDXqrg/FYrh61E+HUuzyiNE8rhOZ4m4DI
 rx8VDcya004kYzXQWpD4g+3vUsRENtua/ZpCvqDzPEvZdwXrDg2UH/Pcc1fpvs1aoeDfuz8zlOa
 1eGbmp/8Zgj/JRHUMsvQN1kTCk7Os9kWPrJxEiaI9THe4V8fvJKdqc73hDAGsy3M0/jxQ+ZLpIM
 IkNSVPa+ZzciRH862bB/oQzGoxm68Gombn2XTR2wvcj1s3JZOGEvSpJcr1oh6Pp8pnL9szQBbsA
 5QwltGaCUh77dJg/Sr3XkYm+2Rni2lKihWMMRy/OIAN47mkYXQ6GDjnjMytInIaLG+uaHzZsYX0
 17q/MAr5fRgFvbetRyGipEhWOEWNrWljwid1vdVk07b20bo46iOvMC88l35EaieUMXtdzWIWCPK
 uENB12zfyuxqRl3oLbdIHPJvz+sZeYU=
X-Received: by 2002:a05:6000:4714:b0:48e:3484:8af2 with SMTP id
 ffacd0b85a97d-4911ad39ce7mr12145812f8f.31.1793981496774; 
 Fri, 06 Nov 2026 08:11:36 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7cc5f11sm4220430f8f.49.2026.11.06.08.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:36 -0800 (PST)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:33 +0100
Message-ID: <20261106161135.608168-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102174815.17205-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2026.08.x] package/python-django:
 security bump to v6.0.9
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> See the release notes:
> https://docs.djangoproject.com/en/6.0/releases/6.0.7/
> https://docs.djangoproject.com/en/6.0/releases/6.0.8/
> https://docs.djangoproject.com/en/6.0/releases/6.0.9/
> 
> This fixes the following vulnerabilities:
> 
> 6.0.7:
> - CVE-2026-48588: Potential exposure of private data via cached
>                   Set-Cookie response
> - CVE-2026-53877: Heap buffer over-read in GDALRaster
> - CVE-2026-53878: Header injection possibility since DomainNameValidator
>                   accepted newlines in input
> 
> 6.0.8:
> - CVE-2026-15307: Server-side file-write and request forgery via spatial
>                   lookups
> - CVE-2026-15337: Potential denial-of-service vulnerability in
>                   check_for_language()
> - CVE-2026-15830: Potential denial-of-service vulnerability via nested
>                   geometry collections
> - CVE-2026-15920: Potential cross-site scripting via URLField values in
>                   the admin
> 
> 6.0.9:
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

Applied to 2026.08.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 993b7b0d68..509c8b3acd 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
> -sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
> +md5  9ad29872db08c9fcedd1a7d4cb2b11da  django-6.0.9.tar.gz
> +sha256  8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f  django-6.0.9.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 764e72084c..ce4552a356 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 6.0.6
> +PYTHON_DJANGO_VERSION = 6.0.9
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
