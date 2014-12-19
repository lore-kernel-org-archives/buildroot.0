From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 19 Dec 2014 11:33:10 -0800
Subject: [Buildroot] Using external toolchain
Message-ID: <CALo-6+iOGt+y1JjC8AaJ3vpck_tb1h7ZTSAd3LBcypfwGCZRfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working with buildroot 2011.02 on a project which is in production and
the company wishes to change to a newer toolchain, crosstools-ng version
1.20.0 (gcc-4.9.1).

I set in the toolchain with the location and prefix, but the build fails
with an incorrect sysroot.

For instance, the toolchain is at:

/opt/toolchains/powerpc-econolite_e300c2-linux-gnu/bin/powerpc-econolite_e300c2-linux-gnu-gcc

But the sysroot comes out:

--sysroot=
*/home/ckrinke/asc4_bsp/buildroot-glibc/output/host/usr/powerpc-unknown-linux-gnu/sysroot*

Note the "econolite" vs the "unknown" in the tuple. This is complicated by
the fact that output/host/usr/power* is non-existent

I *think* that one can specify sysroot when compiling and would appreciate
a suggestion or two to get me out of this despicable place.

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141219/c1720243/attachment.html>
