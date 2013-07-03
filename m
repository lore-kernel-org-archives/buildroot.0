From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jul 2013 19:31:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-07-02
In-Reply-To: <20130703191301.26fbb872@skate>
References: <20130703063004.ABFF552C4E3@lolut.humanoidz.org>
 <20130703165041.GB3268@free.fr> <20130703191301.26fbb872@skate>
Message-ID: <20130703173120.GC3268@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-03 19:13 +0200, Thomas Petazzoni spake thusly:
> On Wed, 3 Jul 2013 18:50:41 +0200, Yann E. MORIN wrote:
> 
> > On 2013-07-03 08:30 +0200, Thomas Petazzoni spake thusly:
> > > Detail of failures
> > > ===================
> > > 
> > >    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/bda11786649e8dd6f7d644bbe39c3d278fa37f9e/
> > 
> > Toolchain used is too old, and lacks up-to-date DVB headers for w_scan
> > to build:
> >     checking for linux/dvb/frontend.h presence... yes
> >     checking for linux/dvb/frontend.h usability (FE_CAN_2G_MODULATION)... yes
> >     checking for linux/dvb/frontend.h usability (DVB-T2, DVB API >= v5.3)... no
> > 
> > Toolchain is:
> >     freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu
> 
> Two options:
> 
>  * Modify the package source code so that it detects if the kernel
>    headers are present or not, and if not, uses a local copy of said
>    headers.

I don't like that. The copy will get stale over time, and that's bad IMHO.

>  * Blacklist the build of w_scan with this toolchain in the autobuilder
>    script.

I believe this is your choice to do that. ;-)

After all, I don't care such build failures happen; I would even expect
those, as long as we can recognise them easily.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
