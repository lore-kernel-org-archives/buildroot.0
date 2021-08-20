Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6335C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:01:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ACD761131
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ACD761131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B580B400D7;
	Fri, 20 Aug 2021 22:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FK47TJjRjCH0; Fri, 20 Aug 2021 22:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1E2F406DF;
	Fri, 20 Aug 2021 22:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0B931BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD8604080D
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcXPDNtWZd-i for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 22:00:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10111.aruba.it (smtpcmd10111.aruba.it [62.149.156.111])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0759940715
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 22:00:51 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.181.120])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HCZEm1GeRnyXHHCZEmA8AS; Sat, 21 Aug 2021 00:00:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629496849; bh=6HNH9U6z6IzkVbwBrqMjDqxtGjPeGX/zqevBk19N6BM=;
 h=From:Subject:To:Date:MIME-Version:Content-Type;
 b=QyMKzeIMnGhnWcabb8qJRFvOJnL1dnwU7dMHIz6hBj1Xu9htpksID1FfLSsXe4Ign
 B/LEaA2A+FIO6QFXYfPZX6P32x++lZm+EYDcduRhIL7JKqyHF92kYdLX0uYbRF34s0
 MiXfueXh8tvqFoWpbUTJCxPXNTLSbHUCTKqCSTDtp36mZdRoX2DdnltqTiI45QvXQe
 Xk1xtLGYHdAThlwNEGguEKL7Ch36bg/rsuWdA9og/N9gDM2kZY73ep5ksSVa3I0B93
 /2s4UMFc5+Md0OcHYOGMVaTofA9IOxrPA12u5XOcO2swQhq25glM31DBiBokKxaRcl
 SktN/b7Khq41g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
 <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
 <20210819152852.760ec08d@windsurf>
 <f4e339cb-a699-afd1-5d5c-68bd1ea147fc@benettiengineering.com>
Message-ID: <9ad96cc2-bb2d-584b-8170-02b72f0eb791@benettiengineering.com>
Date: Sat, 21 Aug 2021 00:00:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f4e339cb-a699-afd1-5d5c-68bd1ea147fc@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDQx0qSajBNG9YN6JUOlLpmrd0s+L74Pm5zTAMUqhPKMeDt66ZWv3T9VkCaffkMyn6JF/hAw+7UcvKz8tG9iEHM5geUf4hj9MeTM2sKn44xkSezlV0ci
 QgZ6PonU4k/izChIxBKWz8E1h7ysYpOk0VvXLvLls7YFkKzSnbpiT73ODGlCMSfoJr4WbH3OubsET7Egm7/x/iJo1YADx91vo8i5X0lMV1/e4DETUuFpprVD
 y31dfVrc8UN8CRU5ox3SvUijzQ+HsxsVurKm/iEpk0JvjrCDZ+msvTvs+57cbQfDYB1bZ8QD66aLw4CBldmDTOsmMgySAktxchRfFhqQagq+A9O7wAW3ebSd
 oC3yRervkrz6Ymeofno3ofYifczfUZ7nA5lWj7vSVgxU3VyScQFIx9pAxTfRwNcyCuIYrRCeaE6A3iMkv/d6jUo31Wz41eeFFjvv3XS0U3g/t4/VyoMoWXi2
 FB+FSLrud9v0g63lUhPYwiqb8Vx5iGBwuIG7KWQa6o/HrppSITdkZqfbOuXEuiK6k2aRpFWYWvMGWlLqDiLd2KmSz7v1nGuSN2L5+g==
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Herve Codina <herve.codina@bootlin.com>,
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

+Cc Yann,

On 8/20/21 4:26 PM, Giulio Benetti wrote:
> Hello Thomas,
> 
> On 8/19/21 3:28 PM, Thomas Petazzoni wrote:
>>>>>        or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/92c086b0c5c2a298a82a6eb9c289dc53c58a5e5e |
>>>>
>>>> Top-level parallel build, no idea what the issue is.
> 
> This doesn't show up on my pc, but instead it ends up with openal
> package build failure due to Bootlin toolchain not updated.
> 
> Basically I can't reach lapack to build because it fails early on
> openal. And most of all it doesn't build with parallel top-level simply
> using br-reproduce-build found here(I only have output/ instead of
> output-1/ and output-2):
> https://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build
> 
> I remember that other build with top parallel but not this. Can somebody
> double check and tell me if it build with top parallel?
> Also because on Autobuilder it shows output-1/

TLPB misleaded me. And I had an old buildroot-test on autobuilder(the 
one build failure is happening) that didn't create output-1/ but output/ 
only.

But the problem is that while openal package build fails(due to external 
Bootlin OpenRisc toolchain), TLPB goes on and builds LAPACK correctly.

I've checked with Yann and that's that way. So this 'unknown' is 
actually openal that will be fixed once Bootlin toolchain will be updated.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
