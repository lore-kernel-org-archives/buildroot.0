From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jun 2013 19:25:08 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130616191806.7b4a899a@skate>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate>
Message-ID: <20130616172508.GL3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-06-16 19:18 +0200, Thomas Petazzoni spake thusly:
> On Sun, 16 Jun 2013 19:03:05 +0200, Yann E. MORIN wrote:
> > It would be nice if it were also possible to somehow "subscribe" to a
> > list of packages and get a mail when any of these packages fails to
> > build.
> 
> Indeed. Are we also talking about a daily e-mail?

If there are build failures, yes.
Of course, no need for a mail if no build failure.

> > For example, I'd like to catch errors in the packages I've submitted.
> > 
> > I see two options for this:
> >   - add a global MAINTAINERS file that list maintainers for each
> >     actively maintained packages (a bit like the Linux kernel does);
> >   - add a FOO_MAINTAINER variable to foo.mk (for each maintained 'foo'
> >     package).
> > 
> > Would that be possible?
> 
> Yes that would be possible. For now, I don't have a particularly strong
> opinion between the two solutions you proposed. Maybe the second one is
> more Buildroot-ish?

Yes, that's my preferred one.

Should that be a single email adress, or can this be a list?
    FOO_MAINTAINERS = me at there him at overthere somone at somewhere

I would not expect more than one maintainer, but then why restrict
ourselves...

I'll adapt the manual to document this new variable, and will submit a
patch to add myself as maintainer for a few packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
