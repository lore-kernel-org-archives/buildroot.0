From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jul 2008 21:55:28 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080704222950.E76B63C61F@busybox.net> (ulf@uclibc.org's message
	of "Fri\, 4 Jul 2008 15\:29\:50 -0700 \(PDT\)")
References: <20080704222950.E76B63C61F@busybox.net>
Message-ID: <87fxqmg53j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-04 15:29:50 -0700 (Fri, 04 Jul 2008)
 ulf> New Revision: 22640

 ulf> Log:
 ulf> Add 'build with log'

 ulf> Modified:
 ulf>    trunk/buildroot/Makefile


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/Makefile
 ulf> ===================================================================
 ulf> --- trunk/buildroot/Makefile	2008-07-04 22:23:20 UTC (rev 22639)
 ulf> +++ trunk/buildroot/Makefile	2008-07-04 22:29:50 UTC (rev 22640)
 ulf> @@ -475,6 +475,9 @@
 
 ulf>  prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
 
 ulf> +log:
 ulf> +	$(MAKE) > $(PROJECT).log 2>&1 

That breaks the source-check/external-deps check in
Makefile.autotools.in (r22607).

-- 
Bye, Peter Korsgaard
