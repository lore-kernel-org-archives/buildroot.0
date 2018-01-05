From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jan 2018 21:29:08 +0100
Subject: [Buildroot] [PATCH 3/8] python-setuptools: check host-python
 version
In-Reply-To: <1514931195.26695.184.camel@impinj.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
 <20180102163337.6334-4-aduskett@gmail.com>
 <1514931195.26695.184.camel@impinj.com>
Message-ID: <20180105212908.7a048009@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2 Jan 2018 22:13:15 +0000, Trent Piepho wrote:
> On Tue, 2018-01-02 at 11:33 -0500, Adam Duskett wrote:
> > python-setuptools is compatible with both python2 and python3, as such,
> > there is no need to force python2 as a dependency.
> > 
> >  
> > +ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
> > +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python3
> > +HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
> > +else
> > +HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON += python
> > +HOST_PYTHON_SETUPTOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
> > +endif  
> 
> From why I see in pkg-python, the default behavior for host packages is
> to depend on the default interpreter, which is python3 if enabled
> otherwise python2.  Isn't the above block basically doing the same
> thing?  Other than using HOST_PYTHON3 rather than PYTHON3.
> 
> But shouldn't this be changed in pkg-python?
> 
> Then setting <PKG>_NEEDS_HOST_PYTHON based on why python version is in
> use could be eliminated, unless the package needs a specific version,
> which appear to be how it's supposed to work.

See my reply to this patch, which explains why it is (IMO) broken.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
