Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6390EE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47ADD401E7;
	Tue, 22 Aug 2023 20:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47ADD401E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sfup9_jQarHQ; Tue, 22 Aug 2023 20:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D5A40206;
	Tue, 22 Aug 2023 20:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D5A40206
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C06EE1BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A68D081BD6
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68D081BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBosr27rX2ar for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:42:50 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A8F381BA8
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8F381BA8
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6F0A919F59D;
 Tue, 22 Aug 2023 22:42:46 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60716])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Aug 2023 22:42:46 +0200
MIME-Version: 1.0
Date: Tue, 22 Aug 2023 22:42:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230822223546.46d9ba7e@windsurf>
References: <20230822192315.8180-1-ju.o@free.fr>
 <20230822213539.331878ec@windsurf>
 <f2414860dfc205f44efba3d43cdddedb@free.fr>
 <20230822223546.46d9ba7e@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <05dfe2d4e3f1f33c11959fe16bb2cac3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692736967;
 bh=xfneSuYXoje7g6ZR25UaZr/+pzdr68TmPPrLyXa/GYE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F7JnVzl4U0O314B3+QOPdgoDJny13y1gJgSC6cfSoiwSu08coukwV6Jixi7VGqEc4
 vgheb4IGbfdnK0Sh5Z3qj0GgoVhB2S2bp7aSxAWH9+YSE0eRhZtg3OuNLcNtq1BXzh
 S2RQZ4aSAr3zula0b1UXy+oiZHELymIiYkYXJTyPdc2h6ydLLKit9rAxxsughQID2f
 2/eB7qOlVfWPfDhZYMsqnj8nbz2ic0nU5Cbe6AvSWqO3Cefg/gjRHvoPOGZP9jX6aa
 +hNlfXt3Q8YDKDyUelGuHNsmCn76VhMsWM+cNZkt2s/hKPu/efTp8GnUViWCgi+bph
 Lffdm+ipcWVMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F7JnVzl4
Subject: Re: [Buildroot] [PATCH next 1/1] package/kexec: fix link error when
 BR2_OPTIMIZE_0=y
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22/08/2023 22:35, Thomas Petazzoni wrote:
> On Tue, 22 Aug 2023 22:08:32 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> This could indeed go into the master branch. Since 2023.08-rc2 was
>> already tagged, I imagined only major fixes would go into master.
>> This one has been longstanding issue (so apparently not so important).
>> 
>> In fact, reading the Buildroot documentation release engineering at 
>> [1]
>> does really allow me to decide what kind of commits (security, 
>> bugfixes,
>> new features, minor improvements like typos) should go to master/next.
>> 
>> Recently, I had the same interpretation in [2] that a minor 
>> improvement
>> (in which nothing was actually broken) should go to next. Yann 
>> preferred
>> master.
>> 
>> If you summarize those situations, I would be happy to propose a doc
>> improvement.
> 
> Essentially, the idea after -rc1 is to stop applying version bumps and
> major changes in master so that master progressively converges to
> something "stable" that we can release. So, we can still merge
> improvements and fixes to master. As such, the build fix for kexec
> definitely qualifies. The license file improvement for lsof that you
> pointed also qualifies: it's an improvement, very low risk. Of course,
> there's always a grey area, even for version bumps: sometimes we take a
> version bump in master because it fixes security issues. Sometimes we
> prefer to backport the patch fixing the security issue rather than
> bumping when the number of other changes that take place with the
> version bump is too large.
> 
> Does that help? :-)

Yes it does!  From now on, I'll also include minor improvements and 
bugfixes
to master. Thanks for the clarification.

> 
> Thomas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
