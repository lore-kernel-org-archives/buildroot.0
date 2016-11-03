From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:16:45 +0100
Subject: [Buildroot] [PATCH v2] owfs: install python bindings in the
 correct location
In-Reply-To: <20161103203604.19427-1-arnout@mind.be>
References: <20161103203604.19427-1-arnout@mind.be>
Message-ID: <20161103221645.7f515094@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Nov 2016 21:36:04 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The owfs build system has a pretty complicated way of configuring the
> Python bindings. It ends up with setting PYSITEDIR to the host-python
> site-packages path, and it still prepends DESTDIR to that.
> 
> As a simple fix, override PYSITEDIR with the correct value on the make
> command line.
> 
> Fixes:
> http://autobuild.buildroot.net/results/200/200846650641494290aa67d28ea6fb2c9351d4dc
> http://autobuild.buildroot.net/results/99c/99c00248dd8b00071bcdbc73336cc276c68a4c16
> and many more
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: use an intermediate OWFS_EXTRA_MAKE_OPTS instead of directly
>     overwriting OWFS_MAKE, so it is easier to append stuff.
> ---
>  package/owfs/owfs.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
