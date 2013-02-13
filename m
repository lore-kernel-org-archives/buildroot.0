From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Feb 2013 23:57:27 +0100
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <20130213231346.0ed68b45@skate>
References: <20130209195709.323b9f5e@skate> <20130213231346.0ed68b45@skate>
Message-ID: <201302132357.27593.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 13 February 2013 Thomas Petazzoni wrote:
> On Sat, 9 Feb 2013 19:57:09 +0100, Thomas Petazzoni wrote:
> 
> >  * Give me suggestions on what to demonstrate. I will prepare a
> >    slideshow of 10-20 slides that continuously loops (it should
> >    present the main characteristics and features of Buildroot), but I
> >    also would like to have some demo to show (I can bring an ARM board
> >    if needed). Any suggestions, both for the slideshow and the demo?
> 
> The current state of the slides is visible at
> http://free-electrons.com/~thomas/pub/buildroot-slides.pdf.

Looks good! :-)
Slide 7:
  - beware automatic line-wrapping: U-Boot gets splitted as:
        U-
        Boot
  - I'd add busybox, it's well-known enough to warrant its presence
    on the slide

> The two slides about build time and system size are still empty, I'm
> currently making the experiments to get the numbers.

It'd be interesting to have:
  - build time with internal toolchain
  - build time with an external toolchain

Also, I wonder how and how much we could evaluate the Buildroot overhead.
For example, considering a system that only has buildroot in it, how long
does it take to build busybox, compile the filesystem generator (eg.
genext2fs and fakeroot) and assemble the file system images, all manually
(but only couting the build time, not the manual keying of the commands),
and how long does it take Buildroot to achieve the same?

If you can provide the .config files for your test setup, I'll try to come
up with a script that just rolls out all required commands, and time the
result.

/me expects something less than a 1% overhead, or even in the measure
noise, for simple .configs, and even less for bigger .configs... :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
