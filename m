From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jun 2016 06:22:30 +0300
Subject: [Buildroot] [PATCH 1/1] taskd: support linking against static
 gnutls and uuid
In-Reply-To: <20160617020836.9765-1-mathstuf@gmail.com>
References: <20160617020836.9765-1-mathstuf@gmail.com>
Message-ID: <20160617032230.GR2749@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

On Thu, Jun 16, 2016 at 10:08:36PM -0400, Ben Boeckel wrote:
> The FindGnuTLS module shipped with CMake does not expose the information
> required for proper linking if it is a static library.
> 
> Similarly, the code which searches for the uuid library is insufficient
> for such a task.
> 
> Also, find_package(Threads) was missing, so pthreads was not properly
> linked.
> 
> Do not send this patch to taskwarrior upstream; it is not a proper fix.
> 
> Fixes:
> http://autobuild.buildroot.net/results/67f574af0cc4348ffe2bce026c44766e49c29124/
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> ---
>  ...ix-linking-against-deps-statically-on-arc.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch
> 
> diff --git a/package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch b/package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch
> new file mode 100644
> index 0000000..56f9dfc
> --- /dev/null
> +++ b/package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch
> @@ -0,0 +1,52 @@
> +From b916016eaf3a3bdb555de11610c0b7964d52da96 Mon Sep 17 00:00:00 2001
> +From: Ben Boeckel <mathstuf@gmail.com>
> +Date: Thu, 16 Jun 2016 21:58:47 -0400
> +Subject: [PATCH] buildroot: fix linking against deps statically on arc
> +
> +Also find the Threads package so that CMAKE_THREAD_LIBS_INIT is actually
> +set.
> +
> +Explicitly not signing this off because it should not go to taskwarrior
> +upstream; deeper fixes are required.

But you do need to sign-off if you want Buildroot to apply this patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
