Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB89BC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5468A8125B;
	Tue,  7 Feb 2023 22:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5468A8125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b32GoxPMcsUK; Tue,  7 Feb 2023 22:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA73811F9;
	Tue,  7 Feb 2023 22:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA73811F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C66D71BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD5E66108F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD5E66108F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xED3F91jAWaH for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:53:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 826D96108E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 826D96108E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:53:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E40B8B0056A;
 Tue,  7 Feb 2023 23:53:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 23:53:40 +0100
Date: Tue, 7 Feb 2023 23:53:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230207225340.GE2817@scaer>
References: <20220531190702.107175-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531190702.107175-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675810425;
 bh=NDopOKZwAg11rUiEAsIeJt0em5bjgkqUTPf+u//fgzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qB0hweQ3tet4fxCgd9seitVDe6se2jrDh5aIyQWonJBZVth819pkp9BFR31ycBP1t
 +KjU83XI/4SDdmEVTfS+wg4ipe8HOFlwjlxI6VvwXFAZtqRgU4NGgIo6CT3GhewgLQ
 UM8Izx2VyIwPNRvWK4RC1h0/p9Q2m+5kTekJ3tFtQjNiS7MKcI1a2zk22R5hVRyxAX
 QQxNuiZhAYtRN4diypFRt+M7YlQAGk1rzWAKw9QxLTc5ce6kuCvlVyzK5BT11L5bTz
 P/t7QV/iDu7kImSuMjihQwg4/Db2fUoIBn1uIPI84j5uWRTzI/YtGSTyG/1h4lb+Wz
 8ccf3pNMHFTEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qB0hweQ3
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: fix
 BR2_SHARED_STATIC_LIBS
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

This patch has now reached the infamous status of being the oldest patch
in our backlog... Sorry for that. :-(

On 2022-05-31 21:07 +0200, Fabrice Fontaine spake thusly:
> --static is added to pkg-config call with BR2_SHARED_STATIC_LIBS

As already noticed by Thomas, this is not correct.

In fact, zabix uses custom --enable-{stati,shared} options, instead of
usingthe standard libtool directives:

  1276 AC_ARG_ENABLE(static,[  --enable-static         Build statically linked binaries],
  1277 [case "${enableval}" in
  1278   yes)
  1279     LDFLAGS="${LDFLAGS} -static"
  1280     AC_MSG_CHECKING(if static linking is possible)

This is where your -static is coming from, and is causing those issues.

So, your fix is technically correct (but see below), but for the wrong
reasons.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zabbix/zabbix.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> index adc54028ad..85fd193b4d 100644
> --- a/package/zabbix/zabbix.mk
> +++ b/package/zabbix/zabbix.mk
> @@ -125,6 +125,13 @@ endif
>  
>  endif # BR2_PACKAGE_ZABBIX_SERVER
>  
> +# With BR2_SHARED_STATIC_LIBS=y, the generic infrastructure adds
> +# --static when calling pkg-config resulting in a build failure with

You'll also need to update that comment, of course.

Can you fix the commit log and the comment, and respin, please?

Again, sorry for the ong delay...

Regards,
Yann E. MORIN.

> +# libcurl or openssl. Adding --disable-static reverts this
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +ZABBIX_CONF_OPTS += --disable-static
> +endif
> +
>  define ZABBIX_INSTALL_INIT_SYSTEMD
>  	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
>  		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
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
