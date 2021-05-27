From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 May 2021 22:37:21 +0200
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
In-Reply-To: <638b4284c5ac4639b393d2ade58994dc@AcuMS.aculab.com>
References: <bug-13586-163@https.bugs.busybox.net/>
 <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
 <20210527154435.GV3208066@scaer>
 <638b4284c5ac4639b393d2ade58994dc@AcuMS.aculab.com>
Message-ID: <20210527203721.GA2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2021-05-27 16:28 +0000, David Laight spake thusly:
> From: Yann E. MORIN
> > On 2021-05-27 17:33 +0200, Andreas Hilse via buildroot spake thusly:
> > > following up on this because I also encountered this error.
> > >
> > > There is a bug report on the grub bug tracker by Tony Battersby who
> > > bisected the error down to a certain patch/bugfix:
> > > https://savannah.gnu.org/bugs/?60458
> > >
> > > The mentioned patch has also been included in buildroot as
> > > boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch with
> > > commit e840f2d469.
> > >
> > > I can also confirm, that removing that patch fixes the issue of grub
> > > loop of endless rebooting.
> > However, this patch is a security fix, so reverting it is not so nice
> > either.
> > 
> > Since it seems that using another optimisation level works arorund the
> > issue, I would be more inclined to change that, e.g. to -Os, as the
> > reporter seems to imply it works for them.
> > 
> > Would you please send a patch with such a workaround, please?
> 
> Hmmmm if the code fails to compile with -O2 it is probably broken.
> (Unlike -O3 which tends to be a compiler bug!)
> 
> So they may have replaced one security bug with another one.

Maybe... However, I prefer we keep the patch that is actually known for
fixing a security issue, and workaround the breakage it introduces,
rather than revert it just because it "may have replaced one security
bug with another one."

If/when there is a report that an actual security issue is intriduced in
that patch, then we can reconsider, and evaluate which issue we want to
sacrifice.

Of course, if there is a better fix, then we can use that (I've looked
at their git tree, there is nothing I could identify).

In the meantime, I stand by my position that we should just work around
the isue by building with -Os, because at the very least it makes for a
bootable system again.

> The patch is too big to eyeball for errors.

Indeed.

> I did manage to build grub with AVX support.
> Spent ages working out why it wouldn't boot a kernel on an Atom.
> (I knew userspace was broken.)
> It is probably worth passing -mno-avx when building grub.

But this seems like a totally different issue, is it not?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
