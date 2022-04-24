Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B98C43217
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 14:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB48540476;
	Sun, 24 Apr 2022 14:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7SQANmdsFsI; Sun, 24 Apr 2022 14:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5657400FF;
	Sun, 24 Apr 2022 14:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55CD81BF841
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43601400FF
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 14:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBxCurfsx0DZ for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 14:50:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D1B34002B
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:50:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:657d:21bd:cb37:8719])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 50A7678033D;
 Sun, 24 Apr 2022 16:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650811826;
 bh=0JjmAm/QsqfA1lK0ouiJBBRM41fLn7DOr1kMeJ1MaV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3nJPZVQVsDyEuPi5LlysvR1BCQNJfVfdOC2CvpPREG1obNAKMyJEeYMXzODlpx9i
 S5O2/oUVzOMGeH1ctoyVwVu3yf6hys8sbsxYZ5N6izS/F6EebqgAv4zYetOaEZcWsT
 nj68xF6W7H+DNXtVHC0rjUoKOPSflDUEs/zJp6D8hIwl/OxOoi8ljccJq+7WjU6t0F
 4sbDUYJ9fsreknWIAyR4SJvBAeq4VqBC4eIBEILOk750JUEvwxvIjc+zfndVjJssaE
 9Kaj7mTJOotfo6z6qWAdQxnaJ4JndWHq87AMWXs8UMe56ZVqf47dJXOgz7tI6Kp3ik
 JXggpymFPbRtg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 16:50:21 +0200
Date: Sun, 24 Apr 2022 16:50:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220424145021.GV2730@scaer>
References: <20220420135549.3536397-1-tianyuanhao3@163.com>
 <20220421191653.GO2730@scaer>
 <0fd2d0f7-d067-0f65-23dd-68aff1e61d94@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fd2d0f7-d067-0f65-23dd-68aff1e61d94@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/systemd: add the missing sgx group
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2022-04-21 16:55 -0700, TIAN Yuanhao spake thusly:
> On 4/21/22 12:16, Yann E. MORIN wrote:
> >On 2022-04-20 06:55 -0700, TIAN Yuanhao spake thusly:
> >>systemd-udevd needs this group:
> >>   /usr/lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring
[--SNIP--]
> >>diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> >>index b07fac27d4..44185a35a0 100644
> >>--- a/package/systemd/systemd.mk
> >>+++ b/package/systemd/systemd.mk
> >>@@ -603,6 +603,7 @@ endef
> >>  define SYSTEMD_USERS
> >>  	# udev user groups
> >>+	- - sgx -1 * - - - SGX device nodes
> >This should have been in the udev virtual package, as all the
> >udev-related users and groups have been moved there to be common between
> >systemd-udevd and the stand-alone eudev, in commit d648d81dd581
> >(packages/{eudev, systemd}: move common users to package/udev).
> I did notice the common rules in the udev virtual package. However "sgx"
> only appears in systemd but not eudev.

OK, my bad. Can you send a patch that moves it back to systemd, please?

> Besides, I found that the "render"
> group in systemd should be "video" in eudev.

This is going to be concerning if the same device nodes have different
groups assigned to them by the two different udev implementations...

In systemd, the renderD* nodes have always been assigned to group
'render', since commit 4e15a7343cb3 (udev-rules: Permission changes for
/dev/dri/renderD*), committed 2017-11-08.

In eudev, renderD* nodes were also assigned to the 'render' group in
commit bb070c154e70 (rules: update), committed 2018-02-20.

But then, in eudev, that was changed with commit a8ffcd1b985f
(rules/50-udev-default.rules: fix issue 160), where they were then
assigned to the 'video' group.

There is not much that is interesting in issue 160, except for some
people reporting issues on distros where the 'render' group does not
exist (along with a bit of the usual whining about systemd).

So, I'm not sure how we should go in that case... Indeed, if we have
packages which want to declare users that belong to the appropriate
group to be able to use the render nodes, then they'd have to know
whether running with systemd or eudev, which was initially the reason to
have a virtual package to abstract that, and have the groups defined in
that virtual package...

Sigh...

But in the end, then yes, 'render' and 'video' should be moved out of
the virtual package and into systemd and eudev, respectively. Can you do
that, please?

Regards,
Yann E. MORIN.

> Regards,
> TIAN Yuanhao
> >
> >Regards,
> >Yann E. MORIN.
> >
> >>  	# systemd user groups
> >>  	- - systemd-journal -1 * - - - Journal
> >>  	$(SYSTEMD_REMOTE_USER)
> >>-- 
> >>2.25.1
> >>
> >>_______________________________________________
> >>buildroot mailing list
> >>buildroot@buildroot.org
> >>https://lists.buildroot.org/mailman/listinfo/buildroot
> 
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
