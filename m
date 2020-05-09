From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:42:12 +0200
Subject: [Buildroot] [PATCH v1 1/4] exfatprogs: fix 64-bit types printf
 compile failure
In-Reply-To: <20200509162117.8728-1-ps.report@gmx.net>
References: <20200509162117.8728-1-ps.report@gmx.net>
Message-ID: <20200509224212.16b3b8f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 May 2020 18:21:14 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   - http://autobuild.buildroot.net/results/a7364a6b3801d7d18c30c7242c6faf19431fddfd
> 
>   mkfs.c:60:14: error: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'long unsigned int' [-Werror=format=]
>     exfat_debug("Volume Length(sectors) : %llu\n",
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...PRIu64-PRIx64-to-printf-64-bit-types.patch | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 package/exfatprogs/0002-mkfs-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
