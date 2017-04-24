From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:19:12 +0200
Subject: [Buildroot] [PATCH v5] syslinux: build with the target toolchain
In-Reply-To: <1491555913-7951-1-git-send-email-benoit.allard@greenbone.net>
 (=?utf-8?Q?=22Beno=C3=AEt?= Allard"'s message of "Fri, 7 Apr 2017 11:05:13
 +0200")
References: <1491473086-16647-1-git-send-email-benoit.allard@greenbone.net>
 <1491555913-7951-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <87lgqpy5ov.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Allard <benoit.allard@greenbone.net> writes:

 > Until now, the host toolchain was used to build syslinux, as it was
 > not possible to build a 32-bit syslinux with a x86-64 toolchain.

 > However, syslinux requires gnu-efi, and gnu-efi is built using the
 > target toolchain. Mixing different toolchains doesn't work well, so
 > this commit changes the syslinux package to use the target toolchain
 > for syslinux as well. This is made possible by patches
 > 0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch and
 > 0004-memdisk-Force-ld-output-format-to-32-bits.patch.

 > Since syslinux also contains some utilities that have to run on the
 > host, those have to continue being built with the host toolchain,
 > which requires patch 0005-utils-Use-the-host-toolchain-to-build.patch.

 > Patch 0006-lzo-Use-the-host-toolchain-for-prepcore.patch is about
 > building prepcore, another utility with the host toolchain as it is
 > required at build-time.

 > This was tested using a Buildroot's built x86_64 toolchain, and
 > checked that the output binaries are 32-bits. It was tested as well if
 > they actually boot on hardware.

 > Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
