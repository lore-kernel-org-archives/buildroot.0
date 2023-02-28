Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929C1C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 09:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B93181FD4;
	Tue, 28 Feb 2023 09:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B93181FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UGaXxuM2Ovh; Tue, 28 Feb 2023 09:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6256281FC7;
	Tue, 28 Feb 2023 09:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6256281FC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6DC01BF21A
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 09:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99C99417C3
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 09:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99C99417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfaKMwoBl5Cv for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 09:37:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20D77408E6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20D77408E6
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 09:37:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B821E0002;
 Tue, 28 Feb 2023 09:37:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pWwQ1-009VBW-88; Tue, 28 Feb 2023 10:37:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
References: <ME3P282MB1347B8B822841FCC27B501D0B9AE9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
 <87o7pfma0d.fsf@dell.be.48ers.dk>
 <ME3P282MB1347F848F339E07DAF66D58AB9AC9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
Date: Tue, 28 Feb 2023 10:37:09 +0100
In-Reply-To: <ME3P282MB1347F848F339E07DAF66D58AB9AC9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
 (Alberto Fahrenkrog's message of "Tue, 28 Feb 2023 07:43:48 +0000")
Message-ID: <87fsaqku62.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [Help] Building from a private PyPi server
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alberto" == Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au> writes:

 > Hi Peter,
 > I believe the API used (JSON) is the same (similar?), I can confirm
 > with one of my colleagues. Is scanpypi written in C or Python? I could
 > have a look at the code. I don't know where the source is, but I'll
 > look it up.

It is a python script, just have a look at utils/scanpypi.


 > The typo was accidental (below), the fact is that even manually using
 > wget I have not yet figured out how to read from the link, also
 > something I will follow up with my colleague.

 > I wasn't aware of the --extra-index-url, I'll pass that information
 > along to our software guys.

 > I found a workaround to get it to work, using our repos directly. I
 > need to sort some things out with our software department, but I'm
 > making progress in the right direction.

OK.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
