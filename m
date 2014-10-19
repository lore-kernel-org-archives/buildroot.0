From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:32:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix uClibc build with
 BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413732225-14832-2-git-send-email-bernd.kuhls@t-online.de>
References: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
 <1413732225-14832-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019173215.28987ba7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 17:23:45 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d-0002-execinfo_h.patch |   42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/mesa3d/mesa3d-0002-execinfo_h.patch
> 
> diff --git a/package/mesa3d/mesa3d-0002-execinfo_h.patch b/package/mesa3d/mesa3d-0002-execinfo_h.patch
> new file mode 100644
> index 0000000..9e3cdd8
> --- /dev/null
> +++ b/package/mesa3d/mesa3d-0002-execinfo_h.patch
> @@ -0,0 +1,42 @@
> +Fixes uclibc build as uclibc does not include backtrace functionality
> +
> +Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=85197
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Do you think it would be possible to have a better patch  that adds an
AC_CHECK_HEADER([execinfo.h]) to configure.ac, and then uses
HAVE_EXECINFO_H instead of __UCLIBC__ ? This is more correct, and would
make it compatible with potential future versions of uClibc that might
have backtrace support.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
