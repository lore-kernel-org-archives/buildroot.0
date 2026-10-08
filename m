Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD1CCA6007
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 05:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1638113C;
	Thu,  8 Oct 2026 05:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNlVcDgjTpdx; Thu,  8 Oct 2026 05:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 84B42810E9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791437586;
	b=lDVnOJjxv4jGTzN3WYNI3kV9rTR49Y9uAoGLnajzdFvnsXzPRI9n9oj81Ex3bgyXe4ZH
	 JmBNsA0I0OL2WKN3endXQJjU+FL+rAdbKDTS5WElxkwbSnP2jaWnqqUAIuIRTKnBWEzLy
	 GTIrCtpgvK8mOmvXQbqBbOau2mMHJwH4eaM84n4D2cR6mYx40FDHhS3YvCPW1BDP3sUHp
	 i+uwDwVdhZsoScEFXvpoK+WE1eASydPAlqPaHwN9DOeVmy/5Sv9+rp75tiRMUVVPDUgte
	 4U8XH6Hq1hh96j7aA9Ue1qR5w1su83yyj12Z8uHwVYgg6sV95JhOJt5bzIbal149z5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791437586;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:MIME-Version:In-Reply-To:References:From:To:Date:
	 Message-ID:User-Agent:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=HzMMfV3GMu6Xqc0gJ8j5mkjxnUitXoFdvuqk+yyMhrA=;
	b=TD1m33pJBZHpSj73IzfVUINR6/rNjUyllF1J70rNOM8c6QJqrvvK7npSoCgxot2ZatCy
	 1n4YIS/N4h7GseI86GX9TKyG48WBxghSkGJZDUEw6mokXz6WDU0+plswTCUKvuDhCqxfb
	 vixl4k+CqxclnzE+aNWfYSTWxLcUxjPiGNdnG3eds22byp4kEMdjxf+cSng+NSrLQXYow
	 3G9Rqy9Kc41xMam/ovtfz8t2gGKCErh0Is5AROGRnRQAkc4/yfF3dkfVFDxC9kX/s1kDo
	 93j34CDLI5RVs2qwnHmfIko70TJ4ZVhvhK6FID4jHoYGv+FFfynR2rqA50Pu1g0sYRg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791437586;
	bh=HzMMfV3GMu6Xqc0gJ8j5mkjxnUitXoFdvuqk+yyMhrA=;
	h=In-Reply-To:References:From:To:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOiM2KgEzR2GRlyogOBoMJA1SqrBROJYmPhUM4X7BSSoaTchdluMKNVnbT/BMbm+N
	 dj37531QwGEsJv3wIWQwjiYtpuuZnOZ0eXHtJjQmCS49QPWl2ju1Ck93ghRFV3hhiz
	 4PVe2XqvQ+1KCZUnZO9ZeiALYG7YDwVizRla6/dLSDLhPmDchJ8j+yVfVxLeKPl/A3
	 /CXCTxLHqhRrpAUMKzpoaeBbmE8oYrtzj1K3jAQ3O1TKlM7agMDy+65xpYDxVVeTqm
	 ulAi7Mt8X84TOHrSCxYXbDgku2BkP9Jgc1pgexkY7k93vAuZ8CuLVdSYGRv3s+WFS2
	 Ni8GXHxTY3/cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B42810E9;
	Thu,  8 Oct 2026 05:33:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 0D55722B
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 05:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id F3074404D0
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 05:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id gEjIs_5IrUZS for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 05:33:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AECEA404C1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791437585;
 b=VzeqFUYYvlCY4yf8L8dnBkULJwAgW/6hiqQ8i/9ALacU4DGJRei5G7EXXB1C6gvLKYvm
 vL8SJvpwqw7qcC90hM4mp8GX8PpfYflCEPKdVmvF60bFGNOznXyaGkQ0YjczdkwcNnQXs
 9jB5CWsKRlDXivviMK9LeOg1oYblU3pTOGXNYTpam2vpyMGg2nenZc3MRr2HcB1XS+wWI
 UpRVVgeVF5USqu8HMiHGKXrJe65ICW5dwA5OFA8/sdjIELLE31qnOfFhb9mLMrgkmlugz
 6w8xHlZ+HZaj/4zILGYRX7j55IKpxK9xxGzt3m1VZm4yKKy/x21xTAvsawrgecKFD+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791437585;
 h=Received-SPF:Received:DKIM-Signature:Content-Type:MIME-Version:
 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
 Date:Message-ID:User-Agent;
 bh=cjCLeUmcHUSAp+DYKODIBuVdX9b+zea9DDs2NiFX2TI=;
 b=kQfQPJhlEh6u1p2vJQAlxeZk4vCvKedYkGgez6GNmGHye/C0ZeEFLVMPlIpvufExO/Mu
 PLP4zz79INav4FNsi38QwM6PTkrHWfeDvEB6MjGTUvTQQmm1IuqGB23xcwygjAUACh/++
 PBTX3WppF5VB3ABk9JAeF/Pdw+RGcze62QaqTu4oX0aXY1VazOpT41a9ZRYQEL4RLfYiH
 uUiHun478Uv8ffC/0CADLVXqiIYJDL1rzkcyZtNev+oZmuhnFn2D+uO/l7iVgylKAcafp
 A0Djzdb+NHPSPp9pSGJrndQGzArzIDVctCCF0VXxWiJNW9Ps8Zl/uivHK08bAUsiVqw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b="VeHLGl8/"; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=paul.elder@ideasonboard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=VeHLGl8/
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id AECEA404C1
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 05:33:03 +0000 (UTC)
Received: from neptunite.rasen.tech (unknown
 [IPv6:2400:2411:160:2f00:e625:c75b:50f0:3454])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2FB8FC0F;
 Thu,  8 Oct 2026 07:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1791437462;
 bh=in6jKJyLfbTpEb0jK6VqYSB/8r3zMUhGz0HvKzoLvJE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=VeHLGl8/yCUbp6ncWNo29ZqGWc9XGgnjMarmM0S7U2aoEdbVbpW47HNfbTWpbi+fI
 2wqWiOqr6GRoy2JCwpicZ/+9A1q/rIMc6aClauzw+E+x+ZzP5RLtz97ol8Vnwk3Efg
 eYL4RTF3BLKqUwaHI5DmVSuPBD4/DtU7dlDBg3O0=
MIME-Version: 1.0
In-Reply-To: <20261007201107.1693337-1-bernd@kuhls.net>
References: <20261007201107.1693337-1-bernd@kuhls.net>
From: Paul Elder <paul.elder@ideasonboard.com>
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Date: Thu, 08 Oct 2026 14:32:54 +0900
Message-ID: <179143757438.2882041.5423478593217906753@neptunite.rasen.tech>
User-Agent: alot/0.0.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kmsxx: python bindings need
 python-pybind
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Bernd Kuhls (2026-10-08 05:11:07)
> Fixes configure error
> 
> Run-time dependency python3 found: YES 3.14
> pybind11-config found: NO
> Found CMake: /usr/bin/cmake (4.3.4)
> Run-time dependency pybind11 found: NO  (tried pkg-config, config-tool and cmake)
> Looking for a fallback subproject for the dependency pybind11
> ERROR: Subproject pybind11 is buildable: NO
> 
> using this defconfig
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_INIT_NONE=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_KMSXX=y
> BR2_PACKAGE_KMSXX_PYKMS=y
> 
> Fixes: 0710da403def5df6219c2b6a3f4cdfa5930b2a89
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Ah, we did need this... my bad.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  package/kmsxx/kmsxx.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> index 0678b50540..f52a104701 100644
> --- a/package/kmsxx/kmsxx.mk
> +++ b/package/kmsxx/kmsxx.mk
> @@ -20,6 +20,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
>  KMSXX_CONF_OPTS += -Dpykms=enabled
> +KMSXX_DEPENDENCIES += python3 python-pybind
>  else
>  KMSXX_CONF_OPTS += -Dpykms=disabled
>  endif
> -- 
> 2.47.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
