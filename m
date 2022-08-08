Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A709EC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 10:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA3B60E1D;
	Mon,  8 Aug 2022 10:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BA3B60E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8y8ZpQpC4h_b; Mon,  8 Aug 2022 10:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F1A060E17;
	Mon,  8 Aug 2022 10:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1A060E17
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2DEC1BF36D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3CC40609
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3CC40609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8UaLthKMnfD for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 10:30:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C1E402E5
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73C1E402E5
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 10:30:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4M1XX31zsfz9scY;
 Mon,  8 Aug 2022 12:30:11 +0200 (CEST)
Message-ID: <2e49d072-ab0a-4e7e-1d39-9844e98bf560@othermo.de>
Date: Mon, 8 Aug 2022 12:30:10 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <35ea7a5d-e0b4-d98e-ca1d-716de2d25698@othermo.de>
 <20220808121723.7d0d2bcb@windsurf>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220808121723.7d0d2bcb@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1659954611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtNpOwT5nQ00AlSuW8Zmt2dkCVjfOEK6hYGFWiB1KdM=;
 b=we2uzmqWHBi1tlH1jsLfpQp8T4hW86ZhfXDl/1oUhr9x8Y3+q0fXqksKrGsKgTaMhz9THC
 JfXEA/8FXW4aFp2scF2TZdb5XG6gT3kos6gKAalNN7iXRs9ML77dhSvv87FB4q3Qu4QvS6
 C5lcgkq7AWw5X1Uy6Q4VleR91G4ChejWNjUnCAfZEkIbzeDKgIaYKO5OI7mq1B5Ydghqm8
 BS0fw/StrJO0e6+Z3zgPZ6H/td347FYCa26vn8LVMvkf8e5v1hODYJ4SHb3dWuy5Uo/ZjP
 1IzPKmaefoEjUZvGLAZyrw1uegPg29uRxfW3tkNxgFOncZnhdLODVmDgKedCSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=we2uzmqW
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 08.08.22 12:17, Thomas Petazzoni via buildroot wrote:
> Hello Marcus,
> 
> On Mon, 8 Aug 2022 12:05:54 +0200
> Marcus Hoffmann <marcus.hoffmann@othermo.de> wrote:
> 
>> I've noticed a similar problem for pip's PEP517 backend as well, which
>> normally calls some internal helper script via python subprocess (and
>> uses the .py name for that). This is fixable by using the .pyc suffix
>> instead in that case though.
> 
> Do you have some details on this?

Sorry, I hadn't really gotten around to properly reporting but here's 
some details:

https://github.com/pypa/pip/blob/main/src/pip/_vendor/pep517/in_process/__init__.py#L13 
returns the path to the .py file in question and is called by

https://github.com/pypa/pip/blob/1880f4a58b4e4ed577a6337d666767784f6831d5/src/pip/_vendor/pep517/wrappers.py#L320-L326 
via the subprocess call.

Why they are doing that, I couldn't figure out in the time I spent 
looking at this.

This is happening for us when we `pip install` an internal package that 
uses flit[1] as it's pep517 build backend.


[1]: https://github.com/pypa/flit

> 
> Thomas

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
