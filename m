From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 3 Aug 2011 16:51:46 +0300
Subject: [Buildroot] [PATCH 1/3] bump udev and clean up
In-Reply-To: <4E394FFE.1020706@visionsystems.de>
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de>
 <871uxe10hq.fsf@macbook.be.48ers.dk> <4E2E67C8.7090208@visionsystems.de>
 <CALR4fEK2r2pL6X09pVUG970PUHxY+a52dvNdjjfVaoGLRnn3Mw@mail.gmail.com>
 <871uxcuqg0.fsf@macbook.be.48ers.dk>
 <CALR4fEKGFH5tq-25=j3DW-CVD5Uc-QxUeLoec-JLwSxNUhQw-w@mail.gmail.com>
 <87sjpst92p.fsf@macbook.be.48ers.dk>
 <CALR4fEKxDB+xH1_X+0xY9KWQXAz_g6zbrQHqzOB81J2jpOcnOg@mail.gmail.com>
 <CALR4fEL2EY3sU74wXUUW=c3z5MOrYNHfMki-VEKgFCn_7yZGvg@mail.gmail.com>
 <CALR4fEJ7ymSGNW39VeaY5iWQ7zTCLMFm0eAApkFi4PyJaBpAhA@mail.gmail.com>
 <4E394FFE.1020706@visionsystems.de>
Message-ID: <CALR4fE+bUUS0Bs+=-hZyRLR-mHrb5z56ecNbqyvdWjpqMhkBTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 3, 2011 at 4:41 PM, Yegor Yefremov
<yegor_sub1@visionsystems.de> wrote:
>> Is the problem caused by my side (I am using tmpfs, and not udevfs,
>> and my kernel is *way* old). What is the equivalent of udevstart in
>> udev?
>
> I've looked at what Debian maintainers do:
>
> they use udevadm trigger --action=add
>
> http://linux.die.net/man/8/udevadm
>
> With the newer kernel you don't have such a problem as empty /dev/, because in BR devtmpfs will be used to fill that directory before mounting rootfs. So just starting udevd is sufficient.

Running "udevadm trigger" inside S10udev seem to fix the problem for
me. I still need to understand the differences between all flags (the
readme says --type=subsystems,-devices).

Is any one else affected from the move to a newer udev version like I am?
