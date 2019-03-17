From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 16:07:23 +0100
Subject: [Buildroot] [PATCH 0/8 v2] support/graphs: fixup and speedup
 graph dependencies (branch yem/graphs-from-make-2)
In-Reply-To: <cover.1551608168.git.yann.morin.1998@free.fr>
References: <cover.1551608168.git.yann.morin.1998@free.fr>
Message-ID: <20190317160723.0748edce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Mar 2019 11:16:31 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thomas Petazzoni (1):
>       support/graph-depends: make sure mandatory deps are displayed
> 
> Yann E. MORIN (7):
>       support/graph-depends: add option to exclude mandatory deps
>       support/graph-depends: also cut on host-skeleton
>       support/graph-depends: also cut on host-tar
>       support/graph-depends: also cut on host-gzip
>       infra/pkg-generic: use pure Makefile-based recursive dependencies
>       core: add make-based full-dependency list

Applied series until there.

>       support/graph-depends: use the new make-based dependency tree

However, I didn't apply this one, because it breaks "make
<pkg>-graph-rdepends", with a "RuntimeError: maximum recursion depth
exceeded". The attached defconfig allows to reproduce the issue with
"make libusb-graph-rdepends".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: defconfig
Type: application/octet-stream
Size: 746 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190317/43727807/attachment.obj>
