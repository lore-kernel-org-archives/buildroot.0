Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A839C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 11:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30D78408C9;
	Thu, 29 Sep 2022 11:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30D78408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15pnEEh5dCE6; Thu, 29 Sep 2022 11:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BA4440222;
	Thu, 29 Sep 2022 11:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA4440222
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6881BF584
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 11:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53C2F60B8C
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 11:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C2F60B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NnlLv-2MsTq for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 11:20:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4469A6059D
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4469A6059D
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 11:20:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id draOonbrbSmRKdraOouJNH; Thu, 29 Sep 2022 13:20:12 +0200
Message-ID: <ca88cebe-45fb-8ba3-f37d-f223c7a94a5f@benettiengineering.com>
Date: Thu, 29 Sep 2022 13:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220928205527.GH1419013@scaer>
 <20220929111816.497911-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220929111816.497911-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfLQrRpaMHO4bofH9dt/r/Lz1PY0ivnURABAp4oldra4/sNDld2OQoDaCYiQReWCfYRpNApzI9qUlkyY/9mXkaxmpoFDPLfHdPbSIFN9XyLoXvpu/J6a5
 ShjLTEbrvb/dlDY1sne6ibD1/2U50RRMRqqlkwVO2VvoxwX5vZuHe/qg2I7hBuowxmalrmALaYUzyjMTTj8ExD5AU8YyJaV3GyYuD5n2Utm6AQo+a8fNnEZJ
 LNfsBjgj5J7+s4cKxa28D1p4joTNHGE9mCCjH894yS8z9w4DNDvuLqlMnzyn2++jDMC/BfbAdYSqseo4E8mXcyXnvyABm3+HAeZn77A0hzQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664450412; bh=2xmjUbxAiBprcNw5AzScAGFqsupaay4Q9pgrEVuTlZ8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=DSTUdC9Nsv+XqFkVMoOyBjES8sIyEO0/dooj1ZNLtemIdn1L3FzqqDdgfGUaSl5hf
 xbK2KD19ap5ACU4KgOHPmtoHo2P5B+a5DvXeCe+U39BIvGAV3obx4nKljGAEOgGsmk
 SfWoPtvhGYw5m4uJj2RZsveSvDrpyA09lSJtqPnTgGPVUecSbehBAfjwhy7BlzSQGj
 96jtZlmOBycvDNwdiFrSCztYDxSlFGweHhTvsKb4GcJwArGSRLYkEQA4J8jr2Hw8h9
 f1jdSoVzz3vmjZytGMyC6EX9VA1XwjDbEa4EvtSnGl3MsoI6okDsEYlZbMFa72zxEd
 m99cHZPrgvcpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DSTUdC9N
Subject: Re: [Buildroot] [PATCH] package/gitlab-runner: fix forcing openssl
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Forgotten,

On 29/09/22 13:18, Giulio Benetti wrote:
> BR2_PACKAGE_LIBOPENSSL doesn't force selecting libopenssl, to achieve this
> we need to use BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL. So let's modify
> accordingly and improve a bit the comment.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>

-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> ---
>   package/gitlab-runner/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
> index 72c2742562..bfa79ac80e 100644
> --- a/package/gitlab-runner/Config.in
> +++ b/package/gitlab-runner/Config.in
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
>   	select BR2_PACKAGE_LIBCURL_CURL # runtime
>   	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
>   	select BR2_PACKAGE_OPENSSL # runtime
> -	select BR2_PACKAGE_LIBOPENSSL # runtime
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime, force using libopenssl
>   	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
>   	select BR2_PACKAGE_TAR # runtime
>   	help

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
