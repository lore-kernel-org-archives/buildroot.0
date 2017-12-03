From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 3 Dec 2017 08:05:00 -0600
Subject: [Buildroot] [PATCH 2/2] kvmtool: bump to f77d646ba0
In-Reply-To: <20171203145407.78bab7c2@windsurf.home>
References: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
 <20171203033321.13460-2-matthew.weber@rockwellcollins.com>
 <20171203145407.78bab7c2@windsurf.home>
Message-ID: <CANQCQpaQzSj_4cKDAnGViSySBFgWmywc2mjdWgEiG2WfW7eLXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Dec 3, 2017 7:54 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Sat,  2 Dec 2017 21:33:21 -0600, Matt Weber wrote:
> Commit used:
> 2017-11-03 16:19:58 +0000
> irq.h: fix compilation error due to missing bool type
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This breaks the build:

  LINK     lkvm
x86_64-amd-linux-gnu-gcc: error: elf_x86_64: No such file or directory
x86_64-amd-linux-gnu-gcc: error: unrecognized command line option '-m'
make[2]: *** [Makefile:384: lkvm] Error 1
make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/
buildroot/output/build/kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e/.stamp_built]
Error 2
make: *** [Makefile:79: _all] Error 2

With the following defconfig:

BR2_x86_64=y
BR2_x86_steamroller=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_KVMTOOL=y
# BR2_TARGET_ROOTFS_TAR is not set


(Pardon the rich text, just have my tablet this morning)

I forgot to run both of the kvm updates through testpkg, so I'll do that
and take a look at this one.

Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171203/f2167b02/attachment.html>
