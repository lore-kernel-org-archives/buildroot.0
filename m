Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7CBC4167D
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 15:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D69C081EC5;
	Tue,  7 Nov 2023 15:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D69C081EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UV8ODPz3LW9S; Tue,  7 Nov 2023 15:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0442281EBE;
	Tue,  7 Nov 2023 15:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0442281EBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B50CF1BF867
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D5FD4183D
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D5FD4183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4YWKutVwFmW for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 15:15:27 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C915641814
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 15:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C915641814
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 65D0C13F8AD;
 Tue,  7 Nov 2023 16:15:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 16:15:18 +0100
Date: Tue, 7 Nov 2023 16:15:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231107151518.GC229059@scaer>
References: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699370123;
 bh=vLdN/MTamRNm0oINTdDyECdr1WJdx4zr8HQtcMErdAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nq2RQh4OJk9vtHqKV5w7s4Bd1hdvDwaioewQsr4pfK3etOZgHQV7pFxviJq0lvz3o
 60mpLoPOUKC86z1ydlooz5uh6BtRtK0WA107ksg8+0bqOCxeBZrdIK6mY0k/fBrM98
 69JXb5dH6Q8Eb/NHkVyxE6JUkeOB7uz6/SRBRZn5a2TGOGiL/GBWKzZPmIy5AYcKod
 pH1P21vNlWT/iuumbzdulo/dZOuntXCmQe0vdH8L3CvcOZGK4/ofjieBzZsCMcfitW
 bUmYH1nOFm/flzUsGvxCuP9Dl42x1XDO6sagmw+x+vLlkjyPtDYPudjzwiqd5JXUgl
 6ivUmg1BAr/rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nq2RQh4O
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix additional modules
 installation
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giluio, All,

On 2023-10-31 10:01 +0100, Giulio Benetti spake thusly:
> At the moment the npm_config_nodedir is set to the build directory but
> npm nodedir must be the one on target to find the expected files. So let's
> set npm_config_nodedir to $(TARGET_DIR)/usr.
> 
> Fixes:
> https://bugs.busybox.net/show_bug.cgi?id=15826
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/nodejs/nodejs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 2a8c570932..8f86413049 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -20,7 +20,7 @@ NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
>  	npm_config_arch=$(NODEJS_CPU) \
>  	npm_config_target_arch=$(NODEJS_CPU) \
>  	npm_config_build_from_source=true \
> -	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> +	npm_config_nodedir=$(TARGET_DIR)/usr \

So, there is a first issue in the original npm_config_nodedir, as it
references NODEJS_VERSION which no longer exists since 4cbc2af604e7
(package/nodejs: rename to nodejs-src and convert to virtual package),
when we renamed the actual version variable to NODEJS_COMMON_VERSION.

This is visible in the build log of #15826:

    npm ERR! gyp WARN read config.gypi ENOENT: no such file or directory, open '/home/marcus/repos/buildroot-upstream/output/build/nodejs-/include/node/config.gypi'

Notice the /nodejs-/ part of the path: it hints that a variable is not
expanded as would be expected; in this case, the wrong variable is
expanded. (I have started a build with the variable name fixed; let's
see what happens...)

Furthermore, even though this again is an npm-mess issue, I'd like a bit
more explanations on why we need to change npm_config_nodedir now, when
it has been working so far, since it was introduced 10 years ago with
commit b31bc7d43870 (nodejs: new package). Presumably, it did work then

Maybe the explanation is just "in fact it has never worked!", and then
it would be nice to know why it never worked.

Daniel, I know it's been 10 years now, but do you happen to have some
recollection of what was going on?

Finally, I *think* your patch might be correct, but not for the good
reasons...

Regards,
Yann E. MORIN.

>  	npm_config_prefix=$(TARGET_DIR)/usr \
>  	npm_config_cache=$(BUILD_DIR)/.npm-cache
>  
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
