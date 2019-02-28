From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Feb 2019 23:45:25 +0100
Subject: [Buildroot] [PATCH v1] zbar: needs c99 mode
In-Reply-To: <20190227220100.13536-1-ps.report@gmx.net>
References: <20190227220100.13536-1-ps.report@gmx.net>
Message-ID: <20190228234525.0cc23afb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Feb 2019 23:01:00 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes [1]:
> 
>   bar/sqcode.c: In function 'sq_scan_shape':
>   zbar/sqcode.c:171:5: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
>        for (int x = x0 - 1; x < x0 + width + 1; x++) {
>        ^
>   zbar/sqcode.c:171:5: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
> 
> [1] http://autobuild.buildroot.net/results/7d544275756f655f9d42c05562aca653923155b1
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/zbar/zbar.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
