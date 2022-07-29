Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF27C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 12:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2397840CF8;
	Fri, 29 Jul 2022 12:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2397840CF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Xh6323Qi2HH; Fri, 29 Jul 2022 12:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42469404AE;
	Fri, 29 Jul 2022 12:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42469404AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C27E31BF3F9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9945D83459
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9945D83459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFQCP4P6COiG for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 12:47:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3CD829F2
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D3CD829F2
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:47:23 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HPOjo3O14bMeiHPOjoNzlh; Fri, 29 Jul 2022 14:47:21 +0200
Message-ID: <de1a9d0e-6e11-3b45-c0a5-363a62d669fa@benettiengineering.com>
Date: Fri, 29 Jul 2022 14:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
 <20220729141205.2bde03b3@windsurf>
 <b24dfe19-b57b-23fc-8822-3fd87d2b0e05@benettiengineering.com>
 <20220729143340.18a16873@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220729143340.18a16873@windsurf>
X-CMAE-Envelope: MS4xfMvsteo2NXNgDNjfwe4pM4DCKMtzJOOItgnzW1tGR2/zKitMl7L5u4DzIZypt9QGkmla7Nen/dEIF8Z2u3fUD/8uFAIN0HpxkvOa5J6W/Ae3CE8zWBIy
 fOtb3L4aJtTcYhrsq/pU03xYzcakXccbHPkNUJMZPj7z86+KdNkqYzQREG2Jbjr4+HMxI+ROO9OJw9sc7WzyxYzIDqAW7z4wYSu5x46NGGXtxVjs+JhcxHeE
 /n26/DC6xM8DkKEBKb93MgC7vb5squhhrOcZdH1xNkwPjAcuWOsW7acjwGCKBv68elaAGhENXCr2foK0Fn3jXlj67yoyw1dquD2cEJpaK4s8PynjLlrmETPj
 OdwrFT5m
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659098841; bh=sgP3AchXMnxN+zdM42piuTV3WrlUEvIDB632G+DBHt8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fkBfi8cnG6upbGmx/GwS2Z5SwlktrW8Y0UJzz6YOnu/8dKrEEkoYulX5JGlgM9xHp
 7s5yZ5ALuv/iH9EgF3D4bwqEBWKKBWfGnpHOFy/SpKFYqAy40HJTRw+gwojixTbXBH
 5DqpKKortBbk0xo6KyTmIaj/ZoBMm0Qh5FnjnvveSgOyuCSqn3fQwmUdareNd6nTl9
 h/e3+ufjD80NAgmvRPzOlj05Pu89avHFKqluuRy32JhHk9anzv+nrzulKcWQsWjmtZ
 7sWcYoYjbe8tLa/svxCupQ/V+DoevQdU01lTVnjGJB7ffFn9q4SlOMe3ixrze3NuA7
 tColE2nKsxq3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fkBfi8cn
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc version
 for gcc bug 68485
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/22 14:33, Thomas Petazzoni via buildroot wrote:
> On Fri, 29 Jul 2022 14:29:53 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> On 29/07/22 14:12, Thomas Petazzoni via buildroot wrote:
>>> On Fri, 29 Jul 2022 14:10:54 +0200
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>>    
>>>>    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
>>>> -# exists in gcc 9.x
>>>> +# exists in gcc 11.x
>>>
>>> What about the recently introduced gcc 12.x ? :-)
>>
>> You're right, gcc 12.x is still affected, do you want me to re-send?
> 
> Not needed, will fix when applying. Thanks!

Perfect, thank you!

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
