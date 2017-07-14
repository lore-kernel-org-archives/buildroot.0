From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Fri, 14 Jul 2017 14:33:20 +0700
Subject: [Buildroot] [PATCH 1/3] python-greenlet: new package
In-Reply-To: <CAGm1_kv07_ngieu_PATD3NvruWXNCHJOVSXjFXqA4hFfF6qd9A@mail.gmail.com>
References: <20170714053800.20007-1-alexey.roslyakov@gmail.com>
 <CAGm1_kv07_ngieu_PATD3NvruWXNCHJOVSXjFXqA4hFfF6qd9A@mail.gmail.com>
Message-ID: <CALFoz4ZVXxuwT_sn5EW0PpBvrVbeXmzhHOKLQ0LTD3J6KKoUCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Yegor

Unbelievable, how I could miss it...
Thank you indeed.

On 14 July 2017 at 13:44, Yegor Yefremov <yegorslists@googlemail.com> wrote:

> Hi Alexey,
>
> looks like you didn't use:
>
> ./utils/scanpypi greenlet
>
> On Fri, Jul 14, 2017 at 7:37 AM, Alexey Roslyakov
> <alexey.roslyakov@gmail.com> wrote:
> > Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
> > ---
>
> Please also add an entry to teh DEVELOPERS file.
>
> >  package/Config.in                            |  1 +
> >  package/python-greenlet/Config.in            |  6 ++++++
> >  package/python-greenlet/python-greenlet.hash |  3 +++
> >  package/python-greenlet/python-greenlet.mk   | 14 ++++++++++++++
> >  4 files changed, 24 insertions(+)
> >  create mode 100644 package/python-greenlet/Config.in
> >  create mode 100644 package/python-greenlet/python-greenlet.hash
> >  create mode 100644 package/python-greenlet/python-greenlet.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index b48ab5e0dd..e09327168b 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -738,6 +738,7 @@ menu "External python modules"
> >         source "package/python-flup/Config.in"
> >         source "package/python-futures/Config.in"
> >         source "package/python-gobject/Config.in"
> > +       source "package/python-greenlet/Config.in"
> >         source "package/python-gunicorn/Config.in"
> >         source "package/python-html5lib/Config.in"
> >         source "package/python-httplib2/Config.in"
> > diff --git a/package/python-greenlet/Config.in
> b/package/python-greenlet/Config.in
> > new file mode 100644
> > index 0000000000..1b24141d5e
> > --- /dev/null
> > +++ b/package/python-greenlet/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_PYTHON_GREENLET
> > +       bool "python-greenlet"
> > +       help
> > +         Lightweight in-process concurrent programming for Python
>
> '.' is missing at the end of the help text.
>
> > +
> > +         https://pypi.python.org/pypi/greenlet/
> > diff --git a/package/python-greenlet/python-greenlet.hash
> b/package/python-greenlet/python-greenlet.hash
> > new file mode 100644
> > index 0000000000..0ad9e41025
> > --- /dev/null
> > +++ b/package/python-greenlet/python-greenlet.hash
> > @@ -0,0 +1,3 @@
> > +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=
> e8637647d58a26c4a1f51ca393e53c00, sha256 locally computed
>
> comment should look like this:
>
> # md5 from https://pypi.python.org/pypi/greenlet/json, sha256 locally
> computed
>
> > +md5    e8637647d58a26c4a1f51ca393e53c00 greenlet-0.4.12.tar.gz
> > +sha256 e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e
> greenlet-0.4.12.tar.gz
> > diff --git a/package/python-greenlet/python-greenlet.mk
> b/package/python-greenlet/python-greenlet.mk
> > new file mode 100644
> > index 0000000000..b5b234c7c2
> > --- /dev/null
> > +++ b/package/python-greenlet/python-greenlet.mk
> > @@ -0,0 +1,14 @@
> > +###########################################################
> #####################
> > +#
> > +# python-greenlet
> > +#
> > +###########################################################
> #####################
> > +
> > +PYTHON_GREENLET_VERSION = 0.4.12
> > +PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
> > +PYTHON_GREENLET_SITE = https://pypi.python.org/packages/be/76/
> 82af375d98724054b7e273b5d9369346937324f9bcc20980b45b068ef0b0
> > +PYTHON_GREENLET_LICENSE = MIT
> > +PYTHON_GREENLET_LICENSE_FILES = LICENSE
> > +PYTHON_GREENLET_SETUP_TYPE = distutils
>
> use setuptools as setup type
>
> Yegor
>
> > +
> > +$(eval $(python-package))
> > --
> > 2.13.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
With best regards,
  Alexey Roslyakov
Email: alexey.roslyakov at gmail.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170714/ab6348be/attachment.html>
