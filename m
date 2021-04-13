From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 13 Apr 2021 08:45:20 -0500
Subject: [Buildroot] [PATCH] package/ace: new package
In-Reply-To: <20210412223020.7c1ffc76@windsurf.home>
References: <20210412165524.17793-1-matthew.weber@rockwellcollins.com>
 <20210412223020.7c1ffc76@windsurf.home>
Message-ID: <CANQCQpZPfkcWVHQWrWq=OC7-ikQz6NBdgG9UK+FTt=ds3KVxGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

. Thomas,

On Mon, Apr 12, 2021 at 3:30 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Matt,
>
> Thanks for this submission. Please see below some comments.
>
> On Mon, 12 Apr 2021 11:55:24 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > diff --git a/package/ace/Config.in b/package/ace/Config.in
> > new file mode 100644
> > index 0000000000..7755327b21
> > --- /dev/null
> > +++ b/package/ace/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_ACE
> > +     bool "ace"
> > +     depends on BR2_TOOLCHAIN_USES_GLIBC
> > +     depends on !BR2_STATIC_LIBS
>
> These means a Config.in comment is needed.
>
> > +     select BR2_PACKAGE_OPENSSL
> > +     help
> > +       The ADAPTIVE Communication Environment (ACE(TM))
> > +       An OO Network Programming Toolkit in C++.
> > +
> > +       See http://www.dre.vanderbilt.edu/~schmidt/ACE.html
>
> Drop the "See " at the beginning, we want the last thing in the help
> text to be just the URL of upstream project home page.
>
> > diff --git a/package/ace/ace.mk b/package/ace/ace.mk
> > new file mode 100644
> > index 0000000000..80d50665d9
> > --- /dev/null
> > +++ b/package/ace/ace.mk
> > @@ -0,0 +1,63 @@
> > +################################################################################
> > +#
> > +# ace
> > +#
> > +################################################################################
> > +
> > +ACE_VERSION=7.0.1
> > +ACE_SOURCE=ACE-$(ACE_VERSION).tar.gz
> > +ACE_SITE=http://download.dre.vanderbilt.edu/previous_versions
> > +ACE_DEPENDENCIES=openssl
>
> Spaces around = sign. I think this is reported by "make check-package".

It looks like "make check-package"did not catch it but we've cleaned
those assignments + other items up in
http://patchwork.ozlabs.org/project/buildroot/patch/20210413134139.13281-1-matthew.weber at rockwellcollins.com/

Regards,
Matt
