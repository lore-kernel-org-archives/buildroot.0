From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Aug 2013 19:59:07 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
 sub-menu
In-Reply-To: <CAAXf6LVX6TR+dPhS_FGHZpf+-_j_XBaCVaQxFY+MFp=O7m+LNA@mail.gmail.com>
References: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
 <520D5FE6.2090007@mind.be>
 <CAAXf6LV8gfZUmLogOubg5j03d9HJR7-bm+cm+HDG-N6kNAiK_g@mail.gmail.com>
 <201308160839.05082.yann.morin.1998@free.fr>
 <CAAXf6LXZ3vzUfexiNiGZu-c-chMZ0rKOpGs=N9APmTO_Y63wRg@mail.gmail.com>
 <CAAXf6LVX6TR+dPhS_FGHZpf+-_j_XBaCVaQxFY+MFp=O7m+LNA@mail.gmail.com>
Message-ID: <20130816175906.GA3422@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-08-16 12:30 +0200, Thomas De Schampheleire spake thusly:
> On Fri, Aug 16, 2013 at 12:24 PM, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
> > On Fri, Aug 16, 2013 at 8:39 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> Thomas, Arnout, All,
> >>
> >> On Friday 16 August 2013 08:30:43 Thomas De Schampheleire wrote:
> >>> On Fri, Aug 16, 2013 at 1:10 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> >>> > On 15/08/13 22:28, Yann E. MORIN wrote:
> >>> >>
> >> I would even put the kernel before the packages, and bootloaders before
> >> kernel. Ie. I'd use the boot-time order of things:
> >>     (Target options)
> >>     Build options
> >>     Toolchain
> >>     System configuration
> >>     Bootloaders
> >>     Kernel
> >>     Packages selection
> >>     Filesystem images
> >>     Host Utilities
> >>     Legacy config options
> >>
> >> Bizzarely enough, moving bootloaders before kernel seems odd... :-/
> >
> >
> > I can follow this boot-time order strategy, but I concur with the
> > bootloader oddity.
> 
> [sorry, accidentally hit send button]
> 
> Here is a slightly different viewpoint: some users will never touch
> the bootloader. However, creating a kernel and rootfs (possibly
> attached to the kernel) is very common. This can result in the
> following order:
> 
> (Target options)
> Build options
> Toolchain
> System configuration
> Kernel
> Package selection for the target
> Filesystem images
> Bootloaders
> Host Utilities
> Legacy config options

Hey! It looks good to me! :-)
I'll handle this. Thanks!

> By the way: isn't it more logical to put 'Bootloaders' in singular
> (Bootloader), since one typically builds only one bootloader, just as
> one only builds one kernel...

This is two-sided:
  - either you consider what Buildroot has to offer: one kernel, and
    multiple bootloaders;
  - or you consider what the user may want to install on the targe, at
    most one kernel, and at most one bootloader.

I prefer the first option. If at some point in the future Buildroot gets
support for alternative kernels (GNU/Hurd, someone? ;-) ), then we'd
have to s/Kernel/Kernels/.

Consequently, "Package selection for the target" should be a plural
"Packages selection for target".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
