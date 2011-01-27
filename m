From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jan 2011 08:33:49 +0100
Subject: [Buildroot] building for x86
In-Reply-To: <AANLkTin2T-7uSanijcVE1hNGKz-tYjSMP2r0GhOE5X_M@mail.gmail.com>
References: <AANLkTin2T-7uSanijcVE1hNGKz-tYjSMP2r0GhOE5X_M@mail.gmail.com>
Message-ID: <20110127083349.166be1dd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ravi,

On Thu, 27 Jan 2011 18:27:17 +1300
Ravi Chemudugunta <chemuduguntar@gmail.com> wrote:

> I am wanting to compile for an x86 target, and my host system is also
> x86, is it advisable to try and use the tool chain that comes with the
> distribution? (Debian Lenny).
> 
> I tried to do this by selecting external and getting rid of the
> prefix, however I get errors like the following:
> 
> -gcc command not found, my guess is that buildroot expects the
> 'arch-platform-' format.
> 
> I am assuming it would be easy enough to hack the make files so they
> don't affix an '-', however I am wondering whether this is even a good
> idea.  For example what happens at the staging to target area when for
> e.g. libc needs to be copied?

Definitely, using the host toolchain (that comes with the distribution)
as an external toolchain isn't supported.

For the external toolchain support, we need a "pure" toolchain, i.e a
toolchain with just the compiler, the binutils and the C and C++
libraries, because we copy the complete toolchain sysroot into
Buildroot's staging area. And the complete toolchain sysroot of your
host toolchain is /, which means that it would copy all your system
into Buildroot's staging directory.

So if you want to build a system for x86 with Buildroot and an external
toolchain, my recommandation would be to build a pure toolchain with
Crosstool-NG.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
