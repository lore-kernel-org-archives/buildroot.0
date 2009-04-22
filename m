From: Steffen Schulz <pepe_ml@gmx.net>
Date: Wed, 22 Apr 2009 14:48:29 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <49CB469A.5080404@eclis.ch>
References: <49CB469A.5080404@eclis.ch>
Message-ID: <20090422124829.GA28316@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just had the same problem when trying to compile trunk for i686.
However, after applying the fix I got an error about missing '-lexpat'.
Adding expat to the dependencies fixed that.


On 090326 at 09:15, Jean-Christian de Rivaz wrote:
> I need the small patch below to successfully buils the dbus-glib. This was tested on a board that is almost like the AT91SAM9261EK, although I don't think it matter for this kind of problem. Without the patch the error was:
>
> (cd /home/xxx/buildroot/build_arm/dbus-glib-0.80-host; [...]
> [...]
> checking pkg-config is at least version 0.9.0... yes
> checking for DBUS... yes
> checking for DBUS_GLIB... no
> checking for DBUS_GLIB_THREADS... no
> configure: error: GLib development libraries not found
> make: *** [/home/xxx/buildroot/build_arm/dbus-glib-0.80-host/.configured] Error 1
>
> Index: package/dbus-glib/dbus-glib.mk
> ===================================================================
> --- package/dbus-glib/dbus-glib.mk      (r?vision 25823)
> +++ package/dbus-glib/dbus-glib.mk      (copie de travail)
> @@ -23,7 +23,7 @@
>                --disable-doxygen-docs \
>                --enable-asserts=yes
>
> -DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-dbus-glib libglib2
> +DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-libglib2 host-dbus-glib libglib2
>
> $(eval $(call AUTOTARGETS,package,dbus-glib))
>
>
> Best Regards,

-- 
