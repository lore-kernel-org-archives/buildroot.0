From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Sep 2016 18:37:28 +0200
Subject: [Buildroot] [PATCH] package/acpitool: needs threads, shared;
 unavailable for bfin
In-Reply-To: <87pono1sm8.fsf@dell.be.48ers.dk>
References: <1475013911-32258-1-git-send-email-yann.morin.1998@free.fr>
 <87pono1sm8.fsf@dell.be.48ers.dk>
Message-ID: <20160928163728.GB3622@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-09-28 07:49 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > acpitool requires threads.
>  > However, it does not check fo threads in its configure script, so
>  > forgets to link with -pthreads, so fails to build in static-only
>  > scenarii.
> 
>  > However, upstream has been dead for the past 7+ years now, so there is
>  > not much point trying to fix this. Besides, a system with ACPI is most
>  > probably a biggish system, so shared libs will probably be enabled, so
>  > we just require shared libs.
> 
>  > As for bfin, the cryptic configure failure:
>  >     configure: error: C++ compiler cannot create executables
> 
>  > is due to the order in which AC_PROG_CXX and AC_PROG_CC are called.
>  > Calling AC_PROG_CC first fixes this error message.
> 
> Didn't we conclude this was a toolchain issue?

I never said otherwise. I just said that doing so in acpitool's
configure.in would fix the C++ check.

>  > Since there's not many chances that a bfin board has ACPI, we just
>  > disable acpitool for bfin.
> 
> Agreed.
> 
>  > ---
>  > Changes v1 -> v2:
>  >   - add dependencies on threads and !static
> 
> You seem to have forgotten to actually do so?

No I did not. I just did forget to add the file before git --amend.

Damned... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
