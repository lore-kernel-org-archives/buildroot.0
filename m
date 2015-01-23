From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 23 Jan 2015 22:00:21 +0100
Subject: [Buildroot] [PATCH] python-pyxb: new package
In-Reply-To: <8738716xjr.fsf@dell.be.48ers.dk>
References: <1421786498-3330-1-git-send-email-yegorslists@googlemail.com>
 <8738716xjr.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_kvsGk2Xz87EueG4ZxWVchbjsGbv9qmp-=SgZKT6b+wYvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 23, 2015 at 9:40 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
>
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  > ---
>  >  package/Config.in                    |  1 +
>  >  package/python-pyxb/Config.in        |  7 +++++++
>  >  package/python-pyxb/python-pyxb.hash |  3 +++
>  >  package/python-pyxb/python-pyxb.mk   | 13 +++++++++++++
>  >  4 files changed, 24 insertions(+)
>  >  create mode 100644 package/python-pyxb/Config.in
>  >  create mode 100644 package/python-pyxb/python-pyxb.hash
>  >  create mode 100644 package/python-pyxb/python-pyxb.mk
>
>  > diff --git a/package/Config.in b/package/Config.in
>  > index 32d6755..5f6ebc2 100644
>  > --- a/package/Config.in
>  > +++ b/package/Config.in
>  > @@ -545,6 +545,7 @@ menu "external python modules"
>  >      source "package/python-pysnmp-apps/Config.in"
>  >      source "package/python-pysnmp-mibs/Config.in"
>  >      source "package/python-pyusb/Config.in"
>  > +    source "package/python-pyxb/Config.in"
>  >      source "package/python-pyzmq/Config.in"
>  >      source "package/python-requests/Config.in"
>  >      source "package/python-rtslib-fb/Config.in"
>  > diff --git a/package/python-pyxb/Config.in b/package/python-pyxb/Config.in
>  > new file mode 100644
>  > index 0000000..f122671
>  > --- /dev/null
>  > +++ b/package/python-pyxb/Config.in
>  > @@ -0,0 +1,7 @@
>  > +config BR2_PACKAGE_PYTHON_PYXB
>  > +    bool "python-pyxb"
>  > +    help
>  > +      PyXB is a pure Python package that generates Python code
>  > +      for classes that correspond to data structures defined by XMLSchema.
>  > +
>  > +      http://pyxb.sourceforge.net/
>
> So this is a code generator, right? Why do we need it for the target and
> not for the host then?

I'd say, it is more object, then code generator. You get some data as
XML file, then you use pyxb and XML Schema file to generate object
from this XML class to easily access it's members. See this example:
http://pyxb.sourceforge.net/index.html#thirty-second-example

So I don't know, if it makes any sense to make a host package of it.

>> diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
>  > new file mode 100644
>  > index 0000000..6da3abc
>  > --- /dev/null
>  > +++ b/package/python-pyxb/python-pyxb.hash
>  > @@ -0,0 +1,3 @@
>  > +# Locally computed:
>  > +sha256  14ced19ecce51e7cd26434446f9bd6b4e309e91806f1f6fc5e21f4ac736aa0de  python-pyxb-1.2.4.tar.gz
>  > +
>
> Extra newline.
>
>> diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
>  > new file mode 100644
>  > index 0000000..bd607b6
>  > --- /dev/null
>  > +++ b/package/python-pyxb/python-pyxb.mk
>  > @@ -0,0 +1,13 @@
>  > +################################################################################
>  > +#
>  > +# python-pyxb
>  > +#
>  > +################################################################################
>  > +
>  > +PYTHON_PYXB_VERSION = 1.2.4
>  > +PYTHON_PYXB_SITE = $(call github,pabigot,pyxb,PyXB-$(PYTHON_PYXB_VERSION))
>  > +PYTHON_PYXB_LICENSE = Apache License 2.0
>
> The Buildroot name for this is Apache-2.0.
>
> Committed with these fixes, thanks.
>
> --
> Bye, Peter Korsgaard
