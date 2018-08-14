From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 21:53:44 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: kconfig needs host-{flex,
 bison} to build the configurators
In-Reply-To: <20180814152743.GJ7915@scaer>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
 <20180814162130.00f55418@windsurf> <20180814152743.GJ7915@scaer>
Message-ID: <20180814215344.20784816@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 17:27:43 +0200, Yann E. MORIN wrote:

> > Could you clarify in which direction you would like to go ?  
> 
> This very series is about solving a technical problem, that
> kconfig-based packages may have dependencies required even before
> running the configurators.
> 
> On the other hand, that other series is about changing our requirements.
> 
> If we decide to require flex+bison, so in this series, only patch 2 can
> be dropped.

OK.

> > Also, if we
> > make bison/flex hard requirements of Buildroot, I'd like to have a
> > clear rule on whether we keep or not our host-bison/host-flex packages,
> > and if we keep them, when they should be used vs. when the system
> > bison/flex should be used.  
> 
> My position is that we will always want to have our host flex and bison
> to build packages that install things in host/, in staging/ or in
> target/.
> 
> For the linux kernel and other kconfig-based packages, we don't care
> which flex/bison are used, because the resulting binaries are not
> installed, unless those packages also generate code eventually installed
> in host/, staging/ or target/

So the system-wide bison/flex would only be used for the kconfig
programs built by Buildroot itself (if we move to a newer kconfig
version that doesn't have the pre-generated files) or by
Linux/U-Boot/Busybox/Barebox. Any other use of flex/bison would use
host-flex and host-bison. That's your proposal ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
