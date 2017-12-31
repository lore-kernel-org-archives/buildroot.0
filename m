From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 31 Dec 2017 10:22:53 -0200
Subject: [Buildroot] [PATCH] daq: new package
In-Reply-To: <20171230211822.7967e315@windsurf>
References: <1514150285-19871-1-git-send-email-sergio.prado@e-labworks.com>
 <20171230211822.7967e315@windsurf>
Message-ID: <CANu7NGuALNdssHnz9BRApZc_SYQ6VPknZt2ZvML6EAcOX1PQAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks. I'll make sure to run check-package next time.

Best regards,

Sergio Prado
Embedded Labworks
https://e-labworks.com/en

2017-12-30 18:18 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun, 24 Dec 2017 19:18:05 -0200, Sergio Prado wrote:
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Thanks, I've applied, after doing a few changes. See below.
>
> > diff --git a/package/daq/Config.in b/package/daq/Config.in
> > new file mode 100644
> > index 000000000000..0627274b52ad
> > --- /dev/null
> > +++ b/package/daq/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_DAQ
> > +     bool "daq"
> > +     select BR2_PACKAGE_LIBPCAP
> > +     select BR2_PACKAGE_LIBDNET
> > +     depends on !BR2_STATIC_LIBS # dlfcn.h
>
> By convention, "depends on" lines go before "select" lines. This is
> verified by check-package.
>
> > diff --git a/package/daq/daq.mk b/package/daq/daq.mk
> > new file mode 100644
> > index 000000000000..f10c31d4a157
> > --- /dev/null
> > +++ b/package/daq/daq.mk
> > @@ -0,0 +1,26 @@
> > +###########################################################
> #####################
> > +#
> > +# daq
> > +#
> > +###########################################################
> #####################
> > +
> > +DAQ_VERSION = 2.0.6
> > +DAQ_SITE = https://www.snort.org/downloads/snort
> > +DAQ_SOURCE = daq-$(DAQ_VERSION).tar.gz
> > +
> > +DAQ_LICENSE = GPL-2.0
> > +DAQ_LICENSE_FILES = COPYING
>
> Since it's a library, it felt weird to not have DAQ_INSTALL_STAGING =
> YES, so I've added that.
>
> > +# assume these flags are available to prevent configure from
> > +# running test programs while cross compiling
> > +DAQ_CONF_ENV = \
> > +     ac_cv_lib_pcap_pcap_lib_version="yes" \
> > +     daq_cv_libpcap_version_1x="yes"
>
> The double quotes around the "yes" were not needed, and we don't do
> that elsewhere in Buildroot, so I've dropped them.
>
> Applied with those changes. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171231/f1487d05/attachment.html>
