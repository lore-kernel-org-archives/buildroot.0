From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:16:28 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/icu: needs gcc >= 4.9 and host gcc >= 4.9
In-Reply-To: <20200614201349.677681-1-fontaine.fabrice@gmail.com>
References: <20200614201349.677681-1-fontaine.fabrice@gmail.com>
Message-ID: <20200618221628.560cd839@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jun 2020 22:13:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> icu uses std::max_align_t since version 67-1 and
> https://github.com/unicode-org/icu/commit/a3078fb8c89b61c35ccebb04cf6b189bc81093b3
> 
> This raises the following build failure with gcc 4.8:
> 
> utext.cpp:572:5: error: 'max_align_t' in namespace 'std' does not name a type
>      std::max_align_t    extension;
>      ^
> 
> This build failure is due to GCC bug 56019:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56019
> 
> Instead of adding BR2_TOOLCHAIN_HAS_GCC_BUG_56019, just bumps gcc
> dependency from 4.8 to 4.9
> 
> As this issue also affects host-icu, add a host gcc >= 4.9 dependency
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6d2658a3c165c99df3eae87b2970e738bd386245
>  - http://autobuild.buildroot.org/results/d204f1a528765d1440620a1eed8c29cbb5ec93c3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Yann E. Morin):
>  - Drop Config.in.host for host-icu

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
