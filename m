Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB8EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4837F60A94;
	Sat,  1 Jan 2022 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSq1Vw6X634a; Sat,  1 Jan 2022 13:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CC860B95;
	Sat,  1 Jan 2022 13:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6501BF31D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07EE981430
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8XsVQheUkNW for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 13:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F7B1812E1
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 13:08:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 41C7E5FF13;
 Sat,  1 Jan 2022 14:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641042498;
 bh=sI4oZOf6G9F4Ew02FpcLdE3oDujK+6ClA45/KrfLYsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ax/PVt8pcyLnfJ51/Q4qWoC3LBL+7WMOgYG5Eqsj891sNTJr+qZQowGWbtD3UW7pm
 bnYcWn7l9SfsOICqSiJvpgv/fP4CAPsVl9AjMOHEkZQ43g6LRSecHGhh+nbsU5FMLK
 MVQh+Y0i4xtGmQypplELckXuDAqqsfKVashdghuCe2UoOxle+6UFLkn+dFNc5keOkP
 D5Li+yi1rdu0AXJYCq/LRAKSnjjuK3hyq8UoZUb2IKbCouO6HvCLRyNHMUW9Y5VAzV
 TapV4MUkQaaz2wPN0fX/+91g0Ujo85B4RYHZ13S7jZxrpqjjS9bovKL4c/XqBDdptP
 BZAij1cblh7Pw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 14:08:09 +0100
Date: Sat, 1 Jan 2022 14:08:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101130809.GH3390456@scaer>
References: <20210321135842.1165539-1-fontaine.fabrice@gmail.com>
 <87k0fj1vz4.fsf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0fj1vz4.fsf@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/rsyslog: enable options when libcurl is enabled
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-01 13:28 +0100, Joachim Wiberg spake thusly:
> On Sun, Mar 21, 2021 at 14:58, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > Following the bump to 8.1910.0, items requiring libcurl were
> > disabled by default. This patch selectively enables options
> > which depend on libcurl when that package is enabled in the
> > build.
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > [Fabrice: Disable mmkubernetes which also depends on lognorm and while
> > at it also disable mmnormalize which is available since version 6.1.2
> > (from 2010) and
> > https://github.com/rsyslog/rsyslog/commit/b9d3cdceabf91bc28f8f6d31cfe9332724e37bbf]
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

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
