From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:05:54 +0200
Subject: [Buildroot] Setting Defaults for RISCV64 Architecture
In-Reply-To: <29a7876d-c734-e09c-4e60-8d62e08c7775@embecosm.com>
References: <862bfe2f-fc60-ead9-2b63-b6a0f23c59cd@embecosm.com>
 <20180814140305.0184f5a1@windsurf>
 <29a7876d-c734-e09c-4e60-8d62e08c7775@embecosm.com>
Message-ID: <20180814150554.3fdc4fd0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 13:35:37 +0100, Mark Corbin wrote:

> > For the Linux kernel itself, there isn't really a problem, as we allow
> > the user to select the Linux kernel version/source with lots of freedom
> > (arbitrary official version from kernel.org, arbitrary commit/tag from
> > a Git repository, arbitrary tarball, etc.).  
> I know that the options are pretty flexible,? but is there a good way to
> preselect the correct version for riscv64? At the moment the default is
> 'Latest version (4.17)' and the user would have to go and reconfigure
> this by hand to point at the custom git repo.

Nope, for the Linux kernel source code, I don't think we want to add
architecture-specific default versions. Just leave it to the user to
know which version to build. It's already something a user has to do on
other architectures as well: the vanilla v4.17 is not always the right
choice for a given HW platform.

> > However, there is a problem for the kernel headers. If the recently
> > released 4.18 kernel still doesn't have what's need for RISCV64, then I
> > guess we'll have to temporarily add a special Linux kernel headers
> > version in package/linux-headers/Config.in.host for RISCV64.  
> Is this for building the toolchain?

Yes, this is for building the toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
