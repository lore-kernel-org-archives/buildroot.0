Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F56C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF6E82D45;
	Wed, 16 Feb 2022 21:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqpgtf3mEQc0; Wed, 16 Feb 2022 21:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF6F82907;
	Wed, 16 Feb 2022 21:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 805161BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EFE882907
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_F_i3l5d-uh for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:56:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82ABD82846
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:56:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9933:bb4:98b5:c594])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EF95FB00535;
 Wed, 16 Feb 2022 22:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645048617;
 bh=nYE6eekFrBT1lp3lsg587ZyjPcBVMrNnD89g/popmZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qrk1IN8hL59PtVFupNu4b5xH+8ltywnjA+rgxTgAc3Bb05XLICJaq0I6Dm/rT/20B
 xxAX8gz5Zhea8Dzdy47PMjQWuwgt4caByU8W2vxJ4WgFJM8WyKQmR1a415REV4jcVp
 t5quxoMFvxeyA/FQcmkFa73vbulcz7fc8VkVCuwhNSyYU8bhefPkuKsdKjpEB9lFHf
 aiC402K690Fmhb8W7d5OZ8RAWYslJMwnLIZU0CH0IYHErURWo2FW4voymi5+GUwmGA
 rNkcxMaGyprRucwzWeRn6fkaHzorjOuthLHikKqgeJux0XJ9h62C/6dAFdEHIET/RI
 LYO2aWh9WenTw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 22:56:52 +0100
Date: Wed, 16 Feb 2022 22:56:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220216215652.GE522310@scaer>
References: <20220214173855.4071040-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214173855.4071040-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] utils/docker-run: hide docker run command
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-02-14 18:38 +0100, Giulio Benetti spake thusly:
> Since this is a helper script I don't find the reason to show the command
> we're issuing, so let's remove 'set -x' before running docker.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master with a reworded and expanded commit log, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/docker-run | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 0614f1325d..55dafd22a3 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -6,5 +6,4 @@ MAIN_DIR=$(readlink -f "${DIR}/..")
>  IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>          sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
>  
> -set -x
>  exec docker run -v "${MAIN_DIR}:/home/br-user" -t "${IMAGE}" "$@"
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
