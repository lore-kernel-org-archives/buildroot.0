From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 11:04:54 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87prtfmgzx.fsf@macbook.be.48ers.dk>
References: <20080328025042.B52E23C31E@busybox.net>
	<87prtfmgzx.fsf@macbook.be.48ers.dk>
Message-ID: <9305ca410803310204g6fc64204t557a88c751472a9a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 28, 2008 at 9:42 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>> "jspence" == jspence  <jspence@uclibc.org> writes:

>   jspence> @@ -124,6 +129,12 @@
>   jspence>  ifndef FCFLAGS_FOR_BUILD
>   jspence>  FCFLAGS_FOR_BUILD:=-g -O2
>   jspence>  endif
>   jspence> +
>   jspence> +ifeq ($(BR2_HAVE_HOST_CCACHE),y)
>   jspence> +HOSTCC:=$(HOSTCCACHE) $(HOSTCC)
>   jspence> +HOSTCXX:=$(HOSTCCACHE) $(HOSTCXX)
>   jspence> +endif
>
>  This is no good for the people (like me) that already use ccache by
>  prepending /usr/lib/ccache to the PATH.
>
>  Maybe you should simply add it as another option to the existing
>  ccache Config.in?

This breaks the build for ccache users, so I'm reverting the hunk for
now. Please commit a fixed version of it.

-- 
Bye, Peter Korsgaard
