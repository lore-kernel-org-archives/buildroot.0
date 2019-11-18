From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 23:22:29 +0100
Subject: [Buildroot] [PATCH v3] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <20191115201908.8216-1-avraham.shukron@gmail.com>
References: <20191112220534.531a470f@windsurf>
 <20191115201908.8216-1-avraham.shukron@gmail.com>
Message-ID: <20191118232229.10a4f929@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 22:19:00 +0200
Avi Shukron <avraham.shukron@gmail.com> wrote:

> qemu requires python in its configre script. Yet host-python was
> not listed as one of the package's dependencies. If no other package
> requested host-python, then configuring this package will fail since
> it won't find any executable named python in the host dir.
> 
> In order to reproduce this issue you must not have python2 installed
> on your host machine.
> 
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
> ---
> Changes v2->v3:
> - Depend directly on host-python3, since it is already a transitive
>   dependency of qemu
> ---
>  package/qemu/qemu.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
