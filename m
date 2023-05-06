Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED99CC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C5794263C;
	Sat,  6 May 2023 16:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C5794263C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snIhVfj9U0IX; Sat,  6 May 2023 16:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D0F94204F;
	Sat,  6 May 2023 16:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D0F94204F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2D31BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65033401B7
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65033401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dj_lvPpi7dFt for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7432C40102
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7432C40102
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:10:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B5C8BB0053D;
 Sat,  6 May 2023 18:10:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:10:08 +0200
Date: Sat, 6 May 2023 18:10:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161008.GO252090@scaer>
References: <20230504000403.1443221-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504000403.1443221-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389411;
 bh=RxRpNLDz20Y6BSAhTuE9wdx4iVoqSNvHSGrdLJkWXfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=luk4baeRJXgI5cCJJV32Dwmf8ctguWAdFIRLiFhep3LR3buJtl2PguR2ET/0tUqsP
 5ZTmMGHb3NlZ8lOiwPVlmebAP+vpAqg9N6hZaZbKu+nKAVkgkGmH8szGf5qaznJwI0
 j4YiWR/K8U0PReavhPSUqrpo6r3D8VGroGjfJxahNlYb3Lmu6qR8nYX+JKbCdiE/r/
 YNFlE+wU4m0d+ZZfNPCK9DFbhVDl9En3qYE+39bjHtiWarFU2LAAO90EfxoSNrU7Fs
 zenUn8xLZN6wXLlCyJ5sJlCpdGB85r4dAWhM/VHlIZ1AvtJ0EwK8Wao7H/B8gDD7RK
 1xzhXjC/bQVNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=luk4baeR
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: bump version to 1.1.7
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

christian, All,

On 2023-05-03 17:04 -0700, Christian Stewart via buildroot spake thusly:
> This is the last planned release of the 1.1.x series.
> 
> https://github.com/opencontainers/runc/releases/tag/v1.1.7
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> index eee2e34cbf..1a68b74ccb 100644
> --- a/package/runc/runc.hash
> +++ b/package/runc/runc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  76cbf30637cbb828794d72d32fb3fd6ff3139cd9743b8b44790fd110f43d96b2  runc-1.1.5.tar.gz
> +sha256  f1885d6dfa188f8112328ac2355e5d67346174a2e2e795ec514a972bcbfcc2fa  runc-1.1.7.tar.gz
>  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index 9c6b5f9b37..805ff23964 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RUNC_VERSION = 1.1.5
> +RUNC_VERSION = 1.1.7
>  RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
>  RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
>  RUNC_LICENSE_FILES = LICENSE
> -- 
> 2.40.1
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
