Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF7FC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54DFD42BCE;
	Tue,  9 May 2023 21:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DFD42BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YYXcXZCQe5o; Tue,  9 May 2023 21:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71DF642BC5;
	Tue,  9 May 2023 21:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71DF642BC5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E959B1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C372A83D1D
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C372A83D1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2vOm-luxzFc for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 21:00:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8622D83D1B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8622D83D1B
 for <buildroot@buildroot.org>; Tue,  9 May 2023 21:00:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3a04:4e20:1cde:35ad])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1E52120047F;
 Tue,  9 May 2023 23:00:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 23:00:17 +0200
Date: Tue, 9 May 2023 23:00:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230509210017.GD252090@scaer>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683666025;
 bh=+8xjc70griZFfPnCjm+5Tpwpm9VS389DXf5NPir28z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HflZ42gHE+rVGSnpZg0NUdFQOWFLSTxwISqx8qHc8H9bucQJFlVO0UM5LPuhXKHu9
 YbM6bjv1szrqFhQ3347sofiD1jjN72T2l1nQiP6G7Zd8c0ShxqManmKzDSDlYyxgFA
 vEyaCLJ8HJxKPXSHsEeRxKQJHzGNmV6xGHj3m1KUXvNg53EGT8HaPLn7ewrKiN1PfB
 K5MxAARs7WyGiNiUJgAbg0a86AYVRUZowfZHqwpUqpn1iWUXFy4WVm3vB/tZy/CmBo
 INtZOcK8qNJ70Yt+SCNcYRWNc2VkTg5z8T7lpdM4qR2HY2B9FXIZpSY2OfoxVnBc8J
 gpLg2J40gxxzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HflZ42gH
Subject: Re: [Buildroot] [PATCH v2 00/13] Selinux: bump to 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-04-25 10:14 -0700, Adam Duskett spake thusly:
> It's been quite some time since anyone updated the SELinux packages (mainly me!)
[--SNIP--]
> Adam Duskett (13):
>   package/libglib2/0003-disable-building-docs.patch: new patch
>   package/python-pip: add host variant
>   package/libsepol: bump to version 3.5
>   package/libsemanage: bump to version 3.5
>   package/libselinux: bump to version 3.5
>   package/policycoreutils: bump to version 3.5
>   package/checkpolicy: bump to version 3.5
>   package/restorecond: bump to version 3.5
>   package/semodule-utils: bump to version 3.5
>   package/audit: bump to version 3.1
>   package/selinux-python: bump to version 3.5
>   package/setools: bump to version 4.4.2
>   package/refpolicy: bump to version 2.20221101

Entire series applied to master, thanls!

I had to do some fixups on some patches, I'll reply to them individually.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
