From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:24:58 +0200
Subject: [Buildroot] [PATCH 1/1] packages/dmraid: mark as broken on
 nios2, _gp2 issue
In-Reply-To: <1438026704-13318-1-git-send-email-brendanheading@gmail.com>
References: <1438026704-13318-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150727222458.5988f479@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

In the title:

	_gp2 -> _gp

The patch doesn't mark dmraid as broken on NIOS II, it only excludes
some toolchains, so I changed the title to:

	dmraid: exclude nios2 sourcery toolchains, _gp issue

On Mon, 27 Jul 2015 20:51:44 +0100, Brendan Heading wrote:
>   Fixes : http://autobuild.buildroot.net/results/a7e2631d06634d768faf5c1d02712cc9b38562c6/
> 
> Investigation of nios2 config.log shows that this is caused by the
> "infamous" _gp2 link issue on codesourcery toolchains:

	_gp
> /home/bheading/dev/fix-dmraid/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: /home/bheading/dev/fix-dmraid/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
> /home/bheading/dev/fix-dmraid/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libdevmapper.so.1.02: error adding symbols: DSO missing from command line
> collect2: error: ld returned 1 exit status

Instead of these errors where you reproduced locally, I instead used
the error visible in the autobuilders. Maybe you didn't know that, but
the config.log is also available in the autobuilders. For this build,
it is available at:

   http://autobuild.buildroot.net/results/a7e/a7e2631d06634d768faf5c1d02712cc9b38562c6/dmraid-1.0.0.rc16-3/1.0.0.rc16-3/dmraid/config.log

Basically, for every build, all config.log files are saved. You can
access them by going into the directory of the build result:

   http://autobuild.buildroot.net/results/a7e/a7e2631d06634d768faf5c1d02712cc9b38562c6/

and then the subdirectory named after the package for which the build
failed.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
