Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC3AC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D9D60BA8;
	Mon, 15 Aug 2022 20:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D9D60BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o9xffnaZMXiy; Mon, 15 Aug 2022 20:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3567F60B96;
	Mon, 15 Aug 2022 20:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3567F60B96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA691BF38D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19DC40298
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19DC40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2J4vAQjqjGNm for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:03:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52CDA401B2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52CDA401B2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:03:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 791E060129;
 Mon, 15 Aug 2022 22:03:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 22:03:29 +0200
Date: Mon, 15 Aug 2022 22:03:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815200329.GN2854108@scaer>
References: <20220814220241.203440-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814220241.203440-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660593813;
 bh=zZTmHQMXHwiPAcibWXp8VDq8++5eyEX+7sEGQrIHOm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQuOWfPMk6zEz6m4mGFXO0diNpBP30ZugShsAyKkgqz8hvrKEC4xBcZ3rOLXfPZSW
 lCnavz9WMPcEH74PNbcCe9/q2k2hNUTcZAFYHbqFlASpk93ZkcG/CD4h1vlSBcqmCK
 LGVznqgq2Pj9rOsPbTKK7cR77Tx04OqcyMDr/E2ua5MR3Cmu1yjipyRsjuCBH7ki2j
 zTEX8KDw06zuKHU+2kTeCQ6rd1khmQlDUHGKKR2fAeuIza86n93J6VKgVfJMr5TQag
 JN4EXGONfD1Xq8pTY+xmQuE+1ZibbSW/+x2NqnjvpYT9iHmSmw/pion29exagI/MGA
 /Hrj9IBULxnKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NQuOWfPM
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: fix libkrb5
 build
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-15 00:02 +0200, Fabrice Fontaine spake thusly:
> Fix the following libkrb5 build failure raised since the addition of the
> package in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:
> 
> configure: error: in `/home/giuliobenetti/autobuild/run/instance-2/output-1/build/freeradius-server-3.2.0/src/modules/rlm_krb5':
> configure: error: cannot run test program while cross compiling
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3968d611458060480d341bd60f7c50209a0ace15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

For the sake of sharing the blame with whomever applies that patch:

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/freeradius-server/freeradius-server.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
> index 2f4c118da5..5b74a3b01a 100644
> --- a/package/freeradius-server/freeradius-server.mk
> +++ b/package/freeradius-server/freeradius-server.mk
> @@ -15,6 +15,12 @@ FREERADIUS_SERVER_CPE_ID_PRODUCT = freeradius
>  FREERADIUS_SERVER_DEPENDENCIES = libtalloc
>  FREERADIUS_SERVER_AUTORECONF = YES
>  
> +# We're patching src/modules/rlm_krb5/configure.ac
> +define FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
> +	cd $(@D)/src/modules/rlm_krb5; $(AUTOCONF) -I$(@D)
> +endef
> +FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
> +
>  # some compiler checks are not supported while cross compiling.
>  # instead of removing those checks, we cache the answers
>  FREERADIUS_SERVER_CONF_OPTS += \
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
