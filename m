Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7228AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 18:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 191E3415E1;
	Thu, 17 Mar 2022 18:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hg4-EuNSNjif; Thu, 17 Mar 2022 18:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C1FF415A3;
	Thu, 17 Mar 2022 18:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BADF51BF349
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6471415A3
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnjYgf12a7lB for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 18:15:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2764141504
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647540911;
 bh=h7dUYmImQUfMSTPYzy/B2gq4SogfSlmGnh0elqa9ZrQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=elHpQ4DcXu1C5LhGy1fQ5VZrMAOs5GcXX9kXtR0MuWXFLIL9HZX+MS/6mAJezgSQl
 JeOPiT4AeqRacPwlouvne3GAxQdzsXPad+DTVNqbZsqgN8pLNhZodowWohguO8gCld
 nuWv3Wq2jCUAqQFo9tV1FU9Q2bhSB5crRPTK8tgc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.203]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1o6RGB1i3c-00bYD3; Thu, 17
 Mar 2022 19:15:11 +0100
Date: Thu, 17 Mar 2022 19:15:10 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220317191510.1b3b85d5@gmx.net>
In-Reply-To: <87cziltvrq.fsf@dell.be.48ers.dk>
References: <20220315205405.9291-1-ps.report@gmx.net>
 <20220316213626.GZ283544@scaer> <87cziltvrq.fsf@dell.be.48ers.dk>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:k2Jf1LQJaEra/sNdnL7v0NT6UVDtDinuPInaOF9wYi7Gv597tby
 XtOPZzZGtxu5MjyLx3SzX1qf0hgxIE2ExAk+0t58wktqCNYd6b0VwO4ZxLtFyn1z8hrGtNo
 Bh+IaCBJnZAO6rUel8BNzRVtO0ptIrLbP3QuLOwj/1iIBKfMcfFUooBqFzanMkzNdbJNUiQ
 igmjTUhAeP9Vg6oMO/9RA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q2GuR3HdgZ4=:jRoXM+c2MLv1Y2IjGly+kc
 e54lYg7XWJCnptTRGfeTDOzuJROwdgjijSkTXPNUGqtERMXLZeiR4+hrot1K9ksEeewMVrnLx
 Gu4kh+5Z9Ow/W6d+4b7xnt7dn7rTecr52vbUZ/S7m33kFtYcgEbILh24/tufZgiptx0jJ1hNs
 1f+NAHPkaBBVinuOvlW1mnVotq+BOkbINHPCO9UqRDR11qL5ctxZOWaqKVj09XrPmKan4ldaM
 8JxsbQO47eN+zXNq7eIf13uOE+oJwjtuJKcmN+gCj+7gmkOOgiR0MlQnWANM4fzs+0g8pVmjW
 F0G5K0vT2sW1v0Zl+4MAQJVMU+V/WbMTSd7jGnChwIOcH5iYKgG3ysDdmkXbGsYyS3Lq/8S1A
 62ZVDDkLiPCDuWvXWqao1f4KfYlJL/4PheUZfCapkSaoa2DZIqDNwIdJ2LcWYEIF7qs4OG/ES
 Oa0c5G1duj/84LbCuPE10oYLo5q78AxAKXSAk+QO35HxjlkVdEjIsJIlmd/0ePMQISwbcCqWQ
 LzNqfPKMpG4BmHGIeXbIrWBmRqJ87fO6sSqtToYOEfV6Cq2C+eI//jJ1ciGmqaY7qIyQYYIju
 YFeUm7josFFiHlELnXe+SaN60T2UkmF3YRzVXmlnEU7lWFmQUA0wneeJLJFZxs10joOxqonnW
 e8SFrZ3yKvZxhZoKKwN7Dz97S7WuU9dIE5P/Ojs/v1lIsnZgkT0vXxBXAASS7vuf5Zf8P4L6/
 BrOFK9vvUWwgKf2mNhyRe7mQz9/fP0C/lzKc6ZwPmiaeKtwc6jsJGQ6nYMCZP+N97nBf8rwrE
 M9U24QlHUSyJ+MTvCWuO7RwnA81TuYGM9O1THKtAo/oFKHfGu8ATCHmaaNo1Ea9eq3fzX7Ri+
 aabUO17xuWbFdxRrN3owU/PQBsVzWzhTYe/RW8zlj+A5YhJkkTnFBTYXalQaehgkWvGrDABk4
 uwuZdhbHwF4vlqMugg91NiVAyuv9iGLE26Uan8e1uADW7jeCGBwjwGiE6rbIKNYO4ySqLCXq+
 hu/Z1p0R57ZjbcIynFWXT8LkUraDOk8bFZ+E110nsyB/qznI+aVbsNuCw8Key9I7GNq4FIMoj
 e+pqHMur+G2sXc=
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: bump version to
 1.1.1n
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
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Wed, 16 Mar 2022 22:47:21 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Peter, All,
>  > +Peter K.: candidate to be backported, that's a security fix.
>
> Indeed. Why it is not marked as such ("security bump to version
> 1.1.1n")?
>

Sorry, missed it ;-), did only look at the last version bump ([1]):

	package/libopenssl: bump version to 1.1.1m

not marked as security bump, but according to [2] is one fixing
CVE-2021-4160...

The security advisory for 1.1.1n is found here [3], fixing CVE-2022-0778...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/package/libopenssl?id=2b906b975a956bd2b6352b2eec6c3c697317bbbe
[2] https://www.openssl.org/news/secadv/20220128.txt
[3] https://www.openssl.org/news/secadv/20220315.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
