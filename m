Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA1606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bjpy16ux
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A043405AB;
	Mon, 26 Oct 2026 19:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_LQQr2UP-Ay; Mon, 26 Oct 2026 19:42:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 76C9A4059E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793043752;
	b=ICdCDV7463YUl3PUMVN6M/JT6ZqT8dnqQLEHoU+ZhalpjYp4BKtZ6dgfe4XmlESFhbjZ
	 lLkMSU/pR+y7yQydjT7u+nDwZ5lip7IaSvTnifJe0q3M+GaSA2dSOq0oJHZHpcWMXfsgT
	 qOWCRbtzDicmOiY8m/24XO8MrDwQcXf3ijI85UIcMhLH8Mnzdldkc7nzyONODC+APiWVa
	 Plk64NkReOuKh381/Kqicywp7EwdbCl8LoobuqkxGUkbRyA8KfrqAk3OWnsF5jZLhdaKL
	 KcQ6HMMq4+fr01IWAnWyNnv8yU7MmVqgIQ7Xl2Z0ZewxREJVNP5ZCDUmiwC9yrZJJUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793043752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=cEkwWuIYRdMAYUWK1rLc1j4xmKwhvM+vwD691RU3eUk=;
	b=shtH5Zpv+mlKYX3MUBmpdgHpx7IpkgXYVbrXXL9yG0r5CAt2dJ0I4nPAtoTqyOQPuDPY
	 v1Dl2hd8RW+Jxalusy1qawDzJv7vGs6O6QDMT75yALht3VMdRqk7oc/rvJyrohL1UHh7c
	 XKL+UamzCT1cvm5aO8+nq6kLeS9KhicYKl2WwQCqTyRd1LfQYC776pZ8NgzkM5LJu2jhX
	 ITY5piAgdMSZuZQ8SsJcRFPVHOHCqTVpLkj1pn1tdh9wlotsxjAXiLJHpiHYnCTsWVENV
	 GnkdukfeZNq+N8H4NyecLRe1sRTcnnaEtA4AGIRSFHbzxEdbuOtA10LbHodJEcTiUEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793043752;
	bh=cEkwWuIYRdMAYUWK1rLc1j4xmKwhvM+vwD691RU3eUk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bjpy16uxJUNJrJJ3sLfPw0FT3f6u1iVIf5MibZ/zjKr9Y6UD7XG4N024t/1ftPoTZ
	 yNoKZgx7HcvpyAOegCjW1gYCzxWZf/cXoTVG5P7V82Q040k2muUl+zsucVmYmZDQaK
	 sfvIzxTcDQqp/XWeRiGoKv9yhkgHSExy1XBax8kdE2bhLpesfkr3ScgPca0GYZ/K0Q
	 sOQLyQg8PYzweBwR82lQ7BhuAzp2UzFjlfjyfyewKYBpaShKNxN5r1RCw6g/mJM5S7
	 Umk7oOCMsI4/U29vriWntOXHzgs/fOnKVkJhwzlLXuM2HdOllHPaMkDaMJKQhJlhiE
	 dMIezgWB3wTjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C9A4059E;
	Mon, 26 Oct 2026 19:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 4AD1B2F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 3CCFE605EF
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 6UTq1xGWO_RS for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:42:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6E7C3605EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793043750;
 b=jCszUg2Yfp37194V5tUnAvp0BfTqtuTNVPjkZ1xPfSKiRud5LXiJlLGKUxy+8kyyddN9
 RJWpl1xUBqDrIW7Uf6xKODImGkSomFRbPUCWuFsLOzl1Rmgh3UdCuNr1P2PiJaSKMjUrk
 jQn4Pr6WB9VpU/Sq5AWfSc1+unUbc2sgmrnpRHyw10JstVYOUgLZrHLpYW7Acwmsr4mtt
 yakITkEM9B3FyKjTmCjiRqrBIk6H0Jhk4Radc49QdV2oJ4ZuBRvgQFb+2jIRIBpUnLQPI
 iFZ5Zo0n3/YtStx6+XxvFzz/I8DHiWWiVB1iQwfwTLhG3x5E6hYQ/z8/2Mv9/nStIYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793043750;
 h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=JA/iOKhKQvqwlgxkyiO77Fe8IwiUMRkw7xh8ta/gHug=;
 b=INSCJmpOwoxoyhjwPzP2DZCrxaCKGgm4n+n4WbTfRCzqDsf74pODXHdM3fLp906AOS9D
 b/6t3n8iystnO9rg7Wyf40TtSIn243UEsLpEUC5/FQ5vagqU/PE2ncCEOJ+lsZdjznouu
 UTVLTubkat32+hv+9ujJG0TyXDsasD4UNZ1kOo+EcYTWlz9Duj9NnsHP7lsa24aQG9pCC
 b1oLa2tLYttOaZ3yU0LZa5dZtli/dkQtRq8550ZPYSmB31CGY6thgtMHE0cBp/sqNQuo+
 ikOInZ920ZROJfRMzJa+aMiB59n9NW9bWFai4uVe+Ns6k0NPKUmq5UTy7QyvpoTtk/A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=ISnL2L6Z; 
 arc=none smtp.remote-ip=172.234.252.31
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id 6E7C3605EE
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:42:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id E9B90434F8;
 Mon, 26 Oct 2026 19:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4867A1F01825;
 Mon, 26 Oct 2026 19:42:26 +0000 (UTC)
Date: Mon, 26 Oct 2026 21:42:23 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <at-tH1CldypKDZJz@kernel.org>
References: <20261026190956.376568-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026190956.376568-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/swtpm: security bump version to
 0.10.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 08:09:55PM +0100, Fiona Klute wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> CVE-2026-75900: Fix length check in SWTPM_NVRAM_CheckHeader()
> https://github.com/advisories/GHSA-gqrg-h59c-j4wj
> 
> Upstream changelog:
> https://github.com/stefanberger/swtpm/releases/tag/v0.10.2
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
>  package/swtpm/swtpm.hash | 3 ++-
>  package/swtpm/swtpm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
> index ebad1ef4bf..4f6cbfd61d 100644
> --- a/package/swtpm/swtpm.hash
> +++ b/package/swtpm/swtpm.hash
> @@ -1,2 +1,3 @@
> -sha256  f8da11cadfed27e26d26c5f58a7b8f2d14d684e691927348906b5891f525c684  swtpm-0.10.1.tar.gz
> +# locally calculated
> +sha256  f61cf6f1e9bbcb4cefb30b70cafaf1c4df54c6961e65cfa63830e8ad0e220134  swtpm-0.10.2.tar.gz
>  sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> index de7f2fa05e..d6559c22d6 100644
> --- a/package/swtpm/swtpm.mk
> +++ b/package/swtpm/swtpm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SWTPM_VERSION = 0.10.1
> +SWTPM_VERSION = 0.10.2
>  SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
>  SWTPM_LICENSE = BSD-4-Clause
>  SWTPM_LICENSE_FILES = LICENSE
> -- 
> 2.55.0
> 

LGTM


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Br, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
