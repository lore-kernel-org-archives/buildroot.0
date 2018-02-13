From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 13:32:30 +0100
Subject: [Buildroot] [PATCH 1/2] musl: add more kernel headers guards
In-Reply-To: <00926ed70cd14972bac0ce653b1f383b4a31492c.1518524870.git.baruch@tkos.co.il>
References: <00926ed70cd14972bac0ce653b1f383b4a31492c.1518524870.git.baruch@tkos.co.il>
Message-ID: <20180213133230.3a99ae2c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tue, 13 Feb 2018 14:27:49 +0200, Baruch Siach wrote:
> Kernel version 4.15 (not 4.16 as the musl commit log claims) allows
> disabling of more parts of the kernel headers definitions. Add upstream
> musl patch that defines the relevant macros. This solves issues of
> networking related symbols redefinition in kernel headers that cause
> headers conflicts. With that in place a subsequent commit will limit the
> musl/kernel headers conflict avoidance workaround in Buildroot to kernel
> headers older than 4.15. This workaround has been introduced in commit
> 196932cd91 (toolchain: workaround musl/kernel headers conflict).
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks for those patches, it's great to see that you continue to
follow this header conflict issue. You didn't specify explicitly if you
intend them for master or next. At this point, I don't see a reason to
need them for master, so it's probably material for next. Do you agree ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
