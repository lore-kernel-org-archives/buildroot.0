From: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 3 Jun 2012 13:12:03 +0300
Subject: [Buildroot] [PATCH] jpeg-turbo: new package
In-Reply-To: <20120603092136.3a462ea1@skate>
References: <CA+pfegELseWchx5hbbChKKi-=xtQMO9CWTyKBEV+6RpRQVEqBA@mail.gmail.com>
 <20120603092136.3a462ea1@skate>
Message-ID: <CA+pfegGdB802LwiCLn+frAJDyqYTpx2B59qgZLXwrJNU9vrExg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

You're right, host package not important even if you're trying to build a
filesystem for x86 platform because of the one-to-one compatibility of
jpeg-turbo with libjpeg, I'll remove it.

When I start to prepare .mk for jpeg-turbo, I see that there is a need for
new dependency management option like "Provides: jpeg" in professional
package management formats.

Suppose that we built the jpeg-turbo and later we want to build tiff
package. In this case, jpeg turbo will build and it replace jpeg-turbo's
libjpeg.soXX files. For this reason, we have to build jpeg-turbo again to
replace the libraries with correct ones.

Is there any plan to address this issue in future? We just see that
jpeg-turbo a lot faster than libjpeg especially on embedded environments.

(I will send a patch with git send-email, previous one is the result of a
firewall which blocking outgoing smtp and webmail client)

2012/6/3 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Hello,
>
> Le Sun, 3 Jun 2012 05:57:46 +0300,
> Murat Demirten <mdemirten@yh.com.tr> a ?crit :
>
> > --- /dev/null
> > +++ b/package/jpeg-turbo/Config.in
> > @@ -0,0 +1,26 @@
> > +config BR2_PACKAGE_JPEG_TURBO
> > + bool "jpeg-turbo"
>
> Indentation should be one tab.
>
> > + help
>
> Here as well.
>
> > +   It is a derivative of libjpeg that uses SIMD instructions
> > +   (MMX, SSE2, NEON) to accelerate baseline JPEG compression
> > +   and decompression on x86, x86-64, and ARM systems.
> > +
> > +   http://libjpeg-turbo.virtualgl.org
>
> Indentation should be one tab + two spaces (for the help text)
>
> > +choice
> > + prompt "libjpeg api version"
>
> Fix indentation everywhere :)
>
> > --- /dev/null
> > +ifeq ($(BR2_PACKAGE_JPEG_TURBO_APIVERSION_62),y)
> > + JPEG_TURBO_CONF_ENV += JPEG_LIB_VERSION=62
> > +endif
> > +
> > +$(eval $(call AUTOTARGETS))
> > +$(eval $(call AUTOTARGETS,host))
>
> There's no need to have a host variant of this package I think.
>
> Also, your patch is line-wrapped, so it cannot easily be applied. Could
> you fix your e-mail client, or better, use git send-email to send your
> patch?
>
> Thanks a lot for your contribution!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot




-- 
Murat Demirten
Genel M?d?r
http://www.yh.com.tr
(212) 292 04 46 - 113
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120603/a8622f1a/attachment.html>
