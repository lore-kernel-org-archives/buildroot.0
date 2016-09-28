From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Sep 2016 07:49:19 +0200
Subject: [Buildroot] [PATCH] package/acpitool: needs threads, shared;
	unavailable for bfin
In-Reply-To: <1475013911-32258-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 28 Sep 2016 00:05:11 +0200")
References: <1475013911-32258-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87pono1sm8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > acpitool requires threads.
 > However, it does not check fo threads in its configure script, so
 > forgets to link with -pthreads, so fails to build in static-only
 > scenarii.

 > However, upstream has been dead for the past 7+ years now, so there is
 > not much point trying to fix this. Besides, a system with ACPI is most
 > probably a biggish system, so shared libs will probably be enabled, so
 > we just require shared libs.

 > As for bfin, the cryptic configure failure:
 >     configure: error: C++ compiler cannot create executables

 > is due to the order in which AC_PROG_CXX and AC_PROG_CC are called.
 > Calling AC_PROG_CC first fixes this error message.

Didn't we conclude this was a toolchain issue?

 > Since there's not many chances that a bfin board has ACPI, we just
 > disable acpitool for bfin.

Agreed.

 > ---
 > Changes v1 -> v2:
 >   - add dependencies on threads and !static

You seem to have forgotten to actually do so?

-- 
Venlig hilsen,
Peter Korsgaard 
