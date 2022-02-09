Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E531FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A307B40567;
	Wed,  9 Feb 2022 21:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwvGxgGg3JjG; Wed,  9 Feb 2022 21:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE31F405DC;
	Wed,  9 Feb 2022 21:56:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3F11BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A55F8318C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mA_jz3Y2vWvY for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:36:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 342FB83192
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:36:02 +0000 (UTC)
Received: from [192.168.178.58] ([151.61.64.67]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.17.173]) with ESMTPSA (Nemesis) id
 1MWiUg-1now6B3wm8-00X0Cz; Wed, 09 Feb 2022 22:36:00 +0100
Message-ID: <890b73ae-305c-2674-ed03-c06562983328@paguilar.org>
Date: Wed, 9 Feb 2022 22:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220208213722.836257-1-paguilar@paguilar.org>
 <5f710ea1-3f98-9435-c033-e73e70e86342@benettiengineering.com>
 <f8202766-058e-25d3-2761-4568ba6c89a1@benettiengineering.com>
From: Pedro Aguilar <paguilar@paguilar.org>
In-Reply-To: <f8202766-058e-25d3-2761-4568ba6c89a1@benettiengineering.com>
X-Provags-ID: V03:K1:4NtcYORs8gqIiyKJSvSZdAeiUN2+AJSqaldTd0jveS/v3Vaqd4X
 cFwfDmO348FnZGxC+ya3+3C/7eWwLuhaL2kw13tikkDRR5kFf4s3NFBNQ/q6AeDGjg0iVcZ
 KTRdrx5Y9ZSwlHnKp10dMUA2ucaMKx6X3bQ7fsiPP1A0YBv96UNrrTlBRaKgsp+iqllM4/c
 70LxwXEnl38sDMY4Svt6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I4xvYuK2UiU=:Jf+k3Bj4TjQWjQtoTA6LWF
 BaF6YRMD+nNa+xx5YbdwAnfrFOscIYgg9hrVu0nMtacyZXcCh1MIomLuMQ2Iu52zR8y9PWEtJ
 JQ6q6G7MnDUc30XcGSdAk6zR7L93RNkHCzsfGsn3huroJhYwVM95qDDBii0K80+fnqGsDjx7o
 N+w1pSWA+//BiFzFVvOfJHUBaxrPKf/FJ0Jb798W1Ko0cZ3ZssIlYj2FE7X1t2i8d1ObDlJX6
 OpzV6vQYhsqHLsIedNVLnAEDMCWfgv2rrJfYykglQqnuLE9PUNYir2aOJnlA/65OJo+ADXnd3
 6bx0EOIHd4U8S9M67RdGfuYcfUg3J2Xk2i1iPzy58Ycje62RVJPiz4wc4DWdrfg9H1N/MCAQq
 txkXfQLJDSKc6UbTR7Ths7DqaOWCupUEpy+NG4VrEc8dgxoHPUH6Kf+RZe4VxNImmyk0eZaI9
 81NiPHad64Z1Mp5lr1rzASpR1l0AcUZa54d09qnQtYELBpPqKJ2hhSQ7/5nEG51F1aZ0md5uC
 dvkFriPg8fEnA/I2P9wqsC03kpnPvy4hRqr+UYxkWGRRhiCkNrLcpI+PXS4cpw1eXIWSJ2/Yy
 hXfWTCYhJjRNbGaVExuVJ306nMI+7oaurA6r5EKFlvzQwZX3MB5rGh21/Ne/ScbRQJH+GVzOp
 kuCvt5pqZZl/TUq2YR4q4nUYQSBeUEEG1OPnt/FBZSu6+kpkFXxlrKEHhSMpbx9mfHQRzzdFA
 6PietG43QUHzX9Mm
Subject: Re: [Buildroot] [PATCH v2 1/1] package/guile: Add BR2_ENABLE_LOCALE
 as dependency.
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 2/8/22 23:54, Giulio Benetti wrote:
> Hi again Pedro,
> 
> I've reproduced the build failure with your previous attached .config 
> file and this patch fixes it. So below...
> 
> On 08/02/22 23:06, Giulio Benetti wrote:
>> Hi Pedro,
>>
>> On 08/02/22 22:37, Pedro Aguilar wrote:
>>> If it's not present, enable libiconv.
>> Here it's missing:
>> Fixes:
>> URL to autobuilder failure
> 
> ...please provide the autobuilder failure URL and if it doesn't exist 
> than we don't need it.

AFAIK, the build failure fixed by this patch was not reported by the 
autobuilder, so I'm afraid there isn't any URL to share.

In a previous email I wrongly mentioned that it fixed an autobuilder 
failure, but all those failures are linked to another issue that seems 
to be fixed by a patch sent by Fabrice, although I haven't tested it:

https://lists.buildroot.org/pipermail/buildroot/2022-February/636041.html

May be the commit message of the current v2 patch can remain as is.

Thanks!

> So once done this I can give you my Review.
> 
> Waiting for V2 with improved commit log then.
> 
> Thank you!
> Best regards

Regards,
-- 
Pedro Aguilar
https://paguilar.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
