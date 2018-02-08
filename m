From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:50:07 +0100
Subject: [Buildroot] [NEXT] glibc: depends on host-bison
In-Reply-To: <20180207004849.21747-1-bluemrp9@gmail.com>
References: <20180207004849.21747-1-bluemrp9@gmail.com>
Message-ID: <20180208235007.45b8da07@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 16:48:49 -0800, Ryan Coe wrote:
> Fixes the following build error:
> 
> checking for bison... no
> checking if ./buildroot/output/host/bin/arm-rpi1-linux-gnueabihf-gcc is sufficient to build libc... yes
> checking for arm-rpi1-linux-gnueabihf-nm... ./buildroot/output/host/bin/arm-rpi1-linux-gnueabihf-nm
> checking for python3... python3
> configure: error:
> *** These critical programs are missing or too old: bison
> *** Check the INSTALL file for required versions.
> package/pkg-generic.mk:237: recipe for target './buildroot/output/build/glibc-glibc-2.27/.stamp_configured' failed
> make: *** [./buildroot/output/build/glibc-glibc-2.27/.stamp_configured] Error 1
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

I've improved the commit log a bit:

 - To indicate which glibc upstream commit changed to making bison a
   hard requirement. This allows to confirm it isn't an "accident" but
   really an intentional move from glibc upstream.

 - By replacing the error log by a reference to an autobuilder failure.

Thanks a lot for this fix, applied to next!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
