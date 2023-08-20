Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF6EEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 08:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD48460B1B;
	Sun, 20 Aug 2023 08:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD48460B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzOcZhz4IFaJ; Sun, 20 Aug 2023 08:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5EC60E83;
	Sun, 20 Aug 2023 08:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5EC60E83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 920371BF2A9
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 08:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B41A81B83
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 08:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B41A81B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYwPPukPuyb2 for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 08:59:25 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F286381B7B
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 08:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F286381B7B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DDF5D19F5AD;
 Sun, 20 Aug 2023 10:59:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 10:59:18 +0200
Date: Sun, 20 Aug 2023 10:59:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230820085918.GF1778688@scaer>
References: <20230820083613.35259-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230820083613.35259-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692521962;
 bh=yWtLrKdcCEYofgSUUSMKhaLqyZJUq4OTlPnfH7nWaH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BExIsLQkkvlN5kObDO7AbOXHmQ60A23VdEMNPbTGqH5mneaFV796acLsUqpjFtYkG
 Bftly3rbsnzre4aC7RN2ScMKzxzrMOBiL0CtlRA01Zq2rJfyUNFHbxfjPNgotV4kOY
 OkYUWlOcVZT9bK45Ev322h6ebJ1rDigqeFdIuWQj3N9sBvbu09E+97oJ9YiXuBa2Jz
 LKYogcL6POZJmezH2Zzn3waUwu6YWvG57oqMNYbyS3N/84RFaHifvhQx1Bm2u49Bd6
 eR30anO53FSsnKGY6vR3/YLj9AdN+ivoFhDx3C1XCuf7SvjFS6tEEo5+GKznKqrKJi
 Z+G81wzgAzTdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BExIsLQk
Subject: Re: [Buildroot] [PATCH] package/mosquitto: security bump to version
 2.0.16
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-08-20 10:36 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2023-28366: Fix memory leak in broker when clients send multiple QoS 2
>   messages with the same message ID, but then never respond to the PUBREC
>   commands.
> - CVE-2023-0809: Fix excessive memory being allocated based on malicious
>   initial packets that are not CONNECT packets.
> - CVE-2023-3592: Fix memory leak when clients send v5 CONNECT packets with a
>   will message that contains invalid property types.
> - Broker will now reject Will messages that attempt to publish to $CONTROL/.
> - Broker now validates usernames provided in a TLS certificate or TLS-PSK
>   identity are valid UTF-8.
> - Fix potential crash when loading invalid persistence file.
> - Library will no longer allow single level wildcard certificates, e.g. *.com
> 
> For more details, see the changelog:
> https://mosquitto.org/ChangeLog.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mosquitto/mosquitto.hash | 4 ++--
>  package/mosquitto/mosquitto.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
> index 2cfd0d9422..cbe54d6d1a 100644
> --- a/package/mosquitto/mosquitto.hash
> +++ b/package/mosquitto/mosquitto.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking gpg signature
> -# from https://mosquitto.org/files/source/mosquitto-2.0.15.tar.gz.asc
> -sha256  4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6  mosquitto-2.0.15.tar.gz
> +# from https://mosquitto.org/files/source/mosquitto-2.0.16.tar.gz.asc
> +sha256  638db9e43e89d243ea98d10d66e76ff376131217780decd01abaffacc66d8035  mosquitto-2.0.16.tar.gz
>  
>  # License files
>  sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
> diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
> index a95a2cac4d..f146a86d0a 100644
> --- a/package/mosquitto/mosquitto.mk
> +++ b/package/mosquitto/mosquitto.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MOSQUITTO_VERSION = 2.0.15
> +MOSQUITTO_VERSION = 2.0.16
>  MOSQUITTO_SITE = https://mosquitto.org/files/source
>  MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
>  MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
> -- 
> 2.30.2
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
