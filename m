From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2013 23:07:35 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <20131217100414.551a3832@skate>
References: <52A730B0.3020104@orange.com> <52AA41FE.6060705@mind.be>
 <20131217071100.04b7b3a7@skate>
 <201312170858.13393.yann.morin.1998@free.fr>
 <20131217100414.551a3832@skate>
Message-ID: <20131217220735.GA3352@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-17 10:04 +0100, Thomas Petazzoni spake thusly:
> On Tue, 17 Dec 2013 08:58:13 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > >  2. Or, we can take the opposite route by pushing the currently
> > >     centralized libgles.mk logic that adds each OpenGL
> > > implementation in LIBGLES_DEPENDENCIES down into each OpenGL
> > > implementation .mk file. But that requires a late evaluation of
> > > $(generic-package), so that all OpenGL implementations can be
> > > registered in LIBGLES_DEPENDENCIES before the generic-package macro
> > > of libgles.mk is evaluated. This would require something like
> > > Yann's patch.
> > 
> > Needless to say I would highly prefer this second solution.
> 
> Right. In principle, I have nothing against this solution. It's just
> that I am not sure to fully grasp the consequences of the change you're
> proposing. I'm a bit worried about "weird" consequences that we may not
> be thinking of at this time. But maybe we should simply apply the
> patch, and see if it causes problems for some specific use cases.

OK, so we should apply it soon, since the holidays season is approaching
pretty fast now, and it would be nive to be able to react quickly in
case anything goes south...

Peter, care to have a look at it and comment (or apply it), please? ;-)
    http://patchwork.ozlabs.org/patch/301874/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
