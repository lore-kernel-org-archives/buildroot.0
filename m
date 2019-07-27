From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 26 Jul 2019 23:11:27 -0300
Subject: [Buildroot] [PATCH 1/2] python-termcolor: new package
In-Reply-To: <CAJ4jsaeSATj2T4PpJMG03t3mjRqs_i0p+-0z9h1pTqxy8j8J2g@mail.gmail.com>
References: <20190726191041.1184-1-asafka7@gmail.com>
 <CAJ4jsaeSATj2T4PpJMG03t3mjRqs_i0p+-0z9h1pTqxy8j8J2g@mail.gmail.com>
Message-ID: <CAJ4jsacGroAH_hRkZaUFaHUYaskuR5WETGKj0MoqnfCWmsAiQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 26, 2019 at 10:59 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Fri, Jul 26, 2019 at 4:10 PM Asaf Kahlon <asafka7@gmail.com> wrote:
> >
> > ANSII Color formatting for output in terminal.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/Config.in                              |  1 +
> >  package/python-termcolor/Config.in             |  6 ++++++
> >  package/python-termcolor/python-termcolor.hash |  5 +++++
> >  package/python-termcolor/python-termcolor.mk   | 14 ++++++++++++++
> >  4 files changed, 26 insertions(+)
> >  create mode 100644 package/python-termcolor/Config.in
> >  create mode 100644 package/python-termcolor/python-termcolor.hash
> >  create mode 100644 package/python-termcolor/python-termcolor.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 90dddfd346..9b2cc7522d 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1075,6 +1075,7 @@ menu "External python modules"
> >         source "package/python-systemd/Config.in"
> >         source "package/python-tabledata/Config.in"
> >         source "package/python-tempora/Config.in"
> > +       source "package/python-termcolor/Config.in"
> >         source "package/python-terminaltables/Config.in"
> >         source "package/python-texttable/Config.in"
> >         source "package/python-thrift/Config.in"
> > diff --git a/package/python-termcolor/Config.in b/package/python-termcolor/Config.in
> > new file mode 100644
> > index 0000000000..e89da9b965
> > --- /dev/null
> > +++ b/package/python-termcolor/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_PYTHON_TERMCOLOR
> > +       bool "python-termcolor"
> > +       help
> > +         ANSII Color formatting for output in terminal.
> > +
> > +         http://pypi.python.org/pypi/termcolor
> > diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
> > new file mode 100644
> > index 0000000000..7cccc3ec97
> > --- /dev/null
> > +++ b/package/python-termcolor/python-termcolor.hash
> > @@ -0,0 +1,5 @@
> > +# md5, sha256 from https://pypi.org/pypi/termcolor/json
> > +md5    043e89644f8909d462fbbfa511c768df  termcolor-1.1.0.tar.gz
> > +sha256 1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b  termcolor-1.1.0.tar.gz
> > +# Locally computed sha256 checksums
> > +sha256 497b3272b67b94a7aa58fa3748d21b62b29ccb783b1cda816f594e3932590bbf  COPYING.txt
> > diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
> > new file mode 100644
> > index 0000000000..ccdff4c0d7
> > --- /dev/null
> > +++ b/package/python-termcolor/python-termcolor.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# python-termcolor
> > +#
> > +################################################################################
> > +
> > +PYTHON_TERMCOLOR_VERSION = 1.1.0
> > +PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
> > +PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981
> > +PYTHON_TERMCOLOR_SETUP_TYPE = distutils
> > +PYTHON_TERMCOLOR_LICENSE = MIT
> > +PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
> > +
> > +$(eval $(python-package))
> > --
>
> Must select BR2_PACKAGE_PYTHON_ENUM
>
> # python
> Python 2.7.16 (default, Jul 26 2019, 21:32:02)
> [GCC 8.2.0] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import fire
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "usr/lib/python2.7/site-packages/fire/__init__.py", line 21, in <module>
>   File "usr/lib/python2.7/site-packages/fire/core.py", line 65, in <module>
>   File "usr/lib/python2.7/site-packages/fire/completion.py", line 25,
> in <module>
>   File "usr/lib/python2.7/site-packages/fire/inspectutils.py", line
> 22, in <module>
>   File "usr/lib/python2.7/site-packages/fire/docstrings.py", line 61,
> in <module>
> ImportError: No module named enum
>
> ---
> Carlos Santos <unixmania@gmail.com>

Sorry, it's python-fire that requires enum.

-- 
Carlos Santos <unixmania@gmail.com>
