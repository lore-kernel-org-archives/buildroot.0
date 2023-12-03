Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD31C07E97
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D5D5415CA;
	Sun,  3 Dec 2023 18:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5D5415CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjyirCXlOPTR; Sun,  3 Dec 2023 18:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B3C84156C;
	Sun,  3 Dec 2023 18:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3C84156C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C29C21BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BD5D4156C
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD5D4156C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Ymqe_QbtgEa for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:15:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A04D7414D1
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04D7414D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2355920002;
 Sun,  3 Dec 2023 18:15:28 +0000 (UTC)
Message-ID: <158689a1-fd02-471d-bcd0-e1fa974ebca8@korsgaard.com>
Date: Sun, 3 Dec 2023 19:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231121220706.506553-1-fontaine.fabrice@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231121220706.506553-1-fontaine.fabrice@gmail.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libblockdev: drop unrecognized
 options
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/11/2023 23.07, Fabrice Fontaine wrote:
> The following options were wrongly kept when bumping to version 3.0.3 in
> commit 18420d9b6b424492741cba495cc2e7a28a409e8b:
>   - dmraid (dropped since
>     https://github.com/storaged-project/libblockdev/commit/d174944a85169efae3bac0b6e76498e3d0c6c240)
>   - bcache and kbd (dropped since
>     https://github.com/storaged-project/libblockdev/commit/c1ff1c87e31fb2820a5694637eb221f590eb9451)
>   - python2 (dropped since
>     https://github.com/storaged-project/libblockdev/commit/8fc33b834529d3d18a73112e4c77ea0a5d26d62c)
>   - vdo (dropped since
>     https://github.com/storaged-project/libblockdev/commit/e51faac2a952da33925e3ccab0f4f0fdf3986cd3)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

> ---
>   package/libblockdev/libblockdev.mk | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
> index 3bbc221cc5..e0fca2b95c 100644
> --- a/package/libblockdev/libblockdev.mk
> +++ b/package/libblockdev/libblockdev.mk
> @@ -16,20 +16,15 @@ LIBBLOCKDEV_AUTORECONF = YES
>   LIBBLOCKDEV_CONF_OPTS = \
>   	--disable-introspection \
>   	--with-loop \
> -	--without-bcache \
>   	--without-btrfs \
>   	--without-dm \
> -	--without-dmraid \
>   	--without-escrow \
> -	--without-kbd \
>   	--without-lvm_dbus \
>   	--without-mpath \
>   	--without-nvdimm \
> -	--without-python2 \
>   	--without-python3 \
>   	--without-s390 \
> -	--without-tools \
> -	--without-vdo
> +	--without-tools
>   
>   ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
>   LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
