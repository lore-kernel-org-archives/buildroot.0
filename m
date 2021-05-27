From: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 27 May 2021 16:28:29 +0000
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
In-Reply-To: <20210527154435.GV3208066@scaer>
References: <bug-13586-163@https.bugs.busybox.net/>
 <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
 <20210527154435.GV3208066@scaer>
Message-ID: <638b4284c5ac4639b393d2ade58994dc@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN
> Sent: 27 May 2021 16:45
> 
> Andreas, All,
> 
> On 2021-05-27 17:33 +0200, Andreas Hilse via buildroot spake thusly:
> > following up on this because I also encountered this error.
> >
> > There is a bug report on the grub bug tracker by Tony Battersby who
> > bisected the error down to a certain patch/bugfix:
> > https://savannah.gnu.org/bugs/?60458
> >
> > The mentioned patch has also been included in buildroot as
> > boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch with
> > commit e840f2d469.
> >
> > I can also confirm, that removing that patch fixes the issue of grub
> > loop of endless rebooting.
> 
> Thanks for the report.
> 
> However, this patch is a security fix, so reverting it is not so nice
> either.
> 
> Since it seems that using another optimisation level works arorund the
> issue, I would be more inclined to change that, e.g. to -Os, as the
> reporter seems to imply it works for them.
> 
> Would you please send a patch with such a workaround, please?

Hmmmm if the code fails to compile with -O2 it is probably broken.
(Unlike -O3 which tends to be a compiler bug!)

So they may have replaced one security bug with another one.
The patch is too big to eyeball for errors.

I did manage to build grub with AVX support.
Spent ages working out why it wouldn't boot a kernel on an Atom.
(I knew userspace was broken.)
It is probably worth passing -mno-avx when building grub.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
