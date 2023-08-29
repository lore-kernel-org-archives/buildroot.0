Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C661C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1CBD82023;
	Tue, 29 Aug 2023 13:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1CBD82023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6k38rwpUXPuR; Tue, 29 Aug 2023 13:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0217282018;
	Tue, 29 Aug 2023 13:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0217282018
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29A8B1BF3DF
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B1782023
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1B1782023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05KZolILawQs for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:10:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1338C81A4E
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1338C81A4E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 823E940008;
 Tue, 29 Aug 2023 13:10:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qayUZ-006rJw-DS; Tue, 29 Aug 2023 15:10:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Robert Smigielski <ptdropper@gmail.com>
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk>
 <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk>
 <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be>
 <87msyb548w.fsf@48ers.dk>
 <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
Date: Tue, 29 Aug 2023 15:10:47 +0200
In-Reply-To: <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
 (Robert Smigielski's message of "Mon, 28 Aug 2023 19:19:08 -0400")
Message-ID: <878r9u56zs.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] CycloneDX SBOM support
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

>>>>> "Robert" == Robert Smigielski <ptdropper@gmail.com> writes:

Hi,

 > Yes I am concerned with creating a valid CycloneDX official SBOM for use in
 > other projects as an input. For example take the output file
 > <product>.json as input to Dependency Track. It does work. That is exactly
 > what I need for my daily work.

And a generally useful thing!


 > If data is not in the legal-info, then no problem, the CycloneDX-Buildroot
 > project will not see it.

Longer term I think that is a problem (which you now also see with the
missing CPE identifiers). The legal-info format is very simple/old, so it
misses a number of things present in show-info that could be interesting
for a SBOM.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
