Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F892C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CE5605E9;
	Sun,  1 Sep 2024 09:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioOMRDYtQUXl; Sun,  1 Sep 2024 09:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84A56069D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84A56069D;
	Sun,  1 Sep 2024 09:16:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A16D31BF4E2
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E68B40176
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-YTHEGlDoGS for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FBC840021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FBC840021
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FBC840021
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:16:45 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 42CEA440F44;
 Sun,  1 Sep 2024 12:14:43 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87seuju4n7.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 01 Sep 2024 11:03:56 +0200")
References: <20240728163645.D8E488283C@busybox.osuosl.org>
 <87seuju4n7.fsf@dell.be.48ers.dk>
Date: Sun, 01 Sep 2024 12:16:41 +0300
Message-ID: <87a5grivie.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1725182083;
 bh=eJLbRS/9j8lsxjOhV/mr8kw69JsqeETWA4TuANrV7NY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JRZ7tKitAA46Jh2j2naF9JgpWoUUumnUrNgip0UeoowvLKcdBurkmtKeyYBcZ5BwX
 HtnHGSg18fZ22J3Vlq+kcog8iEkf+YRtaYKiuXP+PKLTDl8br7ROb1WkfC+34GUL9L
 4W1bWptsjkPf3SyMZ9Akzl+n1hPrcrPmjSjnrlGoH4lVPmgnYIW/6ViQQKlmaJlWIH
 R8c8LGZ7PSJBsc+ArHaIy1HoSb8OLKaC7IGvhTgxSM6dY2+kG33NCYY/qDUhy3Muub
 aQZSkRmFZwCoIsy5QmgkzwV9YkskEiMqgnaupqdmzg/A5SkUnmVEQp25dWDDM7N72y
 qK8ZfSbCnhVaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=JRZ7tKit
Subject: Re: [Buildroot] [git commit] package/gdb: move GDB 14.x patches to
 the right folder
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sun, Sep 01 2024, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:
>
>  > commit: https://git.buildroot.net/buildroot/commit/?id=076f345accb811add37c96705ea1602a8a3b06a1
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>  > Commit bfefed17a9e5a421b3217685003d3b22c99de4ab ("package/gdb: bump
>  > 14.x series from 14.1 to 14.2"), which upgraded the GDB 14.x series
>  > from 14.1 to 14.2 forgot to rename the directory containing the
>  > patches, causing them to no longer be applied.
>
>  > The patches still apply properly with no change, so renaming the
>  > directory is sufficient.
>
>  >   http://autobuild.buildroot.net/results/b8c6af95b244272220c63847e7cc929c9c58eee4/
>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Committed to 2024.02.x and 2024.05.x, thanks.

Not in 2024.05.x as of commit 88f005a95cc ("DEVELOPERS: add Bernd Kuhls
for openvpn").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
