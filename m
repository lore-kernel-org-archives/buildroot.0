From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:29:53 +0200
Subject: [Buildroot] [PATCH] binutils: Fix glibc building for ARC with
 stock binutils 2.30
In-Reply-To: <20180613163956.28894-1-abrodkin@synopsys.com>
References: <20180613163956.28894-1-abrodkin@synopsys.com>
Message-ID: <20180613222953.23ac58db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jun 2018 19:39:56 +0300, Alexey Brodkin wrote:
> There're known issues with building glibc for ARC with vanilla
> Binutils 2.30. Adding a couple of not yet upstreamed patches
> that solve it.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  ...ocation-where-GOT-information-is-col.patch | 197 ++++++++++++++++++
>  ...ustness.-Return-FALSE-in-case-of-NUL.patch |  34 +++
>  ...obal-symbol-is-not-an-indirect-or-wa.patch |  42 ++++
>  ...ion-was-still-being-generated-when-s.patch |  35 ++++
>  4 files changed, 308 insertions(+)
>  create mode 100644 package/binutils/2.30/0010-ARC-Refactored-location-where-GOT-information-is-col.patch
>  create mode 100644 package/binutils/2.30/0011-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
>  create mode 100644 package/binutils/2.30/0012-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
>  create mode 100644 package/binutils/2.30/0013-ARC-PLT-information-was-still-being-generated-when-s.patch

I've applied to master after:

 - Removing the number from the patch titles (use 'git format-patch -N'
   please!)

 - Adjusting the numbering of patch file names. Recently, Romain Naour
   renumbered all patches and made them Git formatted, so it would be
   nice to keep that consistency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
