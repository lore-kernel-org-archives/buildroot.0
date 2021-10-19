Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0716EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9061560FC2
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9061560FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263F1836F0;
	Tue, 19 Oct 2021 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0KiDsy0rneh; Tue, 19 Oct 2021 21:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F56836C3;
	Tue, 19 Oct 2021 21:03:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D28E1BF328
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 850774061D
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ol-4FgmLLQbi for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 21:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C220405E9
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634677374;
 bh=BAm2+EAWBQtDFE0R7BrYTWsu+RiHhqisT8tXzmZM6Qo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GJft7NOiezMJrlZd2PnwJ7KLtPYlWMP4hCMXiiCkUesfzErW+cCEsCIn1+srCavcz
 fBD6bXEuWtt6C0B/b7o5bs10krTY+pVSQ97aSxox9njxnzdX6sjisv9atQToh0gflX
 HrLMq4qcjMfsBZ3IbMZkQY7CzR/V17D6GTIbdAP4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MO9zH-1mNKFA3wy1-00OUNf; Tue, 19
 Oct 2021 23:02:54 +0200
Date: Tue, 19 Oct 2021 23:02:52 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
Message-ID: <20211019230252.324bbb61@gmx.net>
In-Reply-To: <AM0P194MB0706FB2963323BD5D657815EB7BD9@AM0P194MB0706.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
 <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211019002255.165e5e00@gmx.net>
 <AM0P194MB0706FB2963323BD5D657815EB7BD9@AM0P194MB0706.EURP194.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:aV5UCVtCKCLJgK68bk98GBBSTvWXllaDQlR0DHJkSeyWTXNuxK/
 zwOe5z/r1hXIVekvtn1G+MZmc4KQ73//wiMenhL0zYqLujyPSG3bl2JUCTydEg9OzbONHNr
 KH0bgib+hiXLaJHQU/JJXNPnruK+mpnfuCbNzbqlyuniTA/LO7oBjzI9B8eFKJVfjcouQBB
 hYUisdAkLUdIXQtBCFQiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mJh+SAlmw8w=:/4Aok9aw5YJbQjJwDHu3//
 AGEoJlySkgc4d+FdvSc/ap1VkZGfDyQLutOuCXrCAV7LfFvAHnzoWN/J587vlWNsQNspKCZHn
 0fsNMR2tVG05N8AynlMTTFtdK/jAWFHXnZ6u6M1H9rw2X1z5lO1y0Yr+MzfzmH6cgO72T0ySR
 xgRZxWAFjHx//6/na/x//pu1qRIlD+fpZ7g1FXK7ndsGBxQ895KmwrdzhOSSX/g5KNxJWwGe/
 x1BbtCwl7/mz0y9fgfM9kYHcYyAhZwSjSq2aZThng2uGbdQik0Kq/xJuNfZzqeti4qTtXH5Ch
 gb+bbfRYP+e4afvR5Is3MiadhqCTq5Mg6BAI5oM7F7yAdBxxVc/Yg2KkNw2beuEnbnT1evtxB
 UmJiswYVcgHXJntWxACzTqLvL6XgWd46/jOEbDQ1OpfqvDFz97NSR1Jmy5lBfWNlD67S2BZUd
 wHSwbpvXcgJFxVyIAV0bxwO14ognR+jDBro9nmnC+IR0PvEQlqDJYBOiAX/JVv8tDD6o9+F3K
 LraQ6n/0YhiYk7Pk1ZVjVtovpRQVV3pR2xnQXDI9w5esZ81bNKWF5KT7h9EJ4PswNhgflAUJj
 oRoGI2Ij7v+3tPVhdn+qH5Sbo+GZuyitWn0tk6rcOGzgH+OA1NT+SPA3JJCgqeIq5F8nZbcKf
 rkQ9gvrkS56zsuG1oHoKfsOR1OnGY1CZEf+FsEmxIDUBx5OxJHK9RFYO7Jw3dWZcgeJ24t8eG
 GUtl+ReDFtbDed2ZbueJpQy4Qqig0Ppjdzr6a02e9F5vIR0vpYT6F1Y/eUi73649N82vNqMOn
 dRrbUq7FEuq34p0eCl3CsVm0DLnDJiCnySEljRr1BLdFcRnd75VEhVSvYgTqe9JuX4/RB2AuS
 mTzuyiEHra0MDmmmP7TokxG+Y6VUl7sIZQ2nEeiV73NKe+Vjcybki4DOY7/w60x/vLTteVDkT
 L7mpJwkbB2cSHib3A2HH1gOlDYQy3OyI9TJV87lLLBuw2IBi+b7Ue15eoNOLtNn0gVinMRYvN
 C1TL9MCNiue6lHS4SIBMCEl5HemafhceXni2MgyhUj9UgEq8QUHObT4hkxgCjvV+PmR7aPrV9
 lDDZRQ/Wg//W4k=
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Tue, 19 Oct 2021 15:17:23 +0000, "Walter, Stefan" <stefan.walter@iml.fraunhofer.de> wrote:

> Hi Peter,
>
> > Can you try instead of your original
> >
> > /path/to/buildroot-sdk/host/bin/grub-mkimage \
> > 	--config=grub_early.cfg \
> > 	--directory=/path/to/buildroot-sdk/host/lib/grub/i386-pc \
> > 	-o ./genimage_input_tmp/grub_core.img \
> > 	--format=i386-pc \
> > 	--prefix==/boot/grub \
> > 	biosdisk part_msdos ext2 normal linux configfile
> >
> > the following one (makes the difference here for me with the qemu test):
> >
> > /path/to/buildroot-sdk/host/bin/grub-mkimage \
> > 	--config=grub_early.cfg \
> > 	--directory=/path/to/buildroot-sdk/build/grub2-2.04/build-i386-
> > pc/grub-core \
> > 	-o ./genimage_input_tmp/grub_core.img \
> > 	--format=i386-pc \
> > 	--prefix==/boot/grub \
> > 	biosdisk part_msdos ext2 normal linux configfile
> >
> > Note the --directory change from the '.../host/lib/grub/i386-pc' (installed)
> > directory to '.../build/grub2-2.04/build-i386-pc/grub-core' build directory (as
> > the original buildroot
> > grub2 install step uses to create images/grub.img...
>
> there is no directory build/grub2-2.04/build-i386-pc, but there is a build/grub2.204/grub-core, which I assume you meant.

Yes, your are right...

>  I tried with that directory, and indeed, the resulting image boots.

Thanks for testing (and for providing your command lines from your build)...

The host-grub2 modules build can be fixed by the following patch:

--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -125,7 +125,9 @@ GRUB2_TUPLES-$(BR2_TARGET_GRUB2_ARM64_EFI) += arm64-efi
 # use the cross compile variant to ensure grub2 builds

 HOST_GRUB2_CONF_ENV = \
-       CPP="$(HOSTCC) -E"
+       CPP="$(HOSTCC) -E" \
+       CFLAGS="$(HOST_CFLAGS) -Os" \
+       CPPFLAGS="$(HOST_CPPFLAGS) -Os"

 GRUB2_CONF_ENV = \
        CPP="$(TARGET_CC) -E" \

Regards,
Peter

>
> Thank you for your help so far! I'll reference this in the issue at https://bugs.busybox.net/show_bug.cgi?id=14281.
>
> Best regards,
> Stefan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
