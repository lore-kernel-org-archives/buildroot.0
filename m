From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 07:49:21 +0200
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2019.03
 release
In-Reply-To: <20190619092532.40543-1-Evgeniy.Didin@synopsys.com>
References: <20190619092532.40543-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20190622074921.43631db1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jun 2019 12:25:32 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> This commit finally bumps ARC tools to the most recent arc-2018.09 release version.
> 
> ARC GNU tools of version arc-2018.09 bring some quite significant changes like:
>  * Binutils v2.32.51.20190308 with additional ARC patches
>  * GCC 8.3.1 with additional ARC patches
>  * glibc 2.29 with additional ARC patches
> More information on this release could be found here:
>  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.03-release

This release seems to have a new compiler bug, affecting a number of
packages. The failure looks like this:

   internal compiler error: in arc_legitimize_pic_address, at config/arc/arc.c:6104

See:

  http://autobuild.buildroot.net/results/288/28860e57593db31438d8516c0d3c6c3d6403c07e/build-end.log
  http://autobuild.buildroot.net/results/bd6/bd6bddbc20c98e9c903e1c9defebc2f5ddef7abc/build-end.log
  http://autobuild.buildroot.net/results/4b6/4b688cecce61ef885ea1f3f72ac50d8bfb2364b6/build-end.log

Did you already notice those failures ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
