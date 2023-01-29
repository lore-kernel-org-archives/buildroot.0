Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB7C54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B812360B0F;
	Sun, 29 Jan 2023 21:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B812360B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnEHC9F7VAPz; Sun, 29 Jan 2023 21:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5861060BAA;
	Sun, 29 Jan 2023 21:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5861060BAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C8DD1BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41F8360BAA
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F8360BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKdYkSIDScH1 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:46:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D5A760B0F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D5A760B0F
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:46:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AAE625FF9A;
 Sun, 29 Jan 2023 22:46:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 22:46:49 +0100
Date: Sun, 29 Jan 2023 22:46:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129214649.GZ2632@scaer>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127141058.2180747-4-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675028815;
 bh=DXJu4g0hjqYdI1LNnJbdLOa6BGBYDxAPaVbRvUP3/YY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIvHMdpXeExbIsmImOKDg+TyiIYtFUCpWiIpAkub6iKSl+9mqtDydmsvlM1aQokps
 pnKrUOWCNh+MboSRKdqCwAMlV+qKBBEq5d3QnY/Svnm0LCzzSfnOMpYWjgKmO4Y+nL
 iVp6VdlpcvYR4U4nbdOGnqG8B/C4BIqShECBNRwj3Rpqh3BnY8Hx6SIYWn7Hgu9aJq
 Yxg3Sv0pg0oVeSgWRZZAjOlt2FCggpovZZNDNr1Mf+d5UoiuCfuuwMqZ/XiuwY+hMU
 SEkmNJn1qyjz8xU7QKcXQ8FouO4jb448uMuR1g9a1k6kufagqFE3yz/cvqWiIP7TLF
 sTeNG/B95w0jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YIvHMdpX
Subject: Re: [Buildroot] [PATCH v4 04/13] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> From: Stefan Hager <stefan.hager@ginzinger.com>
> 
> This package is required by tensorflow-lite.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
> new file mode 100644
> index 0000000000..1a36fc48f7
> --- /dev/null
> +++ b/package/gemmlowp/gemmlowp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# gemmlowp
> +#
> +################################################################################
> +
> +GEMMLOWP_VERSION = 08e4bb339e34017a0835269d4a37c4ea04d15a69
> +GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
> +GEMMLOWP_LICENSE = Apache-2.0
> +GEMMLOWP_LICENSE_FILES = LICENSE
> +GEMMLOWP_INSTALL_STAGING = YES
> +GEMMLOWP_INSTALL_TARGET = NO

Why not install to target? This needs a little explanations, even if
it's only a comment above, like:  # Only installs headers

Regards,
Yann E. MORIN.

> +GEMMLOWP_SUBDIR = contrib
> +
> +$(eval $(cmake-package))
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
