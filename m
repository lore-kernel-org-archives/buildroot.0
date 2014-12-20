From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 16:10:11 +0100
Subject: [Buildroot] Using external toolchain
In-Reply-To: <CALo-6+iOGt+y1JjC8AaJ3vpck_tb1h7ZTSAd3LBcypfwGCZRfg@mail.gmail.com>
References: <CALo-6+iOGt+y1JjC8AaJ3vpck_tb1h7ZTSAd3LBcypfwGCZRfg@mail.gmail.com>
Message-ID: <20141220161011.48833511@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Fri, 19 Dec 2014 11:33:10 -0800, Charles Krinke wrote:
> I'm working with buildroot 2011.02 on a project which is in production and
> the company wishes to change to a newer toolchain, crosstools-ng version
> 1.20.0 (gcc-4.9.1).
> 
> I set in the toolchain with the location and prefix, but the build fails
> with an incorrect sysroot.
> 
> For instance, the toolchain is at:
> 
> /opt/toolchains/powerpc-econolite_e300c2-linux-gnu/bin/powerpc-econolite_e300c2-linux-gnu-gcc
> 
> But the sysroot comes out:
> 
> --sysroot=
> */home/ckrinke/asc4_bsp/buildroot-glibc/output/host/usr/powerpc-unknown-linux-gnu/sysroot*
> 
> Note the "econolite" vs the "unknown" in the tuple. This is complicated by
> the fact that output/host/usr/power* is non-existent
> 
> I *think* that one can specify sysroot when compiling and would appreciate
> a suggestion or two to get me out of this despicable place.

What you are seeing looks absolutely normal. Buildroot creates its own
sysroot, output/host/usr/powerpc-unknown-linux-gnu/sysroot, and copies
the necessary stuff from the originally sysroot location to this
Buildroot sysroot. This is done so that all other libraries built by
Buildroot get installed into this Buildroot specific sysroot, instead
of being copied back to the original sysroot, which would pollute your
toolchain.

So, if the build fails, please post:

 - Your complete .config file.
 - The last 100-200 lines of the build output.

Also, please try to reproduce with Buildroot 2014.11. Buildroot 2011.02
is very very old, and we've fixed/improved the external toolchain stuff
significantly since 3 and half years.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
