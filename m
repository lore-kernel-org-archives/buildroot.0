From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 16 Feb 2012 15:56:28 -0000
Subject: [Buildroot] Report of the Buildroot Developer Day, February 3,
	2012 - Legal info
In-Reply-To: <201202161353.55663.yann.morin.1998@free.fr>
References: <201202160044.29316.arnout@mind.be>
 <BE5319E74F9A446BA391A54D7377663E@beraninstruments.com.local>
 <201202161353.55663.yann.morin.1998@free.fr>
Message-ID: <693B986947CB45D88A74905A3FE031FC@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> -----Original Message-----
> From: Yann E. MORIN [mailto:yann.morin.1998 at free.fr]
> Sent: 16 February 2012 12:54
> To: buildroot at busybox.net
> Cc: Will Moore; 'Arnout Vandecappelle'
> 
> Will, All,
> 
> On Thursday 16 February 2012 13:17:51 Will Moore wrote:
> > Without getting into a lot of IANAL stuff (!) please could somebody explain
> to
> > me why the cross-compiler for GPLv2 packages is included in this list?
> 
> Because the it is not (see section 3 of the GPL text) :
>   "normally distributed [...] with the major components [...] on which the
>    executable runs."

Thanks for the reference.

> 
> For embedded systems, there is propbably no compiler running on the target,
> so it can not be considered "normally distributed" on that system.

So that would include all the buildroot built host tools?  Hence (typically)
most of /dl?

> 
> Also, bits from the compiler can end up on the target rootfs (eg. libgcc.so).
> And the C library also (libc.so et al.).

My understanding is that the gcc gpl runtime exclusion would normally mean that
this does not count as distributing gcc, but now we are cross compiling your
reference above kicks in.
 
> 
> So, it is easier to play it safe-and-sound, and provide the complete source
> of the toolchain. Then, it will be the responsibility of the buildroot user
> to decide whether it is required or not to distribute it, and whether or not
> to actually distribute it. As Arnout wrote:
> > It is up to the user's legal office to decide what will actually
> > be released and what not.
> 
> But, of course: IANAL ! ;-)

Me neither!
 
Regards,


Will

> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.-------------------
> -.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy:
> |
> | +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^
> |
> | --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no
> |
> | http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.
> |
> '------------------------------'-------'------------------'-------------------
> -'
