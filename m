Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582D0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 03:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58EE6106B;
	Tue, 17 May 2022 03:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsiCfoPFKNii; Tue, 17 May 2022 03:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF4F160F99;
	Tue, 17 May 2022 03:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADB171BF322
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B37D418D1
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wi8_Qh8AySJx for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 03:45:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25CBC418D0
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:45:14 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 418BE4402AF;
 Tue, 17 May 2022 06:44:05 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652759045;
 bh=1XFPF0InR97FdSZHw+kNLbhAGVwb6MsMJ1pHzWyVVIE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=PPwhTsGvO1ZhpZTwVErj03asNAhk8grFFhd4mC5QY1BgQIFYooD8ieGGLuhsYvSBE
 0Fp9JE/9JJxBWxWRwD9fE/ei0SMgZcb5htytByQp66BETMNhbfF0w2yBh+9cCpl/pn
 erwp1xqnhGvBkENMB9BZdJ8RqETd89QvO3+pqALL/y38Iq9zMqd+8NB/5Io1g6naMJ
 TvLZz/kh7GxBDBqbqX8d+Ta2WfM1rNEog++N+TDhvjg0Kk2qizmCNOYjSZNi3AyZiV
 V1td/BY9RdarBsblXbLWH8B6dzbJwYBx/xT8pNh5k2JB4Z1j+5CN2B6YC9z3i0YZuL
 f+nceUqcipv6Q==
References: <ME3P282MB134724A4FBF409DD7B541EF4FECE9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
User-agent: mu4e 1.6.10; emacs 27.1
To: Alberto Fahrenkrog <AFahrenkrog@hopperindustrial.com.au>
Date: Tue, 17 May 2022 06:32:28 +0300
In-reply-to: <ME3P282MB134724A4FBF409DD7B541EF4FECE9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
Message-ID: <87sfp8zut6.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [Question] - Buildroor 2021.02 - Can't find
 python-numpy in menuconfig (python 2.7)
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

Hi Alberto,

On Tue, May 17 2022, Alberto Fahrenkrog via buildroot wrote:
> I'm trying to build the numpy package for python2.7. Unfortunately I
> have to use python 2.7 before I'm able to upgrade.

Note that Python 2.7 has been removed from the latest 2022.02 release.
Which version are you using?

> When I search "/" python-numpy in menuconfig, it tells me it's in
> "Target Packages -> Interpreter languages and scripting -> External
> Python Modules". But I can't find it on the list.

There might be an unsatisfied dependency. The search results should show
you the list of BR2_PACKAGE_PYTHON_NUMPY dependencies, and whether they
are enabled. Specifically python-numpy needs glibc or musl C libraries.
In that case you should see this comment in the menu:

    *** python-numpy needs glibc or musl ***

Another options is that numphy does not support your target
platform. See the list of platforms under
BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS in
package/python-numpy/Config.in. In that case the menu comment does not
show.

> I tried adding it on my _defconfig as 
> BR2_PACKAGE_PYTHON_NUMPY=y
> BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS=y
> But that doesn't make a difference either. 

Kconfig removes symbols with unsatisfied dependencies.

> I haven't spotted any typos.
>
> What's the correct way to add numpy to python 2.7? Any help is appreciated.

Hope this helps,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
