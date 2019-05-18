From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:32:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/libupnp18: add upstream patch
 to fix runtime crash with musl
In-Reply-To: <20190509110438.31340-2-joerg.krause@embedded.rocks>
References: <20190509110438.31340-1-joerg.krause@embedded.rocks>
 <20190509110438.31340-2-joerg.krause@embedded.rocks>
Message-ID: <20190518233242.5d5880ff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 May 2019 13:04:38 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Applications build with a musl 1.1.20+ toolchain and linked with libupnpp will
> crash at runtime with `Illegal instruction` as musl is more strict with
> trying to detach an already detached thread resulting in undefined
> behaviour.
> 
> Upstream status:
> https://github.com/mrjimenez/pupnp/issues/102
> 
> Backported from:
> https://github.com/mrjimenez/pupnp/commit/04b454f693d0c71336252380d08f1d02967e133e
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...tach-detached-thread-the-result-is-u.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
