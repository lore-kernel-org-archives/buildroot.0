From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:21:19 +0200
Subject: [Buildroot] [PATCH 9/9] package/setools: bump to 4.3.0
In-Reply-To: <20200715130740.775804-10-antoine.tenart@bootlin.com>
References: <20200715130740.775804-1-antoine.tenart@bootlin.com>
 <20200715130740.775804-10-antoine.tenart@bootlin.com>
Message-ID: <20200715172119.0e9a9d44@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Adam who worked on setools

On Wed, 15 Jul 2020 15:07:40 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> setools is no longer hosted on https://github.com/TresysTechnology/setools/.
> Update the source location to its new home,
> https://github.com/SELinuxProject/setools/.
> 
> Refresh patches 0001-remove-werror-flag-from-setup.patch and
> 0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch for
> 4.3.0 and remove patch 0003-setup.py-drop-path-prefix-from-man-install.patch
> that is now upstream.
> 
> Add a new dependency on host-python-cython, as setup.py now depends on
> it.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Independently from your version bump, I think this package would
probably warrant a further review as a few things look suspicious, or
at least would be good to check if they are still needed after all the
version bumps.

List of things that makes me a bit "meh":

 - It would be good if we could get rid of the SETOOLS_FIX_SETUP /
   HOST_SETOOLS_FIX_SETUP macros by having an upstreamable solution to
   specify the path to the libraries via some setup.py argument.

 - It is quite weird that the dependencies of the target and host
   variant are so different, even if we build them in exactly the same
   way. The target variant needs host-flex, host-bison and host-swig,
   but not the host variant ? The host variant needs
   host-python-networkx, but the target does not need python-networkx ?
   The target needs python-setuptools ? Why ?

 - It would be nice to also find an upstream solution for the "apol"
   installation issue, where it gets installed even if python-pyqt5 is
   not available.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
