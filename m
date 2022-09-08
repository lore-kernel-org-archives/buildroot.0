Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD65C38145
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 20:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1360E60AF2;
	Thu,  8 Sep 2022 20:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1360E60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dxp7KacLMguo; Thu,  8 Sep 2022 20:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C64560ADC;
	Thu,  8 Sep 2022 20:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C64560ADC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3175D1BF402
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 20:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C74B60ADC
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 20:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C74B60ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLVAlcfPr2PC for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 20:21:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6848860AD3
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6848860AD3
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 20:21:02 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.28.15])
 by Aruba Outgoing Smtp  with ESMTPSA
 id WO1DoUjJtlHojWO1DodKdk; Thu, 08 Sep 2022 22:20:59 +0200
Message-ID: <752089ce-ee11-84fd-db54-42d46cba7c27@benettiengineering.com>
Date: Thu, 8 Sep 2022 22:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20220908191904.823806-1-dario.binacchi@amarulasolutions.com>
 <20220908191904.823806-2-dario.binacchi@amarulasolutions.com>
 <e537c779-8ff0-676d-b642-971f79170f14@benettiengineering.com>
In-Reply-To: <e537c779-8ff0-676d-b642-971f79170f14@benettiengineering.com>
X-CMAE-Envelope: MS4xfIkPROSjbsYUw5U4Jzns9YZQxumw0GezS3QIrlJV0zhkk/VcwIY9r5z8bRPr6kPx59VS7cTtRFla9IWXD+SBdk6l8ZOxC0BAaOATuBpJj+akfi85SVbd
 lqpS9sabf41yQxj6ACRz7zRGzMJk7gD0T4BE5JKugRlISYPEYWvz3TMtj+7rvKUrFE+HtAoG5R0PPM9bhvGOcwYoa3YqX3J5r7FOToXz2bDTE5l3zblrLbGI
 DiOjKyufTO3cYBC5jrE+WHR9YhMO9uRCEjKlWlEWHaODHEZtIrJGyYYoPPACXgb3vhcwuAMmgYIeswhbduD7MpjCIJF4lZlNshPM/LcsCsoEnnkDrml/AIF/
 p0FfwIeyRLSkTaCAJjOIPfirf/4VFa9Wgb+sbVDST15XCdgx4eA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662668459; bh=CCEjv4FFQwjV6xizXKfA+wSrRXX43D/nNYs5pXl/kdo=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=dnBHqg57jRYUgKGBilo2ZisrcPPakybuw7hryU2QRKfc3KAcIwLuMCwjWb0bFIx11
 09DmV9mo+tyzICTJZEQBFnJXP1beAAouzwyHwhVvQp3/7ObCo94NG4E1T7hQ3M0VJ8
 ohMoShjcZUpL1Hig4YvZbZEnbjhF5arb6o8xiQcY8V+4Z25Mt10LIzyuyz/2sc6E/D
 0UpaqFuxzi6iB+AnzcADlZvzMoa9H4MnynB+Bl7L4X5I6OaMutLI0OwDqxJsS/spWq
 9U1/yr9XBmEOj3sW+L70AFVtjTMS5TldTDO5fy0w46okU0pUdPT5jARdOi0gpHTMW6
 gjM+K3W4MzBcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dnBHqg57
Subject: Re: [Buildroot] [PATCH v5 1/2] configs/imx8mn_bsh_smm_s2_defconfig:
 new defconfig
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I've forgotten:
please set as superseded the previous 2 patchsets(V3 and V4) in
patchwork:
https://patchwork.ozlabs.org/project/buildroot/list/?submitter=83038

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 08/09/22 22:09, Giulio Benetti wrote:
> Hi Dario, Ariel, Michael, All,
> 
> On 08/09/22 21:19, Dario Binacchi wrote:
>> BSH SMM S2 (SystemMaster S2) Board is an add-on board which provide
>> input and output interfaces to a dedicated carrier board. It is designed
>> mainly to provide graphical/video and connectivity interfaces to the
>> appliance.
>>
>> Board support package includes the following components:
>> - mainline Linux kernel 5.19.7
>> - mainline U-Boot 2022-07
>> - default packages from buildroot
>>
>> Patches applied to the Linux kernel and U-Boot have been submitted but
>> not merged yet.
>>
>> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
>> The smm s2 board is basically the same as the pro except it boots from
>> NAND instead of eMMC.
>>
>> Co-authored-by: Michael Trimarchi <michael@amarulasolutions.com>
>> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> It looks all good to me now and I've rebuilt with utils/docker-run
> successfully, so:
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> I've also rebuilt successfully imx8mn_bsh_smm_s2_pro_defconfig.
> 
> Best regards!

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
