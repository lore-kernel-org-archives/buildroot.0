Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3495C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 13:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F5F940B62;
	Tue, 18 Oct 2022 13:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5F940B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6T9lcmYlHx4; Tue, 18 Oct 2022 13:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D5C04048E;
	Tue, 18 Oct 2022 13:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D5C04048E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA601BF5E9
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 161C083E05
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161C083E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkiR5WmQg9Aa for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 13:18:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FBB83DFE
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FBB83DFE
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 13:17:59 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kmTlowbM4ae4mkmTmosjXr; Tue, 18 Oct 2022 15:17:58 +0200
Message-ID: <a07fa13b-15cf-afc7-2507-561e2c256c6b@benettiengineering.com>
Date: Tue, 18 Oct 2022 15:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>
References: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
 <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
 <20221018151445.42d376ff@gmx.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221018151445.42d376ff@gmx.net>
X-CMAE-Envelope: MS4xfOZyHcqEtgE4q+aRKYtdzFU3wiUbzDw5RRHjfk+n5SmbAqvLdIBPJjZ4llqEGfNiuvA+ovI+GtTbzXJ5zMMmHbNW520iWuv5DkhlADENJrDcUTVVGPgG
 7LzgAeQajGGCfqns9S2iapSh/znHb6WJ3ELRXFG2YXcF8LoFeVvJVJCY9N2BBbsBNt7ftOeQng6ritwoqpqX5XOfJK2uwRiV2TMn0WEKZ6D+haGAz2VCuFGR
 DBTeLVxgZuGOGz9gde4VxchKVgU8nLTSGdor1wblVB+SslIUUD+qfLTfOgj9qKnm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666099078; bh=h9al+rbw8yjWQ4nT35lx+DzrEbXUTzVs5fMO6UYtnXw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=OhED+efyJCK64be9zoKSKJgCNsUvDGWrb8zNplyiHD9BSuWgAoJbNVm6WRlV1yGwr
 GdCeWYF6Rqa1z1FUy5SMBo9zf2tYbpNevJOCtkbNbz98lxkUJRDO3g1bLih/M3UeTr
 FitQ9qjyNeDLjM2BJEZNZXSKRtbSKA2KHoH9ivFAE9PM+KUyeY3lAmQANyudoNDMdk
 GkNl7ZXjJHwMCsJm+iQJzDIs+SKpjoGDwsv2k6keNAy9n/1QuL9HIaP8LBOALzZBjD
 EcRISk6E/KuJz9V1pPdJsWHPgN69n8TS05iApFtPCM4BK/OE8JBHoYe0lUB1QD0QW0
 mqKrMLkLDh3uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OhED+efy
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 18/10/22 15:14, Peter Seiderer wrote:
> Hello Giulio,
> 
> On Mon, 17 Oct 2022 23:12:39 +0200, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * use specific upstream commit SHA1 since the latest is buggy
> 
> Please mention this in the commit message (including the breaking upstream
> commit) and additional mention that the used commit is from the
> branch(?) not master..., will save some research time for later updates...

Ok. My patch to fix the build with Linux < 6.0 has been already
committed, so I send a V3 using the latest commit and I point the branch
in the commit log. To be honest it wasn't easy for me too :-)

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Peter
> 
>> ---
>>   package/rtl8188eu/rtl8188eu.hash | 2 +-
>>   package/rtl8188eu/rtl8188eu.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
>> index 9c7f2de4b6..ff8c0a3418 100644
>> --- a/package/rtl8188eu/rtl8188eu.hash
>> +++ b/package/rtl8188eu/rtl8188eu.hash
>> @@ -1,3 +1,3 @@
>>   # Locally computed
>> -sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
>> +sha256  e6106521139cc463eaa74d1491e212437b2106c3aa0005b1b7b93f1d8a090237  rtl8188eu-7a7c5e0c0bc168ec5083a707e300e298dd4811fa.tar.gz
>>   sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
>> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
>> index ebce4617ac..99f8248c05 100644
>> --- a/package/rtl8188eu/rtl8188eu.mk
>> +++ b/package/rtl8188eu/rtl8188eu.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>
>> -RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
>> +RTL8188EU_VERSION = 7a7c5e0c0bc168ec5083a707e300e298dd4811fa
>>   RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>>   RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>>   RTL8188EU_LICENSE_FILES = COPYING
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
