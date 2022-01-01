Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CF0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 14:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B71540296;
	Sat,  1 Jan 2022 14:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ratf5tLFX3lv; Sat,  1 Jan 2022 14:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF98740291;
	Sat,  1 Jan 2022 14:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3F51BF59D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 434AA60B4A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4176QOaydS1 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 14:38:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EFE560A94
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 14:38:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c59:844e:fd99:5f73])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4E5C120039E;
 Sat,  1 Jan 2022 15:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641047906;
 bh=kHbITKc0rJhL33A1dxuc2evv2z2gQP3dG9HmTpcEgJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G24o23PlgzybvAclhonQcNr4+6g49rih4hzelLxGLKY+KtTd/Dy6NKgez6xWIfaTO
 dEe53SV9LG24+NutSDin3NQ8NIh5hZFN4Mk3KB4EY+9mMX4+7QhwoIihT2K6c6aOQ/
 uIY0mhTux87GPyWtlOkTGW9UyZPv+yCiDqXQl/HKiL8avjt9YglV7KLP6WQnO0WpyJ
 n1S4OeUKPbwe6S62RiQY/08j2dSCnygqtQAlPoK3y+I1Y0GpcqqszoLRxCtlB07NaG
 amQuHj5TKUAiUYfYLU2B16JkmH0EEoL1SRwMrPeYx261sLCBjKJ9ID65UTa11xcCc9
 Bh3zYR4et0bkg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 15:38:20 +0100
Date: Sat, 1 Jan 2022 15:38:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220101143820.GC2777@scaer>
References: <20211223090800.1716321-1-troglobit@gmail.com>
 <20211223090800.1716321-4-troglobit@gmail.com>
 <20220101141315.GB2777@scaer>
 <07d1d003-f2fd-a682-d496-d733c2e974ce@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07d1d003-f2fd-a682-d496-d733c2e974ce@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 3/3] package/makedevs: coding style and
 whitespace cleanup
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2022-01-01 15:26 +0100, Joachim Wiberg spake thusly:
> On 1/1/22 3:13 PM, Yann E. MORIN wrote:
> > However, I'm also afraid that there might be different reformatting
> > rules based on the clang-format version... Maybe the version we use
> > should be documented somewhere?
> Possibly, but in that case this would be a problem also in other
> projects, e.g. the kernel.  I'd lean more towards syncing with kernel
> .clang-format if that should turn out to be a regular problem.

Agreed.

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
