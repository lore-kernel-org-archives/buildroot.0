From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 16:26:36 +0200
Subject: [Buildroot] [PATCH] package/qemu: fix crash with uClibc-ng
In-Reply-To: <20191019020928.2931-1-unixmania@gmail.com>
References: <20191019020928.2931-1-unixmania@gmail.com>
Message-ID: <20191020162636.16c339ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Oct 2019 23:09:28 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> On uClibc-ng sysconf(_SC_LEVEL1_{I,D}CACHE_LINESIZE) returns -1, which
> is a valid result, meaning that the limit is indeterminate. Add a patch
> that handles this situation using fallback values instead of crashing
> due to an assertion failure.
> 
> Upstream status:
>    https://lists.nongnu.org/archive/html/qemu-devel/2019-10/msg04115.html
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  ...fix-crash-when-compiling-with-uClibc.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
