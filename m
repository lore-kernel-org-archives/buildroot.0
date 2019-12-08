From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:28:23 +0100
Subject: [Buildroot] [PATCH] package/gdb: Disable gdbserver if full gdb
 is enabled for ARC
In-Reply-To: <20191202134125.2545-1-Evgeniy.Didin@synopsys.com>
References: <20191202134125.2545-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20191208232823.0e18acea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Dec 2019 16:41:25 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> With recent update of ARC toolchain to arc-2019.09-eng/rc1 versions
> GDB package builds started to fail in autobuilder:
>  http://autobuild.buildroot.net/results/bc5/bc52d0012944e15dee30a6e00a92f23c87d0dfda//
> 
> This error was caused by 73cc72729a18 ("Move gnulib to top level")
> commit in binutils-gdb master branch and appears in ARC case because
> arc-2019.09 GDB is based on binutils-gdb master branch and includes
> this commit.
> 
> More information about this bug can be found there:
> https://sourceware.org/bugzilla/show_bug.cgi?id=24729
> https://sourceware.org/bugzilla/show_bug.cgi?id=25171
> https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/issues/30
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  package/gdb/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
