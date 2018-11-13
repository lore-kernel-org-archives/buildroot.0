From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 13 Nov 2018 10:10:34 +0100
Subject: [Buildroot] Building u-boot on PowerPC64 (but u-boot only supports
 32 bits)
Message-ID: <CAM+bi4taykZ3P631XxP3uwGubbKFCb-BSp+dJaiixpKMK3jweA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm facing the same problem as discussed here
https://community.nxp.com/thread/376769

Basically, when compiling uboot against PowerPC64 e6500, buildroot fails
with this:
cc1: error: -mcall not supported in this configuration
cc1: error: -mrelocatable not supported in this configuration
cc1: error: -meabi not supported in this configuration

The explanation is that u-boot doesn't support 64 bits builds of
(some/all?) PowerPC CPUs.

Of course, the solution to this is simply to use a 32 bit toolchain, but I
don't want to use a 32 bit toolchain on all the other parts that my root
filesystem consists of, including both kernel and applications.

So, here's the question: is there anyway to make buildroot generate TWO
toolchains, in 32 and 64 bit versions, and mark specific packages (in this
case, u-boot) to use one or the other?

I can no doubt create another project that is intended only for building
u-boot, but then why would I use buildroot instead of simply compiling
u-boot? I'd really like to have everything integrated on buildroot, and I
guess this can be useful for any other packages.

Thank you, best regards!

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181113/460cb8ec/attachment.html>
