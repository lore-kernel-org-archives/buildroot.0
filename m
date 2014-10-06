From: David Bachelart <david.bachelart@bbright.com>
Date: Mon, 6 Oct 2014 10:37:51 +0200
Subject: [Buildroot] [PATCH 1/1] ipmiutil: new package
In-Reply-To: <20141005234727.1ed88b20@free-electrons.com>
References: <1411033115-6914-1-git-send-email-david.bachelart@bbright.com>
 <20141005234727.1ed88b20@free-electrons.com>
Message-ID: <CAJeZidJkZt99WSLzWCuzY4k650o4JFBaoBCiqy2GmHTook59KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Yes, I do... I'm in a rush, I hope I'll submit a new patch in a few
days/weeks.

Regards,
David


2014-10-05 23:47 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear David Bachelart,
>
> Any news about this patch? I made some comments on September, 21st, but
> unless I missed you haven't resent a new version. Do you intend to do
> so in the near future?
>
> Thanks a lot for your contribution,
>
> Thomas
>
> On Thu, 18 Sep 2014 11:38:35 +0200, David Bachelart wrote:
> >
> > Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> > ---
> >  package/Config.in            |    1 +
> >  package/ipmiutil/Config.in   |   15 +++++++++++++++
> >  package/ipmiutil/ipmiutil.mk |   15 +++++++++++++++
> >  3 files changed, 31 insertions(+)
> >  create mode 100644 package/ipmiutil/Config.in
> >  create mode 100644 package/ipmiutil/ipmiutil.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 73ba86a..3eafabb 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -322,6 +322,7 @@ endif
> >       source "package/intel-microcode/Config.in"
> >       source "package/iostat/Config.in"
> >       source "package/ipmitool/Config.in"
> > +     source "package/ipmiutil/Config.in"
> >       source "package/irda-utils/Config.in"
> >       source "package/iucode-tool/Config.in"
> >       source "package/kbd/Config.in"
> > diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
> > new file mode 100644
> > index 0000000..29d6e26
> > --- /dev/null
> > +++ b/package/ipmiutil/Config.in
> > @@ -0,0 +1,15 @@
> > +config BR2_PACKAGE_IPMIUTIL
> > +     bool "ipmiutil"
> > +     depends on BR2_TOOLCHAIN_HAS_SSP
> > +     select BR2_PACKAGE_OPENSSL
> > +     select BR2_PACKAGE_ZLIB
> > +     help
> > +       The ipmiutil package provides easy-to-use utilities to view the
> SEL,
> > +       perform an IPMI chassis reset, set up the IPMI LAN and Platform
> Event Filter
> > +       entries to allow SNMP alerts, Serial-Over-LAN console, event
> daemon, and
> > +       other IPMI tasks.
> > +
> > +       http://ipmiutil.sourceforge.net/
> > +
> > +comment "ipmiutil needs a toolchain w/ ssp"
> > +     depends on !BR2_TOOLCHAIN_HAS_SSP
> > diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
> > new file mode 100644
> > index 0000000..9bf7325
> > --- /dev/null
> > +++ b/package/ipmiutil/ipmiutil.mk
> > @@ -0,0 +1,15 @@
> >
> +################################################################################
> > +#
> > +# ipmiutil
> > +#
> >
> +################################################################################
> > +
> > +IPMIUTIL_VERSION = 2.9.4
> > +IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files/
> > +
> > +IPMIUTIL_DEPENDENCIES = openssl zlib
> > +
> > +IPMIUTIL_LICENSE = BSD-2c
> > +IPMIUTIL_LICENSE_FILES = COPYING
> > +
> > +$(eval $(autotools-package))
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141006/8d66a37e/attachment.html>
