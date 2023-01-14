Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00252C54EBE
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 00:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9294F417B0;
	Sat, 14 Jan 2023 00:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9294F417B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tiaIOObwHzX0; Sat, 14 Jan 2023 00:29:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73580418C7;
	Sat, 14 Jan 2023 00:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73580418C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E59E61BF3C3
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD1E060AAC
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1E060AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5K73JdpwgmR for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 00:29:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF58860776
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF58860776
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:29:47 +0000 (UTC)
Received: from [10.0.2.86] ([88.149.186.89])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GUQcpK4xBvRk8GUQcpQi3M; Sat, 14 Jan 2023 01:29:46 +0100
Message-ID: <5a5b75bd-2a39-a142-b079-b3f885dca87b@benettiengineering.com>
Date: Sat, 14 Jan 2023 01:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: buildroot@buildroot.org
References: <20230114002433.1388538-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230114002433.1388538-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfG66O8XMGqKrhGQRPcS3qn3OfYDElTrBGVKvF+4QwzDxDBqJ2/bQgq43toXZvjpe8lVT5ttkbBiXETOSibkTa3XsPqR/XI7+uvT1f54CqmX7XiWx4JJQ
 VbTaQpx42uqRiH45cdZckymFdvB5alBLmreyA7VFsdxVKHFtaqXPefrRuzJTEZHruqzjwIB77mI088F0hxM1uVIGAUOk4bejECs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1673656186; bh=rO0QlUnWJOovah4Ml1UHWjOsE52XgAgmUjYEkYyjvLE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=hjJMeD/w99p36f+njLOFnOrNSBSjo0DALXdIJzor/CVR6A4BRVI/h90yykR01Beln
 UlkWJWY8YywQplYFGCMooy9NujY9OkORBbZ2QHhWXH0JQSBr5CnRL9AbWPNKYhH3tb
 ZcjTOC5AsTbpQ7YzEVmFzgd7Ci88JW0wUjG0cS98VwYqhZpfKxFfQPOkZqSQKZB7cQ
 A7gaD81j+Vo3qbNKD60a/VuugdyvwNXgsaTHn8Vmw6+tfqKF1ssxnU7e8xeRZ7+PeH
 2sVUkcJQj8AvN1SQ0nQNdZCYc0UZhJk6ZVKsISiapCXPwgIX3AMY8vlCz0Mr/yo0af
 IHAL31SZDP2Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=hjJMeD/w
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure due to
 missing Linux options
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

On 14/01/23 01:24, Giulio Benetti wrote:
> After fixing build failure due to missing Linux CONFIG_CFG80211 an error
> of conflicting Big and Little endianness came out. So let's fix it by
> disabling the default CONFIG_PLATFORM that is not CONFIG_PLATFORM_GENERIC
> but CONFIG_PLATFORM_AUTODETECT.

Here I'm wrong. CONFIG_PLATFORM_GENERIC is still generic with this git 
SHA1. So I'm going to send V2.

Please drop this
Sorry for the noise
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Fixes:
> http://autobuild.buildroot.net/results/aea/aea6bc1e4f89bd1010dfdc9caa54c37edb567d5f/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8821cu/rtl8821cu.mk | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
> index 18222e0014..501d849aca 100644
> --- a/package/rtl8821cu/rtl8821cu.mk
> +++ b/package/rtl8821cu/rtl8821cu.mk
> @@ -9,6 +9,14 @@ RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
>   RTL8821CU_LICENSE = GPL-2.0
>   RTL8821CU_LICENSE_FILES = LICENSE
>   
> +define RTL8821CU_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
> +endef
> +
>   RTL8821CU_USER_EXTRA_CFLAGS = \
>   	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
>   	-DCONFIG_IOCTL_CFG80211 \
> @@ -16,7 +24,7 @@ RTL8821CU_USER_EXTRA_CFLAGS = \
>   	-Wno-error
>   
>   RTL8821CU_MODULE_MAKE_OPTS = \
> -	CONFIG_PLATFORM_GENERIC=n \
> +	CONFIG_PLATFORM_AUTODETECT=n \
>   	CONFIG_RTL8821CU=m \
>   	KVER=$(LINUX_VERSION_PROBED) \
>   	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
