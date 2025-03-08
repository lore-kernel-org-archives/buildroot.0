Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D55C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 21:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F5D816E9;
	Sat,  8 Mar 2025 21:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Jq2E395nqMa; Sat,  8 Mar 2025 21:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032DF8174F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032DF8174F;
	Sat,  8 Mar 2025 21:52:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A4711C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 21:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BCFB40C5C
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 21:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIIBQg2Favcw for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 21:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C83C040C51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C83C040C51
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C83C040C51
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 21:52:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7827913F88F;
 Sat,  8 Mar 2025 22:51:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Mar 2025 22:51:56 +0100
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 22:51:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <Z8wlBkArxK3Qh4WB@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <745bdcacbdff342d7e37dd1003a03923dc03b935.1740841539.git.yann.morin.1998@free.fr>
 <8fb79f2dfe7c9cedca2e2e854e4b3c48@free.fr> <Z8wlBkArxK3Qh4WB@landeda>
User-Agent: Webmail Free/1.6.10
Message-ID: <d13c2b2350a6dc3acc125294c4b5d813@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741470720;
 bh=iaYR77CtZxrHFkGVVGejsA78QIhFcbYHplv3oMobGBk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OjOQzCHA9C25xDdi3y4vNqQ1XGWnqWsYUAXLsGik38Ul4fTWkAyIAutR4X/q4urhY
 vSvE/CZYJuTSG1qP9Xq1CJ9kOp7vD0bu9u8a0JBCbp19tONULYvTuQ2c5nWhWATJlc
 rlO6+UiZ+Dn1QysDWINLttHBrBlQeVPHg6aPTn7gngt5Ai2yp/oLOdB/rcApVWee0O
 599O/c6W/9L3Eo/gpkiMWXx1npnXjhoQ0pJSiVPFXEJUtljyAwJkDLSoKphqKm+ZJD
 MtWSt6Zuij1po+SPpJWirUNZBKaLlMCaGhikYD6YJwR+s2e1bMmuOQMdolzblNr4b2
 ref/xvRAc/sIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OjOQzCHA
Subject: Re: [Buildroot] [PATCH 1/9 v3] support/testing: set date in
 emulated machine
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 08/03/2025 12:07, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2025-03-07 19:49 +0100, Julien Olivain spake thusly:
>> On 01/03/2025 16:05, Yann E. MORIN wrote:
>> > When time comes to check certificates, the date and time in the emulated
>> > machine should be close enough to the actual values, so that certificate
>> > validity can be checked.
>> >
>> > Set the date to the date of the system. This is going to be accurate to
>> > the second, which is, by far, enough for our purpose.
> [--SNIP--]
>> > +        output, exit_code = self.run(f"date @{int(time.time())}")
>> > +        if exit_code:
>> > +            raise SystemError("Cannot set date in virtual machine")
>> > +
>> Is this really needed?
> 
> Yes: the skopeo test added in this series would otherwise fail with
> (lines wrapped for readability):
> 
>     [BRTEST# skopeo --version
>     skopeo version 1.18.0
>     [BRTEST# echo $?
>     0
>     [BRTEST# skopeo inspect docker://busybox:latest
>     FATA[0000] Error parsing image name "docker://busybox:latest":
>         pinging container registry registry-1.docker.io:
>         Get "https://registry-1.docker.io/v2/": tls: failed to verify
>         certificate: x509: certificate has expired or is not yet valid:
>         current time 1970-01-01T00:00:11Z is before 
> 2025-03-05T00:00:00Z
> 
>> Arm and Aarch64 qemu machines includes a pl031 RTC.
>> x86/x86_64 includes a mc146818 RTC.
>> RISC-V has a Goldfish RTC.
> 
> The skopeo test uses the bundeled kernel with the "default" virtual
> machine, and in that machine, the date is not set on boot: there is no
> RTC regferenced in the kernel log, at least.
> 
>> If we revert this patch, the podman runtime test still succeed.
> 
> The reason to introduce this patch was not for podman, but for skopeo.
> 
> [--SNIP--]
>> I understand that it is not always guaranteed that the qemu machine
>> has a rtc and the used kernel has a driver for it, which is why we
>> would like to set the date like this.
> 
> Exactly.
> 
>> But this could be left to the
>> test implementer to make sure this is properly handled. And in the
>> podman test case, you did.
>> 
>> What do you think?
> 
> I think that setting the time is a generic topic, and that tests should
> not need to do that.

Thanks for the explanations. I agree with you that we should keep
this patch.

If you send another version of this patch, could you add
small comment in the commit log about why we are not using qemu
RTCs here? Something like:
"""
Some Qemu machines includes an emulated RTC which could be used to
pass the host time to the guest. For example, arm vexpress-a9
has a pl031 rtc. The Kernel has to include the driver for this to
work.

Since the Buildroot bundled default test kernel does not have this
support, and also to avoid handling the complexity of which
architectures/machines/kernels is supported, those emulated RTCs
are not used here and the date is simply set with the "date" command.
"""

> Regards,
> Yann E. MORIN.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
