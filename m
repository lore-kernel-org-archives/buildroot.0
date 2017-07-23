From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 22:28:16 +0200
Subject: [Buildroot] TestIso9660GrubExternal and TestIso9660GrubInternal
 failing
In-Reply-To: <20170723200237.GJ26998@scaer>
References: <20170723092643.GE2917@scaer>
 <5974e7554c7c_30a1600b705951e@ultri3.mail>
 <20170723200237.GJ26998@scaer>
Message-ID: <20170723202816.GK26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-07-23 22:02 +0200, Yann E. MORIN spake thusly:
> On 2017-07-23 15:13 -0300, Ricardo Martincoski spake thusly:
> > On Sun, Jul 23, 2017 at 06:26 AM, Yann E. MORIN wrote:
> > > On 2017-07-23 09:58 +0200, Thomas Petazzoni spake thusly:
> > >> On Sun, 23 Jul 2017 00:50:16 +0200, Yann E. MORIN wrote:
> > >> > > The patches fixing them are here:
> > >> > > 
> > >> > >   http://patchwork.ozlabs.org/patch/783135/
> > >> > >   http://patchwork.ozlabs.org/patch/783137/
> > >> > >   http://patchwork.ozlabs.org/patch/783136/
> > >> > > 
> > >> > > and nobody reviews them.  
> > >> > 
> > >> > I gave them a spin here, and they indeed fix the build, but the tests
> > >> > are still broken because qemu can't boot the resulting system...
> > >> > 
> > >> > I'll investigate that tomorrow...
> > >> 
> > >> Hum, weird, because I'm pretty sure I tested the test cases with those
> > >> patches. I'll test again, maybe I missed something.
> > > 
> > > So, to rule out any sleep-deprivation issue while testign yesterday
> > > evening, I re-spawn the tests here this morning, and they still do not
> > > run.
> > > 
> > > Maybe it is my qemu version?
> > > 
> > > I'll try and bisect them between July the 1st and now.
> > 
> > Since you are investigating this, let me provide some data I hope is useful.
[--SNIP--]
> I plan on doign those tests;
> 
>   - build on 16.04, run on 16.04
>   - build on 16.04, run on 17.04
>   - build on 17.04, run on 16.04

So, even before the tests are all done, I already noticed an issue here:
on my machine, the iso images are about 1GiB large, while on my server,
they are only a bit less than 5MiB.

So, it looks like this is a binutils issue, with objdump being the
culprit (it very much look like older similar issues).
I'll continue investigating...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
