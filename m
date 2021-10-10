Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F9FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 22:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5376860EE4
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 22:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5376860EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B20403A5;
	Sun, 10 Oct 2021 22:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEruN_eEkLoP; Sun, 10 Oct 2021 22:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58CF7403A2;
	Sun, 10 Oct 2021 22:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCE281BF311
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 22:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB1604023C
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 22:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOa29KcYg4_d for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 22:52:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3553440227
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 22:52:27 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Zhg9minO9VTMxZhgAmiM34; Mon, 11 Oct 2021 00:52:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633906346; bh=eMZtjGVynMWAglx0cMfkrNqoR6T4b1nxSUYPbtNhngs=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=KYy6qQ9iZBMY8Q9d8UrA9RfNfMyZyoz3a2Q2KIWe6R6XgAh4VTK6X4eN9tt7LtHnv
 xZwG19xiyYvQz/aJhG2GONkn5sFKSiTt6JPrOAaI/8EYCTFKRvmUYi8q2U/n9e6P8N
 EpxHhVYIbondfE0VHMb9aQKFecILlIKPV2IJiH8R4A8rrLO33FQ9mm+NtRnyH9ES9t
 diY6sml1EQ+pk8LootQcPv81eT3fQvkIMZ5tXU6zJIAkEOFGHJu+n0sA2rrx5b1NkO
 EwnjlfrHTI6m+ZQQvT5iYEDFXjE+37U4UFk1oMOBr8Aw7HFYExIl3bYZcYcA7SJzJ1
 cJ83CMsnfwRrw==
To: Peter Korsgaard <peter@korsgaard.com>
References: <20211008224605.884413-1-giulio.benetti@benettiengineering.com>
 <20211008224605.884413-2-giulio.benetti@benettiengineering.com>
 <87bl3xs2z8.fsf@dell.be.48ers.dk>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <bd7a900a-12d1-9c61-fcf9-760b646faabe@benettiengineering.com>
Date: Mon, 11 Oct 2021 00:52:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87bl3xs2z8.fsf@dell.be.48ers.dk>
Content-Language: en-US
X-CMAE-Envelope: MS4xfKv6eeLKeu9z3f8HejNmOmIoGAU5x+OoO6+kLqgfT9+GjaMJdFrEt2n97D7WBrTUJkuFf/tvEWTee1arXrd+Dcty7N31b9+Tuc6+wbqN8/GZKrornzco
 gWhWnOt6FZSddUmW0F9iDtIIbu+hczYu4Xu31pMqZg1gUQ2laHCkzLJTejH3iZRS0h7xshDkh2fTqaQE9cfu/3eY3gtEppRUioMXi6fo0IeqeFZ/2Tmdbw+X
 Bl2clFMpPrKFC4872H74VKmYiozYokMqd5fmGOhgDvozFOezNEo4xXAQfnoeBT4NWQv5q/V9FYbaUQyejQST+VVNwbCiTS2HHu9YhpzZg3fKk78fx5Lod/bL
 PLFVpWE7vzzLdd9XwZdcAORXwTp148r3BZ+U5dzHZqFfbukhzYLV+qrdBS7Px7LJdgAfcAQalzCMfK/EHO0VoubaEWsw9g==
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: disable package if
 affected from gcc bug 43744
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, Thomas, All,

On 10/10/21 10:23 AM, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > This package is affected by gcc bug 43744 and I have not found a work
>   > around for it(i.e. the common -O0 we use or other), so let's disable it if
>   > gcc has such bug.
> 
>   > Fixes:
>   > http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> What about the reverse dependencies, E.G. gqrx?
> 
> package/gqrx/Config.in: select BR2_PACKAGE_GNURADIO

Here is the patch fixing reverse dependency for gnuradio:
https://patchwork.ozlabs.org/project/buildroot/patch/20211010224220.1111960-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
