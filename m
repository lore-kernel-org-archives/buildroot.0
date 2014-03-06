From: Johan Derycke <johanderycke@gmail.com>
Date: Thu, 6 Mar 2014 10:26:42 +0100
Subject: [Buildroot] [PATCH 1/2] python-libconfig: new package
Message-ID: <CAKHhJn0_cZ3XGnkQcj_Bc=j09viQyONYuUE=DAFUFz=9g8deqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: woensdag 5 maart 2014 18:11
> To: Derycke, Johan; buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/2] python-libconfig: new package
>
> On 04/03/14 09:32, Derycke, Johan wrote:
> > Python bindings to the C++ library libconfig
> > https://github.com/cnangel/python-libconfig
> >
> > Signed-off-by: Johan Derycke <johan.derycke@barco.com>
> > ---
> >  package/python-libconfig/Config.in           |    9 +++++++++
> >  package/python-libconfig/python-libconfig.mk |   21
> +++++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 package/python-libconfig/Config.in
> >  create mode 100644 package/python-libconfig/python-libconfig.mk
> >
> > diff --git a/package/python-libconfig/Config.in
> > b/package/python-libconfig/Config.in
> > new file mode 100644
> > index 0000000..7e4f317
> > --- /dev/null
> > +++ b/package/python-libconfig/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_PYTHON_LIBCONFIG
> > +       bool "python-libconfig"
> > +       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> > +  select BR2_PACKAGE_BOOST_PYTHON
>
>  You should also select BR2_PACKAGE_BOOST.
>
>  You should also depend on boost's toolchain dependencies:
> BR2_INSTALL_LIBSTDCPP, BR2_LARGEFILE, BR2_TOOLCHAIN_HAS_THREADS,
> and add the corresponding comment.

Can I use:

comment "python libconfig needs boost"
        depends on !BR2_PACKAGE_BOOST
        depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

to avoid the boost "bloatware" being installed behind the back?

>
>  It's a crying shame that the python wrapper for something trivial like libconfig
> requires bloatware like boost  but that can't be helped of course.
>
> > +       select BR2_PACKAGE_LIBCONFIG
> > +       help
> > +           Python bindings to the C++ library libconfig
>
>  Perhaps add a bit of the help text of libconfig.
>
>  Regards,
>  Arnout
>
> > +
> > +          https://github.com/cnangel/python-libconfig
> > diff --git a/package/python-libconfig/python-libconfig.mk
> > b/package/python-libconfig/python-libconfig.mk
> > new file mode 100644
> > index 0000000..8d597ef
> > --- /dev/null
> > +++ b/package/python-libconfig/python-libconfig.mk
> > @@ -0,0 +1,21 @@
> >
> +############################################################
> #########
> > +###########
> > +#
> > +# python-libconfig
> > +#
> >
> +############################################################
> #########
> > +###########
> > +
> > +PYTHON_LIBCONFIG_VERSION =
> b271c3d9dac938ad5cd29b67bd08cc5536a5a391
> > +PYTHON_LIBCONFIG_SITE = https://github.com/cnangel/python-libconfig/
> > +PYTHON_LIBCONFIG_SITE_METHOD = git
> > +
> > +PYTHON_LIBCONFIG_LICENSE = BSD
> > +PYTHON_LIBCONFIG_LICENSE_FILES = README
> > +
> > +PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
> > +
> > +PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
> > +
> > +$(eval $(python-package))
> > +
> > +
> > +
> > --
> > 1.7.10.4
> >
> > Best regards,
> > Johan Derycke
> >
> >
> >
> >
> >
> > This message is subject to the following terms and conditions: MAIL
> > DISCLAIMER<http://www.barco.com/en/maildisclaimer>
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
This message is subject to the following terms and conditions: MAIL
DISCLAIMER<http://www.barco.com/en/maildisclaimer>
