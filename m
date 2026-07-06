Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8E1C44500
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 08:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 865CB812D5;
	Mon,  6 Jul 2026 08:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3AU5peIoYd4; Mon,  6 Jul 2026 08:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0031D812D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783326186;
	bh=PGeyMvfiz8ufM0G91GtcHbXJjCy9VoFJI1CkK7S80Zs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l77qFxngfM2G1lMIhBNHp/7C45ZlKpyIa/i6Nc+spDnzEvq6I5OvJr4DGeOIxoWmU
	 BvmbTNNvup1iftiUi5PZb1ntpwysQjNP/ziQdPLURO+DWJpgdpVk8a5/TJ6n0gruPQ
	 8UT1hF2xkcnUaOcdwvY2SVOQ2c1lNvVgFW5j+AbvVclivfV8vUxiuh7YSnUvylObMo
	 M6US7WX8DwwyzWWKrQTm2fnheISJcARThY6Yx9lKI1DCyXO4JxBshSnlqlz3Mj4e2D
	 eXC9OqTG86GYPHoJa+3zQEzHayzNmNurZJQC7k/xAqewfUAmBbCB6VUuGVtXSZ+oQh
	 T/7MPFpq1mryw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0031D812D1;
	Mon,  6 Jul 2026 08:23:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEF6D2A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB33140093
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv4RP8uGrS4Z for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 08:23:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 128B24008C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 128B24008C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 128B24008C
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 08:23:03 +0000 (UTC)
Received: from L30177.local (unknown [213.36.132.10])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4BD55B00573;
 Mon,  6 Jul 2026 10:23:01 +0200 (CEST)
Date: Mon, 6 Jul 2026 10:23:00 +0200
To: Philippe Nunes <nunes.philippe@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aktl5IUWFKCT5l62@L30177.local>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260701121937.346945-2-nunes.philippe@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701121937.346945-2-nunes.philippe@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783326182;
 bh=OMf2+ZZV0eRlbzD+K3h/wBpXeNaPDnm0kHy4WoxHI1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KYgSFu2rR/0WWC5XtHm+Pic171UMPEgKuzGpp6tDMagqotzkggBP/9q9wYJrMraAv
 HXq+dU+ekOP8BVa1DqR4Jrrw9AV3CJEh89p0vVmFJ21NOEuGHGxY+gUf9M1YHEXW0O
 0M4IzkrEOSiPIYPXuxS+vA15qtkvAXCACdQbcS3cqebVq4Nt474HfK5/aXkMbw2vjB
 8lT6iJLf7jtZJcMUctjy0n4iXvHbF6GEigfSvQobEJwCG3G88OfWSOhv5VUWwRH70y
 hamIoTLLADFyMimVF3UUwnPTjmxhybtKK9eJAA9RBlaiKIpTFnWEBo2y83SKPUqJkX
 B9GgWihJfk2Hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KYgSFu2r
Subject: Re: [Buildroot] [PATCH 1/3] package/mcpp: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Philippe,

Thanks, see below,

> diff --git a/package/mcpp/Config.in.host b/package/mcpp/Config.in.host
> new file mode 100644
> index 0000000000..b5fb6e30c4
> --- /dev/null
> +++ b/package/mcpp/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_MCPP
> +	bool "host mcpp"

The same can be needed on the target.

> +# --enable-mcpplib builds libmcpp.{a,so} alongside the mcpp CLI. The
> +# library is what most consumers embed (libqoriq-rcw, etc.); without
> +# this flag only the standalone CLI is built.
> +HOST_MCPP_CONF_OPTS = --enable-mcpplib

A shorter comment could be good enough:

 # builds libmcpp.{a,so} alongside the mcpp CLI

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
