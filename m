From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 13:31:53 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LVVkFtkFiL-9AD918JTeTPf4zgUf=RQsp4XZUOBVUaTDQ@mail.gmail.com>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
 <CAAXf6LXjfkZ=3_fFPowo3k2HHyUkSpiHnOfGG=HS=0icjYBXhA@mail.gmail.com>
 <20140212104745.61ea39bd@skate>
 <CAAXf6LUDUyWxQ_cf2+TapCcSoB0=HRs2_413MH_FCXN56C3R_Q@mail.gmail.com>
 <CAAXf6LXTF0XKg-pBGKhDmxV+VPULPSxhJm84UnfzUH=kGa3MNA@mail.gmail.com>
 <CAAXf6LVVkFtkFiL-9AD918JTeTPf4zgUf=RQsp4XZUOBVUaTDQ@mail.gmail.com>
Message-ID: <20140212133153.7995b73a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 12 Feb 2014 13:29:35 +0100, Thomas De Schampheleire wrote:

> I found this snippet:
> AC_CHECK_LIB(c, dlopen, LIBDL="", [AC_CHECK_LIB(dl, dlopen, LIBDL="-ldl")])
> 
> which would be used as follows in aclocal.m4:
> -ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"
> +ALSA_LIBS="$ALSA_LIBS -lasound -lm $LIBDL -lpthread"
> 
> but aclocal.m4 seems to be regenerated with autoreconf. How can you
> make changes in that file?

You don't make changes to aclocal.m4.

> I tried adding an m4 file in the m4 subdirectory, adding it to the Makefile.am.
> But how to regenerate aclocal.m4?

By running the aclocal tool.

From man aclocal:

"""
Generate 'aclocal.m4' by scanning 'configure.ac' or 'configure.in
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
