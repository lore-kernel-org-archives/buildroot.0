Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F136CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A613817A3;
	Sun, 13 Feb 2022 15:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYgtBPXx1_ib; Sun, 13 Feb 2022 15:06:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE3C814AB;
	Sun, 13 Feb 2022 15:06:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3E31BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76BCE402B7
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zs9CeGCtMvtu for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:06:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E06A402B5
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:06:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8910:5bc5:ca35:1c76])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4F5BD13F86E;
 Sun, 13 Feb 2022 16:06:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644764793;
 bh=7fudJ16X9ZDw31sDsgkd/zlTL4dvaQcS8WCxJ5vl+Ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QiTsdV+lBWNvvjZ+AdEFOUwO41Hz3o1by+CuY74fMN+V/CdhwxlfrumIrer5tsnJL
 sNrNfJUeO8tiANDDIdYx2WEmehwCYhGWJioGITvZo90wCkNUpJ1qeca+goq7ej6yiZ
 TU0zJ/4yKE6LONxFONVP90bS6cE1ELAfIHwGR6itpM0PKpE2Pfvf8zBEydrUIwKKXd
 I1UttkS9j5fCeOP7B4OlCT1vQbMESrO4jjA6NYU0IHUOW7tVUTJkpzoFxG/U8ToES7
 X6pw+/ftjIjTkNV8UDkakEeWPT0KuAJCKqnUy+K5aVUpcT8eeEIs+8JS0ZReLzV95X
 GGyBYFtIIyy/Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Feb 2022 16:06:21 +0100
Date: Sun, 13 Feb 2022 16:06:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220213150621.GD4462@scaer>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220205201837.3324085-4-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v6 4/8] package/qt5/qt5base: enable ccache
 via configure option
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?utf-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

+Arnout

On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
> This should be cleaner than editing mkspecs/common/g++-base.conf.

Is this actually fixing something? Is ccache as we sue it badly handled
by the qt5webengin buildsystem somehow?

Thomas, Arnout: IIRC some time ago, there were talks about using the
compiler wrapper also for the host compiler. Maybe this would solve this
kind of situations?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index d8a0bf1d16..4b7a2a937d 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -289,10 +289,9 @@ endef
>  endif
>  
>  # This allows to use ccache when available
> -define QT5BASE_CONFIGURE_HOSTCC
> -	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
> -	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
> -endef
> +ifeq ($(BR2_CCACHE),y)
> +QT5BASE_CONFIGURE_OPTS += -ccache
> +endif
>  
>  # Must be last so can override all options set by Buildroot
>  QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
> -- 
> 2.25.1
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
