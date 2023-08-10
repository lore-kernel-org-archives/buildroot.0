Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECA7C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA2B940B20;
	Thu, 10 Aug 2023 05:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA2B940B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AE7YdfJBRcSA; Thu, 10 Aug 2023 05:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E29314158F;
	Thu, 10 Aug 2023 05:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E29314158F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7194D1BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF0E835A7
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF0E835A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dwO8tWQ7DA2 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:50:40 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D600682314
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D600682314
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.192.240] ([89.144.223.222]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1q2rPN34Vh-00jXNF; Thu, 10
 Aug 2023 07:50:36 +0200
Message-ID: <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
Date: Thu, 10 Aug 2023 07:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@mind.be>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230809225901.470e0270@windsurf>
X-Provags-ID: V03:K1:4Bx39KRplRy2d9w2KC4kbG7y2RiOO8rp8LzIWPQuSU5ijVcKjOJ
 m0X4XMrGSzTVLR/utAEjCBhKofSJJLlHy9WS8IElJquwNcF+EW4RXmeZbnY2yuBZY1o8PA8
 yfw+D+QJFwqqizxChX/K60PzsXLxbtaJyX4JKAsh8YLGtLxIsLFys8w58IX1bHJ+HrlESJa
 hz/SWzol1w75h2eM1AKog==
UI-OutboundReport: notjunk:1;M01:P0:B3QD4nQeMb0=;UD6DtDThphR7HNtXUK08+Ciq97Q
 mQVFd4kS3Wm6CXBnBGpgHgZz/ASUO+x/2KZnoeFuJLsjDjtpSH6EGVXFLLeHGrD2sPsypdhf6
 luYmbr9RwvPlgmfWaRdM+Qsj9tMkBx57aU737RWbHNzia5YolUrBkM8wyDGWBggFBQaLcT06E
 QSgeXgQdjszgvrxFmP5y65/sbD55Lh2znL6ovAKvoFXA55eYrOXwvS/UKn013KJ137lXWqKpW
 7rnMGIyt8YEcNeS0gc5xCq+PF2z0DFXs1TxOAGZbn7MOPakYrEoCJ8zGiJ3FOhxUBX+I5dt9m
 7Icz1M2H4M4sPI9oEhjUATG1yDBkMNJTL9LJ/yIrJc0FmGiZx1LVwsEVO514p4AoAYAqfv1S8
 wYyawWuEWVUbRsJ7+1kV3ClrlXBfmi3CvG45/iiLptTZboNKzv7xn6yHJ3rvhcCjr8OEJ7u/T
 1t4VlFuJwmi3hwGXVpcNeAdR5vvV2POqtZfMcsu+O0SRNyFptSMuw4kS9NouXAd5QBgQbLnUZ
 9OD+j7GnmChVmdJoHyPAC8xoQ5pYhwApgEIYBZs1iYcH+FmGzY+/4rgeDA2wXIc0V5IDto5Jb
 eim8GIHnxybphqCZBHq1lhSrnGWsHJmp1mZS7RMiBi8eBINX6jSoJ3j8EBUsxHP4smVoT5pFy
 T/NUdvcuuNRTudOxrj86yLr57fqCqiF2icvw4reQIypQBIlVzG/V4QIOO8LGdk8Egb6IrpBjD
 9Cv26EhHiWaNbc1GQ8eOAdBR7xuRkYlnZ+n40iwhhZbNTEdnyNTaQCh+ko0FP386e51qfsomv
 KCisMzmDBhILBsp8Yy8PztWtIaVSRIZTLiMyYWNNaBV94e6fQ213Lrv9t5cBdGDdcj0pKUeHb
 uhWF3bqWzmFZwFgTwS3Cq8Gt0J5JHRovcgXMrNeFO1rrKO7Yxkgmj4exQjrdsAu1sI0Eiq+or
 x8/JFc5u6mOQ52sgxiQKItyOA5s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691646636; x=1692251436; i=dalang@gmx.at;
 bh=8QxONSZC/FOqb6mCgujVIb+Mxgnke/9y65BeCzEXVbU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VwLdcF5L1NRZb1xQXFkPSD80BLA68av9hFAG/9SqOqHnG0ubJrM1Mr7Y9R78A258IYg0ceU
 lRiTEHs2J+1ScYh3WMxLtRbtRhvYhWOekjU2sg0x12524YSTJZX09t635PR2FSwAyypx94Tht
 pXwEYINshfvdhS55DgVnkyVZofv0Y6NDHYmbZamNWMAkqFWDpG/jmtbMQvFUxBxBRaRgRGdry
 jgOIcw8Q2SijFF0zPv0U0VK8abbuqKI4raEAv7KrudaZSdeHwQFO49B3v9eh6nd9A5D0bi4Iq
 bSpdVmluLYpn+2Kk/7xRNUFfINKbbDv0IkwmNVfK9c+uwCr09y2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=VwLdcF5L
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
Cc: buildroot@buildroot.org, clement.ramirez@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09.08.23 22:59, Thomas Petazzoni via buildroot wrote:
> On Wed, 9 Aug 2023 22:31:11 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
>>   Using the CPE database is actually useless. I think we should drop it.
>
> When I read this, I disagreed...
>
>>   It actually doesn't matter at all if a CPE entry (including the version) is
>> found in the CPE database. If there's a CVE for it, then the entry will exist.
>> But usually, the CVE will have a version range. In that case, we anyway match
>> the version range without caring at all if the specific version exists in the
>> CPE database or not.
>>
>>   So, I think we should just construct a CPE string and match it against the
>> CVEs, without consulting the CPE database at all.

That's what pkg-stats does anyway.
CPEs are checked separately, not for each CVE.

>>
>>   It _does_ make sense to do a lookup in the CPE database for the CPE string,
>> but with * as the version part. This allows us to validate if the
>> vendor/project/etc. are set correctly. But that's something we can do in
>> individual API calls for each package, like we do for release-monitoring.

The problem here is, that the new API (even the one for CPEs) constrains us
to a 6 second timeout between requests [0]. We currently have ~700 packages
with CPEs. This would come out to 4200 seconds or about 70 minutes, each time
we run pkg-stats for all packages.
The only way around this is requesting an API key [1] which allows "50 requests
in a rolling 30 seconds window". NVD still recommends to sleep in between
requests...

>
> ... but then you say we should still use the CPE database, and I agree
> on the why we should use it: to have some reasonable certainty that the
> CPE ID we create in Buildroot for each package has a chance of matching
> the CPEs that will be associated to the CVEs that will perhaps one day
> be reported against this software package. So yes, perhaps we should
> just match in the CPE database with version set to '*', so that we
> don't care if the CPE database isn't aware of the latest releases of
> software packages, which it rarely is.

On that "latest release" note, we have a second, probably rarely used,
use case for CPEs which is support/scripts/gen-missing-cpe. This script
tries to generate a XML structure for each version that isn't registered
in the database. For this script a lot of information about the CPE needs
to be stored.
Side note here: I'm not sure that script will works correctly.
When I tested it I got a file for polkit 122 that contained 0.120 as version.

>
> Thomas

Regards
Daniel

[0]: https://nvd.nist.gov/developers/start-here
[1]: https://nvd.nist.gov/developers/request-an-api-key
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
