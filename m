From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:30:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mtd: fix musl compile
In-Reply-To: <1429912563-20797-1-git-send-email-joerg.krause@embedded.rocks>
References: <1429912563-20797-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150425103035.3d3b9654@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 24 Apr 2015 23:56:03 +0200, J?rg Krause wrote:
> Update rpmatch patch to commit 5923077649ca167991a24ca05bd285fdf6fa1a06 and
> expand to musl. Rename it.
> 
> Add more patches to fix compile issues with musl.
> 
> Patches sent upstream:
> 1) "include/common.h: fix build against musl"
>    http://patchwork.ozlabs.org/patch/464074/
> 2) "lib/libfec.c: fix build against musl"
>    http://patchwork.ozlabs.org/patch/464073/
> 3) "serve_image: do not include error.h"
>    http://patchwork.ozlabs.org/patch/464416/
> 4) "recv_image: do not include error.h"
>    http://patchwork.ozlabs.org/patch/464417/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Reported-by: Peter Korsgaard <peter@korsgaard.com>
> 
> ---
> Changes v1 -> v2:
>   - Fix malformed patch
>   - Do not squash additional musl patches
>   - Drop rejected patch "Makefile: fix build against musl"
>   - Add patch "serve_image: do not include error.h"
>   - Add patch "recv_image: do not include error.h"
> ---
>  ...1-Fix-rpmatch-call-under-uClibc-and-musl.patch} | 51 ++++++++++++++--------
>  .../0002-lib-libfec.c-fix-build-against-musl.patch | 30 +++++++++++++
>  .../0003-serve_image-do-not-include-error.h.patch  | 31 +++++++++++++
>  .../0004-recv_image-do-not-include-error.h.patch   | 31 +++++++++++++
>  4 files changed, 126 insertions(+), 17 deletions(-)
>  rename package/mtd/{0001-Fix-rpmatch-call-under-uClibc.patch => 0001-Fix-rpmatch-call-under-uClibc-and-musl.patch} (50%)
>  create mode 100644 package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch
>  create mode 100644 package/mtd/0003-serve_image-do-not-include-error.h.patch
>  create mode 100644 package/mtd/0004-recv_image-do-not-include-error.h.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
