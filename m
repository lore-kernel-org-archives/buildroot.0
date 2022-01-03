Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8599C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C66340876;
	Mon,  3 Jan 2022 20:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPYVwB-h1LYM; Mon,  3 Jan 2022 20:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D798340308;
	Mon,  3 Jan 2022 20:18:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBFE51BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB8B640308
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uam-sLFmg_3 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:18:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0125401B5
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:18:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6582513F88E;
 Mon,  3 Jan 2022 21:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641241108;
 bh=88+S23QFnDo8iQYXdF1c8Se67t9e2+EuajcrsRxApzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1BXyBNKuq5P4wRqOaqq+jJfsdhtnszdljxehX3oejNiT+pTrlK6jCRly36S/6+hA
 hQ7P5IlZfn/xZs+cLClB4x8U0I2dhLySYSf/AGQO9kk/L4ioQQRkvCxo0rw6I9GmNm
 o/mbvFoC1lzN6OLuqJNMuhLRx33+aRR6Wl0N1eTqg2u4bn4MUHQA64X262+r2cG0Zz
 XzwsSFnpohfjfR3my+7mccwrvSZvq4JzQFYPz3puoyL3fba3BHjKJXa5YhwbcFhE8i
 m4e/EjtdXf9hycaqNW1bP7jIsM5fIUTWLNho8TQ3xLQZ5MPk/pcpEirHqg1fPKNm5f
 z3j4JkERKOBCQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 21:18:22 +0100
Date: Mon, 3 Jan 2022 21:18:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220103201822.GI69135@scaer>
References: <20211214125510.13654-1-andreynech@gmail.com>
 <20211230214722.GJ3390456@scaer>
 <63439c64-530d-4d2f-67e5-91a854501a5c@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63439c64-530d-4d2f-67e5-91a854501a5c@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/: remove -E flag from
 patch call
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
Cc: Andrey Nechypurenko <andreynech@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-01-03 18:11 +0100, Arnout Vandecappelle spake thusly:
> On 30/12/2021 22:47, Yann E. MORIN wrote:
> >On 2021-12-14 13:55 +0100, Andrey Nechypurenko spake thusly:
> >>-E flag instructs patch to remove empty files. However, in some cases
> >>empty files are essential. If they are missing, build could be broken
> >>or other bad things can happen.
[--SNIP--]
> >I was going to apply this, but then I was wondering; what about patches
> >that actually *want* to remove files?
> >It turns out that we do have a few patches that remove files:
>  Have you actually tested this? With modern patch, the /dev/null indicates
> exactly what we want: that the file must be removed. So even without -E, the
> file gets removed.
> 
>  What -E does is remove a file in the following case:
> 
> --- a/foo
> +++ a/foo
> @@ -1,1 +0,0 @@
> - foo

Ah, yeah, I was a bit unsure... Now I tried, adn indeed it behaves as
expected.

> git grep -B1 '+0,0 @@' only yields /dev/null cases, so I think it's OK.
>  So I think the only real concern is: will a patch version that supports
> renames always behave like this? I *think* the answer is yes, but it's hard
> to be sure of course.

OK, I'm sold on the idea, and I believe this is sane enough.

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
