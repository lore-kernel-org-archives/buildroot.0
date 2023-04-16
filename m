Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA86C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 12:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB25840D9;
	Sun, 16 Apr 2023 12:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB25840D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8zSOZ0y_75I; Sun, 16 Apr 2023 12:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B789B83B83;
	Sun, 16 Apr 2023 12:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B789B83B83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E88131C3862
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 12:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C208B83B83
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 12:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C208B83B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFLK9P8z1alX for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 12:36:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8576D8215C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8576D8215C
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 12:36:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 61A1E5FFA9;
 Sun, 16 Apr 2023 14:36:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 14:36:08 +0200
Date: Sun, 16 Apr 2023 14:36:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Message-ID: <20230416123608.GA2819@scaer>
References: <20220904134613.31886-1-thierry.guibert@croix-rouge.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904134613.31886-1-thierry.guibert@croix-rouge.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681648571;
 bh=XPXEN3rMGsTQ3Sz61a1ISgg4OwwIvUkECC07CK6GC0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ksm4WdUAfML1WFaGIg29Ewgow6SW8V8iX6mil2Y4O+HkBiIC2eTQBSAnXpwG4O3RJ
 Lyd4VvaWFld8n1PXfIx5TSmLQhaiq97M8dIu25nOaCSGqqqb4K20kck8kZjgr0gZd/
 8EAcnVH8MvvnkZ/TlKja5D9DQh2RVKlQbYMey6cXVVyVT32X+2bM3AYKapOSid1hKB
 q8BoET8k8vo0U2utPU/DUg9/2YmE5XAIeW9DKIKj/9Z3qUqiypaaEIe913LZw18kxl
 hBkc7Q3F0Z4DhY8kSpFb1sdRrwSREGUYDWfYiCsX2cAQAvc/vdfN+gDypijbruBC9H
 vrU1/QAXN3kWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ksm4WdUA
Subject: Re: [Buildroot] [PATCH] Add documentation about docker registry
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thierry, All,

On 2022-09-04 15:46 +0200, Thierry GUIBERT via buildroot spake thusly:
> Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
> ---
>  docs/manual/adding-board-support.txt | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
> index cd90a5871f..f68e192468 100644
> --- a/docs/manual/adding-board-support.txt
> +++ b/docs/manual/adding-board-support.txt
> @@ -48,9 +48,22 @@ and configurations in these directories, and reference them from the main
>  Buildroot configuration. Refer to xref:customize[] for more details.
>  
>  Before submitting patches for new boards it is recommended to test it by
> -building it using latest gitlab-CI docker container. To do this use
> -utils/docker-run script and inside it issue these commands:
> +building it using latest gitlab-CI docker container. 
> +To do this use utils/docker-run script and inside it issue these commands:
>  --------------------
> - $ make +<boardname>_defconfig+
> + $ make <boardname>_defconfig

Both spurious changes in this commit.

Still, there was clearly incorrect formatting, so I've fix that in a
followup commit, thanks.

>   $ make
>  --------------------
> +
> +By defaut, buildroot developpers use our gitlab.com registry and it should

s/defaut/default/
s/developpers/developers/

> +be convenient for most usages. 
> +If you still want to build your own docker images :
> +--------------------
> + $ DOCKER_REGISTRY=registry.gitlab.com
> + $ IMAGE_NAME=buildroot.org/buildroot/base
> + $ IMAGE_TAG=YYYYMMDD.HHMM
> + $ docker build  --pull --no-cache \
> +	-t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} support/docker
> + $ docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
> +--------------------

I don't think it is very interesting to document how to build a local
image and push it to a registry; that's the basics of docker.

Instead, I've reworded to instruct people where to look for the offical
images, and that they can use it as the FROM directive in their
Dockerfile.

Applied to master with the above changes, thanks.

Regards,
Yann E. MORIN.

> +
> -- 
> 2.37.2
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
