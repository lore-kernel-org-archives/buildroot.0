Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCD2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 18:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C664032B;
	Fri, 31 Dec 2021 18:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBRCmmYGI-Py; Fri, 31 Dec 2021 18:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA9D040241;
	Fri, 31 Dec 2021 18:03:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E87081BF286
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 18:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E4181471
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 18:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjpTXhr8fFIX for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 18:03:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4D7481469
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 18:03:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 322F85FFA0;
 Fri, 31 Dec 2021 19:03:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640973831;
 bh=/iJ7ESQiUJxu40XCaePQwYUazlw8Je4hB7aE04xYI78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rqaNthjwLVEwRjJH3r/9HlyO7UQAJMt7t6Oxb3drfMxB6m9EPVIjWXp+iLG/KQ4TN
 sP7WM2RjhJsVUlOIBLjg71o+fIP3gmMaO1k3aghOzCNBrt8JT3SNn3LhAn9s1zozax
 7IVj1gBFo7o6sG9q/bwPV2akz5/OsYXrJZz4VoQDYj+j4dJMPHsQrQ+idA3+Ux3qps
 HjGMmNiKNzDvu8Iha4klMXkDEI+6P+Bn2sqWb/61ANnJAFEkwcEOgVQAZ3Blbah0JX
 owSmeNEMS2qRulypK/3ixANiOeYtTFScZFtsgZWYotRi2gQWg/ZJPyrTN9MubHCYOX
 /fCjIKLwZHJ4Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 Dec 2021 19:03:42 +0100
Date: Fri, 31 Dec 2021 19:03:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211231180342.GN3390456@scaer>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <d69fc234a73801620273dfcc399f2c10f13bcbb0.1636810092.git.yann.morin.1998@free.fr>
 <20211230214639.7d98b030@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230214639.7d98b030@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 15/16 v2] core/show-info: report package
 build steps and stamp files
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
Cc: Vadim Kochan <vadim4j@gmail.com>, eeppeliteloop@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-30 21:46 +0100, Thomas Petazzoni spake thusly:
> On Sat, 13 Nov 2021 14:28:26 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > People (and their scripts!) whi want to report on the progress of the
> > build, will need to know what steps a package follows in what order.
> > 
> > This is handled internally by Buildroot itself already, by use of stamp
> > files.
> > 
> > However, the names of those stamp files are purely an implementation
> > detail (even if they are very unlikely to ever change).
[--SNIP--]
> This one I really found excessive. There's pretty a 1:1 relationship
> between the steps and the stamp files, so anything that has knowledge
> of the internal steps of a package can also know about the stamp files.

The thing is, those utilities do not even need to have the knowledge of
the internal steps, because the steps are all listed explicitly, in
order, with their names and associated stamp-files.

So, such a tool could just do (python-esque):

    for step in packages[pkg_name]['build_steps']:
        print('{}: {}'.format(step['step'], os.path.exists(step['stamp_file'])))

and they do not even have to concern themselves with whether we add or
remove steps, or whether we change the ordering or what.

(Yeah, the key for the step name could be changed from 'step' to 'name';
naming is hard.)

The only nitpick however, is that with TLPB, installation in images/ is
not ordered wrt the installation in target/ or staging/ (target/ is
always after staging/ even with TLPB).

Regards,
Yann E. MORIN.

> As it's more controversial than the rest of the series, I left it
> aside. I'll for now mark it as Rejected, but I'm also ready to revisit
> that if need be.
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
