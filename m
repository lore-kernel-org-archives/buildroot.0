Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EF8C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 11:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F5C414FA;
	Wed, 10 Jul 2024 11:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWd5_eaXWTQx; Wed, 10 Jul 2024 11:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88DBC41505
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88DBC41505;
	Wed, 10 Jul 2024 11:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3DBE1BF977
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 11:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD65581FBF
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 11:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ipm6DvCqyhAO for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 11:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D2D980CAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D2D980CAB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D2D980CAB
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 11:18:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.120.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mz9Yv-1sE7Hn0YgV-014ZJH; Wed, 10
 Jul 2024 13:18:00 +0200
Message-ID: <e3604bce-6189-4cef-a0f2-19257f66ebf1@gmx.de>
Date: Wed, 10 Jul 2024 13:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
 <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
 <20240709135538.4594978e@windsurf>
 <f1ec17d8-b94a-4759-be4b-9eba46ae1b5a@gmx.de>
 <20240709203551.1e05568e@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240709203551.1e05568e@windsurf>
X-Provags-ID: V03:K1:HJ3gC37xW/0+FltsRTnwGxeuT0TuyemG4rUYTzyn1muMIWIwjh5
 laqmIsQcy8KZ1/jygfh9lfoILnx+TXhCI5vZyLuNnqZKcVBM98BjEYOocw+2eUE8V+EqhG6
 Lv4Yz48CUsV7OzvRBl/rlYrSu1P9WLFXlttIN0rFPIoVdL8X8ooepYjNE0ftWel+YkyTm/T
 xvYP0ChaSGrp3qppZFz5A==
UI-OutboundReport: notjunk:1;M01:P0:qaXgYTZiF1Q=;I63fnOMw4mGCr7yXFeu4ztiflcy
 jJ/fIxmLzPWlNBpQRO++DOXPUQRKcs0bH6JfiM2DUIRf4cfHFTGOBJ102xNKjYFBGAAEkWmTG
 jMye9ZoelEE41Ialf5EVuRpnE/fJwSSsUphAOs9OEZMO/UBoCj58ha+Qv5T9hzE/tmjOzCuYO
 0mbs5lq3Q82SpfjByCjHMgum/5QGYNsSWDS4rhmDSE6ayxym7VcyNKs0+YabN45BM8Me62vVn
 BdpJCcQ7bDWhd7CuQsOZ0mlSVDH0hJIbrAQOL54JDeNSX9tFA7TrwYtGg/GVg4OtPBh+gGBTr
 UlgB6QIuMR2uFoMCVI6tSrm1p662vSSawME8M/xubwaBljGX2H27TJiAjxtRywguoYaL5BMu2
 RJ1qJeFxHJ28mUK6PI5GIEPOhNKLkvVdCc2hQxmOnKPsmphCn6ggaYz+OZsuvmjnwopE74mrb
 /C3bZ8BfykuSMhffO9QOxm1gLPBxgway+kVL8W2+66mCEqygpFZNbZluhNd4FMmJtNVj0GFIs
 srm5J9hGb3kY8oZ8f6XN8Z0JybTk11xQWtfjRoEMczUCU1WZvlKYgfodTTHiaGGchW1E81OCZ
 uZX7P3Mn+l5Z7YRgs4a/EjXHRmrZMBOWcRcwmpdHHqIPfrFj0ZQUiFOXCsZlxXOfc8O0qM74k
 NsHADb/B+Qb86z6HhR0FlUhIuL3PCtJey3DAQHDPOTXp14pMDZQkDesUKqHf8f1/Oy9PVkQJX
 OAv4pRKtBKq5kXCk8XthP+KDWhJrFN+DFftHWxoORFp9h/wlmGC6pqZCMHQQEMoCZMdmDy6wd
 9dbpMkMd1otw9F7yl2QXONOw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720610280; x=1721215080; i=fiona.klute@gmx.de;
 bh=KPIaRRPDrci8JR45grMdQ6ZR9LzajFuAh5z8r8LxEN4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oO7iTC4vMdGMAUCEUypyv/IZO0kBQCtX48dCqa5xqvKZwngLhKQJVU30Bkwu0nrd
 2pfmEfyh7y1y05ts2ZDZWK+ks+Dxyka4Ccjn9UZe7qkrGqAhx/mq1A+w8Zb/aCq+w
 /VzpGnDXZqPag17nK8zm0mQiM2zia1YVd0OWxdMUpCjF09AX8CKLTnGaPB5lB6g2s
 7FShCukLzS/Dj2llF8At3NPKsqp9ZaHX2tBRXOtCLp3sb/PqPLHWVd4THzNnAWX3A
 uJlx4licFNWgfOX6O4IFoTNmEKzyC0xIsdGWNj1JsfLbwMidkKnFyDhrANdjK+1kJ
 PEezRSAjHGPd4da9eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=oO7iTC4v
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.07.24 um 20:35 schrieb Thomas Petazzoni:
> On Tue, 9 Jul 2024 18:25:02 +0200
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>> Thanks for the hint! That passes with the v3 of the patch series I sent
>> earlier.
>>
>> Is there a recommended way to run that with an out-of-tree build? I'm
>> not seeing any option for that in utils/docker-run.
>
> Hm, I'm not sure to see the problem with using docker-run and
> out-of-tree build.
>
> $ mkdir /tmp/foo
> $ cd /tmp/foo
> $ ~/buildroot/utils/docker-run make -C ~/buildroot O=$(pwd) qemu_arm_vexpress_defconfig
> $ ~/buildroot/utils/docker-run make
>
> and that's it?

If you just use a fresh defconfig, yes, but that doesn't quite work for
fail2ban (there isn't one that enables it, it needs Python, and I'd like
to build with musl to match my target). I guess it'd be easy enough to
create a snippet with the required config, append it after defconfig,
and run "make oldconfig".

But then I still wouldn't get to reuse BR2_DL_DIR (though
utils/docker-run can use that from environment) and the CCache setup.

I could use a defconfig from my external tree, but then I'd need to get
utils/docker-run to mount it. That might actually be an option: Make
utils/docker-run honor BR2_EXTERNAL the same way it does BR2_DL_DIR.
Would such a patch be welcome? If yes I'm going to give it a try.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
