From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 21:37:13 +0100
Subject: [Buildroot] [PATCH] package/owfs: fix link with FUSE
In-Reply-To: <1457295860-30898-1-git-send-email-yann.morin.1998@free.fr>
References: <1457295860-30898-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160306213713.307f1de7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  6 Mar 2016 21:24:20 +0100, Yann E. MORIN wrote:
> owfs reinvents its own weird and wicked mechanism to find libfuse. It
> believes that, by default, FUSE is installed in /usr/local, and forcibly
> uses that path to look for headers and libs.
> 
> This is obviously wrong in cross-compilation, and triggers our check for
> unsafe header/library paths.
> 
> The best option to fix that would be to use pkg-config to find FUSE, but
> this is a bit involved. Instead, use config options to specify the path
> to the headers and libs.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/2c8/2c8baf6910d7ac2e3c92efa62cc3b9d3737e1fb5/
>     http://autobuild.buildroot.org/results/1f9/1f994f53ceca434ebd1d87923f85b5ed71229d94/
>     and a few others...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/owfs/owfs.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
