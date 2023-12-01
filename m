Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A68C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC01440492;
	Fri,  1 Dec 2023 20:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC01440492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xvTgT5Ff3BY; Fri,  1 Dec 2023 20:20:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D356F404A0;
	Fri,  1 Dec 2023 20:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D356F404A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB4491BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFDC3404A0
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFDC3404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmdg365v5voN for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:20:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 719AC40492
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 719AC40492
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3CAAC0006
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:20:01 +0000 (UTC)
Message-ID: <08138fda-74d4-46ee-833f-52aac135d125@korsgaard.com>
Date: Fri, 1 Dec 2023 21:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231126221637.5688-1-fontaine.fabrice@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231126221637.5688-1-fontaine.fabrice@gmail.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libzenoh-pico: add threads
 comment
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

On 26/11/2023 23.16, Fabrice Fontaine wrote:
> Commit 3e76df02b324b0442eec7bfd2451ee2fbb3709e9 forgot to add a comment
> about threads dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

> ---
>   package/libzenoh-pico/Config.in | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
> index cb61b0de55..5f7e91c9f6 100644
> --- a/package/libzenoh-pico/Config.in
> +++ b/package/libzenoh-pico/Config.in
> @@ -9,3 +9,6 @@ config BR2_PACKAGE_LIBZENOH_PICO
>   	  functionalities.
>   
>   	  https://github.com/eclipse-zenoh/zenoh-pico
> +
> +comment "libzenoh-pico needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
