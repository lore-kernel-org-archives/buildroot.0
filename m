Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AE0C67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ECD180D50;
	Mon, 24 Oct 2022 21:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ECD180D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BV7nBEAEMKPE; Mon, 24 Oct 2022 21:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C5B80D0F;
	Mon, 24 Oct 2022 21:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92C5B80D0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 724311BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5344360AC2
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5344360AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlB8BbOgOmAt for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:53:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83CDB605B0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83CDB605B0
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:53:38 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id n5O4oyRjKJpY4n5O5oairR; Mon, 24 Oct 2022 23:53:37 +0200
Message-ID: <a0efb5cd-deb3-8175-583e-9c65a523c6ef@benettiengineering.com>
Date: Mon, 24 Oct 2022 23:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221023221425.395087-1-giulio.benetti@benettiengineering.com>
 <20221024231213.41deaa35@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221024231213.41deaa35@windsurf>
X-CMAE-Envelope: MS4xfDoN22cdvuNO4uiZ40ni9ZzDP4K27nC85SXVB4Ne30C7YG9KguhNP2DfvggNnyHI2+VJJXkUrl+n0Frn8n7QzZvySRSpMOkcDrOFvwhs5tKUV8Y8zrRc
 Dhbv0lq+zll8cyLeyGo1Q3+xN5xLMmsC88cybtVG9adLhRidu+JNL5g4+jXV1/Z46YK9DZDqoZ1ImZFyu0mKghkvRHjMkaVtVgfydGpjVYeuYnm086omIdZs
 C9rpaqIjxd2krrJvK+jj85PBdNqsX9qoG06em1782gU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666648417; bh=YdrOxpB6w8huF0pvxJpTxocmmlUxWqkB3TCY1Zcpan4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BN/IyCb9SdvAQsUT4vD30vqbUWbol2LTqW5VeJr1aGEGeiTJZiCd0vTWeXvfv5gzV
 W0IiM2KEmVLiY0grbs8IQmdiQqh5yxqfzPYcQVsu6NvcbrMwKtO4++borXzRctSKSr
 wnKv+B/XwST+aitlyaWGq6GFZ1bNawrd8A7gLH3QZLW3yMitKUxxvZQdMXEuENWgT4
 tDV4Gz+LTS4GzF3XP9cfo/hNTNObSrINJ+9AThCqcBjZMFh4e84ItIkkeyZ43/eh14
 /G9SMPos0exMFC4lYuAA53tBncGshoKxrJcoEcdvVA/xaxFBeTF//QtHDuRw+TuIdb
 zLrSRJ3Df9HQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=BN/IyCb9
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: fix build failure on
 PowerPc
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/10/22 23:12, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Mon, 24 Oct 2022 00:14:25 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Add local patch(pending upstream[0]) to fix build failure with PowerPc due
>> to a package re-defition of get_ra() that is only defined in Linux PowerPc
>> implementation.
>>
>> [0]: https://github.com/lwfinger/rtl8723bu/pull/192
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/99571b055e6185d57f89b90821b76099ebc766ed/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...uild-failure-on-PowerPc-architecture.patch | 46 +++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
> 
> You forgot a reference to the upstream status of the patch in the patch
> itself, so I've added that when committing. 

Thank you, every time I keep forgetting...

-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> Thanks a lot for looking
> into and fixing this build failure!
> 
> Best regards,
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
