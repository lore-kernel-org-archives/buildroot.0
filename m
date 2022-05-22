Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE10C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 00:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9ECC61041;
	Mon, 23 May 2022 00:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlBp34jqfsm5; Mon, 23 May 2022 00:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD0060B7D;
	Mon, 23 May 2022 00:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27BD31BF41C
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 00:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16245417CF
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 00:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_LXf_pn7g3y for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 00:05:54 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4597D417CB
 for <buildroot@buildroot.org>; Mon, 23 May 2022 00:05:54 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id svTEnAl3RTRWPsvTFnwlzf; Mon, 23 May 2022 01:58:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653263929; bh=n/h3sCwMD58u361rfb3G2lM+m764XfxkDduKVD03OZg=;
 h=Date:MIME-Version:To:From:Subject:Content-Type;
 b=JjmXfneSpHf2Exv5l9FZIe5JoNl+smfus5TEYX+Oc8ItcEfog6Ax40xbzle8egQMB
 nZPwkY8D9N9JqOPLsiJOZJxHsjhYAM2tdeu46DV3w/zLeBw8UbDKUiecFCNF5HYn/2
 on1c19QH1z/FVm7EeZqXdHAPns9ysNqD3xfNuwLNP3F0CfsPaPrnw1bADpPzGNJ4PZ
 39VaiLh+zEolD5+Y0dJR8OJ5w+bqjD5b5WAPusnIt3VTRmd19vEwNiU6Nd19FfFvHV
 hBMXQDUgRFWt6OfMl/a3UGvu+nIa84260/v0klJOG/vrNfuHYhuGSnj4yJJziPbKyB
 bS3EsYwRndunw==
Message-ID: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
Date: Mon, 23 May 2022 01:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfCWwPRedO8Y25BTQ3LH9U2NOJlSLAu8SPXGyHYPifIc9VQyRx+CJs3RuTvN1rZQ7y9M3jzfSCzKWPy2H6BQi47FJsaxdShcX+qqn4VWhkZOndyURN3y+
 mFcpfXnionyIjDjoBUKADvJVkhZdjaczqgYl3kDcT0Jf3weE2qzs9QVnm6kSwvhd35wA5WIuDI8ApuXBQUmlKjrrF3AZyplm5b87z5kYPaC6Sku+JVneF96c
 ixmfOSgk6Z3/ASE6mQw3VJ4nukqKzi7ySUVUfCkJu8M=
Subject: [Buildroot] Can't reproduce libnss build failure
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

Hi James,

I'm dealing with libnss build failure with host gcc on your asahi-mini 
autobuilder, the host gcc doesn't
like -m64 option when linking [1].

I've spent many hours trying to reproduce it on various dockers and 
finally on a VM with Ubuntu 16.04
32 bits but in the first cases I can't have any build failure, while 
with the latter I have a different error.

Can you please tell me specifically which distribution and distribution 
version you're using on asahi-mini?
I'm on it and I'd like to fix it.

Thanks a lot
Best regards

[1]: 
http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2/

---
Giulio Benetti
Benetti Engineering sas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
