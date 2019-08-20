From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Aug 2019 14:17:08 +0200
Subject: [Buildroot] Buildroot raspberrypi3_qt5we_defconfig no longer
 builds
In-Reply-To: <20190820114359.cw5qcdpku37q26ic@archlinux.localdomain>
References: <20190810103022.4b2f16f8@windsurf.home>
 <20190813124803.6dgpy73pln2hcjrn@archlinux.localdomain>
 <20190818144317.487720fc@windsurf.home>
 <20190820114359.cw5qcdpku37q26ic@archlinux.localdomain>
Message-ID: <20190820141708.54fbccac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Tue, 20 Aug 2019 07:43:59 -0400
Ga?l PORTAY <gael.portay@collabora.com> wrote:

> I had a look that week end.
> 
> I observed that there is some -isystem CFLAGS in the generated ninja
> files.
> 
> 	-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libpng16
> 	-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
> 	-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/freetype2
> 
> If I substitute the -isystem in -I, the file compile then but webgengine
> fails to the next subproject with -isystem flags.
> 
> IIUC, qtwebengine uses qmake that uses ng to generate ninja files.
> 
> I am looking for the culprit that introduces the -isystem flags. I am
> not yet familiar with ng/ninja, and I have basic knowledge of
> qmake only.

Did you check https://bugreports.qt.io/browse/QTBUG-53367, which seems
related, but more for qmake-generated Makefiles.

We have https://bugs.busybox.net/show_bug.cgi?id=11776, which is in
fact reporting two different qt5webengine issues, the second being the
same as the one you are facing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
