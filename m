From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:11:52 +0200
Subject: [Buildroot] [PATCH 01/16 v3] core: move pkg-utils.mk to support/
In-Reply-To: <baf402ac561bf88a4f0262b463f165f91c00cb75.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <baf402ac561bf88a4f0262b463f165f91c00cb75.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827161152.60926547@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:21 +0200, Yann E. MORIN wrote:
> pkg-utils.mk contains various definitions that are used in the package
> infrastructures and packages themselves.
> 
> However, those definitions can be useful in other parts of Buildroot,
> and are already used in a few places that are not related to the package
> infrastructure. Also, $(sep) will be needed early in the Makefile when
> we eventually support multiple br2-external trees.
> 
> Since this file only contains definitions, we can include it anytime.
> 
> So, consider that file to no longer be specific to the package infras:
>   - move it to support and rename it,
>   - move a few similar definitions from the main Makefile to that file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>  Makefile              |  10 +----
>  package/pkg-utils.mk  |  96 -------------------------------------------
>  support/misc/utils.mk | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 113 insertions(+), 104 deletions(-)
>  create mode 100644 support/misc/utils.mk

Applied to next, thanks. I'm glad to see a few lines disappearing from
the main Makefile. Sadly, the remaining of your series adds some more
lines to this file :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
