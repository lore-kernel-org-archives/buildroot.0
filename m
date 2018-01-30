From: Jesse Cobra <jessecobra@gmail.com>
Date: Mon, 29 Jan 2018 17:31:00 -0800
Subject: [Buildroot] scanpypi package error adadfruit-ads1x15
In-Reply-To: <CAGm1_kusxoiZP5h_MrSG8a8zTTkY+_24PkdNNuweaYV2nGSO6Q@mail.gmail.com>
References: <CACG401qs4wj83dGC4t++ZWQWCdax=-3KzEoHNNYzjUGBKTkhBQ@mail.gmail.com>
 <CACG401rYpb5e8m_ou0wAnowPdNRfYNRAHXgRY-BgPzaK9uY3Ow@mail.gmail.com>
 <CAGm1_ktgUGMkLdi4derUgsgoPOsXnMSf9byecxj2fGUUTyUQrg@mail.gmail.com>
 <CAGm1_kusxoiZP5h_MrSG8a8zTTkY+_24PkdNNuweaYV2nGSO6Q@mail.gmail.com>
Message-ID: <CACG401of=nXOoz-OkQrH50m=bnmXaGa9AyoLjD4BA2P8p1Sfvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason I had to apply the last chunk of the patch myself but this
fixed my issue completely.

Thank you so much for providing a fix.

On Jan 26, 2018 5:35 AM, "Yegor Yefremov" <yegorslists@googlemail.com>
wrote:

> On Fri, Jan 26, 2018 at 1:48 PM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > Hi Jesse,
> >
> > On Fri, Jan 26, 2018 at 5:21 AM, Jesse Cobra <jessecobra@gmail.com>
> wrote:
> >> Made my own package by hand and it worked! Oh well...
> >>
> >> cat buildroot/package/python-ads1x15/*
> >> config BR2_PACKAGE_PYTHON_ADS1X15
> >
> > This package depends on Adafruit-GPIO, so please add this package
> > first and select it via select statement.
> >
> >>     bool "python-ADS1X15"
> >>     help
> >>       encoder, decoder, and lint/validator for JSON (JavaScript Object
> >>       Notation) compliant with RFC 7159.
> >
> > Project URL is missing.
> >
> >> ############################################################
> ####################
> >> #
> >> # python-ads1x15
> >> #
> >> ############################################################
> ####################
> >>
> >> PYTHON_ADS1X15_VERSION = 1.0.2
> >> PYTHON_ADS1X15_SOURCE = Adafruit_ADS1x15-$(PYTHON_
> ADS1X15_VERSION).tar.gz
> >> PYTHON_ADS1X15_SITE =
> >> https://pypi.python.org/packages/14/e8/c9935e32f61e6562abea08cb704fcb
> fbb78b39bd1d20bb9b12eb4c2c820c
> >> PYTHON_ADS1X15_SETUP_TYPE = setuptools
> >> PYTHON_ADS1X15_LICENSE = GNU Library or Lesser General Public License
> (LGPL)
> >
> > please us SPDX short names for the licence type.
> >
> >> PYTHON_ADS1X15_LICENSE_FILES = LICENSE.txt
> >>
> >> $(eval $(python-package))
> >>
> >>
> >> On Fri, Jan 26, 2018 at 1:27 AM, Jesse Cobra <jessecobra@gmail.com>
> wrote:
> >>>
> >>> building for pi zero w on ubuntu 14.04 32 bit buildroot 2017.02.9
> >>>
> >>> utils/scanpypi adafruit-ads1x15 -o package
> >>> buildroot package name for adafruit-ads1x15: python-adafruit-ads1x15
> >>> Package: python-adafruit-ads1x15
> >>> Fetching package adafruit-ads1x15
> >>> Downloading package adafruit-ads1x15 from
> >>> https://pypi.python.org/packages/14/e8/c9935e32f61e6562abea08cb704fcb
> fbb78b39bd1d20bb9b12eb4c2c820c/Adafruit_ADS1x15-1.0.2.tar.gz...
> >>> Traceback (most recent call last):
> >>>   File "utils/scanpypi", line 653, in <module>
> >>>     main()
> >>>   File "utils/scanpypi", line 604, in main
> >>>     package.load_setup()
> >>>   File "utils/scanpypi", line 247, in load_setup
> >>>     os.chdir(self.tmp_extract)
> >>> OSError: [Errno 2] No such file or directory:
> >>> '/tmp/scanpypi-wzvU4f/python-adafruit-ads1x15/Adafruit-ADS1x15-1.0.2'
> >>>
> >>> Anyone point me in the right direction?
> >
> > The package is very strange. First tar name (Adafruit_ADS1x15) and
> > meta name (Adafruit-ADS1x15) are different. Even if I fix this then
> > there are issues with setup.py. I'll have to dig deeper.
>
> Please apply this patch [1] and try to add adafruit-ads1x15 again.
>
> [1] http://patchwork.ozlabs.org/patch/866316/
>
> Regards,
> Yegor
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180129/f99dd002/attachment.html>
