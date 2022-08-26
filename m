Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDEBECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 09:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BF57419B2;
	Fri, 26 Aug 2022 09:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BF57419B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le73yCwZKwbD; Fri, 26 Aug 2022 09:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF01419A9;
	Fri, 26 Aug 2022 09:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF01419A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6FF11BF2C4
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 09:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2415610AF
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 09:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2415610AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl6vvGIseALI for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 09:16:13 +0000 (UTC)
X-Greylist: delayed 00:06:10 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970D160B19
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org
 [IPv6:2001:67c:2050:102:465::206])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 970D160B19
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 09:16:12 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4MDYv870Q4z9slv;
 Fri, 26 Aug 2022 11:09:56 +0200 (CEST)
Message-ID: <4dcde8fb-9370-e990-8069-cbfac74a62f8@othermo.de>
Date: Fri, 26 Aug 2022 11:09:56 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <35ea7a5d-e0b4-d98e-ca1d-716de2d25698@othermo.de>
 <20220808121723.7d0d2bcb@windsurf>
 <2e49d072-ab0a-4e7e-1d39-9844e98bf560@othermo.de>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <2e49d072-ab0a-4e7e-1d39-9844e98bf560@othermo.de>
X-Rspamd-Queue-Id: 4MDYv870Q4z9slv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661504996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAbfM7uyQhaNlwzTutt+6CqHaJzDdlCyqaGCqg7JpRI=;
 b=msJFHxJ9nUKRUrZeUwSfwqY/hYeeZP/+UE7o5+gKUO51fzhkjpZWBxJWkR3FgZD1djhOFE
 b3MY/0lT3ZLxmd+MCuklocZs3+4a9r1/98AYSOzaNEg6XZJPjXEeY5Xn/rsqJul5uFbH0n
 Y4O/gC4duxeT+ag7afdTA4AyVsivt6HuQpWBD01VoB7BIDUzhJYw9Gfk/Upw3LnsiQWORM
 Kn+FNtlAPNq2Qd5tP/vvg8Q3P1D5f1UhAzzfQHWZ1ZBsWlNMp9K27lPpZSBpOFemwkgJdh
 rEdqtoXPecnYKNJzaO8QFxMaFoeXp5iQGxlYhiM2ME8yHqjVRfEib+ZEbvDFpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=msJFHxJ9
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08.08.22 12:30, Marcus Hoffmann wrote:
> Hi Thomas,
> 
> On 08.08.22 12:17, Thomas Petazzoni via buildroot wrote:
>> Hello Marcus,
>>
>> On Mon, 8 Aug 2022 12:05:54 +0200
>> Marcus Hoffmann <marcus.hoffmann@othermo.de> wrote:
>>
>>> I've noticed a similar problem for pip's PEP517 backend as well, which
>>> normally calls some internal helper script via python subprocess (and
>>> uses the .py name for that). This is fixable by using the .pyc suffix
>>> instead in that case though.
>>
>> Do you have some details on this?
> 

I filed https://github.com/pypa/pep517/issues/148 now. It seems that 
openwrt has run into this problem as well but the patch the submitted 
didn't get any feedback for quite a while now.


> 
>>
>> Thomas
> 
> Marcus
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
