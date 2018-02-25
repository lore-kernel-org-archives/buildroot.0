From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 22:27:53 +0100
Subject: [Buildroot] Adding package libgit2
In-Reply-To: <20180214163628.22360128@windsurf.lan>
References: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
 <20180214160622.789eb7e9@windsurf.lan>
 <f909d627-970f-490b-0c9f-678bb3461bc9@green-communications.fr>
 <20180214163628.22360128@windsurf.lan>
Message-ID: <20180225212753.GG2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, Thomas, All,

On 2018-02-14 16:36 +0100, Thomas Petazzoni spake thusly:
> On Wed, 14 Feb 2018 16:30:24 +0100, Nicolas Cavallari wrote:
> > > ARCH is set to ${CMAKE_SYSTEM_PROCESSOR}, and CMAKE_SYSTEM_PROCESSOR is
> > > explicitly passed by Buildroot in package/pkg-cmake.mk. So it should be
> > > correct. zlib-ng CMakeLists.txt uses its ${ARCH} variable to decide
> > > whether the x86 code should be built or not:
> > > 
> > > if("${ARCH}" MATCHES "x86_64" OR "${ARCH}" MATCHES "AMD64")
> > >     set(ARCHDIR "arch/x86")
> > >     add_definitions(-DX86_64 -DX86_NOCHECK_SSE2 -DUNALIGNED_OK -DUNROLL_LESS)
> > >     add_feature_info(SSE2 1 "Use the SSE2 instruction set, using \"${SSE2FLAG}\"")  
> > 
> > I have added --trace to cmake.  There is this gem a few lines below:
> > 
> > else()
> >     set(ARCHDIR "arch/x86")
> >     add_definitions(-DX86 -DUNALIGNED_OK -DUNROLL_LESS)
> >     add_feature_info(SSE2 1 "Support the SSE2 instruction set, using
> > \"${SSE2FLAG}\"")
> > endif()
> > 
> > So anything not arm/aarch64/x86 is treated like x86 anyway...
> 
> Which obviously is not going to work very well :)
> 
> I guess this should be fixed and/or reported to zlib-ng upstream. In
> the mean time, either we fix it, or we disallow zlib-ng on
> architectures other than arm/aarch64/x86.

Yes, let's limit zlib-ng to the only arch upstream supports.

I'll send a patch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
