Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E22C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 09:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC35641BE8;
	Mon, 20 Dec 2021 09:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUaDYAEWsQgs; Mon, 20 Dec 2021 09:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBFB41BDB;
	Mon, 20 Dec 2021 09:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76C521BF3F6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62DB7401D5
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZOGwHOh_mbl for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 09:34:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA03400F3
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 09:34:24 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id zF3lmkX9qYYTXzF3mmab1b; Mon, 20 Dec 2021 10:34:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639992862; bh=2wAcUqhNaUKJGlcty23ImmrgFYvv50jxX3BHdjLMOwE=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=IXWC0R1Wi8aCP3r7Fw/ov9L5cSZ3E+bNxMQPCs/U4ChUKoIcP1WoRrfVwitdUE3UA
 QZ36BJ2azo1hBuq70ebky+16/1t35hilSB50xjRBebe95vxgzHIfmCxLD1gRk9b74S
 7Upp34wMR63gkQN6ek+/QBHAY0EtF7Qi9SWom+Yil51q4M/8b7dm9RxbZBNJwVNHCb
 BYVPgu6Gu6cYKRRaE0+i43pI6H+1uBPRtmi9EpOTw1QXEgUzuzkoITD15wiBQohbHb
 e7nTEWrgd42OijcsjVJc048g4ZeocEgRtlb0OIciXP5DREh+t9i6czDhbOtmr4jzy+
 FiafcskAg0ISA==
To: buildroot@buildroot.org
References: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
 <20211014215455.2444205-2-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <8ef44878-632a-b7e8-e29c-d9fb4f7bb734@benettiengineering.com>
Date: Mon, 20 Dec 2021 10:34:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211014215455.2444205-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPSDXY9ShqY9bWbXkyBMXj2/VuXfKZ3F/H5GdT2IaUQIhZ80YubhL19AzBHAdCJCgSiw+x7GwXonZ3ycsVGIYY3qzJWA/tpcaNE4MKywGb/T+sCdyADP
 cxCMPLefv2U5G1Wbl/x0cP5P2kycX/tsdtEu8VN2aaMjJPbbIM0mmotQpAT4la8dehnhWMjV5fa0LDD+sAweGGid5LjqSPrq7YnM8MPbKrzPtUW9RvXZV8yc
 A0z7tipHW5eFlCc7i8lTSkYab1dH8dBbqfIAza3kJgk=
Subject: Re: [Buildroot] [PATCH 2/2] package/erlang-jiffy: bump version to
 1.0.9
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kindly ping

On 14/10/21 23:54, Giulio Benetti wrote:
> Bump version to 1.0.9
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/erlang-jiffy/erlang-jiffy.hash | 2 +-
>   package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
> index 19e4f96012..93c5e1f8c8 100644
> --- a/package/erlang-jiffy/erlang-jiffy.hash
> +++ b/package/erlang-jiffy/erlang-jiffy.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  7cf67840c58b8732e12c84c8a3b714774da2601ae5e6a57f286273e25b205516  erlang-jiffy-1.0.6.tar.gz
> +sha256  45c224afe0ea2d3ece39e227f01f5585ad53b8b91d2d6924f9f50548874ae879  erlang-jiffy-1.0.9.tar.gz
>   sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
> diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
> index dce6a0f8b3..25e7227c39 100644
> --- a/package/erlang-jiffy/erlang-jiffy.mk
> +++ b/package/erlang-jiffy/erlang-jiffy.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ERLANG_JIFFY_VERSION = 1.0.6
> +ERLANG_JIFFY_VERSION = 1.0.9
>   ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
>   ERLANG_JIFFY_LICENSE = MIT (core), \
>   	BSD-3-Clause (Google double conversion library), \
> 

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
