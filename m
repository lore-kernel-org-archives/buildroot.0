Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F520C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25CA4159C;
	Tue,  7 Feb 2023 17:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25CA4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NP4UKHW8tJfn; Tue,  7 Feb 2023 17:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69154183A;
	Tue,  7 Feb 2023 17:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B69154183A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14EFC1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E267281E27
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E267281E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DzM5mjNbHjRJ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:00:15 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8ECC81E19
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8ECC81E19
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:00:14 +0000 (UTC)
Received: from [172.25.4.86] ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PRDPpPLfrDf8fPRDPpkacA; Tue, 07 Feb 2023 17:53:08 +0100
Message-ID: <a196d84f-02b8-e987-31bd-eae617ff4b07@benettiengineering.com>
Date: Tue, 7 Feb 2023 17:53:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230104020558.1436469-1-giulio.benetti@benettiengineering.com>
 <20230104020558.1436469-2-giulio.benetti@benettiengineering.com>
 <20230207151646.09c9df79@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230207151646.09c9df79@windsurf>
X-CMAE-Envelope: MS4xfI6ot1Pawb8u+EA+gsUS6r1nE2qvDwClAR0cCHzLrWstnKWipDv1vNtUXvzz43hcgQtf32aRJex/br5HqmFQiOuTl5KjrYqRa0KfW2Uhc7RZXuo4Cyc2
 yV8vGK1iDqNKCgTlQsO0J3lqWH7VZk6R0wiOsrAVxtMZ8ZmYoWMPr7VbCIAa5Im4HA8WMm0suUaRUlw1G+LLQ/+n826xPuyO1DXcjtyZPWn0D6vw96/Dh7Ju
 4IhxxDKb67IFyGSp318FgCe9KBaUAXDwhF5qKk+fVysTr+W3YuL9rDZUGLeQy2aH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675788788; bh=DMLDJZRzonE2T34kbfH1iGQyplXmfJVKJ7Smw46kTvk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JacZct5+B0kujCedjLs0S7IbttzOWZI50lInThm7jEQmiUc0QPbU5En0MlnguW/pK
 af0llifdPtD1I58fkpR7DHjaq0DtFmDBxCiSRy3A44IyWKPqALT3NSveIYtKqt7k/f
 psiznlP0mMXE1M02ffmMA8tsN62xYJrdhwZtXSIxF0xwV6baXdUaasbVNQTHwMSawu
 CFtFTmVwykaZX6tWrO/DSWvn6kxTMhBYKlRfPwmB8XPVG8A4rWarBwjrmh585PvtOI
 7g68HyIATxcTb4+P3/hq5Zx1qa4Hfy2ouzjJ7iwxe2RgUOwG29Lik7tJnmBpCV76o6
 028+rJAVyaEQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JacZct5+
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix LINUX_VERSION_PROBED content
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
Cc: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Vincent,

On 07/02/23 15:16, Thomas Petazzoni via buildroot wrote:
> Hello Giulio,
> 
> On Wed,  4 Jan 2023 03:05:58 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Actually LINUX_VERSION_PROBED is set with the string sorrounded by the
>> backquotes including them. So when we evaluate $(LINUX_VERSION_PROBED) we
>> end up having the command itself and instead we only need the Linux version
>> probed in the style x.y.z.
>>
>> Verifying it turns out that:
>> 1) --no-print-directory and -s make flags must be passed before -C flag,
>> The error was not visible because errors were suppressed with
>> '2>/dev/null'
>> 2) backquotes don't evaluate the expression they sorround but become part
>> of the string they sorround and get assigned to the variable
>>
>> To fix this let's move --no-print-directory right after $(MAKE) and
>> use $(shell ) instead of backquotes.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> What is this fixing exactly? Do you have a specific problem that this
> fixes? Or is this just fixing the fact that LINUX_VERSION_PROBED
> contains `a very long command` instead of the result of the command
> itself?

While building the various rtl* wifi drivers I've noticed KVER='a very 
long command` but it gets evaluated correctly, indeed the .ko module is
installed in the correct "lib/modules/$(LINUX_VERSION_PROBED)" path.

> Indeed, switching back to $(shell ...) like you're proposing would
> result in basically backporting:
> 
> commit 28f57bb863ba48df054cec0057c844bf23d5969f
> Author: Arnout Vandecappelle <arnout@mind.be>
> Date:   Sun Jul 12 16:35:27 2015 +0200
> 
>      linux: use backtick instead of $(shell ...) make function
>      
>      Verified that LINUX_VERSION_PROBED is only used in "-quoted commands
>      (actually, usually it's not quoted).
>      
>      Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>      Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> which is not desirable, especially if you don't have a good
> justification of why the current situation doesn't work.
> 
> So for now, I'll mark as Rejected, but if you have a good
> justification, you can resend with a better commit log with this
> justification.

Let's keep it as rejected, sorry for the noise!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
