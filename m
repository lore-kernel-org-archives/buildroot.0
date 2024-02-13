Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4098DC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 18:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0253B80B74;
	Tue, 13 Feb 2024 18:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpzCMKmxhSir; Tue, 13 Feb 2024 18:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E1E580B7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E1E580B7C;
	Tue, 13 Feb 2024 18:19:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A13EF1BF284
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E31980B44
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4QGM2Qjg1Ns for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 18:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64E6080B13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E6080B13
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64E6080B13
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 18:19:27 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZxLorabghPNlaZxNMrz19I; Tue, 13 Feb 2024 19:19:25 +0100
Message-ID: <ce5a8cb8-42ad-4366-87c7-0924ccbd0354@benettiengineering.com>
Date: Tue, 13 Feb 2024 19:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
 <20231204231212.36450-2-kilian.zinnecker@mail.de>
 <08b6187c-94f2-4cbc-b0e8-0066ca687796@benettiengineering.com>
 <6015348.lOV4Wx5bFT@laptop>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <6015348.lOV4Wx5bFT@laptop>
X-CMAE-Envelope: MS4xfKC6rqQwX1I9xrb5r2EIHgMzndONQv+t4pJEoJIEJrqlNrDgTX/fG3laRXVAgQqT04RDs0NFD/CPN/nEv5nfySifXcluWt2MjW/lUSXR88+1H6sJ4KoQ
 ZX99BsPFleyCLnQ1E6N5BWOAclXR4IjUAlgLLKPmd7QVHyoGDYa9uQGLyikbR1oEZxQZ92DsSnobnocTbBuCmE7Rr2rUGM73+FciQeEYunaVQLK2CURVeqtk
 HzIfxorYYRpvUDKqJxdYrFPsN7CP0JzkB+0F5lHGm15346bkNhoRFcPyKsMpojRs/bzi2du05Uke4yhseSsGFxquYeV6CPG9CZLa2jA6UCQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707848365; bh=7c+rTMY7mUhsI/5oN0vtZIzaeS9HrrmYlz2WgK+KKf0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MBUFRQQfbg26Lmrs6dN3869tUY/529KLWdfmhdJtzuao7L9wanWb1gd6LpksTE3K+
 Yeq7L6IDDNqPoPHTfjrEJiKxLxZbFV1ftypLSCYNf+I0ucy3lkTcvuzd+juB4htN4C
 EBhM8r7zIqJX9b/e1btakp/6IgBuGogfeuX6pYxXMPWNSAmWxgDEQ2sTeB/1+oUd7n
 Z4RZ0Zb/RWqqEEIVkUx009anIqBhtXAbXQj1SwZi28JEyCIkBjRMDV5FZnSobEdrrW
 zjEWO/QwiR9QK0HY3E29tCOpFhRFFc8HU89lugG/nWYOzqsF5QHWmdPGBZDbfyeglT
 rW+2eUMm0fltA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MBUFRQQf
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xuantie-bins: new package
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

On 11/02/24 13:15, kilian.zinnecker--- via buildroot wrote:
> Hello Giulio, all,
> 
> [--SNIP--]
>> can you please provide a separate patch to alphabetize?
> 
> I did so: https://gitlab.com/buildroot.org/buildroot/-/commit/
> 53fad3242d74b9fad11978429d6cc2879f783f4b
> 
> However, unfortunately Thomas de-alphabetized it again when he applied my
> RZBoard V2L patches: https://gitlab.com/buildroot.org/buildroot/-/commit/
> f003675119c9ca503afa19c04074e81c49538baf
> 
> I just send a v3 of the BeagleV-Ahead patches. After we get this series
> applied, I will then again send a single patch to alphabetize.

Please send the alphabetize patch along with the V4 patchset,

> 
> [--SNIP--]
>>> --- /dev/null
>>> +++ b/package/xuantie-bins/Config.in
>>> @@ -0,0 +1,6 @@
>>> +config BR2_PACKAGE_XUANTIE_BINS
>>> +	bool "xuantie-bins"
>>> +	depends on BR2_riscv
>>> +	help
>>> +	  This package provides binary blobs, needed for the
>>> +	  BeagleV-Ahead's SoC (TH1520).
>>
>> Can you please describe a bit what those binaries are meant for?
> 
> 
> I gave a brief description, but I don't know much about these. Maybe Robert
> can give even more information, if more is needed?

I see sufficient explanation in V3

> 
> [--SNIP--]
>>> +XUANTIE_BINS_FPGA_BIN_FILENAME = "bins/light_aon_fpga.bin"
>>> +XUANTIE_BINS_AUDIO_BIN_FILENAME = "bins/light_c906_audio.bin"
>>> +
>>> +define XUANTIE_BINS_INSTALL_IMAGES_CMDS
>>> +	$(foreach f, \
>>> +		$(XUANTIE_BINS_FPGA_BIN_FILENAME) \
>>> +		$(XUANTIE_BINS_AUDIO_BIN_FILENAME) \
>>> +		, \
>>> +		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(f)
>>> +	)
>>> +endef
>>
>> Being only 2 files to be installed I'd prefer to see 2 lines instead of
>> foreach loop. Can you please change it accordingly?
> 
> I unrolled the loop in my v3 of the patches.

Fine, see V3 comments.

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
