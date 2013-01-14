From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jan 2013 21:14:34 +0100
Subject: [Buildroot] Autobuilder changes
Message-ID: <20130114211434.51782768@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For information, I've done a few changes to the autobuilders today:

 * I've upgraded all the external toolchains built with Buildroot. They
   have now been built with Buildroot 2012.11.1. The previously used
   toolchains had been built with 2012.05 or something like that.

 * I've slightly changed some of those toolchains, in order to reduce
   the number of ARM toolchains, and have a bit more toolchains from
   other architectures. Namely, I've removed the "br-arm-basic-cpp"
   toolchain (a ARM toolchain that has all special features disabled,
   except C++ that is enabled), it has been replaced by
   "br-powerpc-603e-basic-cpp", which does the same thing but for the
   PowerPC architecture. The br-arm-full-no-ipv6-no-rpc (all features
   enabled except RPC and IPv6) has been removed, and
   br-x86-64-atom-no-rpc-no-ipv6 has been added instead. So basically
   it removes two ARM toolchains in favour of one PowerPC toolchain and
   on x86-64 toolchain.

   Note that the toolchain tarballs are available from
   http://autobuild.buildroot.org/toolchains/tarballs/, and all the
   toolchain configurations being tested are available at
   http://autobuild.buildroot.org/toolchains/configs/free-electrons/.

 * The most important change is that I've tuned my build script to
   randomly add some more fun:

   - On 5% of the builds, it will now add BR2_ENABLE_DEBUG=y
   - On 5% of the builds, it will now add BR2_PREFER_STATIC_LIB=y
   - On 5% of the builds, it will now add
     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
     - In 33% of the builds that have
       BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y, it will add
       BR2_INIT_SYSTEMD=y

   Presumably, those changes are going to cause an increase in the
   number of build failures in the near future. If it gets too much to
   solve all those new problems at once, I'm of course ready to remove
   a bit of those changes and add things more progressively.

If you have suggestions on how to improve the tested configurations,
more ideas, do not hesitate to share them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
