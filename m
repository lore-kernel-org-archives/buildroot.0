From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:15:36 +0200
Subject: [Buildroot] [PATCH v3] package/irrlicht: add patch to fix
 libraries linking
In-Reply-To: <20200623182008.312994-1-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Tue, 23 Jun 2020 20:20:08 +0200")
References: <20200623182008.312994-1-b.bilas@grinn-global.com>
Message-ID: <87d04vv6cn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > This patch fix the irrlicht makefile which contains the paths
 > that point to the host system libraries that are not used and
 > are not available in Buildroot what's unsafe for cross-compilation.
 > In addition it fixes linking to the X11 libraries and the following errors:

 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `XSetSelectionOwner'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `glXGetProcAddress'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `glXMakeCurrent'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `XF86VidModeSetViewPort'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `XF86VidModeSwitchToMode'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `glClearDepth'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `XGetVisualInfo'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `XGrabKeyboard'
 > /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so:
 > undefined reference to `glMatrixMode'

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
 > ---
 > Changes v2 -> v3:
 >  - skipped overriding LDFLAGS variable in package makefile
 >  - skipped including extra $(STAGING_DIR)/usr/include path into CPPFLAGS
 >  - combined two patches into one

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
