From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 7 Oct 2015 14:25:50 +0200
Subject: [Buildroot] [PATCH v6 1/3] python-numpy: introduce
 ARCH_SUPPORTS hidden variable
In-Reply-To: <56150925.7050903@imgtec.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
 <56150925.7050903@imgtec.com>
Message-ID: <20151007142550.3363ddeb@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera

Done.

Thanks,
Gwen

On Wed, 7 Oct 2015 12:59:33 +0100
 <Vincent.Riera@imgtec.com> wrote:

> Dear Gwenhael Goavec-Merou,
> 
> please mark your previous series as superseded:
> 
> http://patchwork.ozlabs.org/patch/526678/
> http://patchwork.ozlabs.org/patch/526680/
> http://patchwork.ozlabs.org/patch/526679/
> 
> Thanks,
> 
> Vincent.
> 
> On 10/07/2015 08:43 AM, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Some packages selects python-numpy. This package has a some CPU
> > specific code. To simplify and avoid duplicate dependencies this
> > patch introduce an hidden ARCH_SUPPORTS variable.
> > 
> > Signed-off-by: Gwenhael Goavec-Merou
> > <gwenhael.goavec-merou@trabucayre.com> Reviewed-by: Arnout
> > Vandecappelle (Essensium/Mind) <arnout@mind.be> ---
> > Changes v4 -> v5:
> >  * Re-add hidden variable.
> > ---
> >  package/python-numpy/Config.in | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/python-numpy/Config.in
> > b/package/python-numpy/Config.in index f8170f8..f25102a 100644
> > --- a/package/python-numpy/Config.in
> > +++ b/package/python-numpy/Config.in
> > @@ -1,9 +1,13 @@
> > -config BR2_PACKAGE_PYTHON_NUMPY
> > -	bool "python-numpy"
> > +config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> > +	bool
> >  	# Numpy has some CPU specific code
> >  	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386
> > \ || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
> >  		|| BR2_sh || BR2_x86_64
> > +
> > +config BR2_PACKAGE_PYTHON_NUMPY
> > +	bool "python-numpy"
> > +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> >  	help
> >  	  NumPy is the fundamental package for scientific computing
> >  	  with Python.
> > 
