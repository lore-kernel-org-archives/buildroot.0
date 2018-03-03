From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Mar 2018 23:10:30 +0100
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <20180301230214.lkzpfyad6m7p43jq@tarshish>
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
 <20180301100227.3fb09c06@windsurf.lan>
 <87lgfbiyk8.fsf@dell.be.48ers.dk>
 <20180301170807.2cd21163@windsurf.lan>
 <87a7vriudq.fsf@dell.be.48ers.dk>
 <20180301230427.28e24d47@windsurf.lan>
 <20180301222342.GF2449@scaer>
 <20180301230214.lkzpfyad6m7p43jq@tarshish>
Message-ID: <20180303221030.GA16780@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-03-02 01:02 +0200, Baruch Siach spake thusly:
> On Thu, Mar 01, 2018 at 11:23:42PM +0100, Yann E. MORIN wrote:
> > On 2018-03-01 23:04 +0100, Thomas Petazzoni spake thusly:
> > > On Thu, 01 Mar 2018 18:21:53 +0100, Peter Korsgaard wrote:
> > > >  >> dumb-init doesn't depend on any libraries, so the only issue is static
> > > >  >> linking with glibc, right?  
> > 
> > One can do a static link with glibc, as long as one does not do any name
> > resolution (username, hostname, etc...). But basically, static linking
> > with glibc has long been frowned upon...
> 
> This has changed a little recently. Toolchain support is still limited though. 
> glibc NEWS for 2.27 says:
> 
> * The GNU C Library can now be compiled with support for building static
>   PIE executables (See --enable-static-pie in INSTALL).  These static PIE
>   executables are like static executables but can be loaded at any address
>   and provide additional security hardening benefits at the cost of some
>   memory and performance.  When the library is built with --enable-static-pie
>   the resulting libc.a is usable with GCC 8 and above to create static PIE
>   executables using the GCC option '-static-pie'.  This feature is currently
>   supported on i386, x86_64 and x32 with binutils 2.29 or later, and on
>   aarch64 with binutils 2.30 or later.

Ah, interesting, thanks! :-)

I always wondered why pie and static were mutually exclusive...
Afterall, semantically they mean two orthogonal things.

Incidentally, I also always wondered why code was not
position-indpendent by default...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
