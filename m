Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EA9CD6E6E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAA3685657;
	Thu,  4 Jun 2026 19:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rD4diNQqxNV8; Thu,  4 Jun 2026 19:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB7A85655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780602750;
	bh=5lpG0CxmCBk+Fca5rhwvKhDHFOhssatKgAUIugeHrcI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ipGbYZhnnTjmFlicHEFQ5Hb8Yh5UwNsnycr8yT7pVLjVFGEXSoAmIYGA4OIXQkWqI
	 p5OEDZvIQD8TacKA5+Nfxx1GVo32H/eIdwk1ELX39dB6xt3HSFzp4p4cqq4/KGSI0C
	 Qn9kqFQorzAXaH4VGM52UJFlEev9uhc/rUnqiDNscQHveck1Nu/6tKv7wiWmdQvymD
	 sMQ3iKaNSo68XsqgMkG1mxdc/2C9+Vzg9Nd/HiQvSqSIwHlxUEhcfDju1N63/WyEvW
	 J9dJnANR+JlPvQkvZ02mj7WI0N0nmz9tOwS7Hfcoq7l/+4nW0FwA1dfUYB0DKrdpct
	 9xOI46aqyM3jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB7A85655;
	Thu,  4 Jun 2026 19:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F7A388
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA0BD85655
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dia3T4Px1ZXq for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 19:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F6C085313
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6C085313
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F6C085313
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:52:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A54AA13F89A;
 Thu,  4 Jun 2026 21:52:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Jun 2026 21:52:24 +0200
MIME-Version: 1.0
Date: Thu, 04 Jun 2026 21:52:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260604173511.2134198-1-bernd@kuhls.net>
References: <20260604173511.2134198-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <6a9cedc260016a00dd65361bf030f0f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780602745;
 bh=2MCGcsbZQYQHzFuyDQ2XVHb83r+ES/8UvGFb4of7DV8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dZkApDD6kyDsBTOQ0lsMd7IVi5v8TI0dNjuK88u/m4avj+CT7Az80Moln/zL4r43W
 0TsXyEBELFgJZU35Yvd/z2Mclt4zekXr0Tt/NTvPSYgkQScRH2iOk4oUbWcxJMKDD6
 xk3zkNztFZizBMvKliGrw01meQMqw+RcxminWtOePDd0cW3EifX+L0sL5ZQZ6OMA6/
 oNA/2DWkaQca02rhLPVD1HcTvsGOBwe/dYwTBn/fKRXV2VUU2oZmewlMM0gSr5Wz79
 VDjT5QH+o5zZiWJluMSOsH/q2+03hWVfI/qMqB6gW4L+wgIZTFgrNRPNayXJu17okF
 aljdzlZasM/eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dZkApDD6
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/06/2026 19:35, Bernd Kuhls wrote:
> https://www.php.net/ChangeLog-8.php#8.5.7
> https://news-web.php.net/php.announce/493
> https://github.com/php/php-src/blob/php-8.5.7/NEWS
> 
> Fixes CVE-2026-44927 & CVE-2026-44928.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
