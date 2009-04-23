From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Thu, 23 Apr 2009 10:57:17 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <87d4b3oj94.fsf@macbook.be.48ers.dk>
References: <49CB469A.5080404@eclis.ch>	<20090422124829.GA28316@cbg.dyndns.org>
	<1240404749.7072.1.camel@sven>	<49EF2669.7010607@eclis.ch>
	<87zle8oiz4.fsf@macbook.be.48ers.dk>	<49F025BE.3020606@eclis.ch>
	<87d4b3oj94.fsf@macbook.be.48ers.dk>
Message-ID: <49F02D6D.4040406@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard a ?crit :
>>>>>> "Jean-Christian" == Jean-Christian de Rivaz <jc@eclis.ch> writes:

Hi,

>  Jean-Christian> Without the patch, using expat or libxml2, let the
>  Jean-Christian> build fail with this error into the make of
>  Jean-Christian> dbus-1.2.12-host:
> 
> I take it you mean dbus-glib-host from the below.

Yes. I was confused by a early make message, sorry.

>  Jean-Christian> configure: error: GLib development libraries not found
>  Jean-Christian> make: *** [/home/jcdr/try/buildroot-svn-expat/build_arm/stamps/host_dbusglib_configured] Erreur 1
> 
> Ahh, I thought you had a problem building dbus for the target, not
> dbus-glib for the host. I see the missing dependency on host-glib and
> will fix shortly.

Thanks.

>  Jean-Christian> It worth noticed that even if libxml2 is used, the
>  Jean-Christian> dbus-1.2.12-host configure log the same messages
>  Jean-Christian> about expat and no one about libxml2.
> 
> Yes, we always build the host dbus version with expat support for
> simplicity.

Ok.

>  Jean-Christian> The two others folders have this patch applyed:
>  Jean-Christian> ------------------------------------------------
>  Jean-Christian> Index: package/dbus-glib/dbus-glib.mk
>  Jean-Christian> ===================================================================
>  Jean-Christian> --- package/dbus-glib/dbus-glib.mk      (r?vision 26188)
>  Jean-Christian> +++ package/dbus-glib/dbus-glib.mk      (copie de travail)
>  Jean-Christian> @@ -23,7 +23,7 @@
>  Jean-Christian>                --disable-doxygen-docs \
>  Jean-Christian>                --enable-asserts=yes
> 
>  Jean-Christian> -DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-dbus-glib libglib2
>  Jean-Christian> +DBUS_GLIB_DEPENDENCIES = uclibc host-pkgconfig dbus host-dbus host-libglib2 host-dbus-glib libglib2
> 
> That's wrong, it's the host-dbus-glib which needs the host-glib, not
> the target dbus-glib (but it'll work as well). I'll fix it in svn.

I agree with you, but I did not know how to make a better fix.

>  Jean-Christian> checking for XML_ParserCreate_MM in -lexpat... no
>  Jean-Christian> configure: error: expat library not found, check config.log for failed attempts
>  Jean-Christian> make: *** [/home/jcdr/try/buildroot-svn-dep-libxml2/build_arm/dbus-glib-0.80/.stamp_configured] Erreur 1
> 
> From looking at configure.ac it seems like you cannot build dbus-glib
> with libxml support, but that it REQUIRES expat (upstream is not
> really interested in libxml support anymore).
> 
> I'll fix the Kconfig dependencies in svn.

Good idea. Thanks.

-- 
Jean-Christian de Rivaz
