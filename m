Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7131FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 08:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B638C408CB;
	Fri, 31 Dec 2021 08:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jha4qa-msh5U; Fri, 31 Dec 2021 08:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 195544050F;
	Fri, 31 Dec 2021 08:18:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 576BA1BF297
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 08:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3805E8131D
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 08:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id md4IOT5snM7F for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 08:18:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 956E98130E
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640938682;
 bh=BTdMfDYZ3sNW3iA8Q0RW3hDYjrY7+RVngFvSML5/QNs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=CUVHz/lc+yshwF5SDqFtBLjhHAupubj4MeKnOH5XrqIKmAgDUNd+1bS9z+G+iVzyH
 TuzdxIxcCyjeM1qloJVHSPlqLXV9OI1YgNtf4vznFeW4Kx+Ra5XvfzwE+9W5TKhfdO
 Ug1qOaTL2RstCwN++IuoXcW7Nwgc1189aMf/1ci0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.96]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1mBnTf3WYU-00rc16; Fri, 31
 Dec 2021 09:18:01 +0100
Date: Fri, 31 Dec 2021 09:18:00 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211231091800.629b2ad3@gmx.net>
In-Reply-To: <20211230211120.031434c7@windsurf>
References: <20211230172507.30212-1-ps.report@gmx.net>
 <20211230211120.031434c7@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:lA95fIFATPXelSGwqtiI/eyKZoaOguszFdrwKsfLAXNTpV+gUAI
 0VG4isSbsG6syYY6vlrnHityoaA4zE+v8s5eSSXO8tRZIoBfqT5ZOI/eILqCZ2cKA5U/q/I
 biLGIJFiBMzH1pUBEczN1R/67+Uufd9uBKIWihxXkfvHwmffQX2oAuhfiJ0tDE1ypgmyy3n
 dxzOf7LRJ1yoK7K5OdlzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:345LRyc3aSg=:4yu6m2e5IV+iAHMTM/r7bt
 TccncD013gF0KTXA0W/amvnG+nr10bFPU3zEX63/CNNoTH3UXOqmGNoqdzqg+n1sxCVjZBQHj
 m7Qee9uvLzyEgSWsr3bN6wuEWKBdHuoqCQBZgYHqw4pLahqVw4A0s8sOYU1dLRCp6dSmukXUC
 YRlr3wf455dy3SVtBdNAZW21NTWgjMS0fNsoI6xbtTkdGydIn8tkGU5opKeAswcjtqh8UBCKN
 cphBHlZ7Gk79TiZM8tHctu/2tcuUGgdUk+HhXSmRtA/atDZnlzzQr8vdEZVtHctKNgiWUuvdd
 ORMG5BcNxn6FAZm0EK2B0wYA4/cAKs8bGHvQ09X4bBCD8GJRC1QxQQRLPl15uH0eb1VsJTlFP
 GeL9KM50GBUDxISwuzua8Aw/BaU/wqXbofUSybAR0gnuQ+Isw28I0EOLlMA5whCr5Rk+anZ0B
 3tTxLP+lroLEA4TE3tqiK8WxFs05XEuY6teVqAIwFMqOki4k07/GrLEMpHhP98DdzEwSnn8iT
 JOqwsDl70DM6eqIE3WZ/geSi8w6NMUznfFOvvOEZpCrVJfP4T11H2LJBuKXBrdw/teGdx6fI8
 EdkvZxIHhaFGS+KJeBEiSaTrH+nFXBGJtSK9Dlsqvu/sWps2fTph0+K+J3Tj23Af8+ejqD7/C
 oCk9ogUZ/4XMcEWAkrE/IUU8ZajZouu6xO9zosvYn/+2DuKvTV/j6nqYNl4KSadX8NUZj/5Cv
 Ia2S+ooWEra3KpB1ya3/htaNOTM7BOO9oC+IJ5Kz1Yp9FuuG4QE2GvN8Ca09yvojOTjE2L2hU
 k6WeO9/vBLxbnuRIA2RQXJGz8Lb+mmJwyzERwP3vfF3114DabGtw3R1XA62a8rBUEuxRXwqva
 g0fSMi9II8qCkrwZnpMQCK6CdkyINeATLIpn/unhLjHRvtchgr6TBGEhmYi4EyJrvF7tHf4EF
 9d8L/Q+1CmW3RKgJkEazUkkw5u9yR34wkqcvuGk/YyECdRGMo/9j9LZBCO8fMVMobUu1MhRd3
 g/qKkeuUQhWKsYNm0vkn4ez6BIpqInpf8MYFR7lz+aNhpqGxFNp1yEdWK94HD5Y5Hakp8loww
 xOnSVh1KhpoFkc=
Subject: Re: [Buildroot] [RFC v1] package/assimp: fix namespace related
 compile failure
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Thu, 30 Dec 2021 21:11:20 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu, 30 Dec 2021 18:25:07 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Note:
> >   - patch fixes the compile failure but did not find the root cause
> >     and/or a good explanation why the template spezialisation failes
> >     for Structure::Convert<CollectionObject> and
> >     Structure::Convert<CollectionChild> (but not the other ones) and
> >     why it is fixed by the patch...
>
> I see in the pull request you've submitted upstream that the issue
> appears with g++ Sourcery CodeBench Lite 2014.05-29 - 4.8.3 20140320,
> which is really a super-old toolchain. Could it be that g++ 4.8 has a
> bug? It clearly is possible, on tricky/modern C++ stuff.

Same failure today (see [1]) with:

	$ ./host/bin/mips-linux-gnu-g++ --version
mips-linux-gnu-g++ (Sourcery CodeBench Lite 2016.05-8) 5.3.0

And merge request accepted upstream, see [2]...

Regards,
Peter

[1] http://autobuild.buildroot.net/results/4ed8516cb03a6447b44f2c3731b2197fd6eea9d9
[2] https://github.com/assimp/assimp/commit/a099fe7cd331a839137115db5df1733c4c1c8070

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
