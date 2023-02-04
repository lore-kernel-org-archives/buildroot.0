Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE7C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 11:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04BD60BE5;
	Sat,  4 Feb 2023 11:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04BD60BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMAlVSC2Nduv; Sat,  4 Feb 2023 11:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0048960B60;
	Sat,  4 Feb 2023 11:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0048960B60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD671BF42C
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 11:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82CE081409
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 11:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82CE081409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSdplDaNVSIJ for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 11:52:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 808288140B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 808288140B
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 11:52:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f055:ed24:459b:7ee:752f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1D835B0057C;
 Sat,  4 Feb 2023 12:52:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Feb 2023 12:52:12 +0100
Date: Sat, 4 Feb 2023 12:52:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230204115212.GC14083@scaer>
References: <175cc1e7e72602b9c0e8d6b761cf72b375383189.1675421166.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175cc1e7e72602b9c0e8d6b761cf72b375383189.1675421166.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675511536;
 bh=0C2K5dcjurTZ1mnjw79RtCdbI7pmMDDo1hy4/bN7anI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ifamz40F5D2e3wRDiTrdqfjOroDnAZVbsEobc5w2/fgd9PRROb5f/ASD3FzIKevhi
 2iRZaDKwcr27qyC6ZRBCF9I7046o1tkJx5w5bXEgPIXGkq40nO7vIO+P8ZVgc2XInE
 y/9DfJd2U3OwBjCYoxdTdhkCg/t2XBKnBccweSDD/xFaoFTmlbk3Z5TWikujJTt/n8
 cMBimChhjekXqQcv2pLlOiPaxk3+OPUuvjNs3WdpcxnTY//tWjzMo2+g9Sy73pm9sB
 1cB5XGZo2A8Lm4aCcz8l/YMJ8agEJZn8akzfLMUDs0hF05ZmGyLOjgD4JV0qt77BQD
 VdpFpf/suTZrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ifamz40F
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: bump to release 33
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2023-02-03 11:46 +0100, Stefan Agner spake thusly:
> This release contains mostly a bugfixes, with some improvements around
> error handling for unimplemented functionality and resiliency against
> runtime changes of dbus service-files.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/dbus-broker/dbus-broker.hash | 2 +-
>  package/dbus-broker/dbus-broker.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
> index f6c2cbe160..89b27ddddc 100644
> --- a/package/dbus-broker/dbus-broker.hash
> +++ b/package/dbus-broker/dbus-broker.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  bea7f653e7251063c5f427e9e3f93562d38a0d8667ae6d49fb56f113605985de  dbus-broker-32.tar.xz
> +sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
>  sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
>  sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
>  sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md

Unfortunately, there are issues with licensing info:

    $ make dbus-broker-legal-info
    [...]
    ERROR: subprojects/libcstdaux-1/AUTHORS has wrong sha256 hash:
    ERROR: expected: 32913ba08dc041f3f4ca361fc0d68014120e1c612772aabbcc901556df499ce5
    ERROR: got     : e796182869fe0892347d069f3f423774124987d6c45d016854fc51530633c177
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [package/dbus-broker/dbus-broker.mk:71: dbus-broker-legal-info] Error 1
    make: *** [Makefile:23: _all] Error 2

Can you look into that and resubmit the bump, please?

Regards,
Yann E. MORIN.


> diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
> index e82b79220d..c4e3679a2e 100644
> --- a/package/dbus-broker/dbus-broker.mk
> +++ b/package/dbus-broker/dbus-broker.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DBUS_BROKER_VERSION = 32
> +DBUS_BROKER_VERSION = 33
>  DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
>  DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
>  
> -- 
> 2.39.1
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
