From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 16:53:08 +0200
Subject: [Buildroot] [PATCH 1/2] orangepi_zero_defconfig: bump u-boot to
 2018.07 to fix build issue
In-Reply-To: <20180816221601.16968-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 17 Aug 2018 00:16:00 +0200")
References: <20180816221601.16968-1-peter@korsgaard.com>
Message-ID: <87sh3davu3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > u-boot 2018.01 now fails to build with the following error:
 >   CC      arch/arm/lib/asm-offsets.s
 > In file included from /builds/buildroot.org/buildroot/output/host/include/libfdt.h:54:0,
 >                  from /builds/buildroot.org/buildroot/output/build/uboot-2018.01/scripts/dtc/libfdt/fdt.c:54:
 > /builds/buildroot.org/buildroot/output/host/include/libfdt_env.h:82:24: error: redefinition of 'fdt16_to_cpu'
 >  static inline uint16_t fdt16_to_cpu(fdt16_t x)
 >                         ^~~~~~~~~~~~
 > In file included from /builds/buildroot.org/buildroot/output/build/uboot-2018.01/scripts/dtc/libfdt/fdt.c:51:0:
 > /builds/buildroot.org/buildroot/output/build/uboot-2018.01/scripts/dtc/libfdt/libfdt_env.h:81:24: note: previous definition of 'fdt16_to_cpu' was here
 >  static inline uint16_t fdt16_to_cpu(fdt16_t x)

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/88314891

 > Fix it by bumping the u-boot version to 2018.07.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
