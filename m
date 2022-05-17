Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A222C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269ED833D3;
	Tue, 17 May 2022 20:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8AcBWqhzShW; Tue, 17 May 2022 20:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B70982A56;
	Tue, 17 May 2022 20:52:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E94281BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D848D60A93
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lf3lsYDFLsqI for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:52:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E982B607F2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:52:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:38de:5f35:431:927e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 47A4613F81D;
 Tue, 17 May 2022 22:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652820753;
 bh=jzRAjGnLEJAUHvE60+sUI7FrwfRtWg63tR7navNA578=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pi3m269X4E+ujrDIyTPC8GgogmqWgovyHhh+Db8Sg9ipr9QMHlPaK7NlX1qjjAm+X
 Ma68fCdIoY0SK6kD/c2O4ptMtdWiKE69e+oCna/zy3Rw3G/AVaByN3nzvISBYvB/Gm
 RUJm852L0Ktqyj7Myg0bKetomAZTHfz05XnTmEj06vE3E0QHeJjDWZJacKKDbe180m
 1K1eH/+xLPWYN0j9t1LN2yYLgJHN17hVdWjRiVUhmq4X9jYtEJ5AWw4BQDJxfWNXrD
 Tbx7QKuRaeXQKlZS7zEVjW93YAbFGMziOUmrLo+v8g63MmrmsIu3tWRpXUTM+9RLlB
 1Ri4zQiXxnsPQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 22:52:31 +0200
Date: Tue, 17 May 2022 22:52:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220517205231.GU1597494@scaer>
References: <20220514150528.165356-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514150528.165356-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python-avro: fix capitalizations of
 Parse
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-05-14 17:05 +0200, Romain Naour spake thusly:
> python-avro 1.11.0 deprecated schema.Parse [1] and actually error
> out when used.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770
> 
> [1] https://github.com/apache/avro/commit/3e79dfec8461fb0157f068cff7ba24be8cdfa9d8
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/sample_python_avro.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/sample_python_avro.py b/support/testing/tests/package/sample_python_avro.py
> index 79d2dcdb22..46363ad2bf 100644
> --- a/support/testing/tests/package/sample_python_avro.py
> +++ b/support/testing/tests/package/sample_python_avro.py
> @@ -1,8 +1,8 @@
>  from io import BytesIO
> -from avro.schema import Parse
> +from avro.schema import parse
>  from avro.io import DatumReader, BinaryDecoder
>  
> -schema = Parse("""{
> +schema = parse("""{
>  "namespace": "org.buildroot.package.python_avro",
>  "type": "record",
>  "name": "Developer",
> -- 
> 2.35.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
