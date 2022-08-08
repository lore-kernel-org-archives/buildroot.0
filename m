Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444EFC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 10:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C33B60D65;
	Mon,  8 Aug 2022 10:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C33B60D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JyM6sV1JfSWt; Mon,  8 Aug 2022 10:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29FE60BC1;
	Mon,  8 Aug 2022 10:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B29FE60BC1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2318A1BF36D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F266A81D5F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F266A81D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryrSp7f0oDuR for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 10:14:11 +0000 (UTC)
X-Greylist: delayed 00:08:11 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F5181B26
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89F5181B26
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 10:14:10 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4M1X032Gxdz9sSj
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 12:05:55 +0200 (CEST)
Message-ID: <35ea7a5d-e0b4-d98e-ca1d-716de2d25698@othermo.de>
Date: Mon, 8 Aug 2022 12:05:54 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
X-Rspamd-Queue-Id: 4M1X032Gxdz9sSj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1659953155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bnz9TwGtt75YRz0/p6Vg/6mFk7EP6Nr6BHESMCI21V8=;
 b=vS+1+0nsvwhpkkwUA7sot2eyF8vQiIK6KpFnsi+kxwSnGCD1dg/TRAjmyuPCM7mUy6xy30
 Vro6EgH64FaGA9agSsKqkpdBfXyQZ3nEN0WhWeyZH8xhbx851w8R79WX3HqjRFSVIgzLjE
 5k2RplYFQS7iPAOhMzh3GfDB4lN30CHKj3at5niibhCQQlcL502BXgGQTyQT1LP3nxtCH/
 Ua5K2tTKW13n5XIPbYB3amu0EdVmsefwtYEqTGOoAcC+6ny3xYp+PTfG9kikm/sulMUhVg
 uitaOVIxaBS7Yldd9H0OAZOgdhxfttaL5onQ2vt7Dq6LbhmYQRoITuiEa6MFjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=vS+1+0ns
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Federico,

On 08.08.22 09:40, Federico Pellegrin wrote:
> 
> 
> Hello all,
> I've found a minor problem related to the rt-tests package, but that 
> maybe is slightly more generic and wanted to report and in case 
> understand which approach would be best to fix it (and contribute a 
> patch then if possible).

I've noticed a similar problem for pip's PEP517 backend as well, which 
normally calls some internal helper script via python subprocess (and 
uses the .py name for that). This is fixable by using the .pyc suffix 
instead in that case though.

> 
> The specific problem: rt-tests, besides a few compiled executables, 
> installs also two tools which are written in Python, namely hwlatdetect 
> and get_cyclictest_snapshot. These are Python scripts which get 
> installed in the PYLIB and then a symbolic link is done from /usr/bin to 
> them, so ie we have: /usr/bin/hwlatdetect -> 
> /usr/lib/python3.10/site-packages//hwlatdetect.py
> 
> Needless to say that once the pycompile.py script is run and original 
> .py files are removed, of course in the "PYC only" setup (which is the 
> default), then the link is broken and it will not work.
> Additionally that pyc files will not work for scripts like that, so just 
> somehow fixing the link mentioned above would anyhow not work, as you 
> need to execute them eventually by explicitly naming the interpreter.
> 
> I could imagine that we could have some similar other cases when we are 
> installing Python scripts directly executed in PYLIB and not modules. 
> But I'm not sure that installing the scripts there is a good idea as 
> well, comparing with other distros that doesn't seem to be the case.
> So maybe the problem is really in rt-tests after all and the location 
> those scripts get installed and I may just fix it that way (and contact 
> upstream)?
> Otherwise should it be more generic maybe could make sense to have a 
> facility to list some files that should not be converted to PYC?

I honestly don't know what the best generic fix for this is, or if it 
even makes sense to try doing that.

> 
> Thanks for any input,
> Federico
> 

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
