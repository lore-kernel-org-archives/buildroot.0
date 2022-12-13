Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58539C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5EB3417D9;
	Tue, 13 Dec 2022 20:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5EB3417D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkvirSFBlMbv; Tue, 13 Dec 2022 20:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D54417D3;
	Tue, 13 Dec 2022 20:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7D54417D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6B71BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32157417D3
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32157417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OD97mrEeFQWJ for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:38:33 +0000 (UTC)
X-Greylist: delayed 00:05:53 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B6AB4174B
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B6AB4174B
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:38:32 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5BzspaL7xOQIK5Bzsp2gos; Tue, 13 Dec 2022 21:35:28 +0100
Message-ID: <7c40c28d-3ad5-1b62-ad12-d84d822bbeb5@benettiengineering.com>
Date: Tue, 13 Dec 2022 21:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221213203236.171656-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221213203236.171656-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfDecGomXghlOYWB693gvS7n4P2pxiRLWepeSjrjdeP5J3jLRM/0CLSYxJyWuXbBVK8kp2cewD6zm5LSNBEi5g6gqByq2zM5kQHS0QiLPMAwo8mnJPwWA
 pjsoGhsNJozEP7EURQQDuduRyAHVEGuqNRA2R9YFIw435RxU0ZNa7H6+rfx2pDFxYu3IzQH0JqmSUe8fo4vw1a4sLoZJ8/iZeFYXuebxtSl2xQWMZlz5gd4f
 FHuE8HOTiR81Y5rXzz7v8W/HA55oIQILziN5QmB8M93ry6f1g45UYQ8r5/kg0vFO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670963728; bh=c6SYlJ3RZbYQWsXfs8zIN44DAwkRCnqQM08wf0J7VzI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=df4NsvbocaBya/wAXBL5tpZ1ijT6PigswuQm9pDh4iN+cndRE+LqiRr00UVZiaTa5
 JGZ1AMkVeVVyHXy5Tw5Tm5XAtoWnfC/fRf+pd2WIfmTZHU5Cs98bqiRXJEfdMPc65x
 s0b76BIMWFXXVlS7lGkVczscIT1IfqLtpfiW+0HstGk1uGzBZcn0Bkc6mKufe7B4Ht
 49JknlAU+A1aS15W/cyQEAAFdicZnqSBOaMc00Z+k1LHQ/2OQ58E2VhKfuJXbn2Xai
 kPiK7DImij75imnbPZhN2y2s8nX0Zz4S4RmTSjTmfnbB5AotYZVzNHF61Q+SyLTFRt
 czAEPsJUY+tMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=df4Nsvbo
Subject: Re: [Buildroot] [PATCH v2] package/rtl8192eu: fix build failure on
 Big Endian architectures
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/12/22 21:32, Giulio Benetti wrote:
> Let's disable the CONFIG_PLATFORM_I386_PC that is set to y by default
> involving the endianness to be set to little. This way we can set the
> CFLAGS according to architecture with some default define like:
> -DCONFIG_IOCTL_CFG80211
> -DRTW_USE_CFG80211_STA_EVENT
> -Wno-error

Fixes:
http://autobuild.buildroot.net/results/13a/13a809570423ead33628663033db4c3c4001a79b/

> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8192eu/rtl8192eu.mk | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
> index e1688eef1b..d967db90b8 100644
> --- a/package/rtl8192eu/rtl8192eu.mk
> +++ b/package/rtl8192eu/rtl8192eu.mk
> @@ -7,9 +7,16 @@
>   RTL8192EU_VERSION = 94bce7798bbb18de6d8b1646dedb2511f24867d3
>   RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
>   RTL8192EU_LICENSE = GPL-2.0
> +
> +RTL8192EU_USER_EXTRA_CFLAGS = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
> +			      -DCONFIG_IOCTL_CFG80211 \
> +			      -DRTW_USE_CFG80211_STA_EVENT \
> +			      -Wno-error
> +
>   RTL8192EU_MODULE_MAKE_OPTS = \
> +	CONFIG_PLATFORM_I386_PC=n \
>   	CONFIG_RTL8192EU=m \
> -	USER_EXTRA_CFLAGS="-Wno-error"
> +	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CFLAGS)"
>   
>   define RTL8192EU_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
