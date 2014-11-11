From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 16:17:53 +0100
Subject: [Buildroot] Issues with Linaro and Musl external toolchains
Message-ID: <20141111161753.4840c172@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

If you are using the Linaro or Musl pre-built external toolchains and
want to see them being supported in Buildroot in the future, please
read on.

I've recently tried to update the Linaro and Musl external toolchains
to their latest versions, but unfortunately, both projects made some
changes that make the new pre-built toolchains they provide unsuitable
for Buildroot:

 * The Musl pre-built toolchains provided by musl-cross, since version
   1.1.2, have two problems: they no longer have sysroot support, and
   the kernel headers are broken. Both issues have been reported:

   https://bitbucket.org/GregorR/musl-cross/issue/5/sysroot-support-needed-for-buildroot
   https://bitbucket.org/GregorR/musl-cross/issue/6/non-standard-kernel-headers-causing-issues

   On Github (it's not clear whether the project uses Github or
   Bitbucket), at https://github.com/GregorR/musl-cross/issues/31, the
   maintainer of musl-cross did not seem to fully understand our need,
   as he simply suggested us to run musl-cross with the appropriate
   option to enable sysroot support. Which obviously doesn't make
   sense, because we want to use the pre-built Musl toolchains. If we
   were to build our own, we would be using the Buildroot internal
   backend, and not musl-cross.

 * The Linaro toolchains, since release 14.10, use a new build system
   called cbuildv2 instead of crosstool-ng. And their sysroot handling
   is completely broken, making their toolchain unusable in Buildroot.
   I've reported the issue upstream as well:

   https://bugs.linaro.org/show_bug.cgi?id=862

So far, I haven't had much luck in convincing the musl-cross maintainer
to change the Musl pre-built toolchains, and I also have some doubts
that Linaro folks will listen positively to my comments.

So, if you're using those toolchains, or interested in using them in
Buildroot, do not hesitate to speak up in the relevant bug reports. Of
course, if you can mention a company or product that is using Buildroot
and one of these toolchains, it's even better, as it'll show that
Buildroot is actually used for a number of real-world products.

If no changes are made upstream on Linaro toolchains and Musl pre-built
toolchains, the support for those will be removed in Buildroot in the
near future.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
