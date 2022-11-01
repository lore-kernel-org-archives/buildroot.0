Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1CCC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE148812E6;
	Tue,  1 Nov 2022 20:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE148812E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXkLzxHNxaLE; Tue,  1 Nov 2022 20:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A538135F;
	Tue,  1 Nov 2022 20:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A538135F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 013C31BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C92138135F
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C92138135F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvKoAwasV_OR for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:51:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBCF4812E6
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBCF4812E6
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 20:51:01 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 99AA7440876;
 Tue,  1 Nov 2022 22:48:39 +0200 (IST)
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
 <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
 <20221101213240.031261eb@windsurf>
User-agent: mu4e 1.8.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 01 Nov 2022 22:47:10 +0200
In-reply-to: <20221101213240.031261eb@windsurf>
Message-ID: <87bkpq1jrh.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667335719;
 bh=3IBM5IV/qRpCA/jej9oG1uFyzcv+2dd14BqWdBDQ/0M=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=JP4tyaJN5Cf4ttWXxQLpKZRZKJgBmrsUSmRW/RLGYXcif65h0S1c4FOktyJnVnJD5
 XkxtaZ0HndpPoyvJ5InTRLRpZuYm13sL1MCGR1fADpCUybNUq2mj4UNBShuIa5SEZr
 AFpLTWmvEq0UZPg+S074dth44uoaFZIgvQ1NE0nQBn9Ij/gCklzFuKU7LrPLxD/b51
 LKMnGFtT9GnhHHDz71f4S0nH/R1qd/gcj1l8rYXSgJdg+uxg2/GAVVUhHONv+A8K63
 9EguiXPaiO7NKmOZ2LezPaW8Hy2wdd59nhla37dDmbP0uIiv3GPfC/xxJomeWmH6Yn
 K3/8Vj/ybN6mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=JP4tyaJN
Subject: Re: [Buildroot] [PATCH 2/3] package/socat: disable openssl for
 static build
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue, Nov 01 2022, Thomas Petazzoni wrote:
> On Tue,  1 Nov 2022 09:41:55 +0200
> Baruch Siach via buildroot <buildroot@buildroot.org> wrote:
>
>> socal configure script does not take the zlib dependency into account
>> when linking with libssl. This break static link. There is not easy way
>> to add zlib dependency, so just disable openssl for static builds.
>
> Even:
>
> SOCAT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>
> does not work?

It does not work because configure.ac puts $LIBS before -lssl in the
tested command line.

> Also, do you have an autobuilder failure for this issue? Or you just
> encountered it locally?

We don't pass an explicit --with-openssl because socan configure does
not support it. So the configure script just behaves as if openssl is
not there, which is normal.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
