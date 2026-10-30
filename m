Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1382606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CTRe/iWw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD8B40EFF;
	Fri, 30 Oct 2026 15:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GP9RAO3IYpuE; Fri, 30 Oct 2026 15:31:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8092940EA0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374282;
	b=UB5G8ZgbS0tiE8H39DtTCL/bo8+ssr8uBW6XfZg3jxpfvCji61fcuIuSx8J0MDkAgM1W
	 6NZSQlG5E36cF46es0pkvN1n+Uva7etu3dc42HLhukdhccTx2JYfS98n0hzgSEcaHMNW2
	 ilvRz7V1AHkjYpSTH7KDBTC8iGPz2kV0mFrs8Gga9UNf7/bPjCvWmShQcC82lpFcnrxJ0
	 Ts47VRUN7dldcWBSEpmARajks+qctvvhtQI5aTJnTFI7Jb0pxzICzCjyskb3qDzkLjXRL
	 cduEMqpCDwjOjE+5x0mdhObTW5TDvFKejF4Il1Rr+Ha0UbSlnlZTUAWhBvlQkjeYZKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HBGwecC/yM5p6sAnE+537gkuWsqoJlldbQ3z56i4aOo=;
	b=ijeZHoV/E93Arj4q3Adv+T4+3VxFOEE0i4s1XDkNVwUILmez+7djV6CX9GeXs23LL6Cz
	 J0TbokSjjQIE8yRV581DYs9/tAdLbF1sM5+x7+CS/Ai8sw1tndxztuZ7moKGeUQCuMVD0
	 Xp+bAbX9GtYGVY1kPyjdQVLE8T0W3aNZuaoNq3AIwbQoxvXSaY6nap31JJYb2hp4O+HlS
	 UNpGn9K09vTCB7NuIKvZg1UD6au3YNgI4gFfgHQyGNVIBrJArGNckgb28FTMH0ky/qICr
	 7K2GrBPcwCBfdQcVUdV0IbzH5iFDElG02Jdk7dZfXY29vb6RyR5fRYg0bHeA2Y1tWPQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374282;
	bh=HBGwecC/yM5p6sAnE+537gkuWsqoJlldbQ3z56i4aOo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CTRe/iWw4kQRhiDyWwRQynudSPkHETs5soaSq+fwdX1E8wr2fJqdqW+1jXHAh987U
	 7ptr7qzEm6Usuh1ENTKSuzyEVrdMJsOOlfYk6EJsc6fv6VM5QN7/FONrvxuPoyvuBd
	 yflr6rnpjdYLrHwiVmnCoucS6856G2/34F88IpdWZxHU3AA/5LDj+dEttTcuyMEYNV
	 Jzd2NPo4RQLnHHfWIu/Skz6I3V7Ixy1Mf8COIfSdeD5bMDsGMzFco8zznclWBN7w/K
	 50HsihleXtZkCTrkCgXc100TTGkbIUw4JUwRKaciKZkCsr0tjlecRdu1BKJNFo7frK
	 UclEjHY65wQCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8092940EA0;
	Fri, 30 Oct 2026 15:31:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68E6C235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 662EE81CD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXk8AjrlSTCD for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 58B8181683
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374214;
 b=O0wcbr0sQ4MyUsFT3t81geWXtNST969UEMiQUe7iguWH38uS6mzcoLePlsNrHKaRW1sG
 UaYB9BZpP55yFEhh0OWmooLW1EldXgyHdGU/jGXzX68ccj9Nfvc0hxnClI1Ega5wZwJ7A
 6U1vxxpzz4BeBGNJpQdTCgXwYRf6eW7t6QUuCCUM7sjcuxXzV2z5SEdWbFHxjfHVXcZXV
 6JGKC0e+g/qXUDNkEsmCBCwLpwuIljJx8pmwBZFeet5+FYFTaIJ/xHce92XFH2vQrVQGJ
 Cw+uD681d9WnCek4b/A2wFtqk5LvcagksYFR6hquqV1MViwXXcCgiZrsONxL+v7KHqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374214;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=m15KenbTIr3cPKVzbh3iWiWUWUoLbmdWmGuIuDNQU+g=;
 b=PKkiV2W9X3oCKuEMcC6ty/0C0plgj6QFL6/sMax9atRHlDb0dzbfCssOIOAWWm4KW8+K
 2VcIr1RG5rZ1BOtoySZ2Vy5bixDbIAAyK1qJWnlJpv4Fx7Ts3patx7MVnKcPnbAh/Tfu/
 VApH6dhnF+ri48WVhZLr5SDvrjjEcDlYk8qBySqCPhFMS8v567Y3KONMPzjvUxOIVuPXu
 3ORFS9LQzr2JXmXcWpXBihbnyTmtM9DvWDZryekhB61NTqIgRge1AkFbahMiHTecI06We
 ETjkirBCcL4G24BIFI/QsaF0zvdsXmkUbt1d8DuMJeMika48uXjBr0fs4kyYE+TLtBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="EUbrdF/g"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58B8181683
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so7061795e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374211; x=1793979011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m15KenbTIr3cPKVzbh3iWiWUWUoLbmdWmGuIuDNQU+g=;
 b=hybglpUE4zwQiYyBZ36L6In1gSQLPJpG/oyFBiEzVAPUZ//h0UY1brqSS+h3+rr1c6
 CqCL0+rZawcq/8LfiWotBtQsUNWl9IByElR4UAKKhK/55bH8Lfr7aUPg/m5sOcMuj5Ad
 IJm1WH76DynfadanfNPlUGYVxV4NZBjCnQi4uPfCUksOCw7vxZoCFQ69NOHtvEQc0bQ3
 MelgpTrplBwK0LdV813Z09UXinEdAA+moGAGXODITpyzq68vHf+WbCaINlEWqCD7uOfp
 5gApNzHOwF7Od6KK6jk6C54pUyldPGU1XANQqvyaHCs5Q7YIQQsLwkEz9Nn/dcYpgxCn
 6Jxw==
X-Gm-Message-State: AFq9FYLGIZ+PvBZphmlYLB0z38hx71hZRjPp0FfjlJ9Fa79MsJ3A4m1g
 ZVoDXkGwE/CvQedExeT/whBkEIearbiwLOcyhH6MOEDvpl5wo1VsAe+gZPEGoAkBuAV1VADF5t4
 m7GCz5Ro=
X-Gm-Gg: AYBFou05Zr4nI356oMWwc1NxVZpqKEMQF0awJ4BSCPk5QlJvblg7j8qtUyWfpdm7elF
 isj7qeKuaNo1ultrGnFjoTMef9gEMuwgUCqRnO3K9i7HLLvGTy6hOat/qj5KQzA+/1ZEy5d/po7
 r6mqzZdMqm4FtyS/e7W9373dODn6LSXBoIvWnGDbOw2395pMvDwAZL8uIJQrNGS5TzUUjt4WkJq
 wwBoaPPkkhmOv11KMzABA6FS4cfuabq+XxHhuDrhriWWuUAP5ic5QJB81PLb72b8NG40023XoQR
 N0mbhXCPmM4vgVAoJGQg2+RglMoxTd2NVh8mSEfFQym2LGRlWxaSaHi/I/daRKTwrLVExeN17we
 10haOHcS8iMsQhgQxw7eltdOiF5RSgQeUdyp/sn0j+qNMxLsyr4qsWPp0sn8esS+rPtVFLUBf+y
 QNUhz70ZxEyhcCX/wWLlSSc05VDFFBN1vqctJBPsuUFr72OZdmybgsgzk/TbQgCHCEB3i0ptmpc
 k9LoZv0OLnn+cs3F97dJ6Key/kZnXNwiCVV02MHFe5Ll9PFdWLYyC8c3lc3XDcwKLdPOnIQsLxM
 p1Wi5TyknJQQ1h6FPckatJc2rTZdsarvZ2jyvOWXVakyKaoRrJfr344+r6sTmQZHwYlhL1R9
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id
 5b1f17b1804b1-4ac17d16afbmr59447675e9.8.1793374211267; 
 Fri, 30 Oct 2026 08:30:11 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf67aab10sm65770505e9.9.2026.10.30.08.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:11 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:30:08 +0100
Message-ID: <20261030153010.1908339-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026061120.36587-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.10
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
> https://www.python.org/downloads/release/python-31410/
> 
> Security content in this release:
> 
> CVE-2026-115557:
> Distrust compromised eMudhra intermediate CA keys
> 
> CVE-2026-114583:
> Reject links replacing the destination in tarfile.tar_filter
> 
> gh-160300:
> Reject cookies with a negative version in http.cookiejar
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/python3/python3.hash | 4 ++--
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 20abfb573f..7272555258 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,4 +1,4 @@
> -# From https://www.python.org/downloads/release/python-3149/
> -sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
> +# From https://www.python.org/downloads/release/python-31410/
> +sha256  de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032  Python-3.14.10.tar.xz
>  # Locally computed
>  sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 1916982dfe..c24020af9b 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.14
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
