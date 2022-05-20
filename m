Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4D3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 05:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE4B760ED2;
	Fri, 20 May 2022 05:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPNho3nTPd54; Fri, 20 May 2022 05:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C3A60E8F;
	Fri, 20 May 2022 05:29:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 251D11BF860
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 05:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1027660E8F
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 05:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFS2yJa7AmIe for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 05:29:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB1AD60A87
 for <buildroot@buildroot.org>; Fri, 20 May 2022 05:29:15 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 013184403AA;
 Fri, 20 May 2022 08:28:03 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653024484;
 bh=yxbrJPfP0OHgWj4b8VW2XpqSilf7XUlxl/WP6MyCfpw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=lu/zd0+IHjutHr+Wj8TAhMIcbyxV3JsnY5aG8r7zAK1RYso0WdRmdpZIRbiMmUfs7
 KZ3QDMFZOYGPPnX1x8PXy6Mfc5jSS1liweELGvZh1bGisOygFL6a5o9gyugeV06An8
 eepkjisi1N1iEiWtHBE7ijOrqVJdi666U/qvFBSKn66HSE6RRvLHv9uraM/3I/ti62
 sJQJ1lvXOQLt1UNtdpmMIdXvcen9YhThly6VYb0tYnZoTZ9g4iyl1bNGcWMVcZTmE8
 1jMds8R88Sxh3x3MGAPcB+LUqas3nZydBTJuQIRH0b84HnN7+EFVvhxkTrdm50lX7N
 B0nFMtuHgRaVA==
References: <CAJiigQmUmhkv+AMuz2eF1kbi=_-VGEAmWTN40aUbvbTqA9+5dQ@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Ugroon} Hackerone <h1ugroon@gmail.com>
Date: Fri, 20 May 2022 08:24:55 +0300
In-reply-to: <CAJiigQmUmhkv+AMuz2eF1kbi=_-VGEAmWTN40aUbvbTqA9+5dQ@mail.gmail.com>
Message-ID: <87czg8n55k.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] How to run an executable file
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ugroon,

On Fri, May 20 2022, Ugroon} Hackerone wrote:
> I have an executable file and when I try to run it with "chmod +x
> file" and "./file" I'm getting command not found: ./file error. So I
> just want to learn how to execute this file?
>
> Note: The output of "file file" is Elf x64

The most common reason for "not found" error on running an executable is
that one or more of needed shared library is missing. The command

  readelf -d file

will list the needed libraries, as well as more information on the
dynamic section of the ELF executable. Make sure you have all listed
shared libraries.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
