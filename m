From: Heiko Zuerker <heiko@zuerker.org>
Date: Fri, 10 Dec 2010 08:23:10 -0600
Subject: [Buildroot] skeleton updates
In-Reply-To: <158894.53583.qm@web58205.mail.re3.yahoo.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>	<da8a618d7ebd5da7e48fccbab506f3e7b7a5cdd8.1291582351.git.thomas.petazzoni@free-electrons.com>
	<158894.53583.qm@web58205.mail.re3.yahoo.com>
Message-ID: <002a01cb9875$c5f3b5b0$51db2110$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Steve Calfee
> Sent: Friday, December 10, 2010 12:47 AM
> To: Thomas Petazzoni; buildroot at uclibc.org
> Subject: [Buildroot] skeleton updates
> 
> Hi Guys,
> 
> I am trying to follow up with Marcus Osdoba's work on dockstar and get
> something ready to submit to buildroot.
> 
> I am having a real problem figuring out how stuff makes it into the the
final
> etc directory. My patch script in the
> target/device/sheevaplug/SeagateDockStar/patchrootfs.sh copies new files
> (inittab and shadow into output/target/skeleton/etc/ and this happens on
> re-invocation of make. However when I look at the rootfs.tar file the
> updated inittab is not there. Can anyone describe how the various /etc/
files
> in fs/skeleton and target/device/...skeleton and the final patch file get
to the
> final output image files.

The best place to add these customizations is BR2_ROOTFS_POST_BUILD_SCRIPT,
which you can find under "Target filesystem options" in menuconfig.
This script is called after everything is build, but before the target
filesystem is generated.

Here's the example I use:
BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/$(BOARD_PATH)/customize_target.sh"

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
