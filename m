Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED476606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KgEcDh3L
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A5C81E96;
	Fri,  6 Nov 2026 16:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gzQtiA_IQWW; Fri,  6 Nov 2026 16:11:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA71481E79
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981479;
	b=e3iuL1idS6FsLdbikNEglTNFEBUzeqePQSyOIqZOM38IV0vQG1wad3BdW1rBU40shMhg
	 kiyRQV/t0ziF3sVBZJMJ7gG0TmXO3dTd7usKMyXR4rxf5vR+oNPXhSKQt1WPghKrsR1AP
	 gsMOCd5E6X9Tpyq0Qj6GNabg3RlE0eIUuBaaSUBMrSEV6O7L1+QFSnV71yc4Pr4HMKJOj
	 0ywCp+C2KgbjcdsEpjG9Rl+Zj3+MlRLmVZcN+PVpzSV1WRrAkuVgPJwNgUP7ps3SMJ6CL
	 +wxv4VqqW4muqLh7g8nNx+9KJofz/zC+bkncBbC4Vh7sDUf6mMuMNzP8l8vFidFiMsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981479;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=22nioBfqK+I/+tX8Ot8jDlECRJQCpkMyLmHZK4lxswY=;
	b=N+dtUAD2sA3fsomUZGxaloVW/4GoGQyKxebPzdsy7NebvUvg+2k0OnWm8Prc8A6PJj6l
	 W2TFYM+fIfd5/tFsi3yVgzTgXxTNW2Pz+6bC5ZJG4d6G3CktXcuOfAV+/afoGtBEU6Vj5
	 wI9A7yXLR7ndxv1dUvqhQHqnk/wWfdyLfR6I3b0cY/BImYqwPS+FX262Z/S+lWCiF73aM
	 /Ul33MapNCmfV3rfmpcqdxvShjiI27KY3CJ7tYrvBr23ss5bn1mD9oNfc2f3mk8NbpUp4
	 vuKnmKWTHMXInxe0eVELLw1wHK/A/V8TGJ5/lSwqYmCueYsQvwFFFFs2uYsmRoH4hig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981479;
	bh=22nioBfqK+I/+tX8Ot8jDlECRJQCpkMyLmHZK4lxswY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KgEcDh3LbAdmRBFEOyRfrPrwu1YRqmIM566cc1zD28dWjJhYY4vJ5C/A+S2m8+1Pb
	 RTZBHCHLCv4ApNtOosaIXFYxQaex6PGrrTI1Hz+7FS7GlA+64KWwUqLC6OBnzKZotH
	 gqysxdVmCzTPf83Ah5QAesqVEaeJIQTBJbkNHtF2fhv1K9UDPEGZxf9bISQcBskJdC
	 FqkQD8dqj1wTEr1s2YAbQWeZse7go95UPMdFYGMQaWlO7KkkZkwDtcxGI6zbJS2DdY
	 oypxwIm8Zc2O/Q4NSvfNhvAFSqWf7UqKlcRDq9ufFbZcZRpPdyAcHgRHENfdpGVMN1
	 dsCS0BPEc1hbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA71481E79;
	Fri,  6 Nov 2026 16:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 895B24B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B12960ABE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwLXiEyCrSjZ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B8B560AC0
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B8B560AC0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso7531075e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981475; x=1794586275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KDaaklADCxqyw6Vm0tlid7H+FP8upBrDHZ3F3OJfndQ=;
 b=C7+kU9cIUWB8P9GS8b/65UBDB2I0Dc/uwfkkrsuXC/i5fcB282i6Z4OPFwgAlRvDZr
 6wOk9E7k6vFctwEUUOkWCi7uOrNhEy+BliIHpOmMs2rBMKdduIEBbKqtIDBoONP27qIb
 18VSOI3dZyZ5CrVoZNrnCJ+3gggEJCNRRX9F9JpW0Ms7h+YZ9NsIGXn6YnLS89c0nWkg
 IFybzZAOS4yFrt1X0kLkISqc0bel41KvZalJTZJLL4EAyu6NxAHIRLL1i6FzWUArDeg3
 98DSD/HW4grh78T/reLXeeE5xmUE/NSMPngjslPlwN8dkymJxvBDaw5Yp8cTaYmIi7sA
 HCTQ==
X-Gm-Message-State: APuU4Z9Y1clUcyfs4oYWVLvPQNWCAggU/wc7Yl/lKXzuCwoz6eLoR65d
 GnRswiX9F3lu5h2G5Lxr6kcvgrQ2jj10j0Byq78XsWmHq8ASqkLCgEAxzqA65m5eMJBMECOh4WU
 KR/IJBio=
X-Gm-Gg: AYBFou3hZkMjIqV14U++4nBh0PAWoEtZZRNaBLNLpU+ZGnvKvjPsYdCJfPefakfzaJP
 0jeJTpiBDgbQ4HEvoc9HYUKXfpq9L0sFCCg5OTfXOiJ9h52YktI/BrfFEc9IFVCw6igVam+NGpI
 vA89U/nvd5QhG9IWbtn76bbf/uILYrKWrEg+T0v0+LN31ru03smdfREzHt+Q/Hj2GHg/DumE93T
 4kGpUg4ei9ihE+F44KPRMwiXn9vynLrA7zAyktIwdqIrSzeOQfYLedUwcjV4MSxg0hwX+fZG8Un
 Cqw16hoWdlateypr2CvBUdlGdaqY8xX1OlDxGsavrKl39natkjjbJIzT0zVSWrUICPlGTXrEpcP
 1DOZcuHn/C3Gq364i8lg9nClgUV9ZN6GWTXtVhMfP/mA9+9840Ailn52fSdglQ74D1GJC6dnY7Z
 1zF17nySiNRBUItBP5452PQSFrUoUxe6vJqbR5kLm4IfYVjEMKNfYvepcJl6Y0+oUWFFQRETvBw
 PyDzpel2sZhTXjH4n77n9Wm02MhDl/6qUfpU9VI/cOsZnYaHBZTeApv4tYxGT2kMXNVsXb98JnC
 nyC4FrJG7g26w24x8Mxb7tjuAE7k0FY=
X-Received: by 2002:a05:600c:314f:b0:4b0:bc65:b9b5 with SMTP id
 5b1f17b1804b1-4b6e063f9a9mr51849165e9.35.1793981474693; 
 Fri, 06 Nov 2026 08:11:14 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cb75913sm4804495e9.0.2026.11.06.08.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:14 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:10 +0100
Message-ID: <20261106161112.607992-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031201918.2850153-5-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-platformdirs: security bump
 to version 4.14.2
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
> Fix unsafe Unix runtime-directory selection and multipath site-directory
> injection:
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-2gh9-8m4r-2xwh
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-jmm4-8x35-q6fq
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-9w45-w2cj-r5hx
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-5pjc-393q-rwmf
> 
> Add the host-python-hatch-fancy-pypi-readme build dependency for
> both the target and host variants.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-platformdirs/python-platformdirs.hash |  4 ++--
>  package/python-platformdirs/python-platformdirs.mk   | 12 ++++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
> index 641b1e62f9..073f9b002d 100644
> --- a/package/python-platformdirs/python-platformdirs.hash
> +++ b/package/python-platformdirs/python-platformdirs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/platformdirs/json
> -md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
> -sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
> +md5  07dd523bb5ca12c4525df2cd242336b1  platformdirs-4.14.2.tar.gz
> +sha256  6d13b4c1d66b7548dcec9e3db13c1ba9d9adb65041b5d07869313afc07e6e41b  platformdirs-4.14.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
> diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
> index 0aebffb6a9..f6da1e5498 100644
> --- a/package/python-platformdirs/python-platformdirs.mk
> +++ b/package/python-platformdirs/python-platformdirs.mk
> @@ -4,14 +4,18 @@
>  #
>  ################################################################################
>  
> -PYTHON_PLATFORMDIRS_VERSION = 4.13.5
> +PYTHON_PLATFORMDIRS_VERSION = 4.14.2
>  PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
> -PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
> +PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/6e/4e/2684728d9f2c8c4110738dcadca7e0bed4b60c8dc68c40c2a9e0cf017900
>  PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
>  PYTHON_PLATFORMDIRS_LICENSE = MIT
>  PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
> -PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
> -HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
> +PYTHON_PLATFORMDIRS_DEPENDENCIES = \
> +	host-python-hatch-fancy-pypi-readme \
> +	host-python-hatch-vcs
> +HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = \
> +	host-python-hatch-fancy-pypi-readme \
> +	host-python-hatch-vcs
>  
>  $(eval $(python-package))
>  $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
