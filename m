Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887E3C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 07:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0793641764;
	Fri,  4 Feb 2022 07:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_xfAUUzWIhX; Fri,  4 Feb 2022 07:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C532408FA;
	Fri,  4 Feb 2022 07:51:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70EE31BF2C1
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 07:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FDAD60B30
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 07:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6zVAWnFKfmU for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 07:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E76C060B25
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643961062;
 bh=we/n2Qi4VYJgoPw3NQROpgJ3Nsh7sfkqkzJe5yW1Jpc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=A4hSAzV6YNumEbtlk7qa8hLA68KZrziRSXvWNDdq/3RZqkjKT2/+BZeNYV5AVsd9U
 qlkJeQM0BM7nPEWZlENjAYckinVvzGI7YcQqvLO/8HoFGqT6AoZ8xobgHn3e4cy8iC
 +t0+UynKCCrJUDRixOaPiGVrea+FDVXfTmcMfsw4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1mvkBm43gt-00Lm5c; Fri, 04
 Feb 2022 08:51:02 +0100
Date: Fri, 4 Feb 2022 08:51:00 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220204085100.77deaeb8@gmx.net>
In-Reply-To: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
References: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GgszyejqFHZGSWtvLCTEGKmcX1Z5G3EGRtRf/XLJcJf0coChzva
 4wFHfkpIjN3Jm9pgMncBTIHmbb9LjKwOsvPwYixinBRiy3cK5behRy0jLJiqC9wx9ST7wUR
 DU9lHEn48zMxrt15zs/rjFgaMM0ZyCs/WtOd4ax8E4r3+fZQW9yo1S61au6hPXYbUf9Gtun
 g9kJNoqF8Ctu9le9skS8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h9xeSPwpLEM=:9Q078+y262HhJ4AuN8J7b6
 VQYcYMm1fmfO9i3ytUPcGc5jCIJOb06i2xf5v1C5fLLKrmo9+wEnxtugNEehtRfuVKU56Skhk
 BwRjGUc4njiPiy33K7EWrz+pXEOZKTkBvD58Fl/Z7Y0v5oAgtaOR2srUiA4k3CQeSAu3criqP
 9QpyoDOCLusH1K8NLypaan4zWBmyG1q/9w96Zxu8xpPEGgIn6yaBJ4QoXu/jFCMViAUm7KhTG
 t3jtQJUztSI4w2HLpE/EQdWp9nWfU0mVk0Gc9j1omUXkrBJRwzCTotUxVNi+0IC8T3FRPmiIf
 wrD3Z+IK1q5mpWWkR2VX94gmPtABXfSC82JHVqD78AKSvVJwMVDIUWgeYrsQ5Ql0gIS3AIRgO
 F8sjtPwDYwEE447kqCEYcA83ysY7OLRr9bE/QUZW0HEuTR7H88AmQ+qidmq9Zv524L6YCcGtz
 xPoihmjS85xh5JL7ExYBheNdZJN/sMISS5Km4VDlJPdoQVJFBXWkr7MZSYuGu6zITI1w30VAn
 rDN+Xq8QD1JVAsYwsfdlRBy5kx0I3Tya63QvRc2goyOn0CHDNuy2ry8paoFab8UCZOqLIaz8M
 sGTo1YiYvD7XA76W/0QqtcKrosqodm/l6+mClQdz/ogHgW9ZyAIcN0RZftDLYis+qcusc16TG
 EbIfMOW3vqbuT/C3TEo8QU/HLNlzkS52yRVNDxvej3lJGrZS7TN/sv58qW7XeBOGfJCk/jjHI
 +qRnRTVakRM74vRl6jXZOgyGsB+3X0xHFJfIzcx3eozUwU4yzaIMzeJZziKL22VH6YaTqEmDj
 S1maJe9FQj0R2KkSPYKYmPveVg2a/FaVv/v/Kh3Ka6qLLSEQSHwNKaP7qKNNrpiwjGsVf2Pcz
 vHqMbYkJnbabuj3tUXwxa9CDLhtfkLy8tBYkvCDlE5gqAMMFp+eLc4YOphq4Y8dfisG5LJQqT
 MkEdH2ssBsR2jgqvsqA3BTNtju33v1+tEE3AksOTrF5fflpunqQZS2xmmiLJBER7qfJIkwsWv
 tfD0AZEYU+KGELW/GmS+7V5Fi+c9TbZ2sQ6xGwZEZEB5aDvEPJ+W/mcRo3G/Ym1okcNf87Qfp
 8ZkY5bz3IbYaMc=
Subject: Re: [Buildroot] qt5webengine build failure on gitlab-CI
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Fri, 4 Feb 2022 02:03:48 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Hi Peter and James,
>
> I can fix this build failure[1] due to qt5webengine, you're the experts
> here, can you take a look please?
>
> You have to build using official docker as I've described in this patch
> for the manual:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/
>
> I've tried this patch:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220117114358.3814200-1-james.hilliard1@gmail.com/
> but it didn't help :-/

See [2], [3] and [4]....

Regards,
Peter

[2] http://lists.busybox.net/pipermail/buildroot/2020-December/601542.html
[3] http://lists.busybox.net/pipermail/buildroot/2021-January/301496.html
[4] http://lists.busybox.net/pipermail/buildroot/2022-January/633204.html

>
> Thanks in advance!
>
> [1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717230
>
> Best regards

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
