From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:23:22 +0200
Subject: [Buildroot] [PATCH] package/liblo: fix build with musl
In-Reply-To: <20180408093706.1082-1-yann.morin.1998@free.fr>
References: <20180408093706.1082-1-yann.morin.1998@free.fr>
Message-ID: <20180409112322.442aa523@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Apr 2018 11:37:06 +0200, Yann E. MORIN wrote:
> Commit 2759ba03979 (liblo: disable werror to fix build issues) tried to
> fix the issue by passing --disable-werror, but this is not a recognised
> option.
> 
> Instead, just fix the code for good.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/000a46954d0c6d3dbc4b4634a0d3a3c955fac679
>     http://autobuild.buildroot.org/results/58cb834bbd69bafc5cb0f23c236919c609648c05
>     http://autobuild.buildroot.org/results/9de1c2007818082e88d77572abf8ff8a72e01930
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alex Baldwin <alexbaldwinmusic@gmail.com>
> ---
> Result of test-pkg with BR2_PACKAGE_LIBLO=y:
>                              br-arm-full [1/7]: OK
>                   br-arm-cortex-a9-glibc [2/7]: OK
>                    br-arm-cortex-m4-full [3/7]: OK
>                           br-x86-64-musl [4/7]: OK
>                             br-bfin-full [5/7]: OK
>                       br-arm-full-static [6/7]: OK
>                 armv5-ctng-linux-gnueabi [7/7]: OK
> 7 builds, 0 skipped, 0 build failed, 0 legal-info failed
> ---
>  .../0001-server-use-correct-poll.h-header.patch    | 32 ++++++++++++++++++++++
>  package/liblo/liblo.mk                             |  5 +---
>  2 files changed, 33 insertions(+), 4 deletions(-)
>  create mode 100644 package/liblo/0001-server-use-correct-poll.h-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
