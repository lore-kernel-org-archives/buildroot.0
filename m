Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71745C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A93E60D6A;
	Thu, 30 Dec 2021 17:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWorBMv5Fq1E; Thu, 30 Dec 2021 17:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A0C760C23;
	Thu, 30 Dec 2021 17:42:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DDEB1BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CFFC402B8
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmzTHhbzUwrE for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:42:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D07A40205
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:42:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:14b5:310a:ddef:6cec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9BE4A13F8B3;
 Thu, 30 Dec 2021 18:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640886148;
 bh=NxYhRtMmflAsL2yNUabuRCnIhZ4rcRE6kuWVEglSdPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=urdfX3bybl6lL3wKuhcX2ec4OzFdsornlHJUMZStxNb2JNUjYGc31QzCAmNiZsIbi
 +oeLB5hNYh1EVYFwhZV9O44SoEDadou0CiUmGTCBU/kpS7Gke4hPH3FqMFebHZYMbH
 qYxL9rxBp7iW+D5wDKTLoQW4udOm2qhsRb/qS8RvG1xdytPznJwyqTqjbLHSgxyMPO
 S1n3Wl5fAi34feS0vpshDSwdQmBwknYjF3ZTkhhG+WrPGs4nGZU/NWwA+hi1vCX9SS
 s6iJYDixI+Z7e8TY1QVa20Q0Zn97KO1Z4173cCCOJHN9WHgOKM6K/0KL+YUeyp0Nbe
 aSSL60Sifd3BA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Dec 2021 18:42:22 +0100
Date: Thu, 30 Dec 2021 18:42:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211230174222.GG3390456@scaer>
References: <20211229143843.1271981-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211229143843.1271981-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml:
 make it possible to test multiple defconfigs
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-29 15:38 +0100, Thomas Petazzoni spake thusly:
> Already supported:
> 
>  - Pushing a branch called "<foo>-defconfigs" tests all defconfigs.
> 
>  - Pushing a branch called "<foo>-defconfig-<defconfig-name>" will
>    test one particular defconfig
> 
> This commit adds support for:
> 
>  - Pushing a branch called "<foo>-defconfigs-<pattern>" which will
>    test all defconfigs whose name start with the pattern. For example
>    "<foo>-defconfigs-qemu_" will test all Qemu defconfigs
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Ideally, this should be documented in the Buildroot manual, but I'm
> not sure where it should be documented.
> ---
>  support/scripts/generate-gitlab-ci-yml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 8aaa456b03..3e0c68091b 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -66,6 +66,11 @@ gen_tests() {
>            (*-defconfigs)
>              do_defconfigs=base
>              ;;
> +	  (*-defconfigs-*)
> +            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%[^\-]*-defconfigs-\(.*\)%\1%')
> +            defconfigs=( $(cd configs; LC_ALL=C ls -1 | grep ^${pattern}) )
> +            do_defconfigs=base
> +            ;;
>            (*-*_defconfig)
>              defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
>              do_defconfigs=base
> -- 
> 2.31.1
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
