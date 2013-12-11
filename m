From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:08:43 +0100
Subject: [Buildroot] [PATCH 03/38] package: introduce Python package
 infrastructure
In-Reply-To: <CAAXf6LWUByrN9ZHRu1MET+_aS44JquFaSXzxx6AWnL9WmC817w@mail.gmail.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LWUByrN9ZHRu1MET+_aS44JquFaSXzxx6AWnL9WmC817w@mail.gmail.com>
Message-ID: <20131211210843.103e43c4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

Only replying to your comments that required a reply. I have
already taken into account all the typos.

On Mon, 9 Dec 2013 11:02:25 +0100, Thomas De Schampheleire wrote:

> > +On line 8 and 9, we declare the name of the tarball (xz-ed tarball
> > +recommended) and the location of the tarball on the Web. Buildroot
> > +will automatically download the tarball from this location.
> 
> Should we clarify here that if the tarball is .gz, it shouldn't be
> specified because it's currently the default?

I decided not to do this, because in the case of the Python modules, it
is very often not possible to rely on the default value of
<pkg>_SOURCE, because the upstream tarball is named
<foo>-<version>.tar.gz, but we call the package python-<foo> in
Buildroot.


> What I have not yet seen in the documentation is a naming policy for
> python packages. I understood that we expect them all to be named
> python-foo, right, so maybe this could be added in the new python
> section of the manual?

I've added some details about this. However, note that not *all* Python
packages should be named python-<foo>. Only Python modules should be
named as such. Packages such as scons and supervisor, which use a
Python-based setup.py, and therefore use the python-package
infrastructure, are not Python modules, and therefore do not have to be
named python-scons and python-supervisor.


> > +# Passed as options of the build step of target distutils based
> > +# packages.
> 
> This is probably personal, but I don't feel this comment explains more
> than the variable name already does.
> Moreover, to repeat the text 'of target distutils based packages' for
> each of the ENV, BUILD_OPT, INSTALL_OPT variables seems redundant too.
> What about a structure like:

Ok, fixed.


> > +# This must be repeated from inner-generic-package, and we need to
> > +# exclude the packages added above in various situations, otherwise
> 
> Do you mean 'as we need to' ?
> 
> added below
> 
> and what do you mean with 'in various situations' here?

I've added a much more detailed explanations about this, it will be in
the v2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
