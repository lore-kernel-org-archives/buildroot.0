Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2E9ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 07:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C205F81C0A;
	Mon, 29 Aug 2022 07:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C205F81C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXy38jlEU1vU; Mon, 29 Aug 2022 07:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89D5819CC;
	Mon, 29 Aug 2022 07:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89D5819CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9801BF2FB
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A5B400D3
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08A5B400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Io5eUxZ-cJJS for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 07:30:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA220400C1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA220400C1
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 07:30:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F28BF780516;
 Mon, 29 Aug 2022 09:30:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 09:30:24 +0200
Date: Mon, 29 Aug 2022 09:30:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220829073024.GT37358@scaer>
References: <20220828221705.58756-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828221705.58756-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661758228;
 bh=nUxqnsSJZoTu5eew0bSH32qwt5CXbE8HUGKBGrTjyZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LfKJJiCyaUIuXE0n4LFpDv5osStUk+uA1dSjKKYOerEXv/etB/GDWvaRKhujW6gvu
 DakAFdGEExVIGJ1VNpqkY1Z+TXWiGjFvhTq7TJDppskKApIfl97YPvt8MIgwWKl2Ck
 iyfm7nuRMq9jbYnHAERyO5qQ652pLpgAhBwO6Doko7EZaaICic16A6h9Waw15r9W0C
 0SCs8vkN5fJ/AE2j09LkS35nR846XMwLM9G+YHZLXJnJf6hsVHorJWbMLHhvMTAS/J
 LYKR/HWUSResit+zJa0G25yyQX3n70XROCIyscM1EfH/ZDCAG9AXa/cnKEc17y2hX6
 LxVDFZ0ZEUPtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LfKJJiCy
Subject: Re: [Buildroot] [PATCH 1/1] package/collectd: disable libupsclient
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-29 00:17 +0200, Fabrice Fontaine spake thusly:
> Disable libupsclient to avoid the following build failure if
> libupsclient is installed on host:
> 
> src/nut.c:40:2: error: #error "Unable to determine the UPS connection type."
>    40 | #error "Unable to determine the UPS connection type."
>       |  ^~~~~
> src/nut.c:46:3: error: unknown type name 'collectd_upsconn_t'
>    46 |   collectd_upsconn_t *conn;
>       |   ^~~~~~~~~~~~~~~~~~
> 
> libupsclient is an optional dependency of nut plugin since version
> 5.10.0 and
> https://github.com/collectd/collectd/commit/bc2d94024d0250211c1e498db1b43bb4525324da
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/22b758097e8fb72c68e41329cbc7abc748d81ca6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

However, I think a better fix would be to understand why this breaks,
even though we do have nut enabled in the config, and collectd's
configure did detect it correctly.

The issue is that collectd's configure script can not detect the type
(as in, a C type) for the structure that hols a UPS connection. And the
issue has nothing to do with the actual type:

    http://autobuild.buildroot.org/results/22b758097e8fb72c68e41329cbc7abc748d81ca6/collectd-5.12.0/config.log

    configure:107607: checking for UPSCONN_t
    configure:107607: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/bin/i586-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
    In file included from conftest.c:155:
    /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/upsclient.h:102:87: error: unknown type name 'time_t'
      102 | ssize_t upscli_sendline_timeout(UPSCONN_t *ups, const char *buf, size_t buflen, const time_t timeout);
          |                                                                                       ^~~~~~

So, the detection fails, not because of the upsclient is missing (it is
not!), but because the detection fails. Why does that toolchan not have
the time_t type defined? It is a musl toolchain, so maybe, just maybe?

So, I reverted the patch because I applied too fast...

Regards,
Yann E. MORIN.

> ---
>  package/collectd/collectd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 5751757040..e0f40095aa 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -45,6 +45,7 @@ COLLECTD_CONF_OPTS += \
>  	--with-nan-emulation \
>  	--with-fp-layout=$(COLLECTD_FP_LAYOUT) \
>  	--with-perl-bindings=no \
> +	--without-libupsclient \
>  	--disable-werror \
>  	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
>  	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
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
