Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B79BC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247EB417D2;
	Mon,  5 Feb 2024 10:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247EB417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_wF0_rdxbmY; Mon,  5 Feb 2024 10:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52CC341568;
	Mon,  5 Feb 2024 10:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52CC341568
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0B031BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A1F60F51
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96A1F60F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghs31EAtQAwd for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:21:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CDE560F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CDE560F31
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3658440009
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:21:50 +0000 (UTC)
Message-ID: <7c076341-a91b-461c-86e2-27e0bca1a5ed@korsgaard.com>
Date: Mon, 5 Feb 2024 11:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <ec21ccc1-415b-422c-ad37-fe1602205c6c@infradead.org>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <ec21ccc1-415b-422c-ad37-fe1602205c6c@infradead.org>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/flannel: Bump to version 0.24.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/01/2024 12.00, Geoff Levand wrote:
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> 
> ---
>   package/flannel/flannel.hash | 2 +-
>   package/flannel/flannel.mk   | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
> index bafc453097..c1ceeed9e8 100644
> --- a/package/flannel/flannel.hash
> +++ b/package/flannel/flannel.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  flannel-0.14.0.tar.gz
> +sha256  f9e68bc9c5b41ee7f721a754c9fa4eddf3da775faa9e638581a564e33b3fabcf  flannel-0.24.2.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
> index b4e2b2f777..515ecfca86 100644
> --- a/package/flannel/flannel.mk
> +++ b/package/flannel/flannel.mk
> @@ -4,7 +4,8 @@
>   #
>   ################################################################################
>   
> -FLANNEL_VERSION = 0.14.0
> +FLANNEL_VERSION = 0.24.2
> +FLANNEL_SOURCE = flannel-$(FLANNEL_VERSION).tar.gz

I am not sure why you are adding this, as that is already the default 
value as pointed out by utils/check-package:

package/flannel/flannel.mk:8: remove default value of _SOURCE variable 
(http://nightly.buildroot.org/#generic-package-reference)

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
