From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:21:45 +0200
Subject: [Buildroot] [git commit] package/python-pybind: new package
In-Reply-To: <20200610205210.71B2481F5F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 10 Jun 2020 22:53:09 +0200")
References: <20200610205210.71B2481F5F@busybox.osuosl.org>
Message-ID: <874kqcmnti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f42f2a63b3c5733dc56a58b18d6ba417a59d8342
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > PyBind is a light (headers only) package for C++/Python and Python/C++
 > bindings.

 > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  DEVELOPERS                               |  1 +
 >  package/Config.in                        |  1 +
 >  package/python-pybind/Config.in          |  8 ++++++++
 >  package/python-pybind/python-pybind.hash |  4 ++++
 >  package/python-pybind/python-pybind.mk   | 13 +++++++++++++
 >  5 files changed, 27 insertions(+)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index f697c96ce4..9a94307082 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1052,6 +1052,7 @@ F:	package/sdl2/
 >  N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 >  F:	package/liquid-dsp/
 >  F:	package/pixiewps/
 > +F:	package/python-pybind/
 >  F:	package/reaver/
 
 >  N:	Guo Ren <ren_guo@c-sky.com>
 > diff --git a/package/Config.in b/package/Config.in
 > index 520e5d5570..b0a7da2f5c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1070,6 +1070,7 @@ menu "External python modules"
 >  	source "package/python-pyalsa/Config.in"
 >  	source "package/python-pyasn1/Config.in"
 >  	source "package/python-pyasn1-modules/Config.in"
 > +	source "package/python-pybind/Config.in"
 >  	source "package/python-pycairo/Config.in"
 >  	source "package/python-pycares/Config.in"
 >  	source "package/python-pycli/Config.in"
 > diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
 > new file mode 100644
 > index 0000000000..604cb9ee67
 > --- /dev/null
 > +++ b/package/python-pybind/Config.in
 > @@ -0,0 +1,8 @@
 > +config BR2_PACKAGE_PYTHON_PYBIND
 > +	bool "python-pybind"
 > +	help
 > +	  PyBind is a lightweight header-only library that exposes C++
 > +	  types in Python and vice versa, mainly to create Python
 > +	  bindings of existing C++ code.

If this is C++ code then it should presumably depend on
BR2_INSTALL_LIBSTDCPP?

-- 
Bye, Peter Korsgaard
