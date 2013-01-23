From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jan 2013 16:57:19 +0100
Subject: [Buildroot] Squashfs boot
In-Reply-To: <50FED12F.4050209@petroprogram.com>
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
 <50FE8914.30909@petroprogram.com>
 <CAN_xxrVD=Tq=ekME-jdHKRzyUwXk0PMocQX9mrxxcgjZQ8SYqA@mail.gmail.com>
 <50FED12F.4050209@petroprogram.com>
Message-ID: <20130123165719.2d62382c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Tue, 22 Jan 2013 19:49:35 +0200, Stefan Fr?berg wrote:
> It's true that you can use squashfs to compress whole system but even
> in that case you have to
> make your own init script that will take care of all the magic of
> mounting. And because squashfs is read-only filesystem then it get's
> more trickier because you have to take care
> of yourself of all those /tmp and /var/log etc.. directories that need
> to store temporarily stuff.

Huh? Mounting a squashfs filesystem as the root filesystem is very
easy. Just use root=/dev/<whereyourrootfsis> and that's it.

Buildroot already mounts a tmpfs in /tmp and has several symlinks
from /var/<something> to /tmp.

So, with the basic default Buildroot configuration, there is absolutely
nothing complicated in having the entire root filesystem read-only
inside SquashFS. On several projects, I've generated a system with
Buildroot where the entire filesystem is read-only mounted. No problem
at all.

I think your solution is much more complex than just having the entire
root filesystem read-only.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
