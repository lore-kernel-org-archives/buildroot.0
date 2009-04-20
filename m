From: Chad <dreveny@gmail.com>
Date: Mon, 20 Apr 2009 10:54:55 -0500
Subject: [Buildroot] undefined reference to `raise' when linking with libgcc
Message-ID: <6712b820904200854t78383b2at85e09c263584329b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm a bit of a noob to the list so I hope I'm not re-hashing issues I
keep encountering (I couldn't seem to find any recent mention of
them).? Perhaps someone can help.? I've been trying to get together an
arm cross compiler.? I used to use Dan Kegel's crosstool, which was
nice, but it's quite outdated now.? I want to build with newer tools
and features and am trying to get a kernel working eventually.

First, I thought I'd try to build for a generic ARM OABI, since I
believe it's more backwards compatible.? From what I understand, the
EABI is much better.? I'd like to use that eventually, but may need to
rebuild everything in order to be compatible (and have a compatible
kernel too?).

Buildroot worked great!? However, upon compiling an old project that
had once worked with the older crosstool generated compiler, I keep
encountering the following link error, when linking with libgcc:

/home/chad/openfi/arm_oabi/buildroot-2009.02/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.3.2/libgcc.a(_dvmd_lnx.o):
In function `__div0':
/home/chad/openfi/arm_oabi/buildroot-2009.02/toolchain_build_arm/gcc-4.3.2/libgcc/../gcc/config/arm/lib1funcs.asm:1079:
undefined reference to `raise'

I have found some references in the buildroot mail list archives from
2007 to a patch that was needed (for gcc-4.2.0), but it doesn't appear
that this was ever corrected permanently
(http://lists.busybox.net/pipermail/buildroot/2007-July/016299.html).
From what I understand, uClibc doesn't supply the 'raise' function and
triggering it needs to be avoided.  Now, I'm not sure if this is
strictly a buldroot problem or a uClibc issue, since buildroot does
apply some patches to the subprojects.  The pach seemed to avoid a
possible divide by 0 (even though the divisor is a constant) which
would otherwise trigger the linking of __div0 and raise.

I could fix it on my copy, but it would seem like this would come back
with the next release.

Is this something that could be fixed in buildroot or uClibc or is it
too architecture specific?  If so, should a bug be raised against one
of these projects?

Thanks,

- Chad
