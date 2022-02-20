Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F35C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 16:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D4E8149D;
	Sun, 20 Feb 2022 16:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KX_cmRDGJSrM; Sun, 20 Feb 2022 16:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 166AD81448;
	Sun, 20 Feb 2022 16:26:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50A681BF41F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 16:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F83860BB0
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 16:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c08axruzklQn for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 16:26:29 +0000 (UTC)
X-Greylist: delayed 00:07:26 by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16CB9606BF
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 16:26:28 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:1dcf:41b1:f6ba:29c7] (unknown
 [IPv6:2a01:e0a:947:6e20:1dcf:41b1:f6ba:29c7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id BC0E7BFA3D
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 17:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1645373940;
 bh=jlcrbWTXqq7D0JpbPtA1v9JSxbbh6nRDxytoYKyWGHY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=oag+3lXH5nlzTo79ugnD71OVBuTGS4EG0enuskAlbM4MEEkZeEOZAUfXZHe9qHeRB
 iRjOINy4nFe0IEP+vBTcj3/VeY9ui+FNzZlvtL7TElP/SRSeyFhDZp8ewWMB7oFiVy
 MTuCx/p0vpiseZgVxH+1/34RNIj9MSK7jadItfNGBJnBBMN3xwQYrNakkMO1uXy8FO
 /jEHu3V5sKu9C7EQx6W95whOHAnnDzakU7V9B/DrNbv/w1JxRI8JTHEXcOKhVSRqzb
 yTrQCqgj6grmTgIRfqxdtfaCVtBzNnqs36Nnukw6D68BtQ70v8+B1a7aCvlqXYkztj
 bP57J2uUE/cXw==
Message-ID: <469c0dbc-6101-be6c-7272-400ac4512b86@grenoble.cnrs.fr>
Date: Sun, 20 Feb 2022 17:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
 <186B6238-5452-4211-BD9D-29A3C921DE42@benettiengineering.com>
 <CAHnHX5grmd94PGaBJn=XkJttwCEFdc=tWaE6v7PpZCN5UL8tSg@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAHnHX5grmd94PGaBJn=XkJttwCEFdc=tWaE6v7PpZCN5UL8tSg@mail.gmail.com>
Subject: Re: [Buildroot] Issue with login
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

In his config file, Mohd wrote:
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
> BR2_LINUX_KERNEL_VERSION="4.4.155"

This may cause problems. C.f. docs/manual/configure.txt:

    If you use kernel headers that are more recent than the Linux
    kernel you run on your embedded system, then the C library might
    be using interfaces that are not provided by your Linux kernel.

In the same config file, there is:
> # BR2_PACKAGE_BUSYBOX is not set

When disabling busybox, you should have seen the message:

    You may need to enable other packages to get a working system
    You better know what you're doing!

And then:
> # BR2_PACKAGE_SYSTEMD_LOGIND is not set
> # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set

Looks like there is no `login' program to let you in. You are probably
only seeing the "login" prompt from getty, but then getty cannot spawn
login.

Regards,

Edgar Bonet.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
