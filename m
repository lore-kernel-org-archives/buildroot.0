From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 9 Oct 2018 22:54:06 +0300
Subject: [Buildroot] [PATCH 4/4] python-pysnmp: bump to version 4.4.6
In-Reply-To: <20181009213706.6e49f620@windsurf>
References: <20180922193631.14369-1-asafka7@gmail.com>
 <20180922193631.14369-4-asafka7@gmail.com>
 <20181009213706.6e49f620@windsurf>
Message-ID: <CALFsTFUy=ZS5vNEA-m7gPizmq6yn6kcN-EUi7gfNpsEUYiesYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Oct 9, 2018 at 10:37 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 22 Sep 2018 22:36:31 +0300, Asaf Kahlon wrote:
> > Update dependencies.
> > License was renamed to LICENSE.rst (no content changed).
> > Add hash for license.
> >
> > Fixes:
> > http://autobuild.buildroot.org/results/9b3/9b3bcd761aa35d9fdf4acc05258cc87e8c36fb14/
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>
> This looks good, but we need to solve the python-cryptodomex licensing
> question before this patch can be applied.
>
>
> > -PYTHON_PYSNMP_VERSION = 4.3.3
> > +PYTHON_PYSNMP_VERSION = 4.4.6
> >  PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
> > -PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/47/b5/c65b9b6fcc36d3f4caca30d3314920f1ca75f5ceecc1f6ae2538ede24511
> > +PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/8b/66/96a49bf1d64ad1e005a8455644523b7e09663a405eb20a4599fb219e4c95
> >  PYTHON_PYSNMP_SETUP_TYPE = setuptools
> >
> >  PYTHON_PYSNMP_LICENSE = BSD-3-Clause
> > -PYTHON_PYSNMP_LICENSE_FILES = LICENSE.txt
> > -
> > -PYTHON_PYSNMP_DEPENDENCIES = python-pyasn python-pycrypto
>
> So these were build time dependencies, and now there are no build time
> dependencies anymore ? Or was it a bug to list them as build time
> dependencies ?
>
These packages were not needed as runtime dependencies at all.
When updating the package dependencies, I also validated that
python-pysnmp can be built without them.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
