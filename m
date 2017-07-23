From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 23 Jul 2017 15:13:41 -0300
Subject: [Buildroot] TestIso9660GrubExternal and TestIso9660GrubInternal
	failing
References: <20170723092643.GE2917@scaer>
Message-ID: <5974e7554c7c_30a1600b705951e@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I renamed the e-mail thread from:
[PATCH 20/20] support/testing: add runtime testing for init systems

On Sun, Jul 23, 2017 at 06:26 AM, Yann E. MORIN wrote:

> On 2017-07-23 09:58 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 23 Jul 2017 00:50:16 +0200, Yann E. MORIN wrote:
>> > > The patches fixing them are here:
>> > > 
>> > >   http://patchwork.ozlabs.org/patch/783135/
>> > >   http://patchwork.ozlabs.org/patch/783137/
>> > >   http://patchwork.ozlabs.org/patch/783136/
>> > > 
>> > > and nobody reviews them.  
>> > 
>> > I gave them a spin here, and they indeed fix the build, but the tests
>> > are still broken because qemu can't boot the resulting system...
>> > 
>> > I'll investigate that tomorrow...
>> 
>> Hum, weird, because I'm pretty sure I tested the test cases with those
>> patches. I'll test again, maybe I missed something.
> 
> So, to rule out any sleep-deprivation issue while testign yesterday
> evening, I re-spawn the tests here this morning, and they still do not
> run.
> 
> Maybe it is my qemu version?
> 
> I'll try and bisect them between July the 1st and now.

Since you are investigating this, let me provide some data I hope is useful.

My local computer has:
binutils 2.26.1
qemu 2.5.0

Using my local computer the tests TestIso9660GrubExternal and
TestIso9660GrubInternal always pass, in current master and also with the 3 grub
patches applied.

Using the image buildroot/base I can reproduce the problems:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23825707
GRUB requires a working absolute objcopy; upgrade your binutils
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23831270
==> System does not boot

If you need me to check versions for other tools in my local computer (Ubuntu
16.04.2, not plain vanilla), feel free to ask.

Regards,
Ricardo
