Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEE3C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 14:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA0BE40C23;
	Sat,  4 Jun 2022 14:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mx8YvII056bQ; Sat,  4 Jun 2022 14:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0422405C7;
	Sat,  4 Jun 2022 14:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DED11BF322
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66C95405C7
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJBYqTgPmM7k for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 14:39:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2061D4002B
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 14:39:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9C9EC5FFAD;
 Sat,  4 Jun 2022 16:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654353581;
 bh=LN7QPnYe+fE7qHgUZUp2tMGbA+ig5GpxYM0ZiTck0sY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JGi/GOSa7ov51Z0kItgfaLOgbvvx8eI7/zubtpFO25yXD+SNZA1bNfreqQrmqGD6g
 tuYtnvTipGSa8vwcr7jZ46vco0CkWohGFmSClFfdgTFaLyrrOA9spYy7ywyl7YhRLf
 d7iY+VM3trlishb6Ez0RgIacV3IZk0DjsRZ9IBnDqeKC6jeEQQZaUNLV76T1F7PDtK
 MVCVtYW0tS6QgkUYOj1ImX7YZfM79PN8gBDtaWqKRZjPX2EgOLz+L+E6cJ/4w8o9Yo
 B8SB3zOR9X6isb6hh7g6E/U780ypCmVCl34VDchIWMxHi/8X6z9gogriPeGPaGU9T/
 ZVNiSWhLkHXYg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 16:39:37 +0200
Date: Sat, 4 Jun 2022 16:39:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220604143937.GK427639@scaer>
References: <20220601203106.3436511-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601203106.3436511-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: disable cloud
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-01 22:31 +0200, Fabrice Fontaine spake thusly:
> Disable cloud to avoid the following build failures raised since bump to
> version 1.33.1 in commit 73dc2eef2dc40b78e732872b26eee0bcea1087d1 and
> https://github.com/netdata/netdata/commit/e7e5d0c37242d8457e4b2610a95effe0db5ca1b1:
> 
> In file included from aclk/aclk.c:7:
> aclk/aclk_otp.h:11:23: error: unknown type name 'RSA'
>    11 | int aclk_get_mqtt_otp(RSA *p_key, char **mqtt_id, char **mqtt_usr, char **mqtt_pass, url_t *target);
>       |                       ^~~
> aclk/aclk.c:48:8: error: unknown type name 'RSA'
>    48 | static RSA *aclk_private_key = NULL;
>       |        ^~~
> aclk/aclk.c: In function 'load_private_key':
> aclk/aclk.c:52:9: warning: implicit declaration of function 'RSA_free' [-Wimplicit-function-declaration]
>    52 |         RSA_free(aclk_private_key);
>       |         ^~~~~~~~
> aclk/aclk.c:65:5: error: unknown type name 'BIO'; did you mean 'EIO'?
>    65 |     BIO *key_bio = BIO_new_mem_buf(private_key, -1);
>       |     ^~~
>       |     EIO

I think this would be solved by enablign appropriate support in openssl.

> [...]
> 
> In file included from database/sqlite/../../aclk/aclk.h:6:0,
>                  from database/sqlite/sqlite_aclk.c:10:
> database/sqlite/../../aclk/aclk_util.h:6:29: fatal error: mqtt_wss_client.h: No such file or directory
> compilation terminated.

mqtt_wss_client.h is provided by netdata itself:
    netdata-1.33.1/mqtt_websockets/src/include/mqtt_wss_client.h

.. so I guess some mis-configuration.

> Fixes:
>  - http://autobuild.buildroot.org/results/6c87c0d1699fd518a989cb81a191419f427accc5
>  - http://autobuild.buildroot.org/results/aa77c027316b45e812eaf9ced61fb8e967bb987f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/netdata/netdata.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
> index dade6c625b..c0ce74d18b 100644
> --- a/package/netdata/netdata.mk
> +++ b/package/netdata/netdata.mk
> @@ -12,6 +12,7 @@ NETDATA_LICENSE = GPL-3.0+
>  NETDATA_LICENSE_FILES = LICENSE
>  NETDATA_CPE_ID_VENDOR = netdata
>  NETDATA_CONF_OPTS = \
> +	--disable-cloud \
>  	--disable-dbengine \
>  	--disable-ebpf \
>  	--disable-ml \
> -- 
> 2.35.1
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
