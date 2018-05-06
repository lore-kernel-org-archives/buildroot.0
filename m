From: Jaap Crezee <jaap@jcz.nl>
Date: Sun, 6 May 2018 22:16:30 +0200
Subject: [Buildroot] boot failure
In-Reply-To: <2f8b7f67-4819-645d-2c97-c108656e78f5@micronovasrl.com>
References: <CO2PR01MB197635D773CF49B7A8986DEFCC840@CO2PR01MB1976.prod.exchangelabs.com>
 <87po29qj5g.fsf@dell.be.48ers.dk>
 <2f8b7f67-4819-645d-2c97-c108656e78f5@micronovasrl.com>
Message-ID: <f49f99ee-cdff-a14d-8470-26917b6605c9@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
> I'm experimenting the same thing with udev, this is my log:
> "
> [??? 5.334345] udevd[83]: starting version 3.2.5
> [??? 5.352869] random: udevd: uninitialized urandom read (16 bytes read)
> [??? 5.380840] random: udevd: uninitialized urandom read (16 bytes read)
> [??? 5.387495] random: udevd: uninitialized urandom read (16 bytes read)
> [??? 5.468700] udevd[84]: starting eudev-3.2.5
> [??? 6.445387] urandom_read: 1 callbacks suppressed
> [??? 6.445397] random: dd: uninitialized urandom read (512 bytes read)
> [??? 6.561425] random: dbus-uuidgen: uninitialized urandom read (12 bytes read)
> [??? 6.68793 random: dbus-uuidgen: uninitialized urandom read (8 bytes read)
> [??? 6.894495] random: crng init done
> [??? 6.897924] random: 2 urandom warning(s) missed due to ratelimiting
> "
> 
> Since complains with dropbear with Enoch and udev with me,
> it seems something kernel related, need to debug it.


Please try using packages like rngd & haveged to make sure all RNG hardware features are used to initialize the kernel random number generator as
early as possible. If you can generate (sort of random) interrupts during boot that will also help to speed up the initialisation.


Jaap
