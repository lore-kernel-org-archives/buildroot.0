Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C86ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6D3761038;
	Sun, 11 Sep 2022 19:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6D3761038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJZVBgG8pQ10; Sun, 11 Sep 2022 19:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBBBF61030;
	Sun, 11 Sep 2022 19:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBBF61030
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 803101BF281
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AF7E40119
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF7E40119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AALqA7tpnSDe for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:45:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2F24400C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2F24400C6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:45:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E726E13F85F;
 Sun, 11 Sep 2022 21:45:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 21:45:25 +0200
Date: Sun, 11 Sep 2022 21:45:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220911194525.GI898622@scaer>
References: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
 <20220910135256.1689860-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220910135256.1689860-2-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662925533;
 bh=0/JjglxFnVu+5d7zVfbanWb4PqYX60zmm8NtGHgbU14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DXr39uW2wvYzBB/U+6/BCPfUwcVLbCZhgRwICDP05l2HCGBdZsL0p8WbCiWeq59t0
 XOivB4AajIfF7t2nwXk9VK94B9ZUINCa3AiyUnUbUg7Oh6p7Sogx6/PauuHiZZSn59
 MQ41bC5Je4Ipr64YsCjDSbdXASNL/+YlPpbrn9/4GHSOuKMDQwdJhnrbVbUFZiyfCq
 dKTKSUSK0Z4+zKvSSQnRboX91cQch2oQ4VUYbXbldimnCri/4lkn21+Xp4NjSpDxjZ
 x8Qn2p0HRTeWnGvku6xQBSwk2c8awaBYZVDA7uulgdMvRKQMeDOLi+k8FtgC+z18wz
 c7mM9eDkw3gLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DXr39uW2
Subject: Re: [Buildroot] [PATCH 2/2] package/qt5/qt5xmlpatterns: fix build
 failure due to gcc bug 90620
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-10 15:52 +0200, Giulio Benetti spake thusly:
> The qt5xmlpatterns package exhibits gcc bug 90620 when built for the
> Microblaze architecture with optimization enabled, which causes a build
> failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y like we
> already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

I don't see the point of mentionning 85180 here, because it is not
already used for qt5xmlpatterns, or any other qt5 package, and there is
no reason to refer to it more than to e.g. 68485 that has the same
workaround. So I drop that part.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/346/346e6d502a8927c8e95eea156f5b2943a85d0a6b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> index 3bb4ef74fd..6711e9bf70 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> @@ -20,4 +20,8 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>  QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
> +QT5XMLPATTERNS_CONF_OPTS += "QMAKE_CXXFLAGS+=-O0"
> +endif
> +
>  $(eval $(qmake-package))
> -- 
> 2.34.1
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
