Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00FACF11D6
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 12:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A45640F8F;
	Thu, 10 Oct 2024 12:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pz_ZGi-lQaMO; Thu, 10 Oct 2024 12:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED19840FAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED19840FAE;
	Thu, 10 Oct 2024 12:02:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4EC61BF419
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 12:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C372940FAE
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 12:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMgUlNXcJIA4 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 12:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58E8240454
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58E8240454
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58E8240454
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 12:02:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.249]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5G9t-1twvHq2WIP-014jEf; Thu, 10
 Oct 2024 14:02:27 +0200
Message-ID: <7a8d5a05-c2b9-45f8-8bde-f8a21354cd13@gmx.de>
Date: Thu, 10 Oct 2024 14:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240927235259.2046297-1-james.hilliard1@gmail.com>
 <1e9d4998-f628-4ec2-85c6-98d357ce6479@gmx.de>
 <20241009223821.582ad875@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241009223821.582ad875@windsurf>
X-Provags-ID: V03:K1:0wKqsYONT/wnRS/eBa01tUehIUe8Vf7FKBEhHAbsZIcewy4NorT
 1khhOaca2owsE7Epb8SLps4Plfwej3Skp0m8+nNGNPAuBsLDYj73KX8VhNDLSMPy5v7IXiq
 aw21EhUFKpHTbDRntLKbcnOmgFuM6nbziIRc4o7l1NYnYs7LismkTAZNrkJG2GYTooQfly3
 RT1b9bT96QKj6DgDEyL6Q==
UI-OutboundReport: notjunk:1;M01:P0:OtqWf8+FXic=;CtvFebzPH9YTVgfq911f9QURc1z
 00iAK0RbgF+Yven08uBPjJdCAbvkofkRWnLyy4gCbuEDvOMwzVxQIdKFS8LNRhLqacoknXBId
 CkFK7Yk0Ul47kaXR9itI4EqDi8X4L5Kcl7QrbcjwIsUxlnEOwgNI32luS3r6ipNbECuwfwU3s
 mk140cha9Ia2oNgEj+NVwvkChGh2iQJzv1pR2VpbXyztcd+z8tUFG2LHZ9yz0n6EEh4t66DsD
 4aSRe5OZFw556Oug9DQYOkVRQynCbMIS5lKlnwvo7kVnUDbSv5yqEA11a4CfZMHkjYVcm9nBo
 PRGGwFQgptBAJa8DbgcmQalzxsiuE4TyQ/bOXWlPhl3QAo1guEnVwBz4EeBAHmaixvsTnaCFx
 SK84Yy4WSf6JnIKJd5WOy2Q2yKXP3LGyobstM8ZSw8MKEkNUiDLhPMfijQLLRl8Yi4VM3QgMO
 Vyki3GytC3tKGXYMsBmaV1wKOorDPWZiiOwg2GFy9LlhRZSrLL3uA9iHKLeXgyoYw2Z7J6aF/
 EjGhuCOUiFckmKA9xH5ABTdsblq9DZl+1khiMPm811Z5a0duOBRhJZif8psiaapWp2C3F6gnL
 vswEDr76qV+7/GGpa5Di5uEI64dXpN7rajX94rRVzaaMwf29v8yqwE1VexEgZ47BHK5SOIq4f
 XcozrqEF9h7fmaL9OrSdjlPUzyW9SueQ8xo9pD5SRyUlgmUneVVHY+NLqEdGrVJDOoTVc33oL
 Yi0ZBkjBXMb1lMZP3PqvUr90PkU9SGT75SHwhCaDLysyNJjrQDMHm2NcsI9vVsjsNxS2rFNsv
 Q+gJqhx4Cr54i2DQnzEDx2ng==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728561747; x=1729166547; i=fiona.klute@gmx.de;
 bh=itV1+B2mOnTZ3ZsYD9PrbXAxraYo3UOwwuHwm3eTjdo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VBiWl5HNzwvnliUFKJVoD8cTgUPb7JVvNz/gGrCcN9HaG6ugPyJaHIsWdY5DL7Qv
 YWVe3FASazewjyuPqX2R2yxlFq/fl2dYo52uZhsdpulJ5N+pc7ZPtb4SN22V4D9DA
 fyPW9h67aJM8LuCqRZbJP+1iA686lkr0KL5LtqK/66mdT55W5+7g7J/om3CD2wn25
 IWpcS89z3zK6IvKSLu5/2TFZU7In668henXeSuD5+vfgpofVwhZp/CamuXSVAs1V6
 +R51QFnTPtsO4NQzNJq6VZCmmCCZ6+SVNbZh21ADAXD41d7rWXnWsD154Jmur7S9q
 3W4tOcgRXkvj2piVOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VBiWl5HN
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 build with latest setuptools
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.10.24 um 22:38 schrieb Thomas Petazzoni:
> On Mon, 30 Sep 2024 12:33:00 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>>> Backport an upstream patch removing this module dependency.
>>
>> I'd prefer to see the update to gobject-introspection 1.82.0 merged
>> instead, which already includes the patch. Though the backport could be
>> a stop-gap measure if the update series needs any lengthy fixes. :-)
>
> Fundamentally, I agree with you that updating GOI with your patch
> series is the way to go, but as this build failure has been impacting
> severely our autobuilders, we need an immediate fix, which is why I
> have applied the patch from James.
Makes sense, I just wish I could do something to get that series merged.
Now it'll need a trivial update to remove the backported patch with the
update, but if there's anything else that needs fixing I'd like to do it
soon instead of accumulating more changes.

Or is it just waiting for someone with commit access to get to it?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
