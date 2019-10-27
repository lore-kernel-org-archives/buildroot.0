From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Oct 2019 15:14:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-brotlipy: new package
In-Reply-To: <a6b0d74c-973b-4782-4ae5-ef4fa71e179f@mind.be>
References: <20190316023656.3485-1-james.hilliard1@gmail.com>
 <a6b0d74c-973b-4782-4ae5-ef4fa71e179f@mind.be>
Message-ID: <CADvTj4qQ3W=hpJzYQLmyAtZeRk2g3B6su0bpz0__q7+dBKKO7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 27, 2019 at 3:02 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi James,
>
>  Sorry for the extremely late reply to this one.
>
> On 16/03/2019 03:36, james.hilliard1 at gmail.com wrote:
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > Python binding to the Brotli library.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [snip]
> > diff --git a/package/python-brotlipy/python-brotlipy.mk b/package/python-brotlipy/python-brotlipy.mk
> > new file mode 100644
> > index 0000000000..f51376fab2
> > --- /dev/null
> > +++ b/package/python-brotlipy/python-brotlipy.mk
> > @@ -0,0 +1,15 @@
> > +################################################################################
> > +#
> > +# python-brotlipy
> > +#
> > +################################################################################
> > +
> > +PYTHON_BROTLIPY_VERSION = 0.7.0
> > +PYTHON_BROTLIPY_SOURCE = brotlipy-$(PYTHON_BROTLIPY_VERSION).tar.gz
> > +PYTHON_BROTLIPY_SITE = https://files.pythonhosted.org/packages/d9/91/bc79b88590e4f662bd40a55a2b6beb0f15da4726732efec5aa5a3763d856
> > +PYTHON_BROTLIPY_SETUP_TYPE = setuptools
> > +PYTHON_BROTLIPY_LICENSE = MIT
> > +PYTHON_BROTLIPY_LICENSE_FILES = LICENSE libbrotli/LICENSE
> > +PYTHON_BROTLIPY_DEPENDENCIES = host-python-cffi
>
>  You're using the bundled libbrotli instead of our own brotli package, which we
> don't like. Apparently, there's an upstream commit bd202a98e44947aaed2345 that
> allows to use an external brotli. Could you respin using that?
I don't think that's possible, see:
https://github.com/python-hyper/brotlipy/issues/129#issuecomment-453109499
>
>  Note that also means you don't need libbrotli/LICENSE in the license files. And
> you don't need your patch any more.
>
>  Regards,
>  Arnout
>
> > +
> > +$(eval $(python-package))
> >
