From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Mar 2018 23:05:27 +0200
Subject: [Buildroot] Make C and CXX compiler cache in
 toolchainfile.cmake.in
In-Reply-To: <8fa283f1-a304-5f8f-54a2-24fc103afc8c@mind.be>
References: <000001d3c425$31ba3fc0$952ebf40$@gmx.de>
 <8fa283f1-a304-5f8f-54a2-24fc103afc8c@mind.be>
Message-ID: <20180330210527.GA8894@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-03-30 21:57 +0200, Arnout Vandecappelle spake thusly:
> On 25-03-18 12:36, Michael Dick wrote:
> > My suggestion ist o use this patch. Is there any reason why the compilers are
> > not cached?
> 
>  Sounds to me like a good idea.
> 
>  Let's add Yann, Samuel and Luca in Cc as CMake experts :-P

I wonder at what time I gained this expertise level in a tool I rarely
use... ;-)

> For their
> convenience, here is the patch inline:
> 
> > --- /tmp/toolchainfile.cmake.in.orig    2018-03-25 12:32:03.353000419 +0200
> > +++ /tmp/toolchainfile.cmake.in 2018-03-25 12:32:52.647000419 +0200
> > @@ -58,8 +58,8 @@
> >  set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
> >  
> >  # This toolchain file can be used both inside and outside Buildroot.
> > -set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
> > -set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
> > +set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@" CACHE STRING "C Compiler")
> > +set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@" CACHE STRING "CXX Compiler")

I have absolutely no clue what this means...

Regards,
Yann E. MORIN.

> >  if(@@TOOLCHAIN_HAS_FORTRAN@@)
> >    set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
> >    set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
> 
> 
>  Michael, could you resubmit as a proper patch with commit log and
> Signed-off-by? See [1].
> 
>  Regards,
>  Arnout
> 
> [1] https://buildroot.org/downloads/manual/manual.html#submitting-patches
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
