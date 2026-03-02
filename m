Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB8AEB3632
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 21:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A0283EB1;
	Mon,  2 Mar 2026 21:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibAQFbytakVN; Mon,  2 Mar 2026 21:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6910083EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772486438;
	bh=pgffwcHHxMTYLzigAQvyuKwrDpZiwwWY4BbXCCQQSCY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pigd5nJecLuA/kMuy/E1Zp1m1RvZsfNrtnaIja81VY2rq6sFOTQPVqSsTmXaY8rPZ
	 GUTNm53qlC5QeHcFerDdo3DymntJj8LyrfNCBg2+Hhd8JwTYX1S7t6u13uPFiBxe2W
	 2IEt7HD4adALvuyPDhHZpw1XDntw1NRecmF3yDtJjeW920crgj4g3Snt1bDXLCKxgQ
	 ZCf+jZuYH6k//l8iOAwFVOQN2/AN34J8CAGGhrYQBrMzoQpp5l3nApmimfLUG2+hUU
	 kEvoqLVU0qIh0XoIHt665/LWSaKkfA4X6GEMJ0xvHVtYW/1TAV4xsDubzIPXXSl8Dl
	 HD318vPvW6CpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6910083EB2;
	Mon,  2 Mar 2026 21:20:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D65F825B
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7A7241CB2
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AhmZm1jiBaW for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 21:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE26841CA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE26841CA4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE26841CA4
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:20:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BD50B19F5A5;
 Mon,  2 Mar 2026 22:20:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 02 Mar 2026 22:20:31 +0100
MIME-Version: 1.0
Date: Mon, 02 Mar 2026 22:20:31 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aaXHi1j_b4fRSI-V@waldemar-brodkorb.de>
References: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
 <294c54a635aa57d40cda161b8af98f8f@free.fr>
 <aaXHi1j_b4fRSI-V@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.13
Message-ID: <054ee3804bf26bee3dadf8425e0f723c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772486432;
 bh=EeBonYGGSBVFx3V/xHwPCkhAZLY6jbN6xy4jgLlug6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mWaYIu3/Qs321gVG2fnfdRFnL7Himu8sq+8JQEtkPW1tRc8rr1lYnJ28d1cWIuFqY
 aKehoxtqm5C/slSeCac+dyo63gc/4pHEwSgnwmVvrnRzYYkktKeeY/vt2Oyj8dkqDh
 FeA8lBxwtrzQMaXjBBh+1qpV11d0D48PzAuq5HBQq0OmJRICPt7kfcmJijsXySUsQA
 4QFaqpQ0zPeeIDa5j6RSBkTkbp3p+0WNJPuuDFVUWO7OWrHcK1jBZocNR7djIgPkO9
 kTROgwZRk4eNrgCNIcd4y3IJLrMBMyOqo+C8Ze8ovZN0Ltq3+ZUKNwAj/JySwoU4c2
 Z5+cMsdodFruA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mWaYIu3/
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.57
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

On 02/03/2026 18:23, Waldemar Brodkorb wrote:
> Hi Julien,
> Julien Olivain wrote,
> 
>> Hi Waldemar,
>> 
>> Thanks for the patch.
>> 
>> On 01/03/2026 13:42, Waldemar Brodkorb wrote:
>> > Following changes made it into the release:
>> >
>> > Joris van Rantwijk (1):
>> >       Fix adjtimex() with TIME64
>> >
>> > Waldemar Brodkorb (8):
>> >       sys/stat.h: remove _STAT_VER/_MKNOD_VER
>> >       fix gettid() declaration
>> >       add statx syscall wrapper
>> 
>> This new uclibc version is introducing a test failure
>> with zfs. See:
>> https://gitlab.com/jolivain/buildroot/-/jobs/13308829775
>> 
>> Running with the previous uclibc 1.0.56 works fine:
>> https://gitlab.com/jolivain/buildroot/-/jobs/13308875027
>> 
>> It seems related to commit:
>> https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32
>> 
>> Do you have any idea which component should be fixed?
>> (uclibc, zfs, or the rutime test_xzf?)
> 
> It is uclibc-ng fault. A fix and a patch v2 will follow.

I looked a bit more into this. The statx headers for glibc and uclibc-ng
are indeed the same:

https://sourceware.org/git/?p=glibc.git;a=blob;f=io/bits/statx-generic.h;h=9bb9701dc67eccad968b338aeb15d87378fe65cd;hb=ea37298b65bd67f94c3c2640e91ec5865a5019ad#l66

https://github.com/wbx-github/uclibc-ng/blob/v1.0.57/libc/sysdeps/linux/common/bits/statx.h#L88

On its side, zfs is (re)defining the function slightly
differently in its test:
https://github.com/openzfs/zfs/blob/zfs-2.4.1/tests/zfs-tests/cmd/statx.c#L57-L59

Also, this test does not include the <sys/stat.h> header. It includes
only <fcntl.h>. In the case this test is compiled with glibc, stat.h
is never included, so the error does not happen.

For some reason, in the uclibc-ng case, sys/stat.h gets
included from fcntl.h, generating the error. See:
https://gitlab.com/jolivain/buildroot/-/jobs/13308829775#L237

Maybe the zfs statx test should protect the statx() definition
with a "#ifndef HAVE_STATX".

Or could uclibc avoid to include sys/stat.h from fcntl.h,
when it's not needed?

What do you think?

> best regards
>  Waldemar

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
