Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAAAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 22:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8484404AA;
	Thu,  3 Feb 2022 22:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3y174qICdpC; Thu,  3 Feb 2022 22:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470304048D;
	Thu,  3 Feb 2022 22:29:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68AE01BF33B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 573EE60AFD
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahqRgwTUC2Ub for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 22:29:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id A748860AEA
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 22:29:49 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fkbrns3mvI46dFkbrnw5s1; Thu, 03 Feb 2022 23:29:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643927388; bh=ALZEDmcZ37a/TmiUL9YIgiW53bKhntiiZ2DVwZgYPcA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=mPYPEmU+CLRanOzrNFqsuVRGmjB8Yn4qBDa+dbEl+S4nmf3yaB3AH6j5QWgwzEZBj
 XA/relL+SfjbyXp5Gn4Hm5hAPplvBMACX+RzttMeymXAR5HByfBKrnpLTltNgsRKT6
 U9C4nVhuLquGLaUFCmD0B5DoWD0dUFFfOlBCfh2mdJqlkUaqK8Fkg+78LuLJq2yuPp
 DC2e6LSDKLUJldEl6gpskp+ZXoswt5QtikOq5agZaNqqp22sCuVETnx62Rww6jIXLh
 gS3T0q3HN43SHykT0SRWsm0V8kMTNag0sCnoVvCvvXHZz5bip7wQdWbRpgjIahOgBQ
 fNNdgo8VtJSJA==
Message-ID: <08bae7c4-b9cc-ebb9-c53e-5a3d0b5d044f@benettiengineering.com>
Date: Thu, 3 Feb 2022 23:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>
References: <412baee3-b818-521a-99bf-ee868d3e1be2@benettiengineering.com>
 <20220202220538.2858380-1-giulio.benetti@benettiengineering.com>
 <20220203212328.264bc948@gmx.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220203212328.264bc948@gmx.net>
X-CMAE-Envelope: MS4wfBGNjrQPEdFtKK/SRBO4LTqjVYTxQSJhyETV9BYsOKj4SfEunm4Rky2cidu3sWIscdLefd4lg36By46zSy/VWeUZtvbxINuTUIf+UlBWiDPes4m2Ep7V
 fT4S6Hvfi8oo8L/005SuFOc3ItRjUDOeFTfolSDqF0HXw3iwjzajEMWAgLBqh+Q2ZBfzUts2w29n+N+0eWf6NR8JCPHM6ve/WlBEOFUIb+JFldT5xsEE8mQz
 IKWOFOylp/IGA6Ch1Fu7PaL7mPSiOHuvDA0NLJ4bwi8akSKoSLeHlKNm/ErIgaCcLbsGWzVgGLnLVf+BuC1oJA==
Subject: Re: [Buildroot] [PATCH] package/util-linux: improve host build
 failure fix
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 03/02/22 21:23, Peter Seiderer wrote:
> Hello Giulio,
> 
> On Wed,  2 Feb 2022 23:05:38 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> As suggested by Peter Seiderer package util-linux doesn't need raw support
>> when built for host, so let's remove:
>> HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>> in favor of:
>> HOST_UTIL_LINUX_CONF_OPTS += --disable-raw
>> This is a better approach than my commit:
>> https://git.buildroot.net/buildroot/commit/?id=d895bd973b35fde10d3dd7db530d9e4782926497
>>
>> Suggested-by: Peter Seiderer <ps.report@gmx.net>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Tested with registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314:
> 
> - reverted 'package/util-linux: fix host build failure' (d895bd973b35fde10d3dd7db530d9e4782926497)
>    --> build fails with: No rule to make target 'disk-utils/raw.8'
> 
> - build with 'package/util-linux: fix host build failure' (d895bd973b35fde10d3dd7db530d9e4782926497)
>    --> build o.k.
> 
> - build with this additional patch
>    --> build o.k.
> 
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> 
> 
>> ---
>>   package/util-linux/util-linux.mk | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
>> index 5a4ff64d01..f3297257cf 100644
>> --- a/package/util-linux/util-linux.mk
>> +++ b/package/util-linux/util-linux.mk
>> @@ -41,7 +41,6 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>>   	touch $(@D)/disk-utils/raw.8
>>   endef
>>   UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>> -HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>>
>>   HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>>
> 
> The line above reads:
> 
> 	# We also don't want the host-python dependency

Oh, you're totally right

>> @@ -49,7 +48,8 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>>   HOST_UTIL_LINUX_CONF_OPTS = \
>>   	--without-systemd \
>>   	--with-systemdsystemunitdir=no \
>> -	--without-python
>> +	--without-python \
>> +	--disable-raw
> 
> So I would move the 'disable-raw' down to line 196ff (or below to an
> extra 'HOST_UTIL_LINUX_CONF_OPTS +=' section with comment why...

Yes

> With this change you can add my:
> 
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> 
> Regards,
> Peter
> 
>>
>>   ifneq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_CRAMFS)$(BR2_PACKAGE_UTIL_LINUX_FSCK)$(BR2_PACKAGE_UTIL_LINUX_LOSETUP),)
>>   UTIL_LINUX_SELINUX_MODULES = fstools
> 

Thank you!

Going to reply with V2.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
