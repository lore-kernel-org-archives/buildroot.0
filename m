From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:25:28 +0200
Subject: [Buildroot] [PATCH] package/qt5base: fix qmake parallel build
In-Reply-To: <20190422095842.61772-1-giulio.benetti@micronovasrl.com>
References: <c060cbb3-21e2-5dcd-18ec-835106f2e682@micronovasrl.com>
 <20190422095842.61772-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190422222528.492c48ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Apr 2019 11:58:42 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> When configuring qt5base, qmake is built, but it's not built in parallel
> mode. This is due to MAKEFLAGS having 2 dashes on its tail, so this:
> MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)"
> expands in this(i.e. 5 njobs):
> MAKEFLAGS="--no-print-directory -- -j5"
> and -j5 gets ignored due to "--" preceeding -j5.
> Double dashes are part of $(MAKEFLAGS) only when evaluated by shell.
> 
> Swap $(MAKEFLAGS) and -j$(PARALLEL_JOBS) to avoid having "--" before
> -j$(PARALLEL_JOBS), this way -j$(PARALLEL_JOBS) won't be ignored by
> ./configure.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
