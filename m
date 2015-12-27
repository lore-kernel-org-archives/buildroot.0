From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Dec 2015 18:04:37 +0100
Subject: [Buildroot] [PATCH 1/1] Add ARM11 MPCore CPU target support
In-Reply-To: <20151223231024.3c760e7b@free-electrons.com>
References: <BLU437-SMTP302AFC715EFB42C4E0320FC1020@phx.gbl>
 <20151128143030.GA3816@free.fr>
 <20151223231024.3c760e7b@free-electrons.com>
Message-ID: <20151227170437.GH3483@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-23 23:10 +0100, Thomas Petazzoni spake thusly:
> Sergi sent a v2 of his patch... but your suggestion doesn't work. See
> below.
> 
> On Sat, 28 Nov 2015 15:30:30 +0100, Yann E. MORIN wrote:
> 
> > I wonder if we should not make VFP optional, and change the CPU nme on
> > whether the user has enabled VFP, like:
> > 
> >     config BR2_arm11mpcore
> >         bool "mpcore"
> >         [...]
> >         select BR2_ARM_CPU_MAYBE_HAS_VFPV2
> >         [...]
> > 
> >     config BR2_GCC_TARGET_CPU
> >         [...]
> >         default "mpcore"        if BR2_arm11mpcore && BR2_ARM_CPU_HAS_VFPV2
> >         default "mpcorenovfp"   if BR2_arm11mpcore
> >         [...]
> 
> This doesn't work, because BR2_ARM_CPU_HAS_VFPV2 is not a user visible
> option, and there is nothing that selects it in the current Buildroot.
> Therefore the "mpcore" case can never be reached.
> 
> Consequently, I am tempted to take v1 of Sergi's patch. Yes, it means
> we don't support the no-VFP variant of ARM11 MPCore, but I'm not sure
> there are lots of ARM11 MPCore without a VFP, so maybe supporting
> mpcorenovfp is not worth the effort for the moment.
> 
> Thoughts?

I think that with the newly VFP stuff we committed today, we could
slightly rework that patch and make it work, no? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
