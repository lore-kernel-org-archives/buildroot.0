From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 20:14:45 +0200
Subject: [Buildroot] Binutils version used on MIPS
Message-ID: <20140701201445.3caa5150@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, Markos,

For the MIPS architecture, the current default binutils version in the
Buildroot internal toolchain backend is 2.21:

        prompt "Binutils Version"
        depends on !BR2_arc
        default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
        default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
        default BR2_BINUTILS_VERSION_2_22

Do you know if there's a good reason to keep using 2.21, as opposed to
a more recent version such as 2.23 or 2.24 ? It would be good to have a
little bit of testing done with binutils 2.23 or 2.24 and if it's
successful, bump the default version used on MIPS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
