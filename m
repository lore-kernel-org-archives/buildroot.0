From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:35:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/openocd: add XDS110 option
In-Reply-To: <20210613144722.1461597-1-fontaine.fabrice@gmail.com>
References: <20210613144722.1461597-1-fontaine.fabrice@gmail.com>
Message-ID: <20210703233558.19235a80@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Jun 2021 16:47:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> XDS110 is available (and enabled by default) since version 0.11.0 and
> https://github.com/ntfreak/openocd/commit/2ba27e2f3edd37e5dce4b2a231d2ae84c14cb59a
> 
> It raises the following build failure without wchar:
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/.libs/libopenocd.a(src_jtag_drivers_libocdjtagdrivers_la-xds110.o): in function `xds110_handle_serial_command':
> xds110.c:(.text+0x368): undefined reference to `mbstowcs'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4536ed9124e77547c5e29f710fcafccc17b80a05
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openocd/Config.in  | 14 ++++++++++++++
>  package/openocd/openocd.mk |  1 +
>  2 files changed, 15 insertions(+)

Sorry, I am seeing your change just now, and in the mean time applied a
similar change from Baruch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
