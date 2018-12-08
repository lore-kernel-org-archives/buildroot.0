From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 20:50:45 +0100
Subject: [Buildroot] [PATCH] boot/afboot-stm32: create destination
 directory during installation
In-Reply-To: <20181208141854.29144-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 8 Dec 2018 15:18:54 +0100")
References: <20181208141854.29144-1-thomas.petazzoni@bootlin.com>
Message-ID: <871s6r6bmy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Following d0f4f95e390bcb1c953efa125f5277a8a235396e ("Makefile: rework
 > main directory creation logic"), BINARIES_DIR is not implicitly
 > created by the main Makefile at the beginning of the build, leaving
 > that up to whatever piece of code needs to install something in
 > $(BINARIES_DIR).

 > The afboot-stm32 package didn't pay attention to this, which this
 > commit fixes.

 > While at it, we move the afboot-stm32 installation into
 > <pkg>_INSTALL_IMAGES_CMDS, because using <pkg>_INSTALL_TARGET_CMDS to
 > install only files to BINARIES_DIR is a bit strange.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/131217111

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
