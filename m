Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116C8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:05:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A09C360FDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A09C360FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FDF4605E2;
	Sun, 17 Oct 2021 17:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4H3gVcWYRj4j; Sun, 17 Oct 2021 17:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C757B605BB;
	Sun, 17 Oct 2021 17:05:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9B331BF5A2
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 17:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B46B7401A1
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 17:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHP4qMOugJdv for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 17:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF61400F6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 17:05:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B4F7C780344;
 Sun, 17 Oct 2021 19:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634490344;
 bh=8PZxmMQZcQRqRpPhTyfxydz07EsiKyuRYIjWnBOdIVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OqAayDDFW4svr8eKd44WGf3SWbEQY65bQSURLQLKIutC+YMooqfCxCb6rQ6A8obLz
 HvVAtOw4Z1j3sOJMleOXkImilIG0WPufUYCJRks7YCCH8Lnp/uBY7oMpUKyOGK+obf
 Q/XfrtUbr5G7Py+Z5q3gtwYHuYHoNsHENVPDUNFMkEjjEVPriRJFtZKobDT/2o6hQd
 r6c/l+aUWwTHUpR8mdN/Z9C8fAB3aE6XafX80CegnwMsm/a0JtsO34c/LXlr3nylW8
 RvwcIqh6xt1B1v1CUMmG/XDRekt6q8UFcEOwXwS8JS5CY8MJyf9GysP0IyacZmyoFN
 AzoQHCfI5BTeA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 19:05:38 +0200
Date: Sun, 17 Oct 2021 19:05:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20211017170538.GG2400@scaer>
References: <20210912141140.253778-9-romain.naour@gmail.com>
 <20210922201027.934860-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922201027.934860-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] .gitlab-ci.yml: update docker image to
 20210922.2200
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-09-22 22:10 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Commit 71b83227128be62c169313e85bb8f339f977ad67 updated the Dockerfile
> to be used in CI tests. In order to actually use this new docker image,
> update .gitlab-ci.yml to point to the docker image that was created with
> the updated Dockerfile.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index bf9f2dca6c..150b8eac1a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,7 +1,7 @@
>  # Configuration for Gitlab-CI.
>  # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
>  
> -image: buildroot/base:20200814.2228
> +image: buildroot/base:20210922.2200
>  
>  stages:
>    - generate-gitlab-ci
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
