From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 21:46:43 +0100
Subject: [Buildroot] [PATCH] use nproc
In-Reply-To: <6f25e6c1-c176-629f-321c-9b404c5d6de6@landley.net> (Rob Landley's
 message of "Fri, 30 Dec 2016 14:14:46 -0600")
References: <6f25e6c1-c176-629f-321c-9b404c5d6de6@landley.net>
Message-ID: <87zijd87rg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rob" == Rob Landley <rob@landley.net> writes:

 > My rule of thumb is that once a change is 7 years old, you can rely on
 > the installed base to have it. With that in mind, would you like to use
 > nproc to check how many processors are available?

 > http://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=commit;h=74cf4cb26dcecd36eb45dc00dbd4587d9dc24a2f

Why? What is the advantage? Purely cosmetical? Are there any well known
distributions providing nproc and not getconf?

 > diff --git a/package/Makefile.in b/package/Makefile.in
 > index afd5d3a..5eed804 100644
 > --- a/package/Makefile.in
 > +++ b/package/Makefile.in
 > @@ -12,7 +12,7 @@ HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 >  # If the number of processors is not available, assume one.
 >  ifeq ($(BR2_JLEVEL),0)
 >  PARALLEL_JOBS := $(shell echo \
 > -	$$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
 > +	$$((1 + `nproc 2>/dev/null || echo 1`)))
 >  else
 >  PARALLEL_JOBS := $(BR2_JLEVEL)
 >  endif


 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
