From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 14:00:43 +0100
Subject: [Buildroot] [PATCH] matchbox-lib: Append -lX11 to the linker
In-Reply-To: <1351596554-27077-1-git-send-email-markos.chandras@gmail.com>
References: <1351596554-27077-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20121030140043.7ba2722b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Tue, 30 Oct 2012 11:29:14 +0000, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> Fixes building with binutils-2.22
> http://autobuild.buildroot.net/results/b4b26dd9c7d7bebe45638ba125fb49a5f5d0cc14/build-end.log
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  package/matchbox/matchbox-lib/matchbox-lib.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
> index de11dfc..339f512 100644
> --- a/package/matchbox/matchbox-lib/matchbox-lib.mk
> +++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
> @@ -10,6 +10,7 @@ MATCHBOX_LIB_SITE = http://matchbox-project.org/sources/libmatchbox/$(MATCHBOX_L
>  MATCHBOX_LIB_INSTALL_STAGING = YES
>  MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
>  MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
> +MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"

This works but is a hack. Has the problem been fixed in newer upstream
releases? If not, would it be possible to cook a patch to send upstream?

Ditto for the matchbox-desktop patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
