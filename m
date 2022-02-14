Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC407C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 16:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6342F828DD;
	Mon, 14 Feb 2022 16:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcwI5UCguiYD; Mon, 14 Feb 2022 16:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F75824C1;
	Mon, 14 Feb 2022 16:28:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF2C1BF383
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B531824C1
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n71fx-YXHBm1 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 16:28:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1D1A828E3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 16:28:16 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JeCxnp9oIQUuPJeCyn91uP; Mon, 14 Feb 2022 17:28:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644856094; bh=OC8y79gxKwd4J03Rfnr+/Ggcym7wB6K8ruDlbtp14Ro=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=h9Oc5jbg4WspSjZp9kXAe1HVTJZIRjX97m5g30dtmX8OpjiYAC2m0aHvdPeGlKvAH
 JRf76LZEY4L17g3Pc7NoEZaZKBS2jLIiHARN5ysSQPdjZr+UVpTVaxTOo5C9hNa1rK
 cL5e1wmOZKiTLF1cCV+c+ICOw0ty7KVYKRIRyD89N1mI3hhiey5fDXmbJVhVmgNPvu
 mpvBnoDX4JoC3iJGgYppqfDx9JoNCO+37u43DFg48Yl4aoEub+quE93i4KZSQkcUV1
 fEVrzksTxg/+Hi9NAMi6tSmFYGtrsvDZ5uIjE/FzEO+uVPoB8YhPR0XA0ZA+R8zQDI
 6VyMgwUtGmcZA==
Message-ID: <26f4f710-d8d3-b4a9-faa9-6bd329dfba8c@benettiengineering.com>
Date: Mon, 14 Feb 2022 17:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
References: <20220214162413.17301-1-luca@lucaceresoli.net>
 <20220214162413.17301-2-luca@lucaceresoli.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220214162413.17301-2-luca@lucaceresoli.net>
X-CMAE-Envelope: MS4wfI9JTxNIA1cWxZJlAszFiJ7A8jG2tCIMqBBVrjqkl3XCQqEDm6RxXTGz5aAYmTemuxktbfw9aEosUJeGtqTWsnmHJhEhCmGgerOpk/nndEQAb8QmeHeq
 l9HQGxY0UqR8cbnRqvyg673oNOd6RZaQ2MhGhwS6pIQvH1XCkgfVqslV2z1fyVzZOYg5s/VQ7tFf2IzYdp33LOQaQ7bM8xIr/vgB0sGi7qL6NL9RUDJsnomK
 3sLJForlQaSjUQov7WMDBVs9PmJRdZ70/CteCOYhQkEBc/uGhoJ1t8DQQRXOTC/aNZndU8qOm0Cw1y0XpGu7Bw==
Subject: Re: [Buildroot] [PATCH 2/2] utils/docker-run: allow interactive use
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

On 14/02/22 17:24, Luca Ceresoli wrote:
> Without -i, the container cannot be used interactively. Allow using it as
> in:
> 
>    $ ./utils/docker-run
>    + exec docker run -v /home/ceresoli/devel/buildroot:/home/br-user -it registry.gitlab.com/buildroot.org/buildroot/base:20220206.1756
>    br-user@1e9508a4ccbb:~$ ls
>    arch  board  boot  CHANGES  Config.in  Config.in.legacy  configs  COPYING  DEVELOPERS  docs  fs  linux	Makefile  Makefile.legacy  output  package  README  support  system  toolchain	utils
>    br-user@1e9508a4ccbb:~$
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   utils/docker-run | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 979aec69b946..9fb895bcc628 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -7,4 +7,4 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>           sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
>   
>   set -x
> -exec docker run -v "${MAIN_DIR}:/home/br-user" -t "${IMAGE}" "$@"
> +exec docker run -v "${MAIN_DIR}:/home/br-user" -it "${IMAGE}" "$@"

Can you please also add --rm option too to avoid having a lot of exited 
containers?
It should go into another patch.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
