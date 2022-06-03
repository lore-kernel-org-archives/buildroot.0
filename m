Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D90C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 13:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A07F6401B2;
	Fri,  3 Jun 2022 13:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSlzbpAZ8ctl; Fri,  3 Jun 2022 13:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2A86409C8;
	Fri,  3 Jun 2022 13:49:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82CA51BF2F6
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 13:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70F83405DD
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 13:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id graeXUHlSKj8 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 13:49:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD7D5401B2
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 13:49:30 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 2AE7D440478;
 Fri,  3 Jun 2022 16:49:20 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1654264160;
 bh=B9f8+rNdPcPyE0zLXqKgfjEieYJUkC1UNDjCFK/fWx8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=JKCfEen8VKLjERT19pHsySA+aHh2sO1b0euvBvAaAm3H4hnkEPL7GSQDhAFBo8xnt
 ATvyWQTlq8kEv9fiUHzKYZhrLt8BSefXcWIQpuov6K8T5u96F2Q+ecN3unAq6ot8fR
 qK5p8h86XfAVE526b9ZilEOSfOkbbVR9pB/79hFJhSP6mlOnUzgm5BBULG2kYAkUCX
 O78nzxEMQGUG31uMGK0fUNf8XPMBhT8BGaOxE2PbBuKOQfDeUGYkuVHq5ccQtqwWGi
 VoES9q48m9e4QiVDtr8ZMWCi2rkuJd2y53OEK2bW4XSxMprpGSk5KUkqtP+KWE8Gir
 57uqO6rDQPn0A==
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
 <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
 <87a6b6pwqf.fsf@tarshish>
 <CALtfCQZPYEJBT=2hx6XJ1FH=ESHhw2N_LaqYbd+xdGkXxT503g@mail.gmail.com>
 <875ylup27u.fsf@tarshish>
 <CADvTj4r=46JdJUPSzOXgmXVDBWYDM3v5wsFjymbzGF1xoyzO4Q@mail.gmail.com>
 <871qwiozwd.fsf@tarshish> <20220602190001.0c4c9f35@windsurf>
User-agent: mu4e 1.6.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Jun 2022 16:47:21 +0300
In-reply-to: <20220602190001.0c4c9f35@windsurf>
Message-ID: <871qw5eu1l.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oscar Gomez Fuente <oscargomezf@gmail.com>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu, Jun 02 2022, Thomas Petazzoni wrote:
> On Wed, 25 May 2022 10:01:06 +0300
> Baruch Siach via buildroot <buildroot@buildroot.org> wrote:
>
>> The '*' in the table indicates no_std, that is, bare metal. That's most
>> likely not what we want for Buildroot. Can we map BR2_ARM_CPU_ARMV8A to
>> armv7 line the following:
>> 
>> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
>> index a86d95236d90..6aac703b2a4f 100644
>> --- a/package/rustc/Config.in.host
>> +++ b/package/rustc/Config.in.host
>> @@ -42,6 +42,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>>  	default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>>  	# armv7-unknown-linux-gnueabihf
>>  	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>> +	# armv8-unknown-linux-gnueabihf
>
> I think this comment would be misleading. Indeed, based on this
> comment, you could think that for this configuration (BR2_arm &&
> BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC) we
> would use the armv8-unknown-linux-gnueabihf variant of rustc, but
> that's not the one we would be using.

So what should be put in that comment? Just
'armv7-unknown-linux-gnueabihf' like we do for BR2_ARM_CPU_ARMV7A?

baruch

>
>> +	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>>  	# mips-unknown-linux-gnu
>>  	default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
>>  	# mips64-unknown-linux-gnuabi64
>> @@ -86,6 +88,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>>  	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI && BR2_TOOLCHAIN_USES_MUSL
>>  	# armv7-unknown-linux-musleabihf
>>  	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
>> +	# armv8-unknown-linux-musleabihf
>> +	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
>
> Same comment of course here.
>
> Other than that, it looks good to me.
>
> Thomas


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
