From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jan 2013 17:18:48 +0100
Subject: [Buildroot] Squashfs boot
In-Reply-To: <51000A62.9090309@petroprogram.com>
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
 <50FE8914.30909@petroprogram.com>
 <CAN_xxrVD=Tq=ekME-jdHKRzyUwXk0PMocQX9mrxxcgjZQ8SYqA@mail.gmail.com>
 <50FED12F.4050209@petroprogram.com> <20130123165719.2d62382c@skate>
 <51000A62.9090309@petroprogram.com>
Message-ID: <20130123171848.370ef451@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Wed, 23 Jan 2013 18:05:54 +0200, Stefan Fr?berg wrote:

> No.
> What I meant was, that if he is going to make it *without* buildroot
> (that is, if he can't get buildroot generated squashfs root to boot).
> *Then* he has to make his own init stuff to mount those /tmp
> and /var/log.

Ok. But then if Buildroot has a bug, let's fix the bug instead of
trying to work-around it, no?

> And my own solution is overly complex because I want the ability to
> write to squashfs, even if just temporarily.
> That's why I use initramfs + squashfs + unionfs

Indeed. You could still boot the root filesystem from squashfs, and
then mount a tmpfs and do the unionfs thing. There's no real need to
split usr/ in a squashfs in order to achieve this, I think.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
