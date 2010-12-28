From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 10:04:57 -0300
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>	<20101224090517.0c935c19@surf>	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
Message-ID: <4D19E079.9030704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/27/10 20:12, ANDY KENNEDY wrote:

> Gustavo,
> 
> Where did BR2_STAGING_DIR go?  I'm used to it being under Build Options,
> but I cannot find it.
> 
> In fact, when I put this in and did a make oldconfig it deleted my entry
> in the .config file.

Staging lives now in output/host/usr/tuple/sysroot, it's no longer an
option. We can keep

> Also, the gmp builds now -- they ifdef'ed out the asm code and replaced
> it with a do while (0) C code -- which makes more sense, I think.
> Though, I cannot get oprofile to build still.  The error message is:
> 
> /root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/mips-unkno
> wn-linux-uclibc/sysroot/usr/lib/libbfd.a(archures.o): relocation
> R_MIPS_HI16 against `__gnu_local_gp' can not be used when making a
> shared object; recompile with -fPIC
> /root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/mips-unkno
> wn-linux-uclibc/sysroot/usr/lib/libbfd.a: could not read symbols: Bad
> value

Oh, bad mips.
Ok, we need a shared libbfd, i was hoping to get away with a static one
but it seems not.
Fixed in git, pull again and retry.

> . . . and before you say anything, yes I build as root ;).

Please don't, things should work and are far less risky without root.

> You want me to work these issues with you off-list until we (ur, you)
> get it fixed, or shall I trim just reply to the list (removing the
> /root/src etc and making it look like it is in a user's dir).
> 
> I don't mind either way.
> 
> I'm gone for the evening.  I'll catch up with you in the morning.  Enjoy
> the long hours of sunlight and warm temperatures!!!
> 
> Andy 

Keep copying the list, maybe someone else is interested in this or can
chime in with an idea.
