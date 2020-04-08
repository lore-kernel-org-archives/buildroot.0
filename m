From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 7 Apr 2020 18:22:28 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 20.2.1
In-Reply-To: <89d27f68-9020-753b-cae2-72c6146bca2c@gmail.com>
References: <20200213025837.46575-1-james.hilliard1@gmail.com>
 <89d27f68-9020-753b-cae2-72c6146bca2c@gmail.com>
Message-ID: <CADvTj4omgb_Y-TABj1BaPcMyxLjWYZ8WY12g8ZPB598xm=fA9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 7, 2020 at 4:48 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi James, All,
>
> Le 13/02/2020 ? 03:58, James Hilliard a ?crit :
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-autobahn/python-autobahn.hash | 4 ++--
> >  package/python-autobahn/python-autobahn.mk   | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
> > index 1dc6c1eeaf..204aba7783 100644
> > --- a/package/python-autobahn/python-autobahn.hash
> > +++ b/package/python-autobahn/python-autobahn.hash
> > @@ -1,5 +1,5 @@
> >  # md5, sha256 from https://pypi.org/pypi/autobahn/json
> > -md5  472d965c75dba0f8cb5f3b9f9001ed1b  autobahn-19.11.1.tar.gz
> > -sha256       201b9879b49c6e259d4126dbafe9e3c73807de0c242d50065fbebc62c6ccb181  autobahn-19.11.1.tar.gz
> > +md5  8889605311865aa8fedd1819c6df2c30  autobahn-20.2.1.tar.gz
> > +sha256       1ec603ea374a3b9d85540c499709c41f35f7c6e288b571d12da14aba6c381211  autobahn-20.2.1.tar.gz
> >  # Locally computed sha256 checksums
> >  sha256       0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
> > diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
> > index 6c5c608b9a..5d69253095 100644
> > --- a/package/python-autobahn/python-autobahn.mk
> > +++ b/package/python-autobahn/python-autobahn.mk
> > @@ -4,9 +4,9 @@
> >  #
> >  ################################################################################
> >
> > -PYTHON_AUTOBAHN_VERSION = 19.11.1
> > +PYTHON_AUTOBAHN_VERSION = 20.2.1
>
> This new version dropped the support of python2
>
> https://github.com/crossbario/autobahn-python/commit/d3f674a09cd0ee2dbfb2eeb8d7f325af82db7606
>
> https://github.com/crossbario/autobahn-python/commit/c0223223f865603ce192e6d5cdbcf74849a4cdd8
>
> Also the dependency on python-six have been dropped
>
> https://github.com/crossbario/autobahn-python/commit/e36818bbfcf748d764af39b4fd3c018e59640277
>
> So all packages that select python-autobahn must be updated due to theses
> changes and the python-autobahn runtime test for python2 must be removed since
> it's now broken:
Looks like all packages that select autobahn and txaio already depend on python3
so I think we're good there at least.
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144499
https://patchwork.ozlabs.org/patch/1267692/
>
> For the same reason, the python-Txaio runtime test for python2 is broken
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144572
https://patchwork.ozlabs.org/patch/1267693/
>
> Can you have a look ?
>
> Best regards,
> Romain
>
>
> >  PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
> > -PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/3f/f4/e907b172d3c1d912b8da57560b8b298ebad22f900f8a412002247716328a
> > +PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/ef/6d/74e6ceea815ee836a64846ace4f754dacaf8fae58a37b4d3c912bc9d37ea
> >  PYTHON_AUTOBAHN_LICENSE = MIT
> >  PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
> >  PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
> >
>
