Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C45C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5111640A25;
	Fri, 11 Mar 2022 12:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7TPcDqR-UIaz; Fri, 11 Mar 2022 12:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0B00408ED;
	Fri, 11 Mar 2022 12:53:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 376911BF3BD
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29F79400D4
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzTNeAaEonFd for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:52:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by smtp4.osuosl.org (Postfix) with ESMTP id D145F409FC
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=8UtNp
 BOba7jO4z91PAwN/rJzvUtz5h0ctl1urpQ2K7Y=; b=ClBwHjunZCATDAeJNZBDb
 MuTaNjCiQuxyufs5c/gbtIy8z7EcFa1/qN6cHF7db9GOsf+y9xwlTI7T4bJQNoWp
 hF0LTo4857qaGn67UkMFGnkGET3Wezj06G7zMMwYeI0xMvny2UYy018yxq0ggMb8
 yzcentOkKSprOh3lodCwt8=
Received: from [192.168.31.190] (unknown [123.185.181.179])
 by smtp7 (Coremail) with SMTP id C8CowABnzThwQitin8vXCQ--.55103S2;
 Fri, 11 Mar 2022 20:37:05 +0800 (CST)
Message-ID: <6920ae4c-efdc-8236-4634-b07d188bd559@163.com>
Date: Fri, 11 Mar 2022 04:37:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org, Christian Stewart <christian@paral.in>
References: <20220311044117.3213995-1-christian@paral.in>
From: TIAN Yuanhao <tianyuanhao3@163.com>
In-Reply-To: <20220311044117.3213995-1-christian@paral.in>
X-CM-TRANSID: C8CowABnzThwQitin8vXCQ--.55103S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4xCFy3WrW5ZF47ZrW5KFg_yoW8CFW5pF
 4ay3W5Zr48tF18CrW3X34UZFyagws5Wr1UA3WDXw1jqFnxXw1xJr18t3W0qr1j9r48Ww4f
 XF4DJFy8uFyjg3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ukl19UUUUU=
X-Originating-IP: [123.185.181.179]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbCqRrAjV0DeIohsQAAsC
Subject: Re: [Buildroot] [PATCH v2 1/1] package/balena-engine: bump to
 version 20.10.13
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 =?UTF-8?Q?Robert_G=c3=bcnzler?= <robertg@balena.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Kyle Harding <kyle@balena.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I suggest waiting for this [1] to be merged before updating balena-engine.

[1]: https://github.com/balena-os/balena-engine/pull/286/files

Thanks,
Yuanhao
On 3/10/22 20:41, Christian Stewart via buildroot wrote:
> https://github.com/balena-os/balena-engine/blob/v20.10.13/CHANGELOG.md
>
> Signed-off-by: Christian Stewart <christian@paral.in>
>
> ---
>
> v2:
>
>   - rebase: update commit against upstream/master
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   package/balena-engine/balena-engine.hash | 2 +-
>   package/balena-engine/balena-engine.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
> index ef590881f5..1054e22550 100644
> --- a/package/balena-engine/balena-engine.hash
> +++ b/package/balena-engine/balena-engine.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  43f4c985b855a4f731a5cdac214f1adf6c4cc2021cbad3f93856009df246d61c  balena-engine-20.10.12.tar.gz
> +sha256  88254fe4a5bcb9801ba0094226de65696fc754eca8143f601c75ba2f95893d3b  balena-engine-20.10.13.tar.gz
>   sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
> index 0afcea3d7e..402c586468 100644
> --- a/package/balena-engine/balena-engine.mk
> +++ b/package/balena-engine/balena-engine.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BALENA_ENGINE_VERSION = 20.10.12
> +BALENA_ENGINE_VERSION = 20.10.13
>   BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
>   
>   BALENA_ENGINE_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
