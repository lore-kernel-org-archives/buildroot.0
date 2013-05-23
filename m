From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 23 May 2013 13:43:24 +0100
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <20130523131251.2ffc509f@skate>
References: <20130523131251.2ffc509f@skate>
Message-ID: <519E0EEC.6070402@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/05/2013 12:12, Thomas Petazzoni wrote:
>
> So, what I've done in my prototype of out-of-tree support is something
> like this:
>
> $(1)-patch:	$(filter host-autoconf host-automake host-libtool,$$($(2)_DEPENDENCIES)
> 		...
>
> $(1)-configure:	$$($(2)_DEPENDENCIES)
>
> The idea is that if the package needs host-autoconf, or host-automake
> or host-libtool in its dependencies, then we pull these dependencies
> before the "patch" step, and all other dependencies are pulled before
> the "configure" step.
>
> This works for most packages, but not all! Some packages, for their
> autoreconf step, need more than host-autoconf, host-automake or
> host-libtool. They might require host-pkgconf or host-gettext, to
> install some .m4 macro files that are needed to make the autoreconf
> work. So in fact, discriminating between dependencies that should be
> pulled in before the "patch" step and the dependencies that can wait
> until the "configure" step is not simple.
>
> Do you see solutions to this?

Thomas, I might be missing something but it seems like all the needed 
dependencies are host dependencies. Can we not make all host 
dependencies be on the patch step and all others on the configure step. 
I think that would work for rtai wouldn't it?

Regards
Will


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
