From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Mar 2019 18:36:02 +0100
Subject: [Buildroot] [PATCH] docs/manual: add note about spurious errors
 duing make printvars
In-Reply-To: <99874541-4ce3-4cb8-b7ce-a0d3d7496357@mind.be>
References: <20190312105713.23968-1-martin.kepplinger@ginzinger.com>
 <99874541-4ce3-4cb8-b7ce-a0d3d7496357@mind.be>
Message-ID: <20190312173602.GE25009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 13:33 +0100, Arnout Vandecappelle spake thusly:
> On 12/03/2019 11:57, Martin Kepplinger wrote:
> > Add a note about errors we currently have, as discussed in
> > http://lists.busybox.net/pipermail/buildroot/2019-March/244212.html
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> > ---
> >  docs/manual/make-tips.txt | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> > index ea1d825bef..475de4ffa7 100644
> > --- a/docs/manual/make-tips.txt
> > +++ b/docs/manual/make-tips.txt
> > @@ -131,3 +131,13 @@ The output of quoted variables can be reused in shell scripts, for example:
> >   $ echo $BUSYBOX_DEPENDENCIES
> >   skeleton toolchain
> >  ----
> > +
> > +Note that when using +make printvars+ you might see spurious errors like
> > +the following. Please help reviewing our Makefile macros and variables
> > +in order to fix this:
> 
>  I thought the conclusion of that thread is that there is no way to fix it?

Yes, that was my impresion as well. We can document that here may be
spurious error messages, but fixing them is not wanted (because it makes
the code more complex).

> The
> only reasonable way is to filter out macros from the .VARS. E.g. defining
> PRINTVARS_FILTER and for each macro definition, append to that list.
> 
>  However, I'm not even convinced that we really want to do that. It is adding
> significant complexity for little gain.

Agreed.

>  Instead, I'm more inclined to remove the possibility of running printvars
> without explicit VARS=. If you really want, you can still get all variables with
> VARS=%.

Yes, that sounds like a good idea, indeed. +1

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
