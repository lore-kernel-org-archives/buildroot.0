From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 20:30:43 +0200
Subject: [Buildroot] build of gcc 4.3.5 broken with
 BR2_GCC_USE_SJLJ_EXCEPTIONS
In-Reply-To: <201007230005.22462.yann.morin.1998@anciens.enib.fr>
References: <4C48BF3D.4040301@gmx.net>
	<201007230005.22462.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100727203043.74441c59@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Jul 2010 00:05:22 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> Marcus, All,
> 
> On Thursday 22 July 2010 23:59:25 Ossy wrote:
> > I don't need this particular option (BR2_GCC_USE_SJLJ_EXCEPTIONS)
> > but anyway my buildroot version (current git tree) wasn't able to
> > build 4.3.5-final with BR2_GCC_USE_SJLJ_EXCEPTIONS=y. After
> > deactivating it everything was fine again.
> 
> Yes, it happens too for me with armeb. Other archs are fine for me
> with sjlj enabled.
> 
> I did not dig up why, so I /simply/ turn off sjlj for ermeb.

Does having this BR2_GCC_USE_SJLJ_EXCEPTIONS option makes sense ? In
which case would this be useful ?

According to http://choices.cs.uiuc.edu/exceptions.pdf, the default
mechanism used by g++ for exceptions is faster and better than SJLJ.

If there are only corner use cases, I'm all for getting rid of this
option in BR. Advanced users can always use
BR2_EXTRA_GCC_CONFIG_OPTIONS to add --enable-sjlj-exceptions to the gcc
configuration if they want.

Thoughts ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
