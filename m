From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:22:03 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/opencv3: fix build due to gcc bug 68485
In-Reply-To: <20190531162645.5108-1-fontaine.fabrice@gmail.com>
References: <20190531162645.5108-1-fontaine.fabrice@gmail.com>
Message-ID: <20190531222203.7a73617d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 18:26:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
> building opencv3 with optimization but not when building with -O0. To
> work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
> -O0.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c78eac84d1c5a6702e7759cd5364da1c3e399b4b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Giulio Benetti):
>  - Improve commit log

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
