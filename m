From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:05:24 +0200
Subject: [Buildroot] [PATCH] linux: simplify LINUX_BUILD_CMDS
In-Reply-To: <20190408202136.22944-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 8 Apr 2019 22:21:35 +0200")
References: <20190408202136.22944-1-thomas.petazzoni@bootlin.com>
Message-ID: <87tven88zf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > We currently do the Linux build as follows:
 >    make <imagename>
 >    if modules enabled; make modules; fi

 > However, Clement L?ger recently reported that due to us not using the
 > "all" target, the GDB scripts that the kernel can build when
 > CONFIG_GDB_SCRIPTS is enabled are not built, since upstream kernel
 > commit 67274c083438340ad16c1437caebc84e1253b224 (merged in v5.1) moved
 > that logic to a separate scripts_gdb target, which is a dependency of
 > the "all" target.

 > While we could add some more logic to explicit generate the
 > "scripts_gdb" target, this logic would fail on Linux < 5.1 for which
 > this make target doesn't exist.

 > So instead, let's simplify the build logic, and use:

 >   make all <imagename>

 > The "all" target automatically depends on "modules", so we no longer
 > need to explicit generate the "modules" target separately.

 > As a result of this change, we may generate additional kernel images
 > compared to what was done previously, but such images would anyway not
 > be installed, and the additional built time is minimal.

 > We did some research as to why the kernel build was done like this in
 > Buildroot, and it's been like that since linux/linux.mk was added back
 > in 2010 by commit 487e21cff69b30b404146b2ffb46959a728a4002 ("New,
 > simpler, infrastructure for building the Linux kernel").

 > Reported-by: Cl?ment Leger <cleger@kalray.eu>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
