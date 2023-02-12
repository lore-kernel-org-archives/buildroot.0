Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9324C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 10:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36A58404D5;
	Sun, 12 Feb 2023 10:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A58404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXQVTtWp5JCO; Sun, 12 Feb 2023 10:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FD5040452;
	Sun, 12 Feb 2023 10:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FD5040452
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06BA11BF378
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D45DB410E1
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45DB410E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3CFuFDezuIP for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 10:57:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41420410D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41420410D3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 10:57:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4693D5FFAA;
 Sun, 12 Feb 2023 11:57:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 11:57:22 +0100
Date: Sun, 12 Feb 2023 11:57:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230212105722.GM2796@scaer>
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer>
 <CADvTj4oC6WXD=n3zMyBMZuCiZvra3PztQ9YhpDfZ72cJqeq0SQ@mail.gmail.com>
 <20230212101112.GL2796@scaer>
 <CADvTj4rnf9zZfsX54nqQONjUdoR-Ok13d=oi9oJRfw6tnP7adA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rnf9zZfsX54nqQONjUdoR-Ok13d=oi9oJRfw6tnP7adA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676199445;
 bh=JFrHgLDP/dA25WOXyEKeY+yn4bCBe0nCzA6tGyot0rQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XCh4k+zzQFnPeGTmrYAALmw9Dw/r8gE7ziQCeIXK155Y7hPOSTFXnhhbqjSZAFmSx
 8j+IvppxOTbpS18Wowii32xSVJzyoHIEaLaO5blxq+m9WieBRdXRofzc/VvsV+Vny+
 tM2WFGW/aD2wHeWghT98rO+QNzS/qTHSKh67JCB3jB8TgXD0UqpSLtgupNul+6JAxk
 4XyX4oDyg1AJ4YZ7dED/DVLG9CCScNOuH3gZsYF1tUfldxF0LVpLfnUyvWKHJWFOmA
 WpOzljwJZJqZKMYLVht5OZGL8C3W6QxIBsVyhJ9OcFkpfk+SoQVecppy/hM0fFIkUN
 dbC2UgGRpzecA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XCh4k+zz
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-02-12 03:22 -0700, James Hilliard spake thusly:
> On Sun, Feb 12, 2023 at 3:11 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > James, All,
> >
> > On 2023-02-12 03:02 -0700, James Hilliard spake thusly:
> > > On Sun, Feb 12, 2023 at 2:42 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > On 2022-10-17 21:46 -0600, James Hilliard spake thusly:
> > > > > To ensure the evaluation order is always correct use double colon
> > > > > rules to make the evaluation order explicit as per make docs:
> > > > >
> > > > > The double-colon rules for a target are executed in the order they
> > > > > appear in the makefile.
> > [--SNIP--]
> > > > So, I'd like that we get another way to fix that, if possible...
> > > I have unfortunately not found any other method to fix the execution
> > > ordering...
> >
> > What about something along the lines of (untestd!):
> >
> >     $(1)-rebuild: $(1): $(1)-clean-for-rebuild
> >     $(1)-rebuild: $(1)
> 
> That would appear to be invalid syntax.
> 
> >
> > We already use such a construct in package/pkg-kconfig.mk, but only
> > once, so this is not as if it were widespread either...
> 
> I don't see anything like that there,

    240:  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%

So, this looks like it is named "target pattern", and it works with a
pattern (eh!).

    $ cat Makefile
     1  all: a
     2
     3  a:
     4          @echo a
     5
     6  a-clean:
     7          @sleep 1
     8          @echo a-clean
     9
    10  a-rebuild: %-rebuild: %-clean
    11  a-rebuild: a

However, that does not work with parallel builds:

    $ make
    a

    $ make a
    a

    $ make a-rebuild
    a-clean
    a

    $ make -j a-rebuild
    a
    a-clean

However, you stated in a previous reply:

    So unlike the legal-info issue using .NOTPARALLEL would not work
    here as these make targets do need to work with parallel builds.

I don't think that's true. Indeed, foo-rebuild is usually done after a
ful build, when iterating over the foo package, iether to test a new
source tree (with ocerride-ssrcdir) or to test fixes in foo.mk. In
either case, we do not need a top-level parallel build, because only one
package, foo, will be built.

So, even in this case, we should be able to use .NOTPARALLEL, no?

It also means that the kconfig rule I mentionned above, does not work
with top-level parallel builds, but that's OK: it's only used to spawn
kconfig configurators (menuconfig et al.), so it should not be used with
top-level parallel, and thus should require .NOTPARALLEL as well.

Meh, TLPB and shuffling are really uncovering issues everywhere... :-(

Regards,
Yann E. MORIN.

> just this which isn't doing anything
> unusual with multiple prerequisites that require a specific execution
> order like the re{install,build,configure} rules in pkg-generic.mk:
> 
> # Force olddefconfig again on -reconfigure
> $(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
> 
> $(1)-clean-kconfig-for-reconfigure:
>     rm -f $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
> 
> >
> > Still, I think it is more easy to read...
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

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
