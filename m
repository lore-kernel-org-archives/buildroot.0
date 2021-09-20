Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FECC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5674760F56
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5674760F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F6CC403D2;
	Mon, 20 Sep 2021 06:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPgsLaqBm6DY; Mon, 20 Sep 2021 06:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1B8403C6;
	Mon, 20 Sep 2021 06:27:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 884BA1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7700440364
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQ1vNi2pkAX3 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:27:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9341400A4
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:27:06 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 040E0C64918B;
 Mon, 20 Sep 2021 08:27:04 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 20 Sep 2021 06:27:03 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20210918153337.GB1053080@scaer>
References: <20210915052807.1981697-1-br015@umbiko.net>
 <20210918153337.GB1053080@scaer>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <21d1c31955bc7fae52c4ae39f53cbe07@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 3/3] package/mpd: update to version 0.22.11
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?Q?J=C3=B6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Yann,

On 2021-09-18 15:33, Yann E. MORIN wrote:
> Andreas, All,
> 
> On 2021-09-15 07:28 +0200, Andreas Ziegler spake thusly:
>> mpd 0.22.10 terminates with segmentation fault on graphical clients 
>> while retrieving album information. This bug was fixed in version 
>> 0.22.11
> 
> Please, wrap your commit log to ~72 chars.

Will do.

> 
> Also, the mail subject is:
>     [PATCH 3/3] package/mpd: update to version 0.22.11
> 
> But I could not see patches 1/3 and 2/3. Did they miss the mailing 
> list?
> If so, can you respin the series, please?

User error, I will re-send the patch with the correct numbering applied.

> 
> Regards,
> Yann E. MORIN.

Kind regards,
Andreas Ziegler

>> Tested on x86_64 using M.A.L.P. Android client
>> 
>> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
>> ---
>>  package/mpd/mpd.hash | 2 +-
>>  package/mpd/mpd.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
>> index 3847fc6724..2501be65de 100644
>> --- a/package/mpd/mpd.hash
>> +++ b/package/mpd/mpd.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated after checking pgp signature
>> -sha256  
>> 07c82535e9999c3d4a099d8e652c88724635125b3c9f265ba9b6f2974ff9e614  
>> mpd-0.22.10.tar.xz
>> +sha256  
>> 143f7f34aaee6e87888f3dd35d49aade6656052651b960ca42b46cbb518ca0a0  
>> mpd-0.22.11.tar.xz
>>  sha256  
>> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  
>> COPYING
>> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
>> index 62e31860c0..fe6b8d539b 100644
>> --- a/package/mpd/mpd.mk
>> +++ b/package/mpd/mpd.mk
>> @@ -5,7 +5,7 @@
>>  
>> ################################################################################
>> 
>>  MPD_VERSION_MAJOR = 0.22
>> -MPD_VERSION = $(MPD_VERSION_MAJOR).10
>> +MPD_VERSION = $(MPD_VERSION_MAJOR).11
>>  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>>  MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>>  MPD_DEPENDENCIES = host-pkgconf boost
>> --
>> 2.25.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@lists.buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___        
>        |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There 
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   
> conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
