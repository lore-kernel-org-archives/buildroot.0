From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 12:21:07 +0200
Subject: [Buildroot] [PATCH 00/91] Update mesa3d & xorg
In-Reply-To: <20140330111350.4782647c@skate>
References: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
 <20140329235039.4bf4983e@skate> <20140329231259.GO3227@free.fr>
 <20140330111350.4782647c@skate>
Message-ID: <20140330102107.GA3152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-30 11:13 +0200, Thomas Petazzoni spake thusly:
> On Sun, 30 Mar 2014 00:12:59 +0100, Yann E. MORIN wrote:
> 
> > The problem seems related to libevas, where the dependency on openGL is
> > poorly handled.
> > 
> > I'm working on it, but you are free to investigate too. ;-)
> > 
> > So far, I managed to get rid of the circular hell, with this:
> > 
> >     diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
> >     index 2afa888..8eea23d 100644
> >     --- a/package/efl/libevas/Config.in
> >     +++ b/package/efl/libevas/Config.in
> >     @@ -148,7 +148,7 @@ choice
> >      config BR2_PACKAGE_LIBEVAS_GL
> >             bool "generic OpenGL"
> >     -       select BR2_PACKAGE_MESA3D
> >     +       depends on BR2_PACKAGE_MESA3D
> >             select BR2_PACKAGE_LIBEET
> 
> But shouldn't BR2_PACKAGE_LIBEVAS_GL instead depend on a new virtual
> package for full OpenGL? We can imagine having in the future other
> implementations that Mesa3D for the full OpenGL, no? Like if you
> install the NVidia proprietary drivers, I believe they come with their
> own implementation of OpenGL, completely independent from Mesa3D, no?
> 
> In this case, since we can "select" a virtual package because that
> doesn't make sense, the dependency would have to be a "depends on", and
> we're good, no?

Oh, I never meant this patch was the correct one, even less so it should
be applied.

As I said in the comment below, I wanted patchwork *not* to catch it.
It is just a starting point of where to break the dependencies loop.
And since time for bed was nigh, I felt it was better just to post it as
is (just so I don't forget it during the night!)

Of course, the solution will involve some fiddling with the virtual
packages. Probably, as you said, adding a new full-openGL virtual
package and adding mesa3D as the provider.

As for the NVidia binary blob, I was anyway planning to look at it in
the near future, so I can run XBMC properly accelerated on my media
center. But there's no timeline...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
