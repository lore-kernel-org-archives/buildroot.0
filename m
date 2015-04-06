From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2015 11:14:26 +0200
Subject: [Buildroot] [PATCH 11/35] pkg-generic: implement
 <pkg>-all-{source, legal-info, external-deps} targets
In-Reply-To: <20150330174512.GD4318@free.fr>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150329214739.GL4093@free.fr> <20150330174512.GD4318@free.fr>
Message-ID: <20150406091426.GC4369@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-30 19:45 +0200, Yann E. MORIN spake thusly:
> On 2015-03-29 23:47 +0200, Yann E. MORIN spake thusly:
> > On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> > > In order to implement the global 'make source', 'make legal-info' and
> > > 'make external-deps' using the package infrastructure logic, this
> > > commit introduces a set of per-package targets that allow to
> > > recursively run the source/legal-info/external-deps actions on the
> > > dependencies of a given package.
> > > 
> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Actually, I may have to withdraw that reviewed tag of mine...
> 
> Testing patch 20/35 (Makefile: use <pkg>-all-legal-info to implement the
> legal-info target) does not give the same result as previously:
> 
>   - some packages that are not enabled get their legal-info "installed"
>   - some non-existing or disabled host packages have their legal-info
>     isntalled as well...
> 
> Not sure this is due to theis patch 11/35, or really due to 20/35 (even
> though I have some clues as to incriminate patch 11...).
> 
> I'll be investigating this a bit later...

Now for good:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

That series just exposes some inconsistencies in the current state of
affairs regarding legal-info in some packages.

Most notably, as Thomas explained, host-packages legal-info was only at
most two-lefvel deep, so we were missing parts of the host-packages
legel-info, now exposed by this series. Also, some of our target
packages have inconsistent depend/select in kconfig, that do not match
the _DEPENDENCIES in their .mk file (and vice-versa), also exposed now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
