From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Mar 2016 15:54:27 +0100
Subject: [Buildroot] [PATCH] toolchain-external: bump musl toolchain to
	1.1.12
In-Reply-To: <1457131807-15330-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 4 Mar 2016 23:50:07 +0100")
References: <1457131807-15330-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y49x561o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > While the prebuilt musl toolchains provided by http://musl.codu.org/
 > had not been updated in a while, a new release based on musl 1.1.12
 > has been put online in December 2015. This commit updates our external
 > toolchain package to use this new pre-built toolchain.

 > Compared to the previous 1.1.6 toolchain, there are some changes:

 >  - The MIPS big endian soft-float variant is no longer available.
 >  - The Microblaze variant is no longer available.
 >  - SuperH 4, both little and big endian, variants have been added.
 >  - The components have been updated: gcc 5.3 is used, binutils 2.25.1,
 >    and of course musl 1.1.12.

 > Besides the update itself, in this commit, we are:

 >  - Making the musl toolchain non-selectable on MIPS big endian
 >    soft-float.

 >  - Making the musl toolchain actually work on MIPS little endian
 >    soft-float, by downloading the right tarball and setting up the
 >    right symbolic link.

 >  - Removing support for the Microblaze variant, and adding support for
 >    the SH4 variants.

 > All variants except armeb have been boot tested under Qemu, up to a
 > Busybox shell prompt. armeb has not been tested due to the lack of a
 > Qemu configuration for this architecture.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
