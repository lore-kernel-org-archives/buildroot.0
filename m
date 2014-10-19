From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:49:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/liblog4c-localtime: Fix build
 with BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413748165-2732-2-git-send-email-bernd.kuhls@t-online.de>
References: <1413748165-2732-1-git-send-email-bernd.kuhls@t-online.de>
 <1413748165-2732-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019224955.172648e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 21:49:25 +0200, Bernd Kuhls wrote:

> diff --git a/package/liblog4c-localtime/liblog4c-0003-debug.patch b/package/liblog4c-localtime/liblog4c-0003-debug.patch
> new file mode 100644
> index 0000000..80b00cf
> --- /dev/null
> +++ b/package/liblog4c-localtime/liblog4c-0003-debug.patch
> @@ -0,0 +1,37 @@
> +Fix build with BR2_ENABLE_DEBUG=yes
> +
> +Fixes
> +init.c:39:20: fatal error: mcheck.h: No such file or directory
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Same comment as for the other package: using
AC_CHECK_HEADER([mcheck.h]) and then HAVE_MCHECK_H is a much better
solution.

Do you think you can push upstream this patch as well as the other
patches that we have?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
