Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4A9C001E0
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 14:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F3F8404BB;
	Tue,  1 Aug 2023 14:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3F8404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGUS_aM0AfKq; Tue,  1 Aug 2023 14:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918A84031F;
	Tue,  1 Aug 2023 14:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 918A84031F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BE831BF2AA
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 14:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F519813FA
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 14:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F519813FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4U12Y5SKXEOl for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 14:44:17 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62F9580AB6
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 14:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F9580AB6
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.55.240] ([213.147.166.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWRRT-1qKbDC2pqd-00XpMb; Tue, 01
 Aug 2023 16:44:13 +0200
Message-ID: <d2033d92-cb45-ccbf-b3f8-05e0fdbda360@gmx.at>
Date: Tue, 1 Aug 2023 16:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230801161956.00715a06@windsurf>
X-Provags-ID: V03:K1:ryVmOptD0nq1rJ+v9e0p2LLiSqfyUVnf+lRi8w/tVplzPaerUNd
 5dDccnIuKocn5S7kUEwqoww16uSj+wsPB3jm8f7Lg5jLZ1xdoUuNs0hYRfkgSR4Te20ROIZ
 PeY5CRyVdwL25vV1/UYtAR1gln/0nbpnGA4Dvf9xVFwNsHnaIC7xSYQbBU9p+nWD7uBtz17
 poSBPJ3rBlcZHgKV702xQ==
UI-OutboundReport: notjunk:1;M01:P0:eDeMXyAsADc=;16KadYULW3HvH6M7MYE1+K6zP1G
 0mjwGJZ+m2SUqD3/49R+FQGWcje3r8ZiWw42XTF2nFfH1G9G+WvCUZHqu359rcKZj3pEySGHN
 5FYRGYgyXzGbPjmGvdSTFVSdvihg43XBIcJp0WzsOXE3/oLdzZ62uc3k1PJH86USdLRWx3OQy
 iv2OWSAPt7T7p4HA0U9u07rZYEvtqzx+t94mBQFxOwv5DmLiioEmPeIp8vfnxauyFLG8aNt3k
 bWyayZOtwzvebeEu50CH5bPONqes+ddy7wOl4yNt0ULqn/9/NkEsQjIxU/vItAqu+8TT7ZOAw
 S88T5jUgHvmfuKkdYzRkJ7rxb8OvkZikmqYK1wciRjf/fzbT0dLBqACJ07tDCjG5rP/Pzn78Q
 7krvtFI1HS+30+ZVcIUqFAdxGtpHtEC41+qaWSv1B9jmVOD9OnVSgZ2HuOaFP8ND/PyI0EKW7
 f3BOd//ssUGgtvUy0sITIb7nME2yB4WjIM915Sreb9zANpvZl50vUEjne3TVNvZo9f9b7e5iY
 gT02/iCmyuJfU5ctxx0meebTc2+Sw/lt3LCxTsVAJbiNexEVBgbPrSayQL23excErKfOdTB5u
 fKsdFE6YowhO1x3PJ8hDDyXl8ffYt0+0Iw5Hom1phP02y/we4fUWrMtE9+6e3ibV23F1r8Hmy
 vYHNF/5VIKgtQrsMrQ4Fby3nJwACmDRxyc4T/yh5YurpCJo/qApRTS/4TEUs3+Bf4ocl2gSUe
 Op5NSWUAWfIxOZzH1aKxlF4iCWCFF2qmSqxHqpjoU9fCWe+k8Wi/dkOBzmdxLeqHS9iA3wp30
 x82WD9hgFnGiEyTde6WWjQqyOyO2W4LoB9V0ZXxh5j65rdwpxWEMYzjtmkgtUkirRCBFUc193
 UWLABxegx3DINiBq+4iZd3ARe+SzWfmaI3u7AcWFYn2lOOEu+9xCcK/mFsNLf46MP1JuHSEId
 IzmIzqkHXyj0guQjHQO8Zlch5Yo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1690901053; x=1691505853; i=dalang@gmx.at;
 bh=48l9g5SqElvAyjDv9uAUlykp9mneJfCLfTVCu0c0O4I=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aDos8f8JnssgQU/IcawXlyNDBlxH2o0TsPDtfL/3mGEA21saeLqrrY17ZSVSxR5T4gJcK6M
 zVTab9UVpbm0PQApLHipyjuqTEapO/axNUJMTbQHe2z47fxM+68vMqQDFB47u3Lfa3YiCFxI6
 TpX/M1w5AJsmXS+gLBX6fN9iHC4ypTQoiVUru3deMdq53RJl+dbBtOYPcGUZ6rlpWZrM7RSec
 bMWE9L6MHWaRC95WOJxLNjW6fk3m4P07+3qZM7KqNUHRHneyfmt8xfXjD05u6296tBozVvnZ1
 6G/fYa5UJfYdmwXW4hDDF53Ppxfk/oBf0lrwuiJJFbkqos6dOZLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=aDos8f8J
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 01.08.23 16:19, Thomas Petazzoni via buildroot wrote:
> Hello Daniel,
>
> On Tue, 1 Aug 2023 16:13:03 +0200
> Daniel Lang <dalang@gmx.at> wrote:
>
>>> Wow, thanks for working on this! Is the storing of 200k files workable,
>>> or do we need to consider some other option like a local sqlite
>>> database or something?
>>
>> From testing on my system I can say that it seems to be workable.
>> Generating pkg-stats for all packages takes roughly the same time
>>
>> old: ./support/scripts/pkg-stats --html old.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   252,39s user 45,10s system 100% cpu 4:54,85 total
>> new: ./support/scripts/pkg-stats --html new.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   250,04s user 46,24s system 100% cpu 4:53,72 total
>
> Nice!
>
> I see you have --disable cpe. Is the CPE database unchanged on the NVD
> side?

I disabled all parts that would request information online during execution
to get a more predictable timing information.

To be honest I didn't check if the CPE feed is deprecated as well.
But looking at the feed's website (https://nvd.nist.gov/products/cpe) it
seems like it will be retired as well in favor of running delta updates
via an API (https://nvd.nist.gov/developers/products).

The "problem" is that NVD currently tracks 1M CPEs and the API returns
10k at a time.
Saving them one by one into a file won't make much sense.
Another idea is to put them in an array and save it as a big json file.
When updating one has to make sure that entries are unique.

I will send a separate patch once I have that part updated as well.

>
>> I did consider a sqlite database given that that's the approach yocto uses.
>> In the end I decided against it as I wasn't sure how future proof it would be.
>> The current approach means that additional information (score, description,...)
>> could be added or used for other purposes without having to download again.
>> Whereas I thought I had to make a selection for the database.
>> In hindsight I could have just added a column for every information available.
>
> I'm not sure if trying to map all fields of the JSON into sqlite fields
> would be relevant. In fact, we would only need some kind of key/value
> store, where the key is the CVE identifier, and the value is the JSON
> blob.
>
>> If there is concern I can see with I have the time to also implement a database
>> approach for comparison.
>
> Not sure it's needed for now. The filesystem is also a good database :-)
>
>> Not sure if updating would be faster with a database. It takes ~1.5 seconds
>> on my system to save the batch of 2k CVEs to file. But I guess the main bottleneck
>> is the API given that the initial download took upwards of 30 minutes during my
>> test runs and only ~2.5 minutes are spend creating files.
>
> OK.
>
>> I did. For a 1:1 comparison the sorting on line 185 has to be changed to
>> for cve_file in sorted(os.listdir(year_folder)):
>> Otherwise CVEs within a package are sorted differently making a comparison
>> very hard.
>> Running pkg-stats with this change generates identical reports:
>>
>> diff old.html new.html
>> 57505c57505
>> < <p><i>Updated on 2023-08-01 07:34:14.594976, git commit 22e476d7886163484d233803b42a2a4c2b588a5b</i></p>
>> ---
>>> <p><i>Updated on 2023-08-01 08:40:33.290711, git commit 22e476d7886163484d233803b42a2a4c2b588a5b</i></p>
>
> Excellent.
>
>> One final note: I'm in no way a python expert, so any optimization or
>> general input is welcome.
>
> No problem, I'm also no a python expert at all :-)
>
> Pending some feedback from you on the CPE question above, I think I'm
> going to do some quick testing of your proposal and push it.
>
> Thanks!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
