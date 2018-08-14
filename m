From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 16:21:30 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: kconfig needs host-{flex,
 bison} to build the configurators
In-Reply-To: <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
Message-ID: <20180814162130.00f55418@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Aug 2018 22:16:55 +0200, Yann E. MORIN wrote:
> Take this opportunity to also drop the append-assignment as the first
> assignment to LINUX_DEPENDENCIES.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I am a bit confused. In this series, you suggest to make
host-flex/host-bison dependencies of the configuration step of Linux.
But in another series
(http://patchwork.ozlabs.org/project/buildroot/list/?series=59260), you
suggest to make flex/bison hard requirements of Buildroot, so that we
don't have to build them.

Could you clarify in which direction you would like to go ? Also, if we
make bison/flex hard requirements of Buildroot, I'd like to have a
clear rule on whether we keep or not our host-bison/host-flex packages,
and if we keep them, when they should be used vs. when the system
bison/flex should be used.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
