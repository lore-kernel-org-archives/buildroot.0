From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 05:07:05 -0500
Subject: [Buildroot] [PATCH] autotools: add with/without and
	enable/disable helpers
In-Reply-To: <20101119105610.2c393dc1@surf>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
	<201011190320.21230.vapier@gentoo.org>
	<20101119105610.2c393dc1@surf>
Message-ID: <201011190507.06655.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, November 19, 2010 04:56:10 Thomas Petazzoni wrote:
> All your patches are well appreciated. However, I feel some
> aggressiveness in your replies, which I don't really understand. Again,
> I really do appreciate all those improvements, so can we keep the
> discussion nice and friendly ?

i dont recall injecting aggressiveness into my messages.  i have been told 
before that my response can be too curt.  not the same, but easy to perceive 
as the same i guess.  personally i try to minimize word count to focus on 
subject matter and not get bogged down with essays.

> > > It'd be nicer if we could use a pure Makefile implementation. What
> > > about a simpler :
> > > 
> > > USE_WITH = $(if $(BR2_$(1)),--with-$(2),--without-$(2))
> > > USE_ENABLE = $(if $(BR2_$(1),--enable-$(2),--disable-$(2)))
> > 
> > this isnt functionally equivalent ... there is no support for the
> > optional [=val] with the flag
> 
> It's not that I'm against using the shell, but for this particular
> macro, the make language seems to be quite appropriate.

i'm not against doing it in make's native language ... it's just that your 
solution didnt support everything mine did.  as long as they're functionally 
equivalent, avoiding mixing two languages (make and shell) is of course a good 
thing.

i'm importing work that i've done for another distro, so while it's been 
heavily tested elsewhere, i wouldnt be surprised if there will be more room 
for improvements as you've shown here.

> And it'd be nice to add some words in the documentation about this as
> well (but I can do that later on if you wish).

i'm not terribly familiar with current documentation on the backend

> > this is due to poor design on the behalf of buildroot.  it really
> > needs to adopt more Kconfig style and do stuff like:
> > foo-y =
> > foo-$(BR2_xxx) += libpng
> 
> I'm for sure open to improvements/changes in the package
> infrastructure. For which variables should we use this ? I'm thinking
> of all "cumulative" variables.

pretty much everything that uses "+=" that ive seen in buildroot has been a 
candidate for conversion.

> Does that sounds like what you're suggesting ?

yes, but i was focusing on the common ones.  TARGETS in the top level and all 
the dependency related variables.  but it probably makes more sense to just do 
it for all variables so as to stay consistent.  doing some will probably be a 
bit confusing for people, and even aggravating when they want one that wasnt 
converted.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/f308615c/attachment.pgp>
