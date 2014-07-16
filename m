From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:30:19 +0200
Subject: [Buildroot] [PATCH v2 05/24] python-numpy: new package
In-Reply-To: <1398208556-4195-6-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20140716223019.45447b73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 23 Apr 2014 01:15:37 +0200, Samuel Martin wrote:
> This patch add NumPy package for python.
> 
> Since Fortran support has been deprecated in Buildroot since the 2013.11
> release, and because most of the external toolchains do not provide a
> Fortran compiler, it is necessary to explicity disable Fortran compiler
> to avoid catching the one from the host system if any.
> 
> We also need to fill a site.cfg file to tell NumPy build-system where
> it should looking for BLAS and LAPACK libraries.
> 
> Some packages may include headers provided by python-numpy package.
> Thus, python-numpy needs to be installed in the sysroot; so add and
> enable its install-staging command.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Thanks, applied, after changing the patch to use the python package
infrastructure for staging installation, and adding the necessary
dependencies to take into account the fenv.h requirement.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
