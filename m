Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBB1C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF74540540;
	Fri, 29 Dec 2023 20:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF74540540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z36Ni-yZjsYo; Fri, 29 Dec 2023 20:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC77743699;
	Fri, 29 Dec 2023 20:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC77743699
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFEAC1BF30C
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BB7E81CA7
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB7E81CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDGov6OQZqKZ for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 20:53:56 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C02781DE9
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 20:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C02781DE9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 260F6B0051B;
 Fri, 29 Dec 2023 21:53:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 21:53:51 +0100
Date: Fri, 29 Dec 2023 21:53:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZY8x33xg3_mh1wun@landeda>
References: <20231226165520.806663-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226165520.806663-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703883234;
 bh=uauZ2Wdzclcn+oM44s0pWljsrJXZzjLUnLznzKh5e5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CoXJMTJfvla/uxoGg9wt1/nn2vI4epAfL88Vob1UhHIya+Wz/REb+0mFX6hHLU5dK
 bQivzf5FKygY0LXbYtIvKdTTNZJRbWVMFyG49cEz2k/zZ25mAAFek+UP3/VKv3YE3n
 MfJHHdPF5aiftx2ZUNjJ9nZVXehapkZehzcyRe2+mQaVEYCh/gUhy92wn02Uxp1trf
 036uzp/tkLjtG4n0XRBpGFaroSktD9UFbIpg5a5c/NhYlmx3tvplM9VAdII0JCFdCd
 oQTBsI3Osm34nBPMvKXEbej8ljyul5rcGhT6zzYS5VWJhcpzMwUQo8RkoSq0xuarHc
 W1WiJD+psOAaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CoXJMTJf
Subject: Re: [Buildroot] [PATCH 1/2] package/libcap-ng: disable python3
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

Fabrice, All,

On 2023-12-26 17:55 +0100, Fabrice Fontaine spake thusly:
> python3 is an optional dependency (enabled by default) since bump to
> version 0.7.7 in commit 4314c86b0b932c3d381ae59b641366697906868f and
> https://github.com/stevegrubb/libcap-ng/commit/02fc25f9d3a00c7d7ccd619d8d678511a73b940b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcap-ng/libcap-ng.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
> index 46f72c702e..c33460d951 100644
> --- a/package/libcap-ng/libcap-ng.mk
> +++ b/package/libcap-ng/libcap-ng.mk
> @@ -12,10 +12,10 @@ LIBCAP_NG_CPE_ID_VENDOR = libcap-ng_project
>  LIBCAP_NG_INSTALL_STAGING = YES
>  
>  LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
> -LIBCAP_NG_CONF_OPTS = --without-python
> +LIBCAP_NG_CONF_OPTS = --without-python --without-python3
>  
>  HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
> -HOST_LIBCAP_NG_CONF_OPTS = --without-python
> +HOST_LIBCAP_NG_CONF_OPTS = --without-python --without-python3
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.43.0
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
