Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD925606A324
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P8kCP+qB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA8560AB6;
	Fri, 30 Oct 2026 15:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SpiqGc3hI6E; Fri, 30 Oct 2026 15:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1F4F60AC3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373982;
	b=NjKiHBu2ghgpfmQ7MTOsucC+u3Vbu2uW4spLk3en0yiDSgvx/hsSKBNn9YaEbma+dyyL
	 +sG6jBv00aeG/L6EN/0XltHbO0QLPPIcdSfGkv0alMgg1wZqZucHXzdyaJqkkwXOPf9Yk
	 8muExtd3MHnlY3HZ2IL95KPZoDczTtycKy5QZNBgB7o6w2UKlK62bGF7soF9cgbCUTk5H
	 CqnQXt+UWap83XaMnxA6qzwXvginywovMCocb87HRXSpa0DHIKkNpiJgb3yF8jVYBLF4N
	 eRdHDM3APdp7zXYMKoAkrGjPPrQXMSwa+IDCqx3HxVVOUOZStHUa5lfHSD9fFk1FVDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EQETLdUjKUzXzLF5H1aXHj8AXdM+l+RtGPjOsgHsd3I=;
	b=JTjHYw4NJkDGx8eJS1fwxAeK+t0cGY5sp7Xcb7u0ih4Fm3aNldhK12/wYFVyyP1qrIY0
	 FFfRqMGswaz8mxnd5ZnieIpPhenLKw2zaII4T9FrXP7PLPxCan4KIbAxDOPF39Dy3XYDy
	 8hYJR0RZ1UXwuLQawmDZTlQS1BVjYl/6SruriSEhJ1nUBPoAS8fuT2WTOEXdmpsspC8at
	 QdrxmT0d+vEn7jsaxXNvfq8k/psQuIDRznbs0yMx7ji72Pek/YweGuchKxSA595ofxoWf
	 ETNSOOPnz+rv74Cr0Db8Ukau5DXB/qB8X1G3QB53bqHYNSr6LxBCcyL2XdZSwsdWStA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373982;
	bh=EQETLdUjKUzXzLF5H1aXHj8AXdM+l+RtGPjOsgHsd3I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P8kCP+qBT8pwMspS+KElLpuh9n9BUWRjdz1LksyvW5Yu7VbjZjA3t2+VLAF2Zl5MR
	 fmZl1gAOcwIaVYckEqZs5tKIpjDXVHe53rZgq3LHHYA8aOvT5fFrFrZMT8TbkAkZpm
	 Zj+De9EXRuTHRP0fYbxpas8ZLUb/0E/byuftuEktDcrex5LjogIRvXjyINjCKvt5LB
	 XbEy8A1QtGjd5pO6/kxOFYbVjoVFxiKi7r37a1WORs/yN6V2/p7e8XHP7Y3VR3m3AT
	 ZY4Wh1DB2tlXlhr327j+Jwxps5FcciqTS3px+XZS/ZF+dmqWU1UtrAnyD4t/laoSek
	 +LmhxcuQbpD8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F4F60AC3;
	Fri, 30 Oct 2026 15:26:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 835A9D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 752BD40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZwQQzG5EW99 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 797FC40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373971;
 b=HsWPlLNE2cCZpR2TmdeJvNseL9BY7nVMsLcA+kz/kApF9Yu2rYb3x5CPl6GSGW1hxQ5V
 VsLOtqdWowYyVyrxanPbc0vCW6CIfYD5HDv5PzlST6sY0//g3sroR2+mqk/7KA1umFHr7
 vm1tyMS8Gpd/WvPZRG/QrOgV3NGa7GfJR1qDNHan4JXeqZO6mXCj4eh3JMrxmQM5pdoPw
 M+7/vJM4pK7M0MKDZ6oVgjnr/zdQx886klYJVuo7ppGsSGpG30EHGEKYVDwYicy8w7z42
 Kwp41e9iIIc5L0NPLpKFccHXgY+sfw3Iq7u3wMUzuq2Tuf4/7OiE7chlJZgqg2L600w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373971;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Xk1EncbvEA5wfY6m8tytxqWBK7brvEJ5pyNtKcLYSm0=;
 b=s2JUOPm72g0vDPAU6e4OaFpNcUWJZnfQXqgMvA5HsBCkVUL71VIgdlwc37vtF87XThiU
 CGMTsFNN7KGR8E+iiQm/1vOtgy0kk3qN2b/LLKCLaLxDLbSbqjDSi75UWWZigkR3s4SOR
 PPPbvo7kjv2HT7gs0nrazLqUTm24Ay17IR6pNAfDUBsjM/vLFmfpCdF0wabOQYgZSKGnt
 zXbqE2IOdI4ng0fvak4Krs6DHX3e3GhmWa8qDrrlfKHdgHD8hq5u81fH0bz9vdg162DK5
 EH1y67EjB1JfKrJI9GzYb3edhkOh1mSOgpoTPm6uMDgdXyuf/aYbFKqSlkzL8HSF5fQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XyZrDlxy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 797FC40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so809530f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373969; x=1793978769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xk1EncbvEA5wfY6m8tytxqWBK7brvEJ5pyNtKcLYSm0=;
 b=MRg2/rZiE2rGpcyZ8fU+kPP5LRyyo2emSVgdIB6umJoQo6MNDw369v2PuTr6TbOuuo
 LU126etX/n9pVPx8gQjfrp7pYA5y1hgGKiIXQxWEQ60CibcwVW0auRd5T+m7rDbhRfrN
 rRav0wY3pUqCVhPQtDO9HrOQomhtyxT/e+YG1mOWWdda7ntxsp2iBzrGVeeage1Ad+sz
 xb3cd6evgaCsvSJGG2xw5zFmyELtRY2FrHSfhAj2rhMNevE5bbqlMQk3DmstXL4FcKXW
 3N+vsE4zObDRdrVoAw3vtLk1yhet1yKmCt5K1IR44H50fHf+5X8c9ShQUhBO89me1pyI
 rdBg==
X-Gm-Message-State: AFq9FYK7FZHEUtDQAeBx5jWjFeyIVV37MwUGu9JQuUF87CMX63gCNiCe
 jOH1R28hDOnH6hVt1/vO4KmIu+ckqUh0jSNONI8CIlsuzXG04YjXscC3yeypGbyK+lfG5+teioQ
 6JZC/80o=
X-Gm-Gg: AYBFou0nzLSpfN3SCPHJu/u3UYJvgTPH2he3H8cgREIGZx5rwvzey2V/BLSx9yQgCVl
 hosGSY/ZDCiPXPVZi8FpaUAmoLuM7nh9wAqtcYlw6gz9MCifup39abNIBGBo67kgML3XPAXSG0M
 QSc0Y43MrPmfyV0Kn2GU3vcdi6RmNfI18CZLax/TfXp8w0LROwZbaiIiq3SdGi68kvf0ha9FYrC
 20byLFtZCRXWO6PxpgSBn7BwYOx4rRnWqqo8xh0yGOMAwb/S0B8FyY8zJeqbVPgJ7Ih5jAeKytl
 8ksN2NJLEjPr7cUM5oD+z7uYTOWPbLNGuPrWXefUNtjpWinppRAhOYO4QSA1ocCeHC/EgT0+Lns
 kjw6OnZq90PzQs/vn/iS8/2pBTvEPKKDqgh1ttxF7lf0ixNoKxsagui0ilGbamRBoUJ5H0xOFLO
 F40oQ5yfQyD+9INkkwnVHS19lh3+cdxNl0n15krPZRImXegvLIfFD6eKlW6AfV7Yc2FduqqObIs
 nF5PGH5JDNSHzmTRZ2a/g7nnhWXHRSVmRq1KjEfEJWsDql8hjrkxpqVqsGa57sIZeYlnCiWSWzR
 p06/y7UKrSsHLEdmjV4bsz2kJPu3ZEgbWbbXEU9PqfvDjwTTHgCYCbk+jniEjoOEDkxNpr3H/56
 3oLC+A8tKYQbrQEQYOQ==
X-Received: by 2002:a05:6000:4807:b0:487:1ddc:aaff with SMTP id
 ffacd0b85a97d-48e6e50b114mr6167675f8f.44.1793373969154; 
 Fri, 30 Oct 2026 08:26:09 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71baa1b3sm3598987f8f.56.2026.10.30.08.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:08 -0700 (PDT)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:06 +0100
Message-ID: <20261030152608.1905954-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008132337.3883254-1-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.131
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
> For release notes since 3.129, see:
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_130_RTM/doc/src/releases/nss_3_130.md
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_RTM/doc/src/releases/nss_3_131.md
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 1851b1e5fd..02bbcaf00d 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
> -sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
> +sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
>  # Locally calculated
>  sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 42021503f7..6b4e68a624 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNSS_VERSION = 3.129
> +LIBNSS_VERSION = 3.131
>  LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>  LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>  LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
