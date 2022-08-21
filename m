Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFE4C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA8460AE3;
	Sun, 21 Aug 2022 20:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA8460AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7NP9fQcoY9Sp; Sun, 21 Aug 2022 20:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 075FD60AE5;
	Sun, 21 Aug 2022 20:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 075FD60AE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CAD71BF317
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 20:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1822D40124
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 20:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1822D40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rhja971Z3xtx for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 20:18:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20518400A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20518400A6
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 20:18:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C346313F86F;
 Sun, 21 Aug 2022 22:18:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 22:18:40 +0200
Date: Sun, 21 Aug 2022 22:18:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220821201840.GU2167049@scaer>
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-4-james.hilliard1@gmail.com>
 <20220727223102.6daf1e27@windsurf>
 <CADvTj4rvcKW-av9ajcrR0hEarYxbSfJqE2P2-1Zj7qj8NBoMQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rvcKW-av9ajcrR0hEarYxbSfJqE2P2-1Zj7qj8NBoMQA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661113129;
 bh=lvkMSCj9ymFbw5sCDpAP6KjLkaLTraDfEkwfjhgKU+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZXOZCCuTMde77QD58qHAzV/J1g96lsJEP6CTyq1nPGYXkJQCZ49ijMT/88SJC8KNL
 j7jpCKD0gMVy3cA3lMM0VuSSNyMrzOUwHMk808PaQricLRuS+6QvsaCqERV2AE4EYN
 8zXIO0ZtI3BcxzQWMgn6s7Rt9ElTVY0bfbtYNRtoQP/5r5xtiEGO2Kx2Sp79PJru57
 sZm8dWCDTlvQMGOuhbkINGazaz4jF+/G1Vv+IsGClj0I/aTK/T6BYy+2C9hMWJMKro
 Xd9ZwWWE+PyHw2w++WF35r9gBsTkS6w7VyCrOzIUlCYqssMH/NRpkzCJb0uVqdfHa0
 xPGGX4jzjkgfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZXOZCCuT
Subject: Re: [Buildroot] [PATCH v8 4/5] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-08-02 16:44 -0600, James Hilliard spake thusly:
> On Wed, Jul 27, 2022 at 2:31 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Mon, 14 Feb 2022 18:53:06 -0700
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> > > Currently the qmake gcc sysrootify path logic causes issues with
> > > per-package directories, disable automatic gcc sysroot for qt5base
> > > install and override all qt.conf paths manually to point to their
> > > correct locations.
> > Could you clarify which "issues" this is fixing? I am now looking at
> > this patch because it is the only one that has not been applied, 6
> > months after it has been posted, and the commit log is very fuzzy about
> > what the problem is, and how the commit fixes it.
> >
> > I have just built the following defconfig successfully:
[--SNIP--]
> > Basically building with PPD, qt5base, and a limited set of qt5
> > packages. Could you describe the problem that you encountered, together
> > with a defconfig that allows to reproduce it?
> I recall it helped with qtwebengine's gn build system integration dependency
> resolution logic which was mixing up host/target deps a bit.

So, this is still very fuzzy, and it lacks concrete explanations, and a
defconfig and setup that exhibits the issue which this patch supposedly
fixes.

I've marked this patch as rejected.

If you believe there realyl is an issue that needs fixing, please do not
hesitate to respin this change with a commit log that explains exactly
how the issue manifests itself, what causes the issue, and why the way
you fix it is good (or at least, better thatn the crrent situation).

Thanks!

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
