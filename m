From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jan 2013 14:19:07 +0100
Subject: [Buildroot] Udev generates too many tty dev nodes
In-Reply-To: <CAKvQZ_085YC_LpJhD5Oxq6KOg9mnRY1O6KSRw75+++6+Fh_+SA@mail.gmail.com>
References: <CAKvQZ_2FEFO7BNqkzXTCeH5+scxg6ZhuW+Ruy99Q8xxivjhx_w@mail.gmail.com>
 <20130117135505.56db811a@skate>
 <CAKvQZ_085YC_LpJhD5Oxq6KOg9mnRY1O6KSRw75+++6+Fh_+SA@mail.gmail.com>
Message-ID: <20130117141907.3d71a934@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Thu, 17 Jan 2013 14:05:46 +0100, Willy Lambert wrote:

> I do ^^. The bad argument is that I hate having mess on my device,
> especially when typing "ls /dev". The good one is that if something
> behave strangly I like to tackle the root cause. It's not an
> industrial projet, it's a personnal one on which I can take the time I
> want to look at everything I like :D. And in this case I do *not* have
> a need for 64 ttys and I did *not* (at least consciently) ask for
> having them. So somehting, somewhere is doing thing on my back, and I
> want to know what.
> 
> udev is supposed to show only what's available or in use. It's sure
> that some of those devices are not meeting this criterias.

Those devices *are* available. They have been registered by the kernel,
so they are available, and it makes perfect sense for udev to create
device files for them.

If you really don't want to see them in /dev, then create a udev rule
to not create those device files. See the answer at
http://unix.stackexchange.com/questions/25021/change-the-number-of-generated-dev-tty-devices
for a hint (not tested, not sure it is the correct way of writing the
udev rule, check udev's documentation).

At the kernel level, this number of tty is not configurable. It's
defined by MAX_NR_CONSOLES, and interestingly, this constant is part of
the kernel to userspace ABI, so I am not sure it is entirely safe to
change it to some other random value.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
