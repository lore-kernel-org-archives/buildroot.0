Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62622C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:04:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E65D611ED
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E65D611ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BD183918;
	Tue, 27 Jul 2021 08:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ey7PUPrg32a6; Tue, 27 Jul 2021 08:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58BE8838E0;
	Tue, 27 Jul 2021 08:04:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 831A71BF293
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F8AB402C8
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5UbMrIrY5Ga for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 08:03:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51C0840205
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 08:03:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B83E18287E; Tue, 27 Jul 2021 09:57:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627372639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=L2rVxbI9d2uxaGqoICu/Wci5W29R8bvXcyea8zQ6g4Y=;
 b=f9wO8iEymIE1MEuTNL6GKvQNw5MVkYd6UOOJXfbsTlXmm9ce0JVIiEkoW46Pnab21NimlY
 RYfNNjsQ5wCWmQG5Xowt2yUolQQft2NGheNhwLE+qD8ugkgdQL15FOwRHM3NhYFHQt7Mx6
 Uu7aRrCxbjx8JIhayaMvdDASuMmqLok=
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210727072011.2272682-1-fontaine.fabrice@gmail.com>
Message-ID: <3dd33844-d383-c91a-4563-257adb959538@heine.tech>
Date: Tue, 27 Jul 2021 09:57:16 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727072011.2272682-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: hid needs hog
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>


On 27.07.21 09:20, Fabrice Fontaine wrote:
> Build of hid without hog is broken since commit
> fb9fc969d91f69851b4c70dba512b607e52bda7b:
>
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: profiles/input/bluetoothd-manager.o: in function `input_init':
> manager.c:(.text+0x2fd): undefined reference to `input_set_auto_sec'
>
> Fixes:
>   - http://autobuild.buildroot.org/results/9222879c9fe958e01e33f69531270355ea016d17
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/bluez5_utils/Config.in | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index 9f20bf83ac..f2b63b0a1c 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -78,6 +78,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
>   config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
>   	bool "build hid plugin"
>   	default y
> +	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
>   	help
>   	  Build plugin for HID (input) profiles.
>   

argh, missed that... thanks for fixing!

Reviewed-by: Michael Nosthoff <buildroot@heine.tech>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
