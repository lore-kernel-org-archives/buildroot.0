From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:38:08 +0200
Subject: [Buildroot] [PATCH] lz4: don't build library and tools in
 parallel
In-Reply-To: <a05bf34066818014319e5f1f388a7f8ea0d52493.1524344332.git.baruch@tkos.co.il>
References: <a05bf34066818014319e5f1f388a7f8ea0d52493.1524344332.git.baruch@tkos.co.il>
Message-ID: <20180422233808.48ca70a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Apr 2018 23:58:52 +0300, Baruch Siach wrote:
> Since commit e93fec6673e (lz4: bump to version 1.8.1.2) we use two make
> targets, 'lib' and 'lz4'. Both targets depend on the static library.
> When these targets run in parallel the two make instances that build the
> static library race against each other. Split these targets to ensure
> build order.
> 
> Should fix:
> http://autobuild.buildroot.net/results/a8d/a8d956ff420f6a265c5c00b33646dbbc24ce2d48/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lz4/lz4.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
