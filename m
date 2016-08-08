From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:46:31 +0200
Subject: [Buildroot] [PATCH] package/uclibc: add upstream patch to fix
 Thumb2 builds
In-Reply-To: <1470676199-28882-1-git-send-email-yann.morin.1998@free.fr>
References: <1470676199-28882-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160808234631.713686df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 19:09:59 +0200, Yann E. MORIN wrote:
> When uClibc-ng 1.0.17 was released, there was a regression when building
> Thumb2-only for a CPU that is capable of running in arm mode (e.g. an
> armv7a cpu).
> 
> We hastily added a patch to revert the upstream commit, as a stop-gap
> measure, waiting for the actual fix.
> 
> That actual fix is there, now. :-)
> 
> Drop our revert-patch, and add the upstream patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...arm-cleanup-redundant-macros-for-syscalls.patch | 152 ---------------------
>  .../0001-arm-fix-compile-in-thumb-mode.patch       |  48 +++++++
>  2 files changed, 48 insertions(+), 152 deletions(-)
>  delete mode 100644 package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch
>  create mode 100644 package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
