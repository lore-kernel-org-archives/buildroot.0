From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:16:36 +0100
Subject: [Buildroot] [PATCH 1/2] trinity: bump to version 1.8
In-Reply-To: <6ad09d50510868507c76a49ae5b0df26dc24f46e.1512329679.git.baruch@tkos.co.il>
References: <6ad09d50510868507c76a49ae5b0df26dc24f46e.1512329679.git.baruch@tkos.co.il>
Message-ID: <20171203231636.7168fe2c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 21:34:38 +0200, Baruch Siach wrote:
> Drop upstream patches.
> 
> Add an upstream patch fixing build with kernel headers v4.14 or newer.
> 
> Enable build for musl; Marcin Nowakowski fixed all incompatibilities in
> this version.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1a8/1a891bfa1f29060003bb7f4fce100aa5a1034673/
> http://autobuild.buildroot.net/results/f22/f22cb03a4ec1eafb89ca5e81a2864f928117b54d/
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-compat-handle-removed-autofs-macros.patch | 61 ++++++++++++++++++
>  ...rspace-headers-for-ax25-instead-of-kernel.patch | 26 --------
>  ...002-fix-build-when_USE_BPF-is-not-defined.patch | 72 ----------------------
>  .../0003-Check-for-bpf-attr-map-flags.patch        | 60 ------------------
>  ...4-get_syscall_entry-remove-SYSCALL_OFFSET.patch | 44 -------------
>  ...ix-cross-compile-detection-of-broken-ipv6.patch | 49 ---------------
>  ...06-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch | 40 ------------
>  package/trinity/Config.in                          |  6 +-
>  package/trinity/trinity.hash                       |  3 +-
>  package/trinity/trinity.mk                         |  2 +-
>  10 files changed, 66 insertions(+), 297 deletions(-)
>  create mode 100644 package/trinity/0001-compat-handle-removed-autofs-macros.patch
>  delete mode 100644 package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
>  delete mode 100644 package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
>  delete mode 100644 package/trinity/0003-Check-for-bpf-attr-map-flags.patch
>  delete mode 100644 package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
>  delete mode 100644 package/trinity/0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch
>  delete mode 100644 package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
