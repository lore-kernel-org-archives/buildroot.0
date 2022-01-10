Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7D1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE1A740641;
	Mon, 10 Jan 2022 22:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EF6e3pQE7dmM; Mon, 10 Jan 2022 22:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B972E4063F;
	Mon, 10 Jan 2022 22:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C50D1BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 593C44063F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbAdaHnHx6lo for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:28:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54C2E40121
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:28:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4B02719F4F3;
 Mon, 10 Jan 2022 23:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641853693;
 bh=j2+sCK8BxsituT34MCz3FLARyx8Oy3NkJIIH16sCUUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hu1ReqFuZVo0VW91O6Tcj14dOujOswDGyk1mCAngMWgdhNjikxb38B1WN5F08C2t2
 vECtbI6/bchMKfEVnxeW2afPPVjCfYFesFUlEA4IB+xVRgf9PbxVnG2rbxpOF23nuu
 B5cxq8xSu8vFtzADeaLgFfT4RrYEtsO3CwTQyx7VUBv2B7rz4dAFQKYzVwvGIbOeQB
 S3D9m3CLhmBKITypXanWXLGjCFNO0BJiJze+jHHI5MKdoqmeyHWRzQGSWLGpnBg2RK
 wSF6VhhUTzgOxz2WreqPQ4+6KlNh/GqmB7mP3vA4GZWJZGDXN0L3+pdQAUm4XhTivo
 NWcCyYaqC2I3w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 23:28:08 +0100
Date: Mon, 10 Jan 2022 23:28:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220110222808.GU1477939@scaer>
References: <20211231202620.3521230-1-james.hilliard1@gmail.com>
 <20220110221051.GT1477939@scaer>
 <CADvTj4qnuwUh594-QC-4ySNQX2aSfhfs36tX-cH5vMB52EbgbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qnuwUh594-QC-4ySNQX2aSfhfs36tX-cH5vMB52EbgbQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/zynq-boot-bin: port to python3
 and move to support/scripts
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Julien Olivain <juju@cotds.org>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-01-10 15:18 -0700, James Hilliard spake thusly:
> On Mon, Jan 10, 2022 at 3:10 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > So I wonder if it even makes sense to keep package/zynq-boot-bin now.
> Well if someone is using an older uboot that doesn't have the
> generation capability
> integrated then it's probably still needed right?

But then, they would have that tool in their uboot tree, and then
nothing would prevent them from running it as a post-build (or
post-image) script.

Yes, they would need to have a python2 on their host. But that will be
the case if they stick to such older tools which may break on more
recent systems, not just uboot...

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
