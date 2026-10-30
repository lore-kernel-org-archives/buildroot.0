Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1DE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UU9XxNNq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F7940F0A;
	Fri, 30 Oct 2026 15:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dI65nPjGRPIG; Fri, 30 Oct 2026 15:31:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E84D440EF7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374284;
	b=TBJl9+SHdvgHsuG8qxCNZ9Z2sSjYnokgVdJIi/Zs8UPmT+7dhTdcCXPhGHABoZ0gBrE5
	 HUz3SkH4s5F4UsXrhK4EIeVAoz3WY5S6sVJ5hcDEp17C7nQgA7eSjVishtW+ARfUic8Nr
	 oomu0a4Ws5zGPh0S7WZO/ZAKspVqkUkLRy7Y1djnrIxmonT9MfugryAtTvUM/BfEheciJ
	 /oYGrupe4QvNFECJZMcCpgMVHnFRRSZ8AIxd3kFNzoWq+UeSALdRco3oab3ekUU6rLRZP
	 gixOvju9zgra1U+1D+jUX4bi1KTgt4H4AktMC+9AZj1+9zdXdGaZ/eyBIKXyko9n9yQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6J2ghioTgraJ6wnQqFlR9ySa7JKsCWsrj66nrGX4MWU=;
	b=AHzUrBf5iSFRXEnNRA0KirEK0lSWbaRCwIUOwIAf8O2kIfnA1/pOc+X1WmF3Qe0GoO8g
	 Nmx8m8IQaz6JV+T7gKJ+WwRTHQ4PUAIlSwjbIi85HQquQquaIH6eL/DfSpfvHKjSdSyiU
	 6ecOyNj4x+47191FUA0Qf9lfk9V1Olagb7t3Hnuu5kGS+58Yholh4HLgVNy4Ax23+UDx0
	 lUn/aHfvit7AbeEQw2Dj6lrXw7MczFL+s0zxBPOPdF9W15yGc57HMIJNBMtlOXQ1lPSvu
	 c42XeWZ1kBfERdSMKNk2uvl06e72npu6woUzSvX+UMYd3dsD+/q2GumSR9/eEwE3GzQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374284;
	bh=6J2ghioTgraJ6wnQqFlR9ySa7JKsCWsrj66nrGX4MWU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UU9XxNNqVIAdTfCZAms7IbXj2tJIFgo0XM0zHb+7QMIqqjvtBnr50UgCJr0w3yNhV
	 QwhIvOE58jODHhSEcWYzfqd4G0ouYHi1XNgYLME1OXZvy06ZIkzlpYFRBJ40hUpud2
	 fjzRXHklhp+AnZkEHi6EU+rAmEQN1XW8igzdhilsCWulRwwPORyk+bhGpQ+pSt/U7B
	 z4BSqNKrB59ODsIPgGnX8vGkIWCjoiTiPL8yG9sIYS299CpRFZzAvyz/QMIn+kvc4t
	 CrGKNUMkCYHQRimdmFFEY5mGxYbShykUmwA4PwXPZHi/L7mcqjks1qf3dV7lz5HiZs
	 IJp5CAXqO1gEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84D440EF7;
	Fri, 30 Oct 2026 15:31:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B98ECD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FCE140530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNGWUXTV3-GC for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7935940211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374216;
 b=ejgPLz4u2xjdtGr6arYbzasv5TLhzorTyRkVQZOTAoWGwcoyglyykdz/6alVOISd0+5e
 9ipP8mAf1v78v//v51KiQXuHSEKS8Pg9+7mwmp6rci9pleAWU8HkJTCL7uoGE52fVsKYG
 uT6TQxWBaR8igChJBaDgv7UQD8WVaxqzcndFJDLOaEL2tPhEEJp6yjHTZoeBExcHvN9e1
 Pqga04k5pW2+0BX+q4h1fmCY42JIGJj84M+L6fk1GUBHH+dhbuMSI31SW5ISkOTp6FrRB
 8aJONdSgXHgOUBUlLeP8VUZ/kcUH/3o8vYT4Gjc6JwxTAolDcY+JV4piiX8vNQF8q6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374216;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6YZid0Q5VuSO6lFzAbW8uYIqsm7Fpm7gEqEMDBriykM=;
 b=GjVUC+3zspv5UQpKxVyNOUxfgkKrUH7zi0WUZD/TmMJneNLkmmF7MjrENIni6CS6Xm6m
 O2r7VsTfYBpzuroqYR2DYfdq57giGbCYpx6nRcCbFRB5pf9A9IlPhCRU96zK/QZqKFIa2
 aqdRs7NtCUPN5H9nrcWF5T7vSzKRRAOQ73AKWt1cD7viTmGmNsDKzfTEnIc5dOgXzrLOI
 e+uUVOo+kCXw0ogNd2TUFg2L57cCcz34xQ8eGyCKiUU9F/ZyVFrBQdN1nhnv+0u7IM13m
 /A1vMpxeR8QQdVNcMfbALTZQYcv6Utn5njABSO4n4xN8h5XmlvMuhZBczisc2lZ4Vmw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Lb+cLPB0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7935940211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:16 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so7062185e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374214; x=1793979014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6YZid0Q5VuSO6lFzAbW8uYIqsm7Fpm7gEqEMDBriykM=;
 b=IswA5waIIWPA6+sGOhyDbXzR9wXWIileohtlfUFVLIlBHrGoBX7jfAcN9kZjiqJWga
 CP4E2Go9phR13B/xf8eqFJIdCvPeXsqMRomqFOXuKSCkNgZrMv9Dlmg2pSC91M8aP+GK
 hs1aEV/wmNBsdaNS/LEUJ7MrgS8XOjy+9KJGiaYPQZHhJFl/DK97OF894xeOhVmuafVl
 TUIxs9+OSmwr703qg14VfDSWl5hQJGL/80biKEciB6dI8lI9WkYJ7pZUZ/BEPEiGw3bU
 Frjg/FYccqcPM5GAIBObCGjpP9m9tKShnlKr4J11PG1Xuwryz+FDeJ7F3bRIzB9cA7vZ
 Qzow==
X-Gm-Message-State: AFq9FYLJlSaF7YOwDn4MfQqB1OofO30G+mYl8NTM08/JwCjfSCk0Hcdx
 Utn5GJsnka75bj2W1N4F56g5uz8AomPRNk2vhWinssDivOVo9x5IA6pmsIjwCGn0sCXrXQwYiEH
 Fx/RAHTI=
X-Gm-Gg: AYBFou1nw8ul2BOkp3zJCpo+PfQbCN7gh8PipX5cTCbGBV+r1Ip+C5gu3pheVyTDeNN
 m6DcX7FvwVaypo3KpnZ8zwtQZnKEbMHiiW2sVk5ZlAn12rQikFP8xT+zLlzSbvLWrrBPBWBFJ7x
 wQKA59yPbVmR9EDHUP+I+DolTr2vKBq7i+uRtJATQfmrgN58quAWmdIfbRJf78KO661hPB6OhaI
 oGv6VOLAHV7huW1FMWG6mUhEVxKdAPhESEdQ0YEf4AYFboevHwCp4zLAIZYVgSDhR0xnWcnJSol
 zR8Gwpm8cuLphzzrV2a5SrOD7KFV1RLQuGL43uRlQFBfeWciOywlKejUh/AVEe0gVWGurrApYPN
 kbL0Ol57TdOBiGkknjzYlTNsPMVqDwzIjdXIUSASzf3MUiKP/+kz4iZBuTnlBnXgvck6ybp1gEK
 DMBVMIFsWlaaPVUZEF9R6yNm+zFEL+Vcs+2Is16RHuLCFshzBVQuT7yoNlXzeRRgI+7yVYNZhXQ
 xiKFQZGvtInZi73/9eGftCIGhL0Tty7hAOn6EZhKGtMJ+zlyHw0l9EmHP1hInAc2bscPT55AdSI
 WJkHIRVgCZzu86cucwa7m45t4c8BoHiA8Tpg7yHZ3X1Ae3WJljgpk62zd5EZsiaIUF3sCMNH
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id
 5b1f17b1804b1-4ac182dc29cmr55399405e9.15.1793374214318; 
 Fri, 30 Oct 2026 08:30:14 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf5b286a0sm55685635e9.4.2026.10.30.08.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:14 -0700 (PDT)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:30:11 +0100
Message-ID: <20261030153013.1908365-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027094331.2867802-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python3: security
 bump to v3.12.16
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
> This is an expedited security release to address the compromised eMudhra
> intermediate CA keys. These keys are now blocked by the ssl module as a
> last resort against their use. Normal uses of pip, including to upgrade
> pip itself, are now safe from attacks based on those compromised keys,
> even if pip hasn't been updated yet.
> 
> This fixes the following vulnerabilities:
> - CVE-2026-115557: Distrust compromised eMudhra intermediate CA keys
> - CVE-2026-77214 CVE-2026-102633: Update bundled Expat to 2.9.0
> - CVE-2024-3220: Don't read mimetypes.knownfiles by default on Windows
> - CVE-2026-114583: Reject links replacing the destination in tarfile.tar_filter
> 
> See the release notes: https://www.python.org/downloads/release/python-31216/
> 
> (alternative to commit 3736eda341337a2ddd824111a5f065c84d44c584)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python3/python3.hash | 4 ++--
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 7949607fb7..0f456ccf94 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,3 +1,3 @@
> -# From https://www.python.org/downloads/release/python-31215/
> -sha256  c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a  Python-3.12.15.tar.xz
> +# From https://www.python.org/downloads/release/python-31216/
> +sha256  b5796915dc45ff745cfb4e990a7e7c93d6f546328a102ce31448d69ebc37575c  Python-3.12.16.tar.xz
>  sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index a2371b1a92..ed49fd6bb3 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.12
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).15
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).16
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
