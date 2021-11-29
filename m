Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482E5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA13C60B88;
	Mon, 29 Nov 2021 21:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6dAkCYfrbIv; Mon, 29 Nov 2021 21:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD3B60A86;
	Mon, 29 Nov 2021 21:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98C001BF38C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9574260A86
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZPO_vV-JyhX for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:16:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F97E605BF
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:16:45 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmUcL-1m9hkk3RHl-00iSUz; Mon, 29 Nov 2021 22:16:39 +0100
Message-ID: <cb21affd-1ab4-ddd5-1cbe-03861208eda4@green-communications.fr>
Date: Mon, 29 Nov 2021 22:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: fr
To: David Laight <David.Laight@ACULAB.COM>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <e3ba29bfce7a4de3aa95a105146eadbf@AcuMS.aculab.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <e3ba29bfce7a4de3aa95a105146eadbf@AcuMS.aculab.com>
X-Provags-ID: V03:K1:jZPf4iuZB/B7t4oRnKHUKZyrsFbgI9ierCq4NDSMxPx2pUcsy2+
 wNfRlw9crdsbQ+C8P69xZw+95XHWrjvba+og+pFGRCZRzUqt71lAUkrUKvRjmIcNnetvwgp
 7e25b5oJhhqxKnVbihTThJoKhSno2fqazeqBlvOcGy37XzjcB6ndWsx1wtgNh+Xp64U9XwO
 tjNALG3Yck6T4T3J7/YXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1HN/gq+FYRk=:2Lf/UnKbtjkAxDTs7PGGeO
 RgvwPn96V+N2DZh6hoEn6zXqR9Nh+8tOaPNCemDj5rfL9nhVfjMmSv4Nftfu2k5P8K1xhZ28P
 No+7YpAs6yU+G3SxzCDuQftIR6O+y8kXM1+OWU1oNwcaajzHVqBiGV7ImEMNmGFPO34H0L0S1
 l+v+dVyzvHde9nwggqWXMDQLlNfz8bD3z7qKlkh+MWNI6Ae80gZB/PXKR/An8SHQH9ZNuYEbT
 q1wz+CuRNnghWZFTlhcdgzSlIUIWTIkQrwnDQVNn+mV/pvmrqNXCBWreNQBOPyuEgTvgvsyqv
 tFj5eBkTlr9BfYijeMOxPupRXw0/9y8t7ZeKWURgNmwuKR+XQCTjwNOvk94KpgBJswXYExUHl
 BJBC9rUOMwUl7rGy9cRTWF3qvsc99QVTb8w2QBBxhgjogw+bFgbjs2Qw4OOWF+fQC8RSO+NS6
 nKzLnwzqe9uBEII49OZXTlA3OvKPdlRPj/HBosYP0eiC255WPxiGZGJSa/cDhFuxIsJpInB9l
 9p+0t2h0+I5oTDtKd0JKmtwOoJLDcSY2gtf+XFNicEW9/52QLrNnsM/TZSEond506l5oE1qfL
 pOI3NX74yk1Jb8iYCr3/iXZRVABQGOQLmWr9/vpw2ZO87NPjIzeRFCeeYaEheRJ9PAjZr9R/f
 4oxkZGo/R/w0PDOgnduoDl7RoLf4VbR95VawtVwKbWvvAS8YJ34FxNPJ2IeoMZ9aPR9HTw1kr
 50HlfDBbz5sSK4pgX+wMeXiQgzxK25jxzUpQbg==
Subject: Re: [Buildroot] DHCP default.script
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

On 29/11/2021 18:19, David Laight wrote:
> I was looking at the DHCP default.script (that ends up in /usr/share/udhcpd)
> and found some quite nasty problems.
> I've fixed them locally and ended up with the script below.
> (Which is probably easier to read than a diff.)
> I've ripped out ahavi - we don't need it (and i don't know what it does!).

It gives IPv4 link-local addresses (169.254.0.0/16) when DHCP fails.

> 2) On a 'renew' it would delete all routes, not just the one added
>     by dhcp.
>     The 'proto dhcp' parameter can be used to identify routes added by
>     dhcp so that they are the only ones deleted (this matches my desktop).

Busybox's iproute is very limited (e.g. it does not display the proto 
when listing routes) and 'dhcp' is not a builtin proto, so this needs a 
/etc/iproute2/rt_protos file to list 'dhcp'...

> nl="$(printf '\nx')"
> nl="${nl%x}"

or just

nl='
'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
