Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A068C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 21:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AFE161063;
	Thu, 16 Dec 2021 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzsivXGx6nOc; Thu, 16 Dec 2021 21:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E55D6105D;
	Thu, 16 Dec 2021 21:45:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04A8C1BF392
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 21:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F256740210
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 21:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFm6EtOH7rAe for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 21:45:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA781400C8
 for <buildroot@uclibc.org>; Thu, 16 Dec 2021 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639691112;
 bh=qqKvALVz2MgxK/jUvPd0V2q6v8UWa06XWN7cXKvF77M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SqWwCoMn5OCe9LmwZaQBks7zW3WKbkMP3lsRsYdBHGdnnPSC4rmRWk7Cyp7S1n/gw
 44ITFIXVppwYHx6zb2IKzTiOKdpBwpsxHLl+cbbFO0vb2ZGvwAth5hKMrbrEFTYcZB
 wD/VXPdpHou0/v+yZga4NFZSo17R/DohmqYPsNZQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.17]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTqg-1n2wcY1FTy-00WWvg; Thu, 16
 Dec 2021 22:45:12 +0100
Date: Thu, 16 Dec 2021 22:45:11 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211216224511.015c9fb9@gmx.net>
In-Reply-To: <1084ea3f-802f-d24b-f613-7bc74c7a1800@mind.be>
References: <bug-14451-163@https.bugs.busybox.net/>
 <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
 <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
 <aafcded5-c0f4-4745-a226-da57d0e7a805__41403.4441857197$1639675757$gmane$org@mind.be>
 <pan$6da85$57c98f32$8301c983$a5945ee7@ID-313208.user.individual.net>
 <1084ea3f-802f-d24b-f613-7bc74c7a1800@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:QVRSqFRud4vFEmOL/PRfzlL3H+5IXyFLpku5jUcmt+uBwWR1qUc
 DhSJu94/LFr+RDKwcd2U8jt7WG5+7zY6Il85/1ZKGq48l/lnQRS+Fy6BSAIm0egxmS5wI/F
 w/XHN7EnWlUzQXP2YZzLK946Ktef64+SqpTbpJBG3AK2KsxR41Yj3eNTfaGpmoBj7piMQZV
 D58sROjkYK3kzoh3bwYUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MXRiryRV4f8=:7bxs2DD1qnYTeAwAKzHpat
 X0cwBTj+Ne/Tay+VT/tUHaJFGm25R7mNVyIucesAhHEqkUHfwmB3f8GYBCQL/30nfiQNEbslb
 ep4pnGzSF25PME4qsUHF4Wgn0YHFuIRYLJy6XYmQYK/nPT8gnCqYpHvY/BCcl4+GSB/7JoQS6
 JqmoXjaHwWl/XdE67ZZ4VQKf9iUwAIb2I9Z+sIudsfdwNvH5Yet0qarRrX7vWcSL9KlBVGJ5a
 A8zb2IqEFMJED8F7y13m5pY2iN1iR1XeL4/PDlEcqDeQp8weonUOTAvPopU0h6nUoj3RfMWkH
 7hw7mGvT8bUUqfl+RFHl2z7E7kiZWR2BUZD909fow0nUconZU5NADimI3GJVKBqgIifCcGZFs
 vr/rV/2bXL3Uc/nVlJbcyzOqlFAf7XyxfTGiXehwsN1sLECKhOPI0aJYhBlzbNS4HIw1CVk7R
 MGqcE82+ip4NFEJz4Ea/FsDtImtCZnRT2webLfUaoWf9ZlfsyvXKRVgF5/bvKoieZ7SQ1eD65
 89Uhdrgd/2yN0Z40A5zOvWTkHY0ZdhuCZJPV+Iur0E+LotsRWIM/W60sGcuNHEn7N92/GeCQ6
 7kEiDAS8n3DOeITrx5GJikIaYtFc0XwoRGaH4MNfLJCsfZouamxPoVUPGG/TJx2D0DKa9L4C/
 AZ1gdFD18cHVe54DR++kR7O4oO6OSZqUhHaGPZDYb/zdxiU59FNV1cCzihwM/c1E5/jQ3w89F
 1CJJUsRNl9xPcxF4GY35cuj7YDgwvwUf9RTqX37CI6UJJeQ3RwKxUVbDiN7VpIlJDN9XoJVcB
 U+rj8ixmuXsjsvOC07c+DVQAMOr8h+iNtDpyQ2TDgvKgyJr/ZRhmDsplsZa0rf/wnoBIH35o7
 zXjL+YbDvqj5GsvvKhite3JM1lGyv/Gl4fuBtDtl64Qtjq3KdaQfhu/sXEZSylOqyAGf/cD5X
 9aqsv7Eg8eVee2LG2aILtJ50p2y8iRi/L0fpUyuj5A3r3eTkofvKzNGOsoQJCWQvSI2zRhxza
 PBa454WNcx/9nm7Y8QAxhjexTimmDiKB0A15g3VieTEU6tIxI52LhjXiStPGPxEghxXtrnESf
 5MZKRgLe4se7QM=
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: don't disable DRI3 for
 some Gallium drivers
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org,
 Michael Taubert <info@arachnodroid.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout, *,

On Thu, 16 Dec 2021 19:33:20 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 16/12/2021 19:12, Bernd Kuhls wrote:
> > Am Thu, 16 Dec 2021 18:28:56 +0100 schrieb Arnout Vandecappelle:
> >
> >>    Bernd, can you comment?
> >
> > Hi Arnout,
> >
> > no, because I do not use buildroot on rbpi hardware.
> >
> > But the topic was already discussed this summer, with no solution afaics:
> > https://patchwork.ozlabs.org/project/buildroot/list/?
> > series=248555&submitter=&state=*&q=&archive=&delegate=
>
>   Good find, thanks!
>
>   Michael, can you try that patch [1] and see if it works for you?
>
>   Peter, I think I'm just going to apply []] except that I'll make
> BR2_PACKAGE_MESA3D_DRI3 a blind option (i.e. not user visible, only selected
> automatically by the drivers, much like BR2_PACKAGE_MESA3D_DRI).
>
>   My other major comment about that patch was that I suspected that it would
> need some 'select' statements, but I guess the autobuilders will inform us of
> that, so we can go ahead and merge it.
>
>   Does that sound OK to you?

Fine with me ;-)

Regards,
Peter

>
>   Regards,
>   Arnout
>
>
> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/20210612223011.26118-1-ps.report@gmx.net/
>
>
> >
> > Regards, Bernd
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
