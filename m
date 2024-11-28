Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFC5D690F8
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 10:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC2560808;
	Thu, 28 Nov 2024 10:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwheaYuZw1RJ; Thu, 28 Nov 2024 10:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76CF60765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D76CF60765;
	Thu, 28 Nov 2024 10:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D59FD1DA8
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 10:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6A2240A27
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 10:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_1BhWlh9fU1 for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 10:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0EBA404EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0EBA404EB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0EBA404EB
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 10:40:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.106] ([85.22.122.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XPn-1tlnzO1Zcv-00rkZq for
 <buildroot@buildroot.org>; Thu, 28 Nov 2024 11:40:11 +0100
Message-ID: <bb3d253e-1ec1-4d4a-a125-04cd47358b45@gmx.de>
Date: Thu, 28 Nov 2024 11:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <CABRndgwO5RUQOK_VBbLgZe4qoNRA1DDw-JCua6h=ory4xquBKQ@mail.gmail.com>
 <8455423.T7Z3S40VBb@localhost>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <8455423.T7Z3S40VBb@localhost>
X-Provags-ID: V03:K1:tgIbAGhsBK9slAX5lysNmvpFm8lYiDMSrPRf2KC4kpLqE+u0tLr
 EfQWUxW+yxAu158mmnUOM4dG3Dpb74c9Vc77APgSOSXqUuCKM/q8GqnejkC5hYcv2BL79xy
 FLE6vqRRyMcX4l0bEDuAo3AwUGkZ+FJg4C9WRK1HAvs4tsgwU8Y12YHMJPRF9KU4Vdik1g6
 MoCtuzbS2lzO9sGdOFWCg==
UI-OutboundReport: notjunk:1;M01:P0:nhLbXcEVFpM=;pExzuOxsdRHtolWKI8DOW5892sY
 QqpOm+LVIgrML5/shaVQPfT7ljIgMiSr19zHHfBjj94HL6vC0ls46wyr6y51ZFkg6sDwIPnnY
 ROGFpPhy75eWwSll2hJ7qfuPCLuf/AJzbYEJJGeP34ayvnAFMUjCxD5hlZ01XWzacfe3YdrDy
 EAU/TgpZdmWZpMF73mBRIY9ncrv6kJC3eDz4pCSqsql9VUyYnY/NMsKSGcGuogXmBqkZAilqs
 OZ30m8i4S6rQWkv5n5p7D3ysU3i/cMIJGCGaT+FGup7TGrJRTiXjX20iCseBdglmmGaPVXNRF
 gtunDzHs6U2LAWYraQOU+KbfLopbBVooMKw4ZrixMmYfI6f3JwbHuMeeeos4Op0eQIIszpIMy
 hD9R/cqPQV60+0It2bHQV15nAbYhRDNW+XYua4sJxojbc3OZR2EQBP0j5M1gzgJtHg5Jdx5HO
 ZCLWNyaMgxQzpEqn0eCXH3iJlWco00EPjH6tIDujsFa8TK3UNWU3u6Witeo2JYTBPOWTOmjYI
 z4a4Yp5yG3062+9YpgiVmaqwJpLpDheRTGVeXkbyvLNfU6P20sC3DvnOqm3tR9FAzEf9C6Kh7
 Kqg9t0hIZ4ReGO7Zi672TddF6Xa43CgPFBN2LiLwbgIAzjV/0kfr+0/XQVnDLHzgJIsw5a4qQ
 fBGZA3RoKOqzSF7NwGgA/+M7JLydhxbzCvPqzmGYK3oycT5A2k7FpVxwWrlOj2GTyqTlXe9e/
 byXAImpxudfYXe6mvzywFd7CH9CRbe8SO2tj0ipXB6V9ej8++VwJEhQEh16qSDyWE33aEN+dN
 kjPT3N8IPEZJKxUzbWyOK3Y84R76kXpS37uZYCbmM/E4YyF5UdtQnAn7aLNftROWXMD5FjUkC
 u2rbK065fl/37CO51+tEJV8+HH++3sybW4lX1ea0nVORoPHIqQrPiiygMDhzFajm11mp3nj4p
 PCFatTMkgV4aDdF7LsQZZ+/Ba8kcifJRAMWaSwTMrKtRf35kZn57+2Hj2lvaVAyEtxenOTXoJ
 8mE7loB2JVr78Y6R48jFN3tMnN4kbgceRbIUAlip7sM6hubI2NrNV7mSF16orxUFm8v5uUF1X
 o3yxdFskorIlbjY3ja3EPnIs48WnwK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1732790411; x=1733395211; i=fiona.klute@gmx.de;
 bh=Q0suFF2WsNqvJV6Xode5T53RNhg1BN4cC5Tg4fbV/1w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=S0s+SIAxqtK5uEPnbfJL17qsJVp9B58m1td3+/ttaFuqPrnr2GDS8ezHnMcNYeYF
 uEVPUTfG4FhcHnBnfnnYbw8whn23usNkkx+DRWsqB395lVSRPTuRBLFArBDte79Z8
 yWPv3aZJn+U9KGFesJHjHE+0CMLcOVgqJKe+ifWLGQHv+odYLabskCPZ18FLH9TiK
 YaiNGA+vuFp8SrDSzLsAXEHjGj55twdLG5Aaklzl4QqrJmzKVKmsKguvRrfVQB47n
 6PJXadKgz6UIzGI1Zn1DK/14MecWjl5NCzC+tsHwKfRLWKnvibxrYSlNVi7BFyhEn
 NxM1XsMDYd958Zo4IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=S0s+SIAx
Subject: Re: [Buildroot] 2024.02.6 : modinfo for target side
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 25.11.24 um 23:30 schrieb Mattia Narducci:
> Hello Zvika,
>
> On Sat, 16 Nov 2024 06:38:09 +0100 Zvi Vered wrote:
>> In 2024.02.6 I included "kmod"  in "Target packages->System tools"
>> But in rootfs.tar built without any errors, there is no kmod nor modinfo.
>
> the kmod package you selected only provides command line utilities like
> modinfo when "kmod utilities" is also selected.
>
> There are two options to get them:
>
> 1. do not select kmod package and use the utilities conveniently
> provided by busybox. You should already have insmod, lsmod, modprobe
> and rmmod available if you are using the default busybox configuration.
> Just run make busybox-menuconfig and select modinfo from the "Linux
> Module Utilities" menu
>
> 2. if you really need modinfo from the kmod package, first select "Show
> packages that are also provided by busybox" from "Target packages".
> Then you should see the new option "kmod utilities" in the "Target
> packages -> System tools" submenu
The Busybox utils have some limitations relative to kmod, like not
supporting loading compressed kernel modules. So whether the Busybox
tools are sufficient depends on the rest of your setup, but I agree
they're usually preferable for small size if yes. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
