Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0BBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:26:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB6C60EE0
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BB6C60EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32055404FE;
	Thu, 11 Nov 2021 08:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TgYmKiUiaeW; Thu, 11 Nov 2021 08:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F253404F7;
	Thu, 11 Nov 2021 08:25:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5AD1BF282
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A39C404F7
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbRdMLsTQXbI for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 08:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6FD940342
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 08:25:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d0bf:367b:1b33:f0cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 08D9813F8A7;
 Thu, 11 Nov 2021 09:25:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636619155;
 bh=mfFlntfqhHhacUvdZoXBR7Tb8iyZUrJBDSw4/9KrB3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mExouOlKepVdI+DrPWAInASvg4iGep3IkXPuM1Bu9pEKabTxZMgsQ5PxQL9CK39z+
 1qRWXRCAd4ZG4fmPtoUFQo1p6joZRxAut9O08noudL771IzcGQm4rwTiFwyNTOr3Sf
 yf/Z+Cng9b/+VKQJHkGJG0H6hzYJNEisN10GMIm1pIV+R3QPBR8NUXDpNjb1Xj3gjz
 TJ+cXQp3qfEUkHQyKsqMxfftQOgmqzDMMGihNuyOG2N0aoYeGxmZa/8pA6sHzQfosV
 Cv3wGIJ+QBOytKRK60LUAUy78DOYo01vwtQyYeb8K94HXi2v/OH4oQBTrVOY761znr
 t4EnHKzP8o82g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 09:25:48 +0100
Date: Thu, 11 Nov 2021 09:25:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211111082548.GA2504300@scaer>
References: <20211109220328.388872-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109220328.388872-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 RFC] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-11-09 23:03 +0100, Romain Naour spake thusly:
> Currently when a tag is added to the Buildroot git tree, the gitlab-ci
> create a pipeline with several hundred of jobs (~750) to build all
> defconfigs and execute the Buildroot testsuite.
> 
> However, there is only a limited number of gitlab-ci runner (9 runners)
> and some jobs reach the timeout limit (24h) while waiting for a runner
> [1]. Indeed, the Buildroot project doesn't use the Gitlab's shared
> runners.
> 
> In addition to the pipeline created when a new tag is added to the
> git repository, two pipelines are created each weeks to execute the
> Buildroot testsuite (on monday [2]) and build all defconfigs (on
> Thursday [3]).
> 
> At some point there are too many jobs waiting in gitlab due board
> defconfigs builds. Indded a board defconfig requires a lot of time
> (~30min) compared to other jobs in order to build a toolchain and a
> kernel linux along with a basic rootfs. There is currently 262
> defconfigs.
> 
> This is even worse when several pipelines are trigged at the same
> time (new git tag and scheduled pipeline trigger).
> 
> In order to reduce the number of long jobs, don't build board
> defconfigs with pipelines trigged on tag, keeping only the runtime
> tests and the Qemu's defconfigs.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966541
> [2] https://gitlab.com/buildroot.org/buildroot/-/pipelines/404035190
> [3] https://gitlab.com/buildroot.org/buildroot/-/pipelines/401685550
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: improve commit log
> 
> I would like to keep Qemu runtime testing when a tag is added because
> it test the toolchain provided by default by Buildroot on several
> architectures.
> ---
>  support/scripts/generate-gitlab-ci-yml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 7d09279bbd..232785f2e3 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -36,6 +36,9 @@ gen_tests() {
>               )
>  
>      if [ -n "${CI_COMMIT_TAG}" ]; then
> +        # When a tag is added to the Buildroot git tree, we want
> +        # to run the runtime tests and only test Qemu defconfigs.
> +        defconfigs=( $(cd configs; LC_ALL=C ls -1 qemu_*_defconfig) )
>          do_basics=true
>          do_defconfigs=base
>          do_runtime=true
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
