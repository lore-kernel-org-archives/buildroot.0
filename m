Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF0CC27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 21:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0829D4152D;
	Thu, 13 Jun 2024 21:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7BYXa7dqK3S; Thu, 13 Jun 2024 21:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3ACC403D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3ACC403D6;
	Thu, 13 Jun 2024 21:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5C261BF340
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 21:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2BAC4171E
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 21:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThaghemE0nVv for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 21:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E814416FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E814416FD
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E814416FD
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 21:56:38 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HsQusMF3rQso7HsQusTCCQ; Thu, 13 Jun 2024 23:56:36 +0200
Message-ID: <0e066850-25e9-4b49-8da9-b02afe9513db@benettiengineering.com>
Date: Thu, 13 Jun 2024 23:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
 <20240613234119.5ee92044@windsurf>
Content-Language: it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240613234119.5ee92044@windsurf>
X-CMAE-Envelope: MS4xfO9azW4QnJIzjWH3Ylojf7vbZGk8KdmFRBvipN6k2kHykiY5Wf/PYnNZLOIy25TyRBjYrV1rM50g6Xfw9ohgX/XmscgurN2wmateVIqcuEl5gJbWYQKt
 jew8CvMY/7PR7QZPWw6GTkE7T1rQwchQKFge19O/CxiWseF/9OYFFSnMaHFCjCRgFPFKoQazj4yrtADSNnVL31uedn9atEblHEsidMAZHbgWZJuPxFrSW+9B
 aH5a3Dzj2sFpYdgVmoUTAiOy53p6zPzLiU+H6KGLdyGU8Sc1HHsyEYXjbX9VZDlGYclsiP5d9nMYu+t/ylAPPvQCYZhWfZVtK8+YHxykLiY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1718315796; bh=mGp3WSO8udno1/zdvejq5ZyxdAB2FptCsbr5VmLBHj8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=irZh6W6kgm9jR95qsbdjnUZhp2liYyQNUBbHPRt7s5YueKWe0mmXKIHxg/lKBBl0S
 U7e07fltdYqDVzUr1612Q1DwdPo37/WMT6SzQ1oY3TJ0VeIRNtp6nHlcYOlNa6wMY9
 E4zZDNMBwmHa5GHsB4+0tqeE2+ivo0o9Y4o99R6F+NrU7JGXoXFwHoeXNzxVkkggKM
 XmjeStMKt5rpRt45QEFd23QL4KhgPCqQqRk+a4FkRz6q8jdrZvn5Vzg7JlNZu5s07x
 TbV3x6DuApg4BozxQA1Bw/2QtGb+3/tTgrM2x038z7/Q+J6OrVmmkeE9AllkqKSkDH
 JXLk1qQDKTaHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=irZh6W6k
Subject: Re: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 13/06/24 23:41, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Tue, 14 May 2024 10:58:00 +0200
> Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> 
>> Our Bugzilla is so slow and unstable that it has become
>> unusable. Let's switch to using the Gitlab issue tracker instead.
>>
>> There are still lots of references to the Bugzilla bug tracker in our
>> News page at https://buildroot.org/news.html, but these are for older
>> news.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> I was wondering if the other maintainers had any feedback on this patch?

I'm not a Maintainer, but I use Gitlab daily with Issues since 1 year in
team and in generale I find it a good tool.

As bug tracker is pretty good also because of Labels we could define to
better address the bug. This has been tested at my Customer's Gitlab
with 3 different final customers in Horeca sector. Both developers and
final customers have been happy since 2 year with many projects started
and finished and still maintaining(I count 10 circa).

And all the above can be done with the free license with no problem.

These are my 2 cents.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
