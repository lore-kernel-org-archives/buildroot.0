From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 18:25:00 -0500
Subject: [Buildroot] [PATCH v2] autotools: add with/without and
	enable/disable helpers
In-Reply-To: <AANLkTikhi1PN3uSMR6Q_4gX3oEmi2Y7pNZhbaaL8PgwM@mail.gmail.com>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
	<201011190624.54500.vapier@gentoo.org>
	<AANLkTikhi1PN3uSMR6Q_4gX3oEmi2Y7pNZhbaaL8PgwM@mail.gmail.com>
Message-ID: <201011191825.02260.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, November 19, 2010 07:49:54 Paulius Zaleckas wrote:
> On Fri, Nov 19, 2010 at 1:24 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> > On Friday, November 19, 2010 06:13:26 Thomas Petazzoni wrote:
> >> > +_USE_CONF = $(if $(BR2_$(3)), --$(1)-$(4)$(if $(5),=$(5)),
> >> > --$(2)-$(4))
> >> 
> >> What about testing directly BR2_PACKAGE_$(3), since all packages are
> >> prefixed by BR2_PACKAGE_ ?
> > 
> > if that's the case, then there's no reason
> > 
> > in the original implementation, i avoided making the 2nd argument
> > optional. this was because i'd have to execute tr or something to do
> > lower->upper.  but if it's all in make now, it should be possible to
> > support the syntax: $(call USE_ENABLE,libvorbis)
> > the 1st arg would always be passed through the UPPERCASE helper, and hte
> > 2nd arg would default to the 1st.
> 
> I believe he means BR2_PACKAGE_$(3) instead of BR2_$(3), not to get rid of
> it.

i know what he meant.  i think you're confusing unrelated threads of thought.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/6961619e/attachment-0001.pgp>
