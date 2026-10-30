Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76540606A334
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RJPyJH6F
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D4B40BD9;
	Fri, 30 Oct 2026 15:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjMRkR7S6WiC; Fri, 30 Oct 2026 15:26:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53ECE40BC1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373981;
	b=bYrzhz3te8Eb8PkuYn9und4emv7omHkO2i3i9zGzjt+6+xd6XIxiHlJ2EYbUv4m2hGzn
	 75tUpqZlFFgQHrRTeN5SDKc1u0CPgMx362updWuge9HbfTh3iJZFzqz5Ev7axyBCxszsS
	 HTvL1Pey31S98keyGJuiWLYtnmYF4XG1WywIVZe0OINm2TG70Oj6xSb/lbCcahK5asNUD
	 fFfJ0ifIUrUOg6es6uTzVRcbdzF49HgNcWmPHO19I2/yGbAGKco/+bUHVlrk8QiT616DW
	 /5u8VHzl2pWg8ucHD4k5BjpbKsR45yNpTm91gau6dv50GAbg4SLHKp7gFIUJ1gDssgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WKwQ73hnF28xS62d7Bims3nSIcQkvga8M64/9Vmq34k=;
	b=ILYEIQmoQ91SYVQFhR0cMDOFG/3Qm9hmZYhazN/o6KeT146/Ur0bnLDle2EPTfJY7VSq
	 qVMvSYPF8N2XV/82/NtgHt5+BtgHbMnXziAR95gCwVI3ZLwrv7XISf1mN6q9KAWXGZKGH
	 rxY9RRkvKqrqnHj4S29qRynNyGQoSOR9ZriYQgrWAQMvXmENa83T8ANo4iTPbga99Fdiq
	 hFDcQ1IIvbdxKKA/TTgnu3tK0uDbgRRClR8LaY2XU1f0QCMWa1ix1vXcdahWzk8s3gg4/
	 vJpjs556gcVXmUalTm0CJhPDk/TS8vCKy39syr7/CuG37QVy6pT3JOaVIIzeQO6fPBQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373981;
	bh=WKwQ73hnF28xS62d7Bims3nSIcQkvga8M64/9Vmq34k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RJPyJH6FMw+Mf4JSQbguzcpZ/nEqsxxyi/AQR5mSZX/G25kECk0ei9nk74FYXqf9D
	 WVwvkcFsfp0yW5r/aHvLn5orGrp80PJ7F6K8ru3TsE5yAn/Tm5hOFnRxUYeq4DoW4w
	 gQa50XI1D5xM9slXh/tg/Y8Ckte8OBKUWSkSqP0wSUKikn2sbuRNSq1Fz/A/uYvS6e
	 nPE8fD5IOhVTIoo6Cg3aNr4BapeMMaGh+Inm4vT0A8vqaW4MPJmXUxIcnx+r2mAWkC
	 YvLZqQTCZ4tTwcMC/YurV4xs1Z3LlAKvAwWGJpvi5feYTCNbM0kXC0u4uB7yM2LuRI
	 clkr+nbEellcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53ECE40BC1;
	Fri, 30 Oct 2026 15:26:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F13C235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84DB640BC0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GAtelE_mhdW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 60C2640BD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373968;
 b=PX4/jkIICCz/BVqAiO7nNdse4FdGHqQEDuCWAuIfJoOX0fx+uPg4vr5sZZWs9NSFOOGb
 EjTpOyl9OPuL99TauSedo8c2VTZUnrvoPfzOFBK08V5T/hkLa8MRp3l9GNi8xpmp6PFKr
 +hmrKPvnWzCnF0MlH4M8bP9hwcD5kNV33OiE0SudIt8SUawQ/Y5OH4OyqAHkSk7RkidZC
 /Vp/cha8/Zx31K2Ui1zb+5CEJddXi3ED/bpmj+gyfx9kPpfnVHO2EYipCIRpFdnIcSYzX
 xpZFMjugq9jGSH86/Xd+zKh/KNo/z4GeO6vhSilVrrL2/p+DN4PEVzplGmJGQlVkD0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373968;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=HiWB5TlQRKcyPx/UpqwACndDeEg4SMrIh9CoVkcY9D0=;
 b=CyVnu5Xa6pRhuZphtdbRHNrBBD5VFo6SMBJ7J3AWhy/gOemJuAMcA+AmZZTJ8IDhWcXE
 gp7i0cp/xCnQwP1Pxa9yJQJu/Tio8AIoEnIQWFyBktasIN3tdiyJBOv0KCF0hIkYkjqlX
 JwzwuUKX1XnRMTTNOo/S/5sQDc2xct/thDi7fyb9MzQdivoh9s64k+rbq893oe8IB8MD9
 h1M36YruwNI7+8fM27vQlhFTFByzsqBgjzfpgcYs84dDA73N+oH7wCYp1kEMWlpl1owyf
 jT8XYGgSJWT83cHdGBqmUjAZs85uf2EBPjAMZyj5t+35xEaOpiR49pz42Ecv6wLsQlw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=e43Axunw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C2640BD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so883309f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373966; x=1793978766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HiWB5TlQRKcyPx/UpqwACndDeEg4SMrIh9CoVkcY9D0=;
 b=Jm95zZuYQswx/qfedfDQfdPuPDUGm83/5zJWJzAtOj+eZArynrzGM4NcEumf1t1fo2
 FvLTORp+DE/o8ZShs2NTQtrcxsZfzY9qcVZcEaF8poBMC8/83XyWOskrEbFGVvXONIgL
 sDea/pBn7CKdnoDqthwJCFi9NM6V5bokkDpGKwTzaM8fproVqrgJlLcKAYKl3heghODP
 /FBkdEEIj9F3LnWRZIZJNDWQjgUEUIgLykH6u3ips6ORA2wQ00nn0g4Nbc76yNtM3boQ
 jds3XHPXtDnwHzvt8XfPkbrOwMjm/TMegcd4i/pjNYMQNXrXXnXrYSIyMwQPO7xpXhsZ
 X1kQ==
X-Gm-Message-State: AFq9FYI5nZfaHUj2GqAlI3abc3XLMLaDm/VQKc2FpHERlNuoz9BLXRy3
 FeqtwvtEBrNa1/2wZPgvV5HJLmXv30ybEc/+9hPClCuY31hEqo1XJGechOIDJAPCjMfRI8vKQH4
 EbNYfoH8=
X-Gm-Gg: AYBFou0+N8R2SnJnURGisThbwSadOm1+MXO2d8I/RziO3mWYwyzgLj1CtKR/zN2B+yG
 i9UrRtd+DhFZM0Lt370rp2km1IwD55lTaM5xUBMxDH1M3/OtboVSmszvjSaFAhuki77keoDqQ5K
 O8pYqCEK8CtuiSHFPdp/GldP7VxmElubzs/tBzdweqqMtjIHxML19qvYQ/VMyFSadswGq4YDz8N
 nQocdPiEBuNPKlACPSwNsYNJRjMZ4nioUItvnldZPMRwTDyeuU0Eu0jZwI/i0HDvlXvU17YSt8i
 7k3qoMjLtD9iFEnq1r7VJO/Mr8lSRfiUj6wZ6o2AYoBQ3Vf2SbAWJSbtSjSxPnGwiFbbf9zAFnx
 3itBS3UWAZauO1EcXpntgt+553iuSCtQ+xksWxVEqXKYNqAiVBilqAp8DFQeZJKz5L/9K9pxm4v
 N6Xpu4wtT3pdieHVJi9jri28llDVMi+qkKKIPpWGfZ9DG71uzDXKFhUuMw11v8Nbo9w/L+uiXUr
 mNmmu4Att93Bpe6RGyu+uko71+P7WPu/35OrOlck00r7BcyuBH5W9qRkT7h0YZwKlfGHFmEA9eX
 M0CegklDHHQHeWxSI0ZlGeaU5lUOIlIJkAEsjkNLqeErGxZKINrTUkCX98BCkpoWn3suSDsc
X-Received: by 2002:a05:6000:4a07:b0:48e:2108:4d28 with SMTP id
 ffacd0b85a97d-48e6e303c5cmr6374290f8f.13.1793373966219; 
 Fri, 30 Oct 2026 08:26:06 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b80eb1sm4030530f8f.34.2026.10.30.08.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:05 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:02 +0100
Message-ID: <20261030152604.1905918-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003234707.769506-1-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-grpcio: bump to version
 1.84.0
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
> Skip dependency checks as the source archive includes generated C++
> sources and does not require Cython.
> 
> Update license hash due to clarified third-party license paths:
> https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-grpcio/python-grpcio.hash | 6 +++---
>  package/python-grpcio/python-grpcio.mk   | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
> index 9441d89389..e533bc1bfb 100644
> --- a/package/python-grpcio/python-grpcio.hash
> +++ b/package/python-grpcio/python-grpcio.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/grpcio/json
> -md5  b2b6afdac225e749c4c97284a0c1113f  grpcio-1.76.0.tar.gz
> -sha256  7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73  grpcio-1.76.0.tar.gz
> +md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
> +sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
> +sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
> diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
> index af9817a0ef..bf32da46a2 100644
> --- a/package/python-grpcio/python-grpcio.mk
> +++ b/package/python-grpcio/python-grpcio.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
>  
> -PYTHON_GRPCIO_VERSION = 1.76.0
> +PYTHON_GRPCIO_VERSION = 1.84.0
>  PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
> -PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/b6/e0/318c1ce3ae5a17894d5791e87aea147587c9e702f24122cc7a5c8bbaeeb1
> +PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
>  PYTHON_GRPCIO_SETUP_TYPE = setuptools
>  PYTHON_GRPCIO_LICENSE = Apache-2.0
>  PYTHON_GRPCIO_LICENSE_FILES = LICENSE
> +PYTHON_GRPCIO_BUILD_OPTS = --skip-dependency-check
>  
>  $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
