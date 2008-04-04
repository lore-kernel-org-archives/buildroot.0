From: J. Spence <j3mail-busybox@rearden.com>
Date: Thu, 3 Apr 2008 22:52:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <9305ca410803310204g6fc64204t557a88c751472a9a@mail.gmail.com>
Message-ID: <2565792.95771207288348335.JavaMail.root@zmail.rearden.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- "Peter Korsgaard" <jacmet@uclibc.org> wrote:
> On Fri, Mar 28, 2008 at 9:42 AM, Peter Korsgaard <jacmet@uclibc.org>
> wrote:
> > >>>>> "jspence" == jspence  <jspence@uclibc.org> writes:
> 
> >   jspence> @@ -124,6 +129,12 @@
> >   jspence>  ifndef FCFLAGS_FOR_BUILD
> >   jspence>  FCFLAGS_FOR_BUILD:=-g -O2
> >   jspence>  endif
> >   jspence> +
> >   jspence> +ifeq ($(BR2_HAVE_HOST_CCACHE),y)
> >   jspence> +HOSTCC:=$(HOSTCCACHE) $(HOSTCC)
> >   jspence> +HOSTCXX:=$(HOSTCCACHE) $(HOSTCXX)
> >   jspence> +endif
> >
> >  This is no good for the people (like me) that already use ccache
> by
> >  prepending /usr/lib/ccache to the PATH.
> >
> >  Maybe you should simply add it as another option to the existing
> >  ccache Config.in?
> 
> This breaks the build for ccache users, so I'm reverting the hunk for
> now. Please commit a fixed version of it.

Oops, my fault.  We don't have a /usr/lib/ccache on our big build machine, so we did it the way you see it in the patch.  It didn't occur to me to change the path instead, so I think we'll do that on our build machine.
