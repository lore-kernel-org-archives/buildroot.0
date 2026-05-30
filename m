Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FB1CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 06:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2426542E93;
	Sat, 30 May 2026 06:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4IvdfM6wblW; Sat, 30 May 2026 06:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C0A42E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780121998;
	bh=YoXzIq8wZtp5u5JPLYvpNiz/LIJp0+zYGp8Y3VpYZdg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CW7MPYiVwYDZHejdBpZAf7bZQcVL75XdnbJUnFELUmcvq7t/l8K9IyfNIJO4QOeGA
	 FoirHbDsGHylPvxjtuw/sZPME6D4fLk4w4U1fLo2hlZ1QDSjQJKDHeqsuaGSD2z60P
	 LgAkfSlIm+sJVFXrC82yT6+nkkEY+u0LznNQsfPOPO1TejrczhpSich4deL8Sp0cOq
	 vWHxPxwT1i+h4EYjwr5QaEHLLh0E/TiI3wDvdkcg/7MUuyg7UL7a6ecRzeJGJ2oMmC
	 NUVIlU+CGZjbMjeN1hY5ecw1tQBU2QkmIkOgdvI0ut/pJFY/temmEU4piIdjRTtavY
	 AzgLCZJM4SXyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C0A42E94;
	Sat, 30 May 2026 06:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63FF6F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A5908512B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUl7P-87hVQp for <buildroot@buildroot.org>;
 Sat, 30 May 2026 06:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 460C485128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460C485128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 460C485128
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:19:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9540B97C67A; Sat, 30 May 2026 08:19:52 +0200 (CEST)
Message-ID: <f6f44447-0842-4540-a713-163b48ed0bd6@rnout.be>
Date: Sat, 30 May 2026 08:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260413-linux-werror-v2-1-e29e45398c56@cherry.de>
 <7539aa42-be40-4ed4-aac7-2de8a53b9d31@rnout.be>
 <EA0B9F90-EFC1-45B7-BC7A-AD261C75BE87@0leil.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <EA0B9F90-EFC1-45B7-BC7A-AD261C75BE87@0leil.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780121993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IoN47wrOtZnEaYFKdvYc3/+me13j9LF1wcKOvaT2/c4=;
 b=bdz8m7gyoIUKYmVHHFRTUE8HZGruSEmZZ/cSaQtfTBN03MFyMR/gjQOAm/5YJ8cq8XbfkR
 kMLGD6TBgLwSDCiA/B0ZCJIrgOm1APhsWg0kSBEzpT588DVKY+N8tece9hzFE0pLZ5pmTW
 azrobh8cby9hAUHHUgc0LqFyCVP317GEm4drQui5fMODWkf3ThnKTF7p8WwiWnjQGFC4Ge
 DLcV7poxB+1WbIlgSgPzk0RB+/NJqsy5lP182NOZgt0RlQArrcRRkHbBCVegSYLVaw3BBW
 QABbpzRSq0ohiCM+u+vUkwRdwxkm11D8EUSG8deD/7nE6Ld6RG92xhCud1yTdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=bdz8m7gy
Subject: Re: [Buildroot] [PATCH v2] Revert "linux: disable -Werror"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/05/2026 23:54, Quentin Schulz wrote:
> On May 29, 2026 10:58:19 PM GMT+02:00, Arnout Vandecappelle <arnout@rnout.be> wrote:
>>
>>
>> On 13/04/2026 11:08, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> This reverts commit 6b56e0b4f09b36140e2cb9e41072d5ac6074f375.
>>>
>>> commit 6b56e0b4f09b ("linux: disable -Werror") said we needed to disable
>>> CONFIG_WERROR in the kernel because it failed to build the esp-hosted
>>> kernel module. This was very much the hammer approach because a) it'd be
>>> better to fix the warnings in the kernel module or b) disable the
>>> kernel's CONFIG_WERROR *only* if esp-hosted is to be built, via the
>>> ESP_HOSTED_LINUX_CONFIG_FIXUPS variable in
>>> package/esp-hosted/esp-hosted.mk.
>>>
>>> This is a simple revert without making any change to any kernel module
>>> (including esp-hosted) because all upstream Buildroot defconfigs with a
>>> kernel module enabled build fine today (albeit with warnings). The two
>>> defconfigs that were pointed at by the now-reverted commit all have been
>>> (updated for and) run on master without failing the build.
>>>
>>> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Applied to master, thanks.
>>
> 
> Thanks!
> 
>>> ---
>>> I've rebuilt the kernel of all 307 upstream Buildroot defconfigs which
>>> selects the Linux kernel with:
>>>
>>> for defconfig in $(git grep -l LINUX_KERNEL configs/); do
>>>     d=$(basename "$defconfig")
>>>     make O=build/$d $d | tee -a log.txt
>>>     make O=build/$d linux | tee -a log.txt || break
>>>     rm -rf build/$d
>>> done
>>
>> That is some serious testing!
>>
> 
> Could spend some time building stuff on an idly server :)
> 
>>>
>>> and the loop didn't exit early and log.txt didn't contain any error: (or
>>> even warning: or ^^^ lines, which is surprising...).
>>
>> But, the commit message says "albeit with warnings"... Or does it mean that most of those configs anyway don't enable CONFIG_WERROR so this revert has no effect on them? Perhaps it would have been a good idea to identify those explicitly - who knows, maybe CONFIG_WERROR isn't enabled anywhere and your test didn't actually prove anything...
>>
> 
> "Albeit with warnings" apply to "defconfigs with a kernel module enabled" that I list below. There aren't many kernel module packages (out-of-tree) that are in Buildroot upstream defconfigs. It is thus proved that for at least a few of the Buildroot defconfigs which build both the Linux kernel and some out of tree modules with warnings that the Linux kernel defconfig doesn't have CONFIG_WERROR enabled (otherwise the build would fail).
> 
> I mentioned that building the Linux kernel from all 307 upstream defconfigs selecting it didn't output any warning or ^^^ line in the build log, though I noted this was odd. This means that I either missed the warning with my poor grep-fu or that there are none. What it proves though is that disabling the forced disabling of CONFIG_WERROR didn't trigger build errors on any of the 307 upstream defconfigs building the Linux kernel. Whether they actually enable CONFIG_WERROR is a different topic, but this proves no regression is introduced (at least when I wrote and tested the patch :) ). I did test with a custom defconfig that this flag is now respected and fails the build if there's a warning.

  CONFIG_WERROR is set by the kernel itself in the arch defconfig of i386 and 
x86_64 (and nowhere else). And for the few x86 defconfigs we have, we use a 
custom defconfig that doesn't set CONFIG_WERROR. So I don't think any of the 
defconfigs you tested actually sets CONFIG_WERROR, so this patch has no effect :-)

  And of course, whether or not CONFIG_WERROR is going to lead to a failure 
depends on both the kernel version and the toolchain version... That's a 
combinatorial space we don't want to try to cover :-). It is very unlikely that 
in all these combinations, there is _nothing_ that fails with CONFIG_WERROR set.

  So I think the proper solution is to make sure that it doesn't happen in the 
autobuilders. There at least we always use the same kernel version. And then the 
proper approach is to fix the issue in the external module itself and sending 
that patch upstream to the external module. Or just remove the external module, 
most of them are pretty crappy (which is why they're external to begin with).

  Regards,
  Arnout

> 
>> Anyway, it's applied :-)
>>
>> Regards,
>> Arnout
>>
>>
>>>
>>> I also built the kernel modules of the couple of upstream Buildroot
>>> defconfigs that build some modules, identified with:
>>>
>>> for module in $(git grep -l --full-name kernel-module package/ | xargs basename -a | grep '.mk' | xargs basename -a -s .mk | sed 's/-/_/g' | tr '[:lower:]' '[:upper:]' | sed 's/\(.*\)/BR2_PACKAGE_\1/'); do
>>>           git grep $module configs
>>> done
>>>
>>> which returns:
>>> configs/orangepi_lite_defconfig:BR2_PACKAGE_RTL8189FS=y
>>> configs/orangepi_pc_plus_defconfig:BR2_PACKAGE_RTL8189FS=y
>>> configs/mangopi_mq1rdw2_defconfig:BR2_PACKAGE_RTL8723DS=y
>>> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS=y
>>> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS_BT=y
>>> configs/orangepi_zero_defconfig:BR2_PACKAGE_XR819_XRADIO=y
>>>
>>> and while there were warnings, they don't fail the build of the kernel
>>> module(s) for those defconfigs. No available updates for all kernel
>>> modules I built, as far as I could tell.
> 
> ^^^^ this is the part which relates to "albeit with warnings".
> 
> Thanks for the feedback, lemme know if there's anything I can do if there's some desired improvement or follow-up to do.
> 
> It's late here and I'm tired so hopefully what I'm saying makes sense.
> 
> Happy hackathon!
> 
> Cheers,
> Quentin
> Hi Arnout,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
