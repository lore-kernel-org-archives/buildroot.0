Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C3606A33E
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nwaF99kI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BD340CFD;
	Fri, 20 Nov 2026 10:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8l_Ly-uHcfa; Fri, 20 Nov 2026 10:00:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 57A9240D5C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168817;
	b=kfDx5YUdq22qzbv1NGJx9XAMRHZ26Lt9yyBs0w1wv7qdsBI3oJ1XYFJE6+2nG0g4I1g3
	 dFd+CKzCZnyb4fr03FhLAa6iMAMth79f/DP1fKkCzvGiLgeUNllMBohBe65QCLtOHzGC7
	 KJ2fYSrXMssOtQzHc4BcQ1f6gtuFb8q21IPjQT1+2wXeus1yKnXKf5O9G7Hiq6A/U7nzg
	 YgpAz0yOPuxZFlsfrvdT79AZeeHV19jolY5vjdzaIPN4gB3iG9YxIZEpBVQDoy0W2HnIx
	 lrrzCORke2HRWGcsSm/Ay4Co0q1q+HM1DM6DUOC16o9b3n6BvZWsXJ2dq/7j8dgBZXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=v/g8NOqsXnlT0LH4XknJNWP7mN9AJ7JzJGCT9ylVSP8=;
	b=YGLaMnWeE8LyvathVddcFesgZSyoQH1kAOJsIyManXRzbu6DA0dKka4wpjSDIffIgt/E
	 wY5Qf61Lre23K5xk2Ro05QOEUMRbIuRx9oEP4+KbXnOuUzUrM3AMT5t3TAqZbz5Bdyczf
	 5eyYExCIgO7x/XU2WzGl4A40z4wekYaXDP5EL941SgupDeZ4oE/KHfY+/5Kk9Jz87pxZM
	 btxo5z8qKwmHct7HJmzszboUJNCPZN9CCF0kk8pTPPBxk/EajNakNELW60LmRKtTA0Icm
	 uenCBPbrqP7l6sYdmyl2Gn+YL+Jyspu8CvjpjvpqVXRpk0h2X8xpMMJfwrpxEjWD3GA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168817;
	bh=v/g8NOqsXnlT0LH4XknJNWP7mN9AJ7JzJGCT9ylVSP8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nwaF99kI8O5nU6l9S/XOkVFpVTic84rCh7ybubOZt80Dn8XkuCqciiXpZBwq95iuT
	 RoGOTaNkvwWlHHfWIMqHqAoF3J6l6Gco7aywEmRdSZJT/DHkxMwZo/VqFqSfn5wz4b
	 5Fcuh6OJMnUV0KidwfQQZWzhVqfNjnCXcsA+L/jQNX2HiD04cyCBc8ld0ouEg5vLev
	 1CFDk1PsaPkTlGZYD3FOiguHriST4yKyYCL+i5G1MvuUXvdcIGqDuYPbiWerEyzn9e
	 lCtvGz0m+YxKT/8kT9DseTlyIxtYrfm6D9i1bTDCA7v+yfAb9Ix0wsC0PibU0vWwec
	 kHCAJHa6twdDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A9240D5C;
	Fri, 20 Nov 2026 10:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3E45E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99BC4400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqKYmISjiC9I for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 681124016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 681124016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso6144375e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168812; x=1795773612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JHOodjZbwN1ichajMAykQJKG1AFnpyTWHt5daTjBUck=;
 b=yAZ9UIZk1+E5KbRfDBPT9WshonSr2m1gaAvgUUI3hjWgr0wyd5WMf3c4wESiJunULl
 gzt079IUx/ObD8+HHFTI8L00+fLuOix0rfTQ1ZxX8j/Pr4n/hBCtViFpsOyvlkIYWwkq
 5pF7/7SacZWPF4aXSIuRTMBgfO11gK1fBYZ33A6L9/rUKn/XHB4n7oh56yIzJuCYOOIt
 hIo+ptl7bEH9sCv/qpsJAfzeIdoxTrgyjYgO+/idUnybskfaveObU1cMeE38hwWtWE0M
 LVcO1+kg3Wi1iWoPzCuwoJNySq2mwguRU9kV4YO8mBLiFf/J+xHSumFKRXLqmqevAlMs
 duQQ==
X-Gm-Message-State: APuU4Z8A5ZaMFNV7ViDMcgR+kgu+v34xVhL+8p2psTImk6Bd5prZyviB
 VlvpmH/Q3YTdaa0gT+nePN7Rd7Tm2aL5s6CUo9fX/WywTUBegvo1PirnX1xRd0t3oiDPnxIF/W/
 PZh7xfsWSug==
X-Gm-Gg: AYBFou23h6j9PJ7+DafvDrt3EXOOb2Oijg2QuG33oWJgojXKwtuj4GezBALbyMFGXMR
 HX/VYwFjt1FPe34cwq4+FziGNNTEw1d0/hf+4gZJaFfI+UFFDkmMFjWOZOXgCw3r5uAxoGP+Vou
 6UvYz3FWNFbOwxhXPXUPy91++crVyqeAWMu5ZXtBpFawJqWwu7j99TWlRM4w/HxFLgsgfYk8JUI
 rIa341B339TsRwJ0CXl4qhwWeQz3A1QfjunIzWCtpArl46bxjfz5CI2nGQgBiPJTbcL8g5QM/5r
 rYVfvFKUljNIpVxnhidxdEJpnu6HEPE/LgeBd0D/9hvCKZ9TUDORPIQgss/Gmz9sPmcKEHhw2Nh
 e7aP8qNb6XK8E4DO7OBxtLuq69MNnImwXbLqGO3QAVVr7FQ1wjR90Ncxvzg8PJmWYGX27bgGbc5
 mxs7CGqj/yq+Cxfdm0R96XH5xFhaDlKs9R/W/G7ik2zaMh0HmJa0O6lCXyDugltF3hZyyWiONcf
 ZUsm52Al0TOfgdOlGzG4XhoIYcYgAZ+Kw7f4whHTcBlqZWbeKJtisMVIYEi3yysPRJFUyFFho5c
 PfNrMPr/25B5UZCR0M89XEBgPJqrKJGB+rnk7opWzlW/Wg==
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id
 5b1f17b1804b1-4bb8881f47emr54350545e9.25.1795168811859; 
 Fri, 20 Nov 2026 02:00:11 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm63178305e9.9.2026.11.20.02.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:11 -0800 (PST)
To: buildroot@buildroot.org,
	Maxime Leroy <maxime@leroys.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:06 +0100
Message-ID: <20261120100010.541315-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113141742.209508-1-maxime@leroys.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dpdk: security bump to version
 25.11.4
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> See the release note of the new versions:
> - https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id4
> - https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id7
> 
> Fixes the following CVEs:
> - CVE-2026-86561
> - CVE-2026-86562
> - CVE-2026-86563
> - CVE-2026-86565
> - CVE-2026-86566
> - CVE-2026-86567
> - CVE-2026-86845
> - CVE-2026-86846
> - CVE-2026-86847
> - CVE-2026-86848
> - CVE-2026-86849
> - CVE-2026-86856
> - CVE-2026-93683
> - CVE-2026-100236
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to 2026.08.x. Thanks

> ---
> Tested in GitLab CI (all jobs passed):
>  https://gitlab.com/maxime-leroy/buildroot/-/pipelines/3063567560
> 
>  package/dpdk/dpdk.hash | 2 +-
>  package/dpdk/dpdk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
> index adafe2dac6..f5197a7c51 100644
> --- a/package/dpdk/dpdk.hash
> +++ b/package/dpdk/dpdk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  418bfe3212640ee95a1cb10af6ed360cad2387686fe2721f8a3a9cd02d5ef4f2  dpdk-25.11.2.tar.xz
> +sha256  50272f214b2e7fd23dc9b6b4d5408b54798021b19611339298784faa5a189b43  dpdk-25.11.4.tar.xz
>  sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
>  sha256  ec514554f1b9e90c4f55167267c22da9d511f884877c32a5b18bee6b7c8b18cd  license/exceptions.txt
>  sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> index 968a5a877d..e624eab62f 100644
> --- a/package/dpdk/dpdk.mk
> +++ b/package/dpdk/dpdk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DPDK_VERSION = 25.11.2
> +DPDK_VERSION = 25.11.4
>  DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
>  DPDK_SITE = https://fast.dpdk.org/rel
>  DPDK_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
