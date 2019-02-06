From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 16:04:50 +0100
Subject: [Buildroot] [RFC PATCH 1/2] annobin: New package
In-Reply-To: <20180503143147.5301-2-stefan.sorensen@spectralink.com>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
 <20180503143147.5301-2-stefan.sorensen@spectralink.com>
Message-ID: <20190206160450.0b2a899c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Thu,  3 May 2018 16:31:46 +0200
Stefan S?rensen <stefan.sorensen@spectralink.com> wrote:

> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

In the mean time, the package checksec was added, which is able to do
the same sort of checks on binaries to verify if they have been built
with specific security hardening options:

config BR2_PACKAGE_HOST_CHECKSEC
        bool "host checksec"
        help
          This tool provides a shell script to check the
          properties of executables
          (PIE,RELRO,Stack Canaries,Fortify Source).
          It also has a kernel test mode that can run on target
          for testing of PaX, ASLR, heap and config hardening.

          NOTE: when using this tool as a host tool, the tool
          can offline check a target folder of elf files for
          hardening features enabled in those elf files.  There
          are other features of this tool, like the kernel test
          feature that are not functional offline, but require the
          user to execute in a chroot or on target.

          https://github.com/slimm609/checksec.sh.git

This one is already in Buildroot, and is a lot easier to integrate than
a gcc plugin. So unless you see an issue with checksec that is solved
by annobin, we'll probably stick to using checksec.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
