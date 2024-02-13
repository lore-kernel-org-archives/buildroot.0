Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAE6C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 18:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B75B81E4F;
	Tue, 13 Feb 2024 18:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNVhN83Ua7KS; Tue, 13 Feb 2024 18:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F3D82237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5F3D82237;
	Tue, 13 Feb 2024 18:17:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 656FB1BF284
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5243860D70
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJajjENBwTaG for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 18:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1EA160D6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1EA160D6F
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1EA160D6F
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 18:17:51 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZxLorabghPNlaZxLprz0Pn; Tue, 13 Feb 2024 19:17:49 +0100
Message-ID: <75e279f2-ff11-4ff8-bb59-f33b352ea3f7@benettiengineering.com>
Date: Tue, 13 Feb 2024 19:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
 <20231204231212.36450-3-kilian.zinnecker@mail.de>
 <8f6baf1d-3caa-4b47-aad9-a34fa0761058@benettiengineering.com>
 <2172310.irdbgypaU6@laptop>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <2172310.irdbgypaU6@laptop>
X-CMAE-Envelope: MS4xfGAQ+hMd5zM6Ks8K0Qws9ctP9oPCxdI6cB9SbdBjw+BhSVw7Pt2xfMj6JELezvueN0x8cv5MldB7PUQvq2jPt7qHcgor3v0dfSTIfEsr9rjk3kxmZ/cb
 hDiweMgSKKEgERhMIkqdiv9iTZ2X4/d4LIScRRe9S2GuYJdwl+FVQbSgBZNt+qv+6ZTVC7pUZRk8eCvFVIn+IKmkOQM1ZQSkhazLqPjdtAB3/mZRfEoTAlxZ
 94EDZ0TbPKoLQhCeOkiG6T79M/nBHEPFHZOE6BVr3NXVxPyf6mmS5W4nB03hW/q1l4VdS/xKM6wkBaWGosrfKQuEcfsw+xYh3rZy8izqtM4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707848269; bh=LLZha5Hnl1fq+nnN2WbB0ZCLBOmN6EJ1isLdmX2aIcg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ZmmjaZj/ClGYQSs0eNEE5BQkqjSKiibmX0l2gTHEuQ+QumapeODBgMMrzD430ArKU
 irZh4eFRz+03lKhA7VCy9ErD5wsG0PozOW+05VHkN76EagkqiCv0jiX0EcG2KAZacY
 YE5qMZgB5SmbZFq1Pd30e/aam+eEE7vg6+BQvIIqA/bgXG8B3ZjTxQ7ngnt5/30Lsu
 e/b+6AG+WWt9dengITTQ0OvnNKxeOoc2eosEyDub/iTjTObT1iblhebemOWiQ/tMqW
 Oabv5rSU0TOHvJ10srr+15RbFIqUxVFlr7/kbFRfz3EecIT9oNg4Dm3nm/+adhM0L0
 nwmxPHx4QhLxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZmmjaZj/
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/beaglev_ahead: new defconfig
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 11/02/24 13:24, kilian.zinnecker--- via buildroot wrote:
> Hello Giulio, all,
> 
>>> This patch adds board support for the BeagleV-Ahead. It uses a
>>> custom kernel for the board's SoC. As the SoC has an outdated and
>>> currently not supported version of the RISC-V vector extension, the
>>> vector extension is disabled.
>>
>> can you please provide an URL to the product page?
> 
> Yes, I added an URL into the commit message of v3.
> 
> [--SNIP--]
>>> --- /dev/null
>>> +++ b/board/beaglev-ahead/post-image.sh
>>> @@ -0,0 +1,6 @@
>>> +#!/usr/bin/env bash
>>> +set -e
>>> +
>>> +cp -r ${BUILD_DIR}/linux-custom/arch/riscv/boot/dts/thead/overlays/
>>> ${BINARIES_DIR}
>> linux-custom should substituted with $(LINUX_DIR)
> 
> I tried $(LINUX_DIR) and ${LINUX_DIR}, but both resulted in an empty string
> and as a consequence in a wrong path and broke the build. 

You're right, LINUX_DIR is not exported in Makefile, that's why it can't
be found in scripts.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> So in my v3 I kept it as it is for now. Should I try something else?
> 
>>> --- /dev/null
>>> +++ b/configs/beaglev_ahead_defconfig
>>> @@ -0,0 +1,44 @@
>>> +BR2_riscv=y
>>> +BR2_riscv_custom=y
>>> +BR2_RISCV_ISA_CUSTOM_RVM=y
>>> +BR2_RISCV_ISA_CUSTOM_RVA=y
>>> +BR2_RISCV_ISA_CUSTOM_RVF=y
>>> +BR2_RISCV_ISA_CUSTOM_RVD=y
>>> +BR2_RISCV_ISA_CUSTOM_RVC=y
>>
>> With commit cbd91e89e43d600172c62fd1cbd33aa74d0a851a all "_CUSTOM" have
>> been dropped, so can you please replace all the:
>> BR2_RISCV_ISA_CUSTOM_*
>> occurences with:
>> BR2_RISCV_ISA_*
>> ?
> 
> I fixed it, thanks.
> 
>>> +BR2_GCC_VERSION_13_X=y
>>
>> I think there is a reason you force using gcc 13, can you describe it in
>> the commit log and here?
> 
> Yes, there were problems. I am not 100% sure, but as I remember it: the
> OpenSBI used has an old version and in its build, it does not define certain
> flags, which are needed by GCC 12 to activate the needed zifencei and zicsr
> extension. Those extension where redefined to be in some other extension pack
> of RiscV (or something like that, I don't remeber this exactly). Anyway it
> threw an error in GCC 12, and I thinkt to fix that, one would have to touch the
> old OpenSBI version. Switching to GCC 13 (where it works out of the box) seems
> then to be cleaner for me.
> 
> [--SNIP--]
>>> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev-ahead/uboot.fragmen
>>> t" +BR2_TARGET_UBOOT_FORMAT_BIN=y
>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.bin"
>>
>> Here you need to add:
>> BR2_PACKAGE_HOST_DOSFSTOOLS=y
>> otherwise it fails to build under buildroot/utils/docker-run
> 
> Added dosfstools to the defconfig, thanks!
> 
>>> +BR2_PACKAGE_HOST_MTOOLS=y
>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>> +BR2_PACKAGE_XUANTIE_BINS=y
>>
>> After enabling BR2_RISCV_ISA_ options it builds successfully using
>> buildroot/utils/docker-run
> 
> I build the image with buildroot/utils/docker-run and it boots. Thanks for the
> hint, I will use buildroot/utils/docker-run in the future as well!
> 
> Thanks for your review and best regards,
> Kilian
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
